#include <conprint.h>

#include "ShopCategoriesScreen.h"
#include "ShopProductsScreen.h"
#include "AuctionListScreen.h"
#include "AlbumLoadScreen.h"
#include "../utils/Util.h"
#include "DetailScreen.h"
#include "../UI/Button.h"

void ShopCategoriesScreen::refresh() {
	show();
	categories.clear();
	category.clear();
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = -1;
	int urlLength = 100 + URLSIZE;
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	switch(screenType) {
		case ST_FREEBIE:
			notice->setCaption("Checking for shop categories...");
			sprintf(url, "%s?productcategories=1", URL);
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_SHOP:
			notice->setCaption("Checking for shop categories...");
			sprintf(url, "%s?productcategories=2", URL);
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_AUCTIONS:
			notice->setCaption("Checking for auction categories...");
			sprintf(url, "%s?auctioncategories=1", URL);
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
	}
	delete [] url;
	url = NULL;
	if(res < 0) {

	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();
	}
}

ShopCategoriesScreen::ShopCategoriesScreen(MainScreen *previous, Feed *feed, int screenType) : mHttp(this), screenType(screenType) {

	lprintfln("ShopCategoriesScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	this->feed = feed;
	next = NULL;
	label = NULL;
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	if (screenType == ST_FREEBIE) {
		mainLayout = Util::createMainLayout("", "", true);
	} else {
		mainLayout = Util::createMainLayout("", "Back", true);
	}

	kinListBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	notice->setDrawBackground(false);

	kinListBox->setHeight(kinListBox->getHeight() - 20);

	int res = -1;
	int urlLength = 100 + URLSIZE;
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	switch(screenType) {
		case ST_FREEBIE:
			notice->setCaption("Checking for shop categories...");
			sprintf(url, "%s?productcategories=1", URL);
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_SHOP:
			notice->setCaption("Checking for shop categories...");
			sprintf(url, "%s?productcategories=2", URL);
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_AUCTIONS:
			notice->setCaption("Checking for auction categories...");
			sprintf(url, "%s?auctioncategories=1", URL);
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_RANKING:
		case ST_FRIEND:
			notice->setCaption("Checking the latest rankings...");
			sprintf(url, "%s?leaders=1", URL);
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
	}
	delete [] url;
	url = NULL;
	if(res < 0) {
		drawList();
		notice->setCaption("Unable to connect, try again later...");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();
	}
	this->setMain(mainLayout);

	moved = 0;
}

ShopCategoriesScreen::~ShopCategoriesScreen() {
	lprintfln("~ShopCategoriesScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	clearListBox();
	kinListBox->clear();
	delete mainLayout;
	mainLayout = NULL;
	if (next != NULL) {
		delete next;
		feed->remHttp();
		next = NULL;
	}
	parentTag="";
	temp="";
	temp1="";
	error_msg="";
}
void ShopCategoriesScreen::clearListBox() {
	Vector<Widget*> tempWidgets;
	for (int i = 0; i < kinListBox->getChildren().size(); i++) {
		tempWidgets.add(kinListBox->getChildren()[i]);
	}
	kinListBox->clear();
	kinListBox->getChildren().clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
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
	kinListBox->getChildren().clear();

	if (screenType == ST_AUCTIONS)
	{
		label = Util::createSubLabel("Create New Auction");
		label->addWidgetListener(this);
		kinListBox->add(label);
	}

	for(Vector<String>::iterator itr = category.begin(); itr != category.end(); itr++) {
		label = Util::createSubLabel(itr->c_str());
		label->addWidgetListener(this);
		kinListBox->add(label);
	}

	if (categories.size() > 1) {
		kinListBox->setSelectedIndex(0);
	} else if (categories.size() == 1) {
		kinListBox->setSelectedIndex(0);
		if ((screenType != ST_AUCTIONS)&&(screenType != ST_RANKING)&&(screenType != ST_FRIEND)) {
			keyPressEvent(MAK_FIRE);
		}
	} else {
		label = Util::createSubLabel("Empty");
		//label->addWidgetListener(this);
		empt = true;
		kinListBox->add(label);

		//kinListBox->setSelectedIndex(0);
	}

	if (screenType == ST_FREEBIE)
		notice->setCaption("Received: a free booster pack.");
}

void ShopCategoriesScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget)->setFont(Util::getDefaultFont());
	}
}

