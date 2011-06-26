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

	if (screenType == ST_AUCTION)
	{
		if (!strcmp(auction->getBuyNowPrice().c_str(), "")) {
			mainLayout = createMainLayout("", back, bid, true);
		} else {
			if((!strcmp(auction->getBuyNowPrice().c_str(), ""))||(!strcmp(auction->getBuyNowPrice().c_str(), "0"))) {
				mainLayout = createMainLayout("", back, bid, true);
			} else {
				mainLayout = createMainLayout(buy_now, back, bid, true);
			}

		}
	}
	else if (screenType == ST_USER) {
		mainLayout = createMainLayout("", back, "", true);
	}
	else if (free)
		mainLayout = createMainLayout(confirm, back, "", true);
	else
		mainLayout = createMainLayout(purchase, back, "", true);

	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	next = NULL;

	if ((first)&&(free)) {
		label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, freebielbl, 0, gFontBlack);
		label->setMultiLine(true);
		label->setAutoSizeY(true);
		listBox->add(label);
	} else if (screenType != ST_USER) {
		String msg = "Current credits: " + feed->getCredits();
		label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, msg.c_str(), 0, gFontBlack);
		label->setMultiLine(true);
		label->setAutoSizeY(true);
		listBox->add(label);
	}
	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), /*74*/scrHeight/2, listBox, 2, 1);
	feedlayout->setSkin(gSkinBack);
	feedlayout->setDrawBackground(true);
	feedlayout->addWidgetListener(this);

	mImageCache = new ImageCache();
	tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

	nameDesc = "";
	fullDesc = "";

	switch (screenType) {
		case ST_PRODUCT:
			retrieveProductThumb(tempImage, product, mImageCache);
			if (free) {
				fullDesc = product->getName();
				fullDesc += "\n";
				fullDesc += "Credits: Free";
				fullDesc += "\n";
				fullDesc += "Cards: " + product->getCardsInPack();
				fullDesc += "Pack Type: " + product->getProductType();
				nameDesc = product->getName();
			} else {
				nameDesc = product->getName();
				fullDesc = product->getName() + "\n" + product->getDetailsString();
			}
			break;
		case ST_AUCTION:
		case ST_USER:
			retrieveThumb(tempImage, auction->getCard(), mImageCache);

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

			fullDesc += "\nTime: ";
			fullDesc += getTime().c_str();
			fullDesc += "\nBidder: ";
			if(!strcmp(auction->getLastBidUser().c_str(), "")) {
				fullDesc += auction->getUsername();
			} else {
				fullDesc += auction->getLastBidUser();
			}

			MAUtil::Environment::getEnvironment().addTimer(this, 1000, -1);
			break;
	}

	cardLabel = new Label(0,0, scrWidth-86, /*74*/scrHeight/2, feedlayout, fullDesc/*nameDesc*/, 0, gFontBlack);
	cardLabel->setVerticalAlignment(Label::VA_CENTER);
	cardLabel->setAutoSizeY();
	cardLabel->setMultiLine(true);

	if (screenType == ST_AUCTION)
	{
		label = new Label(0,0, scrWidth-PADDING*2, scrHeight - 24, NULL, place_bid, 0, gFontBlack);
		label->setMultiLine(true);
		label->setAutoSizeY(true);
		listBox->add(label);

		label = createEditLabel("");
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

		if((!strcmp(auction->getBuyNowPrice().c_str(), ""))||(!strcmp(auction->getBuyNowPrice().c_str(), "0"))) {

		} else {
			fullDesc += "\nBuy Out: ";
			fullDesc += auction->getBuyNowPrice();
		}

		fullDesc += "\nTime: ";
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

	char buffer[36];
	snprintf(buffer, 128, "D %d, H %d, M %d, S %d", cmp_p->tm_mday, cmp_p->tm_hour, cmp_p->tm_min, cmp_p->tm_sec);
	return buffer;
}

ShopDetailsScreen::~ShopDetailsScreen() {
	delete mainLayout;
	if(mImageCache != NULL){
		delete mImageCache;
	}
	nameDesc = "";
	fullDesc = "";

	MAUtil::Environment::getEnvironment().removeTimer(this);
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
	if (feed->setTouch(truesz)) {
		saveData(FEED, feed->getAll().c_str());
	}
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
					buyNow();
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
				case ST_USER:
					MAUtil::Environment::getEnvironment().removeTimer(this);
					((AuctionListScreen*)previous)->refresh();
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
	if(!strcmp(parentTag.c_str(), xml_result)) {
		result += data;
	}
}

void ShopDetailsScreen::mtxTagEnd(const char* name, int len) {
	if (bidOrBuy) {
		if(!strcmp(name, xml_result)) {
			busy = false;

			if (!strcmp(result.c_str(), xml_buyout_success)) {
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
		if(!strcmp(name, xml_result)) {
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
			//work out how long the url will be, the number is for the & and = symbols and hard coded params
			int urlLength = AUCTION_BID.length() + feed->getUsername().length() + editBidBox->getCaption().length() +
					auction->getAuctionCardId().length() + 30;
			char *url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&username=%s&bid=%s&auctioncardid=%s", AUCTION_BID.c_str(),
					feed->getUsername().c_str(), editBidBox->getCaption().c_str() , auction->getAuctionCardId().c_str());

			if(mHttp.isOpen()){
				mHttp.close();
			}
			mHttp = HttpConnection(this);

			int res = mHttp.create(url, HTTP_GET);

			if(res < 0) {

			} else {
				mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
				mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
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
			int urlLength = BUY_AUCTION_NOW.length() +
					auction->getAuctionCardId().length() + 15;
			char *url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&auctioncardid=%s", BUY_AUCTION_NOW.c_str(),
					auction->getAuctionCardId().c_str());

			if(mHttp.isOpen()){
				mHttp.close();
			}
			mHttp = HttpConnection(this);

			int res = mHttp.create(url, HTTP_GET);

			if(res < 0) {

			} else {
				mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
				mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
				mHttp.finish();
			}
			delete [] url;
		}
		else
		{
			notice->setCaption(not_enough_credits);
		}
	}
}

void ShopDetailsScreen::drawPostBid(String message)
{
	if (success)
	{
		notice->setCaption(message.c_str());

		//((Label*)listBox->getChildren()[listBox->getChildren().size() - 2])->setCaption("You are the current highest bidder");

		listBox->getChildren()[listBox->getChildren().size() - 1]->setEnabled(false);
		listBox->getChildren()[listBox->getChildren().size() - 1]->removeWidgetListener(this);

		updateSoftKeyLayout("", back, "", mainLayout);

		((AuctionListScreen*)previous)->updateAuctions();
		auction = NULL;

		hasBid = true;
	}
}

void ShopDetailsScreen::drawBuyNow(bool success)
{
	if (success)
	{
		next = new ImageScreen(previous, RES_LOADING, feed, false, auction->getCard());
		((ImageScreen*)next)->isAuction = true;
		next->show();
		auction = NULL;
	}
	else
	{
		notice->setCaption("Buy now failed");
	}
}

void ShopDetailsScreen::clearListBox() {
	for (int i = 0; i < listBox->getChildren().size() - 1; i++) {
		tempWidgets.add(listBox->getChildren()[i]);
	}
	listBox->clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		listBox->add(tempWidgets[j]);
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
	else if (!isNumeric(bid)) {
		errorString += "Please enter a numeric value.\n";
	}
	else if (atof(bid.c_str()) >= atof(feed->getCredits().c_str())) {
		errorString = "You do not have enough credits to make that bid.";
	}
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
