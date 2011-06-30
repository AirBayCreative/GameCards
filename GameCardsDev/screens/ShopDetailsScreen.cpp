#include <madmath.h>
#include <mastdlib.h>

#include "ShopDetailsScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"
#include "../UI/Widgets/MobImage.h"
#include "../utils/Convert.h"
#include "AlbumViewScreen.h"
#include "ShopProductsScreen.h"
#include "ImageScreen.h"
#include "AuctionListScreen.h"

ShopDetailsScreen::ShopDetailsScreen(Screen *previous, Feed *feed, int screenType, bool free, Product *product, Auction *auction, bool first) : mHttp(this), previous(previous), feed(feed), screenType(screenType), product(product), auction(auction), first(first), free(free) {
	lprintfln("ShopDetailsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	next = NULL;
	buynow = false;
	success = false;
	confirmbuynow = false;
	if (screenType == ST_AUCTION)
	{
		if (!strcmp(auction->getBuyNowPrice().c_str(), "")) {
			mainLayout = Util::createMainLayout("", "Back", "Bid", true);
		} else {
			if((!strcmp(auction->getBuyNowPrice().c_str(), ""))||(!strcmp(auction->getBuyNowPrice().c_str(), "0"))) {
				mainLayout = Util::createMainLayout("", "Back", "Bid", true);
				buynow = false;
			} else {
				mainLayout = Util::createMainLayout("Buy", "Back", "Bid", true);
				buynow = true;
			}
		}
	}
	else if (screenType == ST_USER) {
		mainLayout = Util::createMainLayout("", "Back", "", true);
	}
	else if (free)
		mainLayout = Util::createMainLayout("Confirm", "Back", "", true);
	else
		mainLayout = Util::createMainLayout("Purchase", "Back", "", true);

	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	next = NULL;

	if ((first)||(free)) {
		label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Received: 300 credits and a free starter pack.", 0, Util::getFontBlack());
		label->setMultiLine(true);
		label->setAutoSizeY(true);
		listBox->add(label);
	} else if (screenType != ST_USER) {
		String msg = "Current credits: " + feed->getCredits();
		label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, msg.c_str(), 0, Util::getFontBlack());
		msg = "";
		label->setMultiLine(true);
		label->setAutoSizeY(true);
		listBox->add(label);
	}

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), /*74*/115, listBox, 2, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(true);
	feedlayout->addWidgetListener(this);

	mImageCache = new ImageCache();
	tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

	nameDesc = "";
	fullDesc = "";

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
		case ST_AUCTION:
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
			fullDesc += "\nBidder: ";
			if(!strcmp(auction->getLastBidUser().c_str(), "")) {
				fullDesc += auction->getUsername();
			} else {
				fullDesc += auction->getLastBidUser();
			}

			break;
	}

	cardLabel = new Label(0,0, scrWidth-86, /*74*/scrHeight/2, feedlayout, fullDesc/*nameDesc*/, 0, Util::getFontBlack());
	cardLabel->setVerticalAlignment(Label::VA_CENTER);
	cardLabel->setAutoSizeY();
	cardLabel->setMultiLine(true);

	if (screenType == ST_AUCTION)
	{
		label = new Label(0,0, scrWidth-PADDING*2, scrHeight - 24, NULL, "Place bid", 0, Util::getFontBlack());
		label->setMultiLine(true);
		label->setAutoSizeY(true);
		listBox->add(label);

		label = Util::createEditLabel("");
		editBidBox = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2,64,MA_TB_TYPE_NUMERIC, label, "", L"Bid:");
		int num;
		if (!strcmp(auction->getPrice().c_str(), "")) {
			num = Convert::toInt(auction->getOpeningBid().c_str());
			num+=10;
			editBidBox->setText(Convert::toString(num));
		} else {
			num = Convert::toInt(auction->getPrice().c_str());
			num+=10;
			editBidBox->setText(Convert::toString(num));
		}
		editBidBox->setDrawBackground(false);
		editBidBox->setSelected(true);
		label->setSelected(true);
		label->addWidgetListener(this);
		listBox->add(label);
	}

	this->setMain(mainLayout);
	moved = 0;
	busy = false;
	bidOrBuy = false;
	hasBid = false;
}

void ShopDetailsScreen::refresh()
{
	show();
}

