#include <conprint.h>

#include "ShopProductsScreen.h"
#include "ShopDetailsScreen.h"
#include "ShopCategoriesScreen.h"
#include "../utils/Util.h"
#include "../UI/Button.h"

void ShopProductsScreen::refresh()
{
	String msg = "Credits: " + feed->getCredits() + " Premium: " + feed->getPremium();
	notice->setCaption(msg.c_str());
	show();
}

void ShopProductsScreen::pop() {
	refresh();

	if (products.size() == 1) {
		previous->pop();
	}
}

ShopProductsScreen::ShopProductsScreen(MainScreen *previous, Feed *feed, String category, bool free, bool first) : mHttp(this), category(category), first(first), free(free) {
	next = NULL;
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	lprintfln("ShopProductsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	this->feed = feed;
	if (strcmp(category.c_str(), "credits") == 0)
		credits = true;
	else
		credits = false;

	prem = "0";
	cred = "0";

	mainLayout = Util::createMainLayout("", "Back", "", true);

	kinListBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setDrawBackground(false);
	notice->setCaption("Checking for products...");

	mImageCache = new ImageCache();

	int urlLength;
	char *url;
	if (credits) {
		urlLength = 42 + URLSIZE;
		url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?getpayments=1", URL);
		lprintfln("%s", url);
	} else
	{
		if (!free) {
			urlLength = 60 + URLSIZE + category.length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?categoryproducts=2&categoryId=%s", URL, category.c_str());
			lprintfln("%s", url);
		} else if (free) {
			urlLength = 60 + URLSIZE + category.length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?categoryproducts=1&categoryId=%s", URL, category.c_str());
			lprintfln("%s", url);
		}
	}

	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);

	int res = mHttp.create(url, HTTP_GET);

	if(res < 0) {
		notice->setCaption("Unable to connect, try again later...");
		drawList();
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();
	}
	delete [] url;
	url = NULL;
	this->setMain(mainLayout);

	moved=0;

	emp = true;
	id = "";
	productName = "";
	productType = "";
	price = "";
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
	for(int i = 0; i < products.size(); i++) {
		String cardText = products[i]->getName();
		cardText += "\n";

		if (credits) {
			if (strcmp(products[i]->getPremium().c_str(), "0")) {
				cardText += "Premium: " + products[i]->getPremium();
			} else
			if (strcmp(products[i]->getPrice().c_str(), "0")) {
				cardText += "Credits: " + products[i]->getPrice();
			}

		} else if (free) {
			cardText += "Credits: Free";
		} else {
			if (strcmp(products[i]->getPremium().c_str(), "0")) {
				cardText += "Premium: " + products[i]->getPremium();
			} else
			if (strcmp(products[i]->getPrice().c_str(), "0")) {
				cardText += "Credits: " + products[i]->getPrice();
			}

		}

		cardText += "\n";
		cardText += "Cards: " + products[i]->getCardsInPack();

		feedlayout = new Layout(0, 0, kinListBox->getWidth()-(PADDING*2), 74, kinListBox, 2, 1);
		feedlayout->setSkin(Util::getSkinAlbum());
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_LOADINGTHUMB));

		Util::retrieveProductThumb(tempImage, products[i], mImageCache);

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, Util::getDefaultFont());
		label->setDrawBackground(false);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setMultiLine();
	}
	if (products.size() > 1) {
		emp = false;
	} else if (products.size() == 1) {
		/*if (free) {
			next = new ShopDetailsScreen(this, feed, ShopDetailsScreen::ST_PRODUCT, true, products[kinListBox->getSelectedIndex()], NULL, true);
		} else {
			next = new ShopDetailsScreen(this, feed, ShopDetailsScreen::ST_PRODUCT, false, products[kinListBox->getSelectedIndex()], NULL, true);
		}
		next->show();*/
		emp = false;
		keyPressEvent(MAK_FIRE);
	} else {
		emp = true;
		kinListBox->add(Util::createSubLabel("Empty"));
	}
	kinListBox->setSelectedIndex(0);
}

