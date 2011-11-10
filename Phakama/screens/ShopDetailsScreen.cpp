#include <madmath.h>
#include <mastdlib.h>

#include "ShopDetailsScreen.h"
#include "../utils/Util.h"
#include "../UI/Widgets/MobImage.h"
#include "../utils/Convert.h"
#include "AlbumViewScreen.h"
#include "ShopProductsScreen.h"
#include "ImageScreen.h"

ShopDetailsScreen::ShopDetailsScreen(Screen *previous, Feed *feed, int screenType, bool free, Product *product, Auction *auction, bool first) : mHttp(this), previous(previous), feed(feed), screenType(screenType), product(product), auction(auction), first(first), free(free) {
	lprintfln("ShopDetailsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	next = NULL;
	buynow = false;
	expired = false;
	confirmbuynow = false;
	if (screenType == ST_USER) {
		mainLayout = Util::createMainLayout("", "Back", "", true);
	}
	else if (free)
		mainLayout = Util::createMainLayout("Confirm", "Back", "Cards", true);
	else
		mainLayout = Util::createMainLayout("Purchase", "Back", "Cards", true);

	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	next = NULL;

	if ((first)||(free)) {
		label = new Label(0,0, scrWidth-PADDING*2, 36, NULL, "Received: 300 credits and a free starter pack.", 0, Util::getDefaultSelected());
		label->setMultiLine(true);
		listBox->add(label);
	} else if (screenType != ST_USER) {
		String msg = "Current credits: " + feed->getCredits();
		label = new Label(0,0, scrWidth-PADDING*2, 36, NULL, msg.c_str(), 0, Util::getDefaultSelected());
		msg = "";
		label->setMultiLine(true);
		listBox->add(label);
	}

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), /*74*/140, listBox, 2, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(true);
	feedlayout->addWidgetListener(this);

	mImageCache = new ImageCache();
	tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_LOADINGTHUMB));

	nameDesc = "";
	String fullDesc = "";

	switch (screenType) {
		case ST_PRODUCT:
			Util::retrieveProductThumb(tempImage, product, mImageCache);
			if (free) {
				fullDesc = product->getName();
				fullDesc += "\n";
				fullDesc += "Credits: Free";
				fullDesc += "\n";
				fullDesc += "Cards: " + product->getCardsInPack();
				fullDesc += "\nPack Type: " + product->getProductType();
				nameDesc = product->getName();
			} else {
				nameDesc = product->getName();
				fullDesc = product->getName() + "\n" + product->getDetailsString();
			}
			break;
		case ST_USER:
			Util::retrieveThumb(tempImage, auction->getCard(), mImageCache);

			nameDesc = auction->getCard()->getText();
			fullDesc = nameDesc;
			fullDesc += "\nBid: ";
			if(!strcmp(auction->getPrice().c_str(), "")) {
				fullDesc += auction->getOpeningBid();
			} else {
				fullDesc += auction->getPrice();
			}

			if((!strcmp(auction->getBuyNowPrice().c_str(), ""))||(!strcmp(auction->getBuyNowPrice().c_str(), "0"))) {

			} else {
				fullDesc += "\nBuy Out: ";
				fullDesc += auction->getBuyNowPrice();
			}

			fullDesc += "\n";
			fullDesc += getTime().c_str();
			fullDesc += "\nSeller: ";
			fullDesc += auction->getUsername();
			if(!strcmp(auction->getLastBidUser().c_str(), "")) {

			} else {
				fullDesc += "\nBidder: ";
				fullDesc += auction->getLastBidUser();
			}

			if (expired) {
				Util::updateSoftKeyLayout("", "back", "", mainLayout);
			}

			break;
	}

	cardLabel = new Label(0,0, scrWidth-86, /*74*/scrHeight/2, feedlayout, fullDesc/*nameDesc*/, 0, Util::getDefaultFont());
	cardLabel->setVerticalAlignment(Label::VA_CENTER);
	cardLabel->setAutoSizeY();
	cardLabel->setMultiLine(true);

	this->setMain(mainLayout);
	moved = 0;
	busy = false;
	hasBid = false;
}

void ShopDetailsScreen::refresh()
{
	show();
}

void ShopDetailsScreen::runTimerEvent() {

	if (auction != NULL)
	{
		String fullDesc = nameDesc;
		fullDesc += "\nBid: ";
		if(!strcmp(auction->getPrice().c_str(), "")) {
			fullDesc += auction->getOpeningBid();
		} else {
			fullDesc += auction->getPrice();
		}

		if(!buynow) {

		} else {
			fullDesc += "\nBuy Out: ";
			fullDesc += auction->getBuyNowPrice();
		}

		fullDesc += "\n";
		fullDesc += getTime().c_str();
		fullDesc += "\nBidder: ";
		if(!strcmp(auction->getLastBidUser().c_str(), "")) {
			fullDesc += auction->getUsername();
		} else {
			fullDesc += auction->getLastBidUser();
		}

		cardLabel->setCaption(fullDesc);
	}
}