void ShopDetailsScreen::runTimerEvent() {

	if (auction != NULL)
	{
		fullDesc = nameDesc;
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
		timeleft = timeleft*-1;
	}
	split_time(timeleft, cmp_p);

	char buffer[128];
	memset(buffer, 0, 128);
	String days = "Day";
	String hours = "Hour";
	if (cmp_p->tm_mday > 1) {
		days = "Days";
	}
	if (cmp_p->tm_hour > 1) {
		hours = "Hours";
	}
	if (cmp_p->tm_mday == 1) {
		snprintf(buffer, 128, "%d %s %d %s", cmp_p->tm_mday, days.c_str(), cmp_p->tm_hour, hours.c_str());
	} else {
		snprintf(buffer, 128, "%d %s %d %s", cmp_p->tm_mday, days.c_str(), cmp_p->tm_hour, hours.c_str());
	}
	delete cmp_p;
	return buffer;
}

ShopDetailsScreen::~ShopDetailsScreen() {
	delete mainLayout;
	if(mImageCache != NULL){
		delete mImageCache;
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
#if defined(MA_PROF_SUPPORT_STYLUS)
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
#endif

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
				case ST_AUCTION: // Bid
					postBid();
					break;
			}
			break;
		case MAK_SOFTLEFT:
			if (next != NULL) {
				delete next;
			}
			switch (screenType) {
				case ST_AUCTION: // Buy
					if (confirmbuynow) {
						confirmbuynow = false;
						buyNow();
					} else if (buynow) {
						confirmbuynow = true;
						drawBuyNow();
					}
					break;
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
				case ST_AUCTION: // Buy
					editBidBox->setSelected(false);
				case ST_USER:
					previous->show();
					break;
				case ST_PRODUCT:
					//editBidBox->setSelected(false);
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
	}
}

void ShopDetailsScreen::connReadFinished(Connection* conn, int result) {}

void ShopDetailsScreen::xcConnError(int code) {
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
		result += data;
	} else if(!strcmp(parentTag.c_str(), "credits")) {
		credits += data;
	}
}

void ShopDetailsScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "credits")) {
		feed->setCredits(credits.c_str());
		success = true;
	}
	if (bidOrBuy) {
		if(!strcmp(name, "result")) {
			busy = false;

			if (!strcmp(result.c_str(), "1")) {
				//drawPostSubmitPhase("Purchase success!");
				drawBuyNow(true);
			}
			else {
				//drawPostSubmitPhase("Purchase failed.");
				drawBuyNow(false);
			}

		}
	}
	else
	{
		if(!strcmp(name, "result")) {
			busy = false;
			drawPostBid(result);
		}
	}
}

void ShopDetailsScreen::mtxParseError() {
}

void ShopDetailsScreen::mtxEmptyTagEnd() {
}

void ShopDetailsScreen::mtxTagStartEnd() {
}

void ShopDetailsScreen::postBid()
{
	if (!busy) {
		String valid = validateBid();
		notice->setCaption(valid);

		if (valid.length() == 0) {
			bidOrBuy = false;
			busy = true;
			result = "";
			notice->setCaption("Trying to place bid...");
			//work out how long the url will be, the number is for the & and = symbols and hard coded params
			int urlLength = 71 + feed->getUsername().length() + editBidBox->getCaption().length() +
					auction->getAuctionCardId().length();
			char *url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "http://dev.mytcg.net/_phone/?auctionbid=1&username=%s&bid=%s&auctioncardid=%s", feed->getUsername().c_str(), editBidBox->getCaption().c_str() , auction->getAuctionCardId().c_str());

			if(mHttp.isOpen()){
				mHttp.close();
			}
			mHttp = HttpConnection(this);

			int res = mHttp.create(url, HTTP_GET);

			if(res < 0) {

			} else {
				mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
				mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
				mHttp.finish();
			}
			delete [] url;
		}
	}
}

void ShopDetailsScreen::buyNow()
{
	if (!busy)
	{
		bool canPurchase;

		//check that the user can afford the buy out price
		if (atof(feed->getCredits().c_str()) >= atof(auction->getBuyNowPrice().c_str())) {
			canPurchase = true;
		}
		else {
			canPurchase = false;
		}

		if (canPurchase)
		{
			notice->setCaption("Purchasing");
			bidOrBuy = true;
			result = "";
			busy = true;
			//work out how long the url will be, the 8 is for the & and = symbols and hard coded params
			int urlLength = 60+ auction->getAuctionCardId().length();
			char *url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "http://dev.mytcg.net/_phone/?buyauctionnow=1&auctioncardid=%s", auction->getAuctionCardId().c_str());

			if(mHttp.isOpen()){
				mHttp.close();
			}
			mHttp = HttpConnection(this);

			int res = mHttp.create(url, HTTP_GET);

			if(res < 0) {

			} else {
				mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
				mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
				mHttp.finish();
			}
			delete [] url;
		}
		else
		{
			notice->setCaption("You do not have enough credits to make this purchase.");
		}
	}
}