void ShopProductsScreen::clearListBox() {
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

ShopProductsScreen::~ShopProductsScreen() {
	lprintfln("~ShopProductsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	clearListBox();
	kinListBox->clear();
	delete mainLayout;
	mainLayout = NULL;
	if (next != NULL) {
		delete next;
		feed->remHttp();
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
		((Label *)widget->getChildren()[1])->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget->getChildren()[1])->setFont(Util::getDefaultFont());
	}
}

void ShopProductsScreen::keyPressEvent(int keyCode) {
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
			previous->pop();
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
			if (!emp) {
				if (next != NULL) {
					delete next;
					feed->remHttp();
					next = NULL;
				}
				if (free) {
					next = new ShopDetailsScreen(this, feed, ShopDetailsScreen::ST_PRODUCT, true, products[kinListBox->getSelectedIndex()], NULL, false);
				} else {
					next = new ShopDetailsScreen(this, feed, ShopDetailsScreen::ST_PRODUCT, false, products[kinListBox->getSelectedIndex()], NULL, false);
				}
				next->show();
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

void ShopProductsScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		feed->remHttp();
		notice->setCaption("Unable to connect, try again later...");
	}
}

void ShopProductsScreen::connReadFinished(Connection* conn, int result) {}

void ShopProductsScreen::xcConnError(int code) {
	feed->remHttp();
}

void ShopProductsScreen::mtxEncoding(const char* ) {
}

void ShopProductsScreen::mtxTagStart(const char* name, int len) {
	if (!strcmp(name, "categoryproducts")) {
		clearProductsList();
	}

	parentTag = name;

}

void ShopProductsScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void ShopProductsScreen::mtxTagData(const char* data, int len) {
	if (credits)
	{
		if(!strcmp(parentTag.c_str(), "paymentid")) {
			id += data;
		} else if(!strcmp(parentTag.c_str(), "desc")) {
			productName += data;
		} else if(!strcmp(parentTag.c_str(), "paymethodid")) {
			productType += data;
		} else if(!strcmp(parentTag.c_str(), "creditam")) {
			price += data;
		} else if(!strcmp(parentTag.c_str(), "productnumcards")) {
			cardsInPack += data;
		} else if(!strcmp(parentTag.c_str(), "thumbnailurl")) {
			thumb += data;
		}
	}
	else
	{
		if(!strcmp(parentTag.c_str(), "credits")) {
			cred += data;
		} else if(!strcmp(parentTag.c_str(), "productid")) {
			id += data;
		} else if(!strcmp(parentTag.c_str(), "premium")) {
			prem += data;
		} else if(!strcmp(parentTag.c_str(), "productpremium")) {
			productprem += data;
		} else if(!strcmp(parentTag.c_str(), "productname")) {
			productName += data;
		} else if(!strcmp(parentTag.c_str(), "producttype")) {
			productType += data;
		} else if(!strcmp(parentTag.c_str(), "productprice")) {
			price += data;
		} else if(!strcmp(parentTag.c_str(), "productnumcards")) {
			cardsInPack += data;
		} else if(!strcmp(parentTag.c_str(), "productthumb")) {
			thumb += data;
		}
	}
}

void ShopProductsScreen::mtxTagEnd(const char* name, int len) {
	if (credits)
	{
		if(!strcmp(name, "payment")) {
			product = new Product(id.c_str(), productName.c_str(), productType.c_str(),
					thumb.c_str(), price.c_str(), cardsInPack.c_str(), productprem.c_str());
			products.add(product);

			id = "";
			productName = "";
			productType = "";
			productprem = "";
			price = "";
			thumb = "";
			cardsInPack = "";
			credits = "";
			prem = "";
		} else if (!strcmp(name, "payments")) {
			notice->setCaption("");
			drawList();
		} else {
			notice->setCaption("");
		}
	}
	else
	{
		if(!strcmp(name, "productthumb")) {
			product = new Product(id.c_str(), productName.c_str(), productType.c_str(),
					thumb.c_str(), price.c_str(), cardsInPack.c_str(), productprem.c_str());
			products.add(product);

			id = "";
			productName = "";
			productType = "";
			productprem = "";
			price = "";
			thumb = "";
			cardsInPack = "";
		} else if (!strcmp(name, "categoryproducts")) {
			if (strcmp(cred.c_str(), "")) {
				String msg = "Credits: " + cred + " Premium: " + prem;
				feed->setCredits(cred.c_str());
				feed->setPremium(prem.c_str());
				if ((first)||(free)) {
					msg = "Received: 150 credits and a free starter pack.";
				}
				notice->setHeight(36);
				notice->setAutoSizeY(false);
				notice->setCaption(msg.c_str());

			} else {
				notice->setCaption("");
			}
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

void ShopProductsScreen::mtxParseError(int) {
}

void ShopProductsScreen::mtxEmptyTagEnd() {
}

void ShopProductsScreen::mtxTagStartEnd() {
}
