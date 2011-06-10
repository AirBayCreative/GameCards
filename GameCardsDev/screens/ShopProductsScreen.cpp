#include <conprint.h>

#include "ShopProductsScreen.h"
#include "ShopPurchaseScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"

ShopProductsScreen::ShopProductsScreen(Screen *previous, Feed *feed, String category, bool free) : mHttp(this), category(category), previous(previous), feed(feed) {
	next = NULL;

	if (strcmp(category.c_str(), "credits") == 0)
		credits = true;
	else
		credits = false;

	if (credits)
		mainLayout = createMainLayout(back, purchase, "", true);
	else if (free)
		mainLayout = createMainLayout(back, confirm, details, true);
	else
		mainLayout = createMainLayout(back, purchase, details, true);

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setDrawBackground(true);
	notice->setCaption(checking_products);

	mImageCache = new ImageCache();

	int urlLength;
	char *url;
	if (credits)
		url = (char*)PAYMENTS.c_str();
	else
	{
		urlLength = PRODUCTS.length() + strlen(categoryid) + category.length() + 2;
		url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s&%s=%s", PRODUCTS.c_str(), categoryid, category.c_str());
	}

	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);

	int res = mHttp.create(url, HTTP_GET);

	if(res < 0) {
		notice->setCaption(no_connect);
		drawList();
	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;
	this->setMain(mainLayout);

	moved=0;

	emp = true;
	id = "";
	productName = "";
	productType = "";
	price = "";
	thumb = "";
	cardsInPack = "";

	freebie = free;
}
#if defined(MA_PROF_SUPPORT_STYLUS)
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
#endif
void ShopProductsScreen::drawList() {
	Layout *feedlayout;
	//listBox->getChildren().clear();
	for(int i = 0; i < products.size(); i++) {
		cardText = products[i]->getName();
		cardText += "\n";

		if (credits)
			cardText += "Credits: " + products[i]->getPrice();
		else if (freebie)
			cardText += "Price: Free";
		else
			cardText += "Price: " + products[i]->getPrice();

		feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 2, 1);
		feedlayout->setSkin(gSkinAlbum);
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

		retrieveProductThumb(tempImage, products[i], mImageCache);

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, gFontBlack);
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
	delete mainLayout;
	if (next != NULL) {
		delete next;
		next=NULL;
	}
	if(mImageCache!=NULL){
		delete mImageCache;
		mImageCache=NULL;
	}
	clearProductsList();
	parentTag="";
	cardText="";
	id="";
	productType="";
	category="";
	productName="";
	price = "";
	thumb = "";
	cardsInPack = "";
}

void ShopProductsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget->getChildren()[1])->setFont(gFontBlue);
	} else {
		((Label *)widget->getChildren()[1])->setFont(gFontBlack);
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
		case MAK_BACK:
		case MAK_SOFTLEFT:
			previous->show();
			break;
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			if (!emp) {
				if (next != NULL) {
					delete next;
				}
				next = new ShopPurchaseScreen(this, feed, (products[listBox->getSelectedIndex()]), freebie, credits);
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
		clearProductsList();
	}

	parentTag = name;

}

void ShopProductsScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void ShopProductsScreen::mtxTagData(const char* data, int len) {
	if (credits)
	{
		if(!strcmp(parentTag.c_str(), xml_paymentid)) {
			id += data;
		} else if(!strcmp(parentTag.c_str(), xml_paymentdesc)) {
			productName += data;
		} else if(!strcmp(parentTag.c_str(), xml_paymentmethod)) {
			productType += data;
		} else if(!strcmp(parentTag.c_str(), xml_paymentcreditam)) {
			price += data;
		} else if(!strcmp(parentTag.c_str(), xml_productnumcards)) {
			cardsInPack += data;
		} else if(!strcmp(parentTag.c_str(), xml_paymentthumb)) {
			thumb += data;
		}
	}
	else
	{
		if(!strcmp(parentTag.c_str(), xml_productid)) {
			id += data;
		} else if(!strcmp(parentTag.c_str(), xml_productname)) {
			productName += data;
		} else if(!strcmp(parentTag.c_str(), xml_producttype)) {
			productType += data;
		} else if(!strcmp(parentTag.c_str(), xml_productprice)) {
			price += data;
		} else if(!strcmp(parentTag.c_str(), xml_productnumcards)) {
			cardsInPack += data;
		} else if(!strcmp(parentTag.c_str(), xml_productthumb)) {
			thumb += data;
		}
	}
}

void ShopProductsScreen::mtxTagEnd(const char* name, int len) {
	if (credits)
	{
		if(!strcmp(name, xml_payment)) {
			product = new Product(id.c_str(), productName.c_str(), productType.c_str(),
					thumb.c_str(), price.c_str(), cardsInPack.c_str());
			products.add(product);

			id = "";
			productName = "";
			productType = "";
			price = "";
			thumb = "";
			cardsInPack = "";
		} else if (!strcmp(name, xml_payments_done)) {
			notice->setCaption("");
			drawList();
		} else {
			notice->setCaption("");
		}
	}
	else
	{
		if(!strcmp(name, xml_productthumb)) {
			product = new Product(id.c_str(), productName.c_str(), productType.c_str(),
					thumb.c_str(), price.c_str(), cardsInPack.c_str());
			products.add(product);

			id = "";
			productName = "";
			productType = "";
			price = "";
			thumb = "";
			cardsInPack = "";
		} else if (!strcmp(name, xml_product_done)) {
			notice->setCaption("");
			drawList();
		} else {
			notice->setCaption("");
		}
	}
}

void ShopProductsScreen::clearProductsList() {
	for (int i = 0; i < products.size(); i++) {
		if (products[i] != NULL) {
			delete products[i];
			products[i] = NULL;
		}
	}
	products.clear();
}

void ShopProductsScreen::mtxParseError(int offSet) {
}

void ShopProductsScreen::mtxEmptyTagEnd() {
}

void ShopProductsScreen::mtxTagStartEnd() {
}