void ShopCategoriesScreen::keyPressEvent(int keyCode) {
	int ind = kinListBox->getSelectedIndex();
	int max = kinListBox->getChildren().size();
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];
	switch(keyCode) {
		case MAK_UP:
			if(currentSelectedKey!=NULL){
				currentSelectedKey->setSelected(false);
				currentSelectedKey = NULL;
				currentKeyPosition = -1;
				kinListBox->getChildren()[kinListBox->getChildren().size()-1]->setSelected(true);
			} else if (ind > 0) {
				kinListBox->setSelectedIndex(ind-1);
			}
			break;
		case MAK_DOWN:
			if (ind+1 < kinListBox->getChildren().size()) {
				kinListBox->setSelectedIndex(ind+1);
			} else {
				kinListBox->getChildren()[ind]->setSelected(false);
				for(int i = 0; i < currentSoftKeys->getChildren().size();i++){
					if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
						currentKeyPosition=i;
						currentSelectedKey= currentSoftKeys->getChildren()[i];
						currentSelectedKey->setSelected(true);
						break;
					}
				}
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			if (screenType != ST_FREEBIE) {
				previous->show();
			}
			break;
		case MAK_FIRE:
			if(currentSoftKeys->getChildren()[0]->isSelected()){
				keyPressEvent(MAK_SOFTLEFT);
				break;
			}else if(currentSoftKeys->getChildren()[2]->isSelected()){
				keyPressEvent(MAK_SOFTRIGHT);
				break;
			}
		case MAK_SOFTLEFT:
			orig = this;
			switch (screenType) {
				case ST_FREEBIE:
					if (!empt) {
						orig = this;
						String selectedCaption = ((Label*)kinListBox->getChildren()[kinListBox->getSelectedIndex()])->getCaption();
						String category = categories.find(selectedCaption)->second.c_str();
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new ShopProductsScreen(this, feed, category, true);
						next->show();
					}
					break;
				case ST_RANKING:
					if (!empt) {
						orig = this;
						String selectedCaption = ((Label*)kinListBox->getChildren()[kinListBox->getSelectedIndex()])->getCaption();
						String category = categories.find(selectedCaption)->second.c_str();
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new DetailScreen(this, feed, DetailScreen::RANKING, NULL, category, selectedCaption);
						next->show();
					}
					break;
				case ST_FRIEND:
					if (!empt) {
							orig = this;
							String selectedCaption = ((Label*)kinListBox->getChildren()[kinListBox->getSelectedIndex()])->getCaption();
							String category = categories.find(selectedCaption)->second.c_str();
							if (next != NULL) {
								delete next;
								feed->remHttp();
								next = NULL;
							}
							next = new DetailScreen(this, feed, DetailScreen::FRIEND, NULL, category, selectedCaption);
							next->show();
						}
						break;
				case ST_SHOP:
					if (!empt) {
						orig = this;
						String selectedCaption = ((Label*)kinListBox->getChildren()[kinListBox->getSelectedIndex()])->getCaption();
						String category = categories.find(selectedCaption)->second.c_str();
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new ShopProductsScreen(this, feed, category, false);
						next->show();
					}
					break;
				case ST_AUCTIONS:
						int i = kinListBox->getSelectedIndex();
						String selectedCaption = ((Label*)kinListBox->getChildren()[kinListBox->getSelectedIndex()])->getCaption();
						orig = this;

						if (!strcmp(selectedCaption.c_str(), "My Auctions")) {
							if (next != NULL) {
								delete next;
								feed->remHttp();
								next = NULL;
							}
							next = new AuctionListScreen(this, feed, AuctionListScreen::ST_USER);
							next->show();
						} else if (!strcmp(selectedCaption.c_str(), "Create New Auction")) {
							if (next != NULL) {
								delete next;
								feed->remHttp();
								next = NULL;
							}

							next = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_AUCTION, NULL, true);
							next->show();
						} else if (!empt) {
							if (next != NULL) {
								delete next;
								feed->remHttp();
								next = NULL;
							}
							orig = this;
							String selectedCaption = ((Label*)kinListBox->getChildren()[i])->getCaption();
							String category = categories.find(selectedCaption)->second.c_str();

							next = new AuctionListScreen(this, feed, AuctionListScreen::ST_CATEGORY, category);
							next->show();
						}

					break;
			}
			break;
		case MAK_LEFT:
			if(currentSelectedKey!=NULL){
				if(currentKeyPosition > 0){
					currentKeyPosition = currentKeyPosition - 1;
					for(int i = currentKeyPosition; i >= 0;i--){
						if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
							currentSelectedKey->setSelected(false);
							currentKeyPosition=i;
							currentSelectedKey= currentSoftKeys->getChildren()[i];
							currentSelectedKey->setSelected(true);
							break;
						}
					}
				}
			}
			break;
		case MAK_RIGHT:
			if(currentSelectedKey!=NULL){
				if(currentKeyPosition+1 < currentSelectedKey->getParent()->getChildren().size()){
					currentKeyPosition = currentKeyPosition + 1;
					for(int i = currentKeyPosition; i < currentSoftKeys->getChildren().size();i++){
						if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
							currentSelectedKey->setSelected(false);
							currentKeyPosition=i;
							currentSelectedKey= currentSoftKeys->getChildren()[i];
							currentSelectedKey->setSelected(true);
							break;
						}
					}
				}
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
		feed->remHttp();
		drawList();
		notice->setCaption("Unable to connect, try again later...");
	}
}

void ShopCategoriesScreen::connReadFinished(Connection* conn, int result) {}

void ShopCategoriesScreen::xcConnError(int code) {
	feed->remHttp();
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
	if (!strcmp(parentTag.c_str(), "cardcategories")) {
		categories.clear();
		category.clear();
	} else if(!strcmp(parentTag.c_str(), "albumname")) {
		temp1 = data;
	} else if(!strcmp(parentTag.c_str(), "albumid")) {
		temp = data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg = data;
	}
}

void ShopCategoriesScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "albumname")) {
		categories.insert(temp1, temp);
		category.add(temp1);
		temp1 = "";
		temp = "";
	} else if (!strcmp(name, "cardcategories")) {
		notice->setCaption("Choose a category.");
		drawList();
	} else if(!strcmp(name, "error")) {
		notice->setCaption(error_msg.c_str());
	} else {
		notice->setCaption("");
	}
}

void ShopCategoriesScreen::mtxParseError(int) {
}

void ShopCategoriesScreen::mtxEmptyTagEnd() {
}

void ShopCategoriesScreen::mtxTagStartEnd() {
}
