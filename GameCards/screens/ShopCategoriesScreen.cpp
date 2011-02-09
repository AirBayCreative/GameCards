#include <conprint.h>

#include "ShopCategoriesScreen.h"
#include "ShopProductsScreen.h"
#include "AuctionListScreen.h"
#include "../utils/Util.h"

void ShopCategoriesScreen::refresh() {
	show();
	mHttp = HttpConnection(this);
	int res = -1;
	switch(screenType) {
		case ST_SHOP:
			res = mHttp.create(PRODUCTCATEGORIES.c_str(), HTTP_GET);
			break;
		case ST_AUCTIONS:
			res = mHttp.create(AUCTIONCATEGORIES.c_str(), HTTP_GET);
			break;
	}
	if(res < 0) {

	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
}

ShopCategoriesScreen::ShopCategoriesScreen(Screen *previous, Feed *feed, int screenType) : mHttp(this), previous(previous), feed(feed), screenType(screenType) {
	next = NULL;
	label = NULL;
	if (feed->getTouchEnabled()) {
		mainLayout = createMainLayout(back, "", true);
	} else {
		mainLayout = createMainLayout(back, select, true);
	}

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	notice->setDrawBackground(true);
	notice->setCaption(checking_categories);

	listBox->setHeight(listBox->getHeight() - 20);

	int res = -1;
	switch(screenType) {
		case ST_SHOP:
			res = mHttp.create(PRODUCTCATEGORIES.c_str(), HTTP_GET);
			break;
		case ST_AUCTIONS:
			res = mHttp.create(AUCTIONCATEGORIES.c_str(), HTTP_GET);
			break;
	}
	if(res < 0) {
		drawList();
		notice->setCaption(no_connect);
	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	this->setMain(mainLayout);

	moved = 0;
}

ShopCategoriesScreen::~ShopCategoriesScreen() {
	//mainLayout->getChildren().clear();
	//listBox->getChildren().clear();

	//delete listBox;
	delete mainLayout;
	/*if (image != NULL) {
		delete image;
		image = NULL;
	}
	if (softKeys != NULL) {
		softKeys->getChildren().clear();
		delete softKeys;
		softKeys = NULL;
	}*/
	/*if (label != NULL) {
		delete label;
		label = NULL;
	}*/
	if (next != NULL) {
		delete next;
		next = NULL;
	}
	//delete notice;
	parentTag="";
	temp="";
	temp1="";
	error_msg="";
}

void ShopCategoriesScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void ShopCategoriesScreen::pointerMoveEvent(MAPoint2d point)
{
	moved++;
    locateItem(point);
}

void ShopCategoriesScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		}
	}
	moved=0;
}

void ShopCategoriesScreen::locateItem(MAPoint2d point)
{
	list = false;
	left = false;
	right = false;

	Point p;
	p.set(point.x, point.y);
	for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
		{
			list = true;
		}
	}
	for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
			if (i == 0) {
				moved=0;
				left = true;
			} else if (i == 2) {
				moved=0;
				right = true;
			}
			return;
		}
	}
}

void ShopCategoriesScreen::drawList() {
	empt = false;
	listBox->getChildren().clear();
	for(Map<String, String>::Iterator categoryIter = categories.begin(); categoryIter != categories.end(); categoryIter++) {
		label = createSubLabel(categoryIter->first);
		label->addWidgetListener(this);
		listBox->add(label);
	}

	if (categories.size() >= 1) {
		listBox->setSelectedIndex(0);
	} else {
		empt = true;
		label = createSubLabel(empty);
		label->addWidgetListener(this);
		listBox->add(label);
	}
}

void ShopCategoriesScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontGrey);
	}
}

void ShopCategoriesScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_SOFTLEFT:
			previous->show();
			break;
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			switch (screenType) {
				case ST_SHOP:
					if (!empt) {
						orig = this;
						String selectedCaption = ((Label*)listBox->getChildren()[listBox->getSelectedIndex()])->getCaption();
						String category = categories.find(selectedCaption)->second.c_str();
						if (next != NULL) {
							delete next;
						}
						next = new ShopProductsScreen(this, feed, category);
						next->show();
					}
					break;
				case ST_AUCTIONS:
					if (!empt) {
						orig = this;
						String selectedCaption = ((Label*)listBox->getChildren()[listBox->getSelectedIndex()])->getCaption();
						String category = categories.find(selectedCaption)->second.c_str();
						if (next != NULL) {
							delete next;
						}
						next = new AuctionListScreen(this, feed, AuctionListScreen::ST_CATEGORY, category);
						next->show();
					}
					break;
			}
			break;
	}
}

void ShopCategoriesScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		drawList();
		notice->setCaption(no_connect);
	}
}

void ShopCategoriesScreen::connReadFinished(Connection* conn, int result) {}

void ShopCategoriesScreen::xcConnError(int code) {
	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
}

void ShopCategoriesScreen::mtxEncoding(const char* ) {
}

void ShopCategoriesScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void ShopCategoriesScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void ShopCategoriesScreen::mtxTagData(const char* data, int len) {
	if (!strcmp(parentTag.c_str(), xml_cardcategories)) {
		categories.clear();
	} else if(!strcmp(parentTag.c_str(), xml_albumname)) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), xml_albumid)) {
		temp += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	}
}

void ShopCategoriesScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_albumname)) {
		categories.insert(temp1, temp);
		temp1 = "";
		temp = "";
	} else if (!strcmp(name, xml_cardcategories)) {
		notice->setCaption(choose_category);
		drawList();
	} else if(!strcmp(name, xml_error)) {
		notice->setCaption(error_msg.c_str());
	} else {
		notice->setCaption("");
	}
}

void ShopCategoriesScreen::mtxParseError() {
}

void ShopCategoriesScreen::mtxEmptyTagEnd() {
}

void ShopCategoriesScreen::mtxTagStartEnd() {
}