void ShopDetailsScreen::drawPostBid(String message)
{
	String bid = editBidBox->getCaption();

	if (mainLayout == NULL) {
		mainLayout = Util::createMainLayout("", "Back", true);
		listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
		notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	}
	else {
		clearListBox();
		Util::updateSoftKeyLayout("", "Back", "", mainLayout);
	}

	notice->setCaption("");
	label = new Label(0,0, scrWidth-PADDING*2, 100, NULL, message.c_str(), 0, Util::getFontBlack());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	//label->setSkin(Util::getSkinBack());
	label->setMultiLine(true);
	listBox->add(label);

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), /*74*/115, listBox, 2, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(true);
	feedlayout->addWidgetListener(this);

	mImageCache = new ImageCache();
	tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

	nameDesc = "";
	fullDesc = "";

	Util::retrieveThumb(tempImage, auction->getCard(), mImageCache);

	if (success) {
		nameDesc = auction->getCard()->getText();
		fullDesc = nameDesc;
		fullDesc += "\nBid: ";
		fullDesc += bid;
		if((!strcmp(auction->getBuyNowPrice().c_str(), ""))||(!strcmp(auction->getBuyNowPrice().c_str(), "0"))) {

		} else {
			fullDesc += "\nBuy Out: ";
			fullDesc += auction->getBuyNowPrice();
		}

		fullDesc += "\n";
		fullDesc += getTime().c_str();
		fullDesc += "\nBidder: ";
		fullDesc += feed->getUsername();
	} else {
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
		fullDesc += "\nBidder: ";
		if(!strcmp(auction->getLastBidUser().c_str(), "")) {
			fullDesc += auction->getUsername();
		} else {
			fullDesc += auction->getLastBidUser();
		}
	}
	success = false;

	cardLabel = new Label(0,0, scrWidth-86, /*74*/scrHeight/2, feedlayout, fullDesc/*nameDesc*/, 0, Util::getFontBlack());
	cardLabel->setVerticalAlignment(Label::VA_CENTER);
	cardLabel->setAutoSizeY();
	cardLabel->setMultiLine(true);

	this->setMain(mainLayout);

	((AuctionListScreen*)previous)->updateAuctions();
	auction = NULL;

	hasBid = true;
}
void ShopDetailsScreen::drawBuyNow()
{

	if (mainLayout == NULL) {
		mainLayout = Util::createMainLayout("Confirm", "Back", true);
		listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
		notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	}
	else {
		clearListBox();
		Util::updateSoftKeyLayout("Confirm", "Back", "", mainLayout);
	}

	notice->setCaption("");
	String message = "Are you sure you want to buy " + auction->getCard()->getText() + " for " + auction->getBuyNowPrice() + "?";
	label = new Label(0,0, scrWidth-PADDING*2, 100, NULL, message.c_str(), 0, Util::getFontBlack());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	//label->setSkin(Util::getSkinBack());
	label->setMultiLine(true);
	listBox->add(label);

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), /*74*/115, listBox, 2, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(true);
	feedlayout->addWidgetListener(this);

	mImageCache = new ImageCache();
	tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

	nameDesc = "";
	fullDesc = "";

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
	fullDesc += "\nBidder: ";
	if(!strcmp(auction->getLastBidUser().c_str(), "")) {
		fullDesc += auction->getUsername();
	} else {
		fullDesc += auction->getLastBidUser();
	}

	cardLabel = new Label(0,0, scrWidth-86, /*74*/scrHeight/2, feedlayout, fullDesc/*nameDesc*/, 0, Util::getFontBlack());
	cardLabel->setVerticalAlignment(Label::VA_CENTER);
	cardLabel->setAutoSizeY();
	cardLabel->setMultiLine(true);

	this->setMain(mainLayout);

	//((AuctionListScreen*)previous)->updateAuctions();
	//auction = NULL;

	//hasBid = true;
}
void ShopDetailsScreen::drawBuyNow(bool success)
{
	if (success)
	{
		next = new ImageScreen(previous, RES_LOADING, feed, false, auction->getCard());
		((ImageScreen *)next)->isAuction = true;
		next->show();
		auction = NULL;
	}
	else
	{
		notice->setCaption("Could not purchase the card.");
	}
}

void ShopDetailsScreen::clearListBox() {
	for (int i = 0; i < listBox->getChildren().size() - 1; i++) {
		tempWidgets.add(listBox->getChildren()[i]);
	}
	listBox->clear();
	listBox->getChildren().clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		//listBox->add(tempWidgets[j]);
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
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