String ShopDetailsScreen::getTime() {
	String all = auction->getEndDate();
	String year = "";
	String month = "";
	String day = "";

	struct tm * cmp_p = new tm;

	int indexof = all.find("-");
	if (indexof > -1) {
		year = all.substr(0,indexof++).c_str();
		all=all.substr(indexof);
	}
	indexof = all.find("-");
	if (indexof > -1) {
		month = all.substr(0,indexof++).c_str();
		all=all.substr(indexof);
		day = all;
	}
	cmp_p->tm_hour = 23;
	cmp_p->tm_min = 59;
	cmp_p->tm_sec = 59;
	cmp_p->tm_year = Convert::toInt(year)-1900;
	cmp_p->tm_mon = Convert::toInt(month)-1;
	cmp_p->tm_mday = Convert::toInt(day);
	time_t test = mktime(cmp_p);


	time_t timeleft = test - maTime();


	if (timeleft < 0) {
		//should be set to zero, for now gonna use negative inferred value for testing
		timeleft = 0;
		expired = true;
	}
	split_time(timeleft, cmp_p);

	char buffer[128];
	memset(buffer, 0, 128);
	String days = "Days";
	String hours = "Hours";
	if (cmp_p->tm_mday == 1) {
		days = "Days";
	}
	if (cmp_p->tm_hour == 1) {
		hours = "Hours";
	}
	if (cmp_p->tm_mday == 1) {
		snprintf(buffer, 128, "%d %s %d %s", cmp_p->tm_mday, days.c_str(), cmp_p->tm_hour, hours.c_str());
	} else {
		snprintf(buffer, 128, "%d %s %d %s", cmp_p->tm_mday, days.c_str(), cmp_p->tm_hour, hours.c_str());
	}
	delete cmp_p;

	if (timeleft == 0) {
		return "Expired";
	}

	return buffer;
}

ShopDetailsScreen::~ShopDetailsScreen() {
	lprintfln("~ShopDetailsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	clearListBox();
	listBox->clear();
	delete mainLayout;
	if(mImageCache != NULL){
		delete mImageCache;
	}
	if(next!=NULL){
		delete next;
		feed->remHttp();
	}

	/*if (tempImage != NULL) {
		delete tempImage;
	}*/
	/*if (product != NULL) {
		delete product;
	}*/
	auction = NULL;
	product = NULL;
	tempImage = NULL;
	mImageCache = NULL;
	nameDesc = "";
	fullDesc = "";
	parentTag = "";
	result = "";
	credits = "";
	temp = "";
	temp1 = "";
	error_msg = "";

}

void ShopDetailsScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void ShopDetailsScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void ShopDetailsScreen::pointerReleaseEvent(MAPoint2d point)
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
	moved = 0;
}

void ShopDetailsScreen::locateItem(MAPoint2d point)
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
        	//list = true;
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

void ShopDetailsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}

void ShopDetailsScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
			if (hasBid)
				break;

			switch (screenType) {
				case ST_PRODUCT:
					if (next != NULL) {
						delete next;
						feed->remHttp();
					}
					next = new AlbumViewScreen(this, feed, product->getId(), AlbumViewScreen::AT_PRODUCT);
					next->show();
					break;
			}
			break;
		case MAK_SOFTLEFT:
			if (next != NULL) {
				delete next;
				feed->remHttp();
			}
			switch (screenType) {
				case ST_PRODUCT:
					if (free) {
						next = new AlbumViewScreen(this, feed, product->getId(), AlbumViewScreen::AT_FREE);
					} else {
						next = new AlbumViewScreen(this, feed, product->getId(), AlbumViewScreen::AT_BUY);
					}
					next->show();
					break;
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			switch (screenType) {
				case ST_USER:
					previous->show();
					break;
				case ST_PRODUCT:
					((ShopProductsScreen *)previous)->pop();
					break;
			}
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
	}
}

void ShopDetailsScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		feed->remHttp();
		notice->setCaption("Unable to connect, try again later...");
	}
}

void ShopDetailsScreen::connReadFinished(Connection* conn, int result) {}

void ShopDetailsScreen::xcConnError(int code) {
	feed->remHttp();
}

void ShopDetailsScreen::mtxEncoding(const char* ) {
}

void ShopDetailsScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void ShopDetailsScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void ShopDetailsScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "result")) {
		result = data;
	} else if(!strcmp(parentTag.c_str(), "credits")) {
		credits = data;
	}
}

void ShopDetailsScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "credits")) {
		feed->setCredits(credits.c_str());
	}
}

void ShopDetailsScreen::mtxParseError(int) {
}

void ShopDetailsScreen::mtxEmptyTagEnd() {
}

void ShopDetailsScreen::mtxTagStartEnd() {
}

void ShopDetailsScreen::clearListBox() {

	if (editBidBox != NULL) {
		//editBidBox->setSelected(false);
		editBidBox->disableListener();
	}

	Vector<Widget*> tempWidgets;
	for (int i = 0; i < listBox->getChildren().size(); i++) {
		tempWidgets.add(listBox->getChildren()[i]);
	}
	listBox->clear();
	listBox->getChildren().clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
	editBidBox = NULL;
}

/**
* Returns a blank string if the bid is valid.
*/
String ShopDetailsScreen::validateBid(){
	String bid = editBidBox->getCaption();

	String errorString = "";

	if (bid.length() == 0) {
		errorString = "Please enter a bid.";
	}

	//else if (atof(bid.c_str()) >= atof(feed->getCredits().c_str())) {
		//errorString = "You do not have enough credits to make that bid.";
	//}
	else if (auction->getPrice().length() > 0 && (atof(auction->getPrice().c_str()) >= atof(bid.c_str()))) {
		errorString = "Your bid needs to be higher than the current bid.";
	}
	else if (auction->getPrice().length() == 0 && (atof(auction->getOpeningBid().c_str()) > atof(bid.c_str()))) {
		errorString = "Your bid needs to equal or exceed the opening bid.";
	}
	else if ((atof(auction->getBuyNowPrice().c_str()) > 0)&&(atof(auction->getBuyNowPrice().c_str()) <= atof(bid.c_str()))) {
		errorString = "Your bid should be lower than the buy now price.";
	}

	return errorString;
}
