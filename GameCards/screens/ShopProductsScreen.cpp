#include <conprint.h>

#include "ShopProductsScreen.h"
#include "ShopDetailsScreen.h"
#include "ShopPurchaseScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"

ShopProductsScreen::ShopProductsScreen(Screen *previous, Feed *feed, String category) : mHttp(this), category(category), previous(previous), feed(feed) {
	next = NULL;

	mainLayout = createMainLayout(back, purchase, details, true);

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setDrawBackground(true);
	notice->setCaption(checking_products);

	mImageCache = new ImageCache();

	char *url = new char[100];
	memset(url,'\0',100);
	sprintf(url, "%s&%s=%s", PRODUCTS.c_str(), categoryid, category.c_str());
	mHttp = HttpConnection(this);

	int res = mHttp.create(url, HTTP_GET);
	mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
	mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
	if(res < 0) {

	} else {
		mHttp.finish();
	}
	this->setMain(mainLayout);

	moved=0;

	emp = true;
	id = "";
	productName = "";
	description = "";
	price = "";
	currency = "";
	thumb = "";
	cardsInPack = "";
}

void ShopProductsScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void ShopProductsScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void ShopProductsScreen::pointerReleaseEvent(MAPoint2d point)
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

void ShopProductsScreen::locateItem(MAPoint2d point)
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
				left = true;
				moved=0;
			} else if (i == 1) {
				list = true;
				moved = 0;
			} else if (i == 2) {
				right = true;
				moved=0;
			}
			return;
		}
	}
}

void ShopProductsScreen::drawList() {
	Layout *feedlayout;
	listBox->getChildren().clear();
	for(ProductVector::iterator itr = products.begin(); itr != products.end(); itr++) {
		cardText = itr->getName();
		cardText += "\n";
		cardText += "Price: " + itr->getCurrency() + " " + itr->getFormattedPrice();

		feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 2, 1);
		feedlayout->setSkin(gSkinAlbum);
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		tempImage = new Image(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

		Product *tmp;
		tmp = itr;

		retrieveProductThumb(tempImage, tmp, mImageCache);

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, gFontWhite);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setMultiLine(true);
	}
	if (products.size() >= 1) {
		emp = false;
	} else {
		emp = true;
		listBox->add(createSubLabel(empty));
	}
	listBox->setSelectedIndex(0);
}

ShopProductsScreen::~ShopProductsScreen() {
	mainLayout->getChildren().clear();
	listBox->getChildren().clear();

	delete listBox;
	delete mainLayout;
	if (image != NULL) {
		delete image;
		image = NULL;
	}
	if (softKeys != NULL) {
		softKeys->getChildren().clear();
		delete softKeys;
		softKeys = NULL;
	}
	delete label;
	delete notice;
	delete next;
	delete mImageCache;

	parentTag="";
	cardText="";
	id="";
	description="";
	category="";
	productName="";
	price = "";
	currency = "";
	thumb = "";
	cardsInPack = "";
}

void ShopProductsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget->getChildren()[1])->setFont(gFontBlue);
	} else {
		((Label *)widget->getChildren()[1])->setFont(gFontWhite);
	}
}

void ShopProductsScreen::keyPressEvent(int keyCode) {
	int selected = listBox->getSelectedIndex();
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
			if (!emp) {
				if (next != NULL) {
					delete next;
				}
				next = new ShopDetailsScreen(this, feed, ShopDetailsScreen::ST_PRODUCT, &(products[listBox->getSelectedIndex()]));
				next->show();
			}
			break;
		case MAK_SOFTRIGHT:
			if (!emp) {
				if (next != NULL) {
					delete next;
				}
				next = new ShopPurchaseScreen(this, feed, &(products[listBox->getSelectedIndex()]));
				next->show();
			}
			break;
	}
}

void ShopProductsScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption("");
	}
}

void ShopProductsScreen::connReadFinished(Connection* conn, int result) {}

void ShopProductsScreen::xcConnError(int code) {
}

void ShopProductsScreen::mtxEncoding(const char* ) {
}

void ShopProductsScreen::mtxTagStart(const char* name, int len) {
	if (!strcmp(name, xml_product_done)) {
		products.clear();
	}

	parentTag = name;

}

void ShopProductsScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void ShopProductsScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), xml_productid)) {
		id += data;
	} else if(!strcmp(parentTag.c_str(), xml_productname)) {
		productName += data;
	} else if(!strcmp(parentTag.c_str(), xml_productdesc)) {
		description += data;
	} else if(!strcmp(parentTag.c_str(), xml_productprice)) {
		price += data;
	} else if(!strcmp(parentTag.c_str(), xml_productcurrency)) {
		currency += data;
	} else if(!strcmp(parentTag.c_str(), xml_productnumcards)) {
		cardsInPack += data;
	} else if(!strcmp(parentTag.c_str(), xml_productthumb)) {
		thumb += data;
	}
}

void ShopProductsScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_productthumb)) {
		product = new Product(id.c_str(), productName.c_str(), description.c_str(),
				thumb.c_str(), price.c_str(), currency.c_str(), cardsInPack.c_str());
		products.add(*product);
		id = "";
		productName = "";
		description = "";
		price = "";
		currency = "";
		thumb = "";
		cardsInPack = "";
	} else if (!strcmp(name, xml_product_done)) {
		notice->setCaption("");
		drawList();
	} else {
		notice->setCaption("");
	}
}

void ShopProductsScreen::mtxParseError() {
}

void ShopProductsScreen::mtxEmptyTagEnd() {
}

void ShopProductsScreen::mtxTagStartEnd() {
}
