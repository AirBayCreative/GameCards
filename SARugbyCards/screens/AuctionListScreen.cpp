#include <conprint.h>

#include "AuctionListScreen.h"
#include "ShopDetailsScreen.h"
#include "../utils/Util.h"

AuctionListScreen::AuctionListScreen(MainScreen *previous, Feed *feed, int screenType, String catId) : mHttp(this), screenType(screenType), categoryId(catId) {
	lprintfln("AuctionListScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	this->feed = feed;
	emp = true;
	left = false;
	right = false;
	list = false;
	shouldUpdateAuction = false;


	clearAuctions();
	deleteAuctions();

	parentTag = "";
	cardText = "";
	cardId = "";
	description = "";
	thumburl = "";
	openingBid = "";
	price = "";
	userCardId = "";
	auctionCardId = "";
	username = "";
	buyNowPrice = "";
	error_msg = "";
	endDate = "";
	lastBidUser = "";

	moved = 0;

	card = NULL;
	auction = NULL;

	next = NULL;

	label = NULL;
	tempImage = NULL;

	mImageCache = new ImageCache();
	mainLayout = Util::createMainLayout("", "Back", "", true);

	kinListBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setCaption("Getting auctions...");

	//work out how long the url will be, the number is for the & and = symbols as well as hard coded params
	int urlLength = 0;
	switch (screenType) {
		case ST_CATEGORY:
			urlLength = 74 + URLSIZE + categoryId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
		case ST_USER:
			urlLength = 73 + URLSIZE + feed->getUsername().length() +  + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
	}
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	switch (screenType) {
		case ST_CATEGORY:
			sprintf(url, "%s?categoryauction=1&category_id=%s&height=%d&width=%d&jpg=1", URL,
					categoryId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
			lprintfln("%s", url);
			break;
		case ST_USER:
			sprintf(url, "%s?userauction=1&username=%s&height=%d&width=%d&jpg=1", URL,
					feed->getUsername().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
			lprintfln("%s", url);
			break;
	}
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		drawList();

		notice->setCaption("Unable to connect, try again later...");

	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();

	}
	delete [] url;
	url = NULL;

	this->setMain(mainLayout);
}

void AuctionListScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void AuctionListScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void AuctionListScreen::pointerReleaseEvent(MAPoint2d point)
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

void AuctionListScreen::locateItem(MAPoint2d point)
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
				moved=0;
			} else if (i == 2) {
				right = true;
				moved=0;
			}
			return;
		}
	}
}

void AuctionListScreen::drawList() {
	Layout *feedlayout;
	int ind = kinListBox->getSelectedIndex();
	if (ind < 0) {
		ind = 0;
	} else if (ind >= auctions.size()) {
		ind = auctions.size()-1;
	}
	clearListBox();
	for(int i = 0; i < auctions.size(); i++) {
		cardText = auctions[i]->getCard()->getText();

		if ((strcmp(auctions[i]->getPrice().c_str(), ""))&&(strcmp(auctions[i]->getPrice().c_str(), "0"))) {
			cardText += "\nCurrent Bid: ";
			cardText += auctions[i]->getPrice();

			if (strcmp(auctions[i]->getLastBidUser().c_str(), feed->getUsername().c_str()) == 0) {
				cardText += " (Yours)";
			}
		}
		else {
			cardText += "\nOpening Bid: ";
			cardText += auctions[i]->getOpeningBid();
		}
		cardText += "\n";
		cardText += getTime(auctions[i]->getEndDate());

		feedlayout = new Layout(0, 0, kinListBox->getWidth()-(PADDING*2), ALBUM_ITEM_HEIGHT, kinListBox, 2, 1);
		feedlayout->setSkin(Util::getSkinAlbum());
		feedlayout->setDrawBackground(false);
		feedlayout->addWidgetListener(this);
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_LOADINGTHUMB));

		Card *tmp;
		tmp = auctions[i]->getCard();

		Util::retrieveThumb(tempImage, tmp, mImageCache);

		label = new Label(0,0, scrWidth-86, ALBUM_ITEM_HEIGHT, feedlayout, cardText, 0, Util::getDefaultFont());
		label->setDrawBackground(false);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setMultiLine();
	}

	notice->setCaption("");

	if (auctions.size() >= 1) {
		emp = false;
		kinListBox->setSelectedIndex(ind);
	} else {
		emp = true;
		kinListBox->add(Util::createSubLabel("Empty"));
		kinListBox->setSelectedIndex(0);
	}
}

void AuctionListScreen::clearListBox() {
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

String AuctionListScreen::getTime(String enddate) {
	String all = enddate;
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
		//expired = true;
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
	cmp_p = NULL;

	if (timeleft == 0) {
		return "Expired";
	}

	return buffer;
}

void AuctionListScreen::refresh()
{
	clearAuctions();

	//work out how long the url will be, the number is for the & and = symbols as well as hard coded params
	int urlLength = 0;
	switch (screenType) {
		case ST_CATEGORY:
			urlLength = 74 + URLSIZE + categoryId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
		case ST_USER:
			urlLength = 73 + URLSIZE + feed->getUsername().length() +  + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
	}
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	switch (screenType) {
		case ST_CATEGORY:
			sprintf(url, "%s?categoryauction=1&category_id=%s&height=%d&width=%d&jpg=1", URL,
					categoryId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
			lprintfln("%s", url);
			break;
		case ST_USER:
			sprintf(url, "%s?userauction=1&username=%s&height=%d&width=%d&jpg=1", URL,
					feed->getUsername().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
			lprintfln("%s", url);
			break;
	}
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		drawList();

		notice->setCaption("Unable to connect, try again later...");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();

	}
	delete [] url;
	url = NULL;

	show();
}

void AuctionListScreen::updateAuctions()
{
	clearAuctions();
	shouldUpdateAuction = true;

	//work out how long the url will be, the number is for the & and = symbols as well as hard coded params
	int urlLength = 0;
	switch (screenType) {
		case ST_CATEGORY:
			urlLength = 74 + URLSIZE + categoryId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
		case ST_USER:
			urlLength = 73 + URLSIZE + feed->getUsername().length() +  + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
	}
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	switch (screenType) {
		case ST_CATEGORY:
			sprintf(url, "%s?categoryauction=1&category_id=%s&height=%d&width=%d&jpg=1", URL,
					categoryId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
			lprintfln("%s", url);
			break;
		case ST_USER:
			sprintf(url, "%s?userauction=1&username=%s&height=%d&width=%d&jpg=1", URL,
					feed->getUsername().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
			lprintfln("%s", url);
			break;
	}
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		//drawList();

		notice->setCaption("Unable to connect, try again later...");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();

	}
	delete [] url;
	url = NULL;
}

AuctionListScreen::~AuctionListScreen() {
	lprintfln("~AuctionListScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	clearListBox();
	kinListBox->clear();
	delete mainLayout;
	mainLayout = NULL;
	if (next != NULL) {
		delete next;
		feed->remHttp();
		next = NULL;
	}
	delete mImageCache;
	mImageCache = NULL;

	clearAuctions();
	deleteAuctions();

	parentTag="";
	cardText="";
	cardId="";
	description="";
	thumburl="";
	categoryId="";
	error_msg="";
	openingBid="";
	price="";
	userCardId="";
	auctionCardId="";
	username="";
	buyNowPrice="";
	endDate="";
	lastBidUser="";
}

void AuctionListScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget->getChildren()[1])->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget->getChildren()[1])->setFont(Util::getDefaultFont());
	}
}

void AuctionListScreen::keyPressEvent(int keyCode) {
	int selected = kinListBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_UP:
			kinListBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			kinListBox->selectNextItem();
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			previous->show();
			break;
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			if (!emp) {
				if (next != NULL) {
					delete next;
					feed->remHttp();
					next = NULL;
				}
				if (screenType == ST_USER) {
					next = new ShopDetailsScreen(this, feed, ShopDetailsScreen::ST_USER, false, NULL, auctions[kinListBox->getSelectedIndex()], false);
				} else {
					next = new ShopDetailsScreen(this, feed, ShopDetailsScreen::ST_AUCTION, false, NULL, auctions[kinListBox->getSelectedIndex()], false);
				}
				next->show();
			}
			break;
	}
}

void AuctionListScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	error_msg = "";
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		drawList();
		feed->remHttp();

		notice->setCaption("Unable to connect, try again later...");
	}
}

void AuctionListScreen::connReadFinished(Connection* conn, int result) {}

void AuctionListScreen::xcConnError(int code) {
	feed->remHttp();

}

void AuctionListScreen::mtxEncoding(const char* ) {
}

void AuctionListScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void AuctionListScreen::mtxTagAttr(const char* attrName, const char* attrValue) {

}

void AuctionListScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "cardid")) {
		cardId += data;
	} else if(!strcmp(parentTag.c_str(), "description")) {
		description += data;
	} else if(!strcmp(parentTag.c_str(), "thumburl")) {
		thumburl += data;
	} else if(!strcmp(parentTag.c_str(), "fronturl")) {
		fronturl += data;
	} else if(!strcmp(parentTag.c_str(), "frontflipurl")) {
		frontflipurl += data;
	} else if(!strcmp(parentTag.c_str(), "backurl")) {
		backurl += data;
	} else if(!strcmp(parentTag.c_str(), "backflipurl")) {
		backflipurl += data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), "openingbid")) {
		openingBid += data;
	} else if(!strcmp(parentTag.c_str(), "price")) {
		price += data;
	} else if(!strcmp(parentTag.c_str(), "usercardid")) {
		userCardId += data;
	} else if(!strcmp(parentTag.c_str(), "auctioncardid")) {
		auctionCardId += data;
	} else if(!strcmp(parentTag.c_str(), "username")) {
		username += data;
	} else if(!strcmp(parentTag.c_str(), "buynowprice")) {
		buyNowPrice += data;
	} else if(!strcmp(parentTag.c_str(), "endDate")) {
		endDate += data;
	} else if(!strcmp(parentTag.c_str(), "lastBidUser")) {
		lastBidUser += data;
	}
}

void AuctionListScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "auction")) {
		card = new Card();
		card->setId(cardId.c_str());
		card->setText(description.c_str());
		card->setThumb(thumburl.c_str());
		//card->setFullDesc(fullDesc.c_str());
		card->setFront(fronturl.c_str());
		card->setFrontFlip(frontflipurl.c_str());
		card->setBack(backurl.c_str());
		card->setBackFlip(backflipurl.c_str());

		auction = new Auction();
		auction->setAuctionCardId(auctionCardId.c_str());
		auction->setBuyNowPrice(buyNowPrice.c_str());
		auction->setCard(card);
		auction->setOpeningBid(openingBid.c_str());
		auction->setPrice(price.c_str());
		auction->setUserCardId(userCardId.c_str());
		auction->setUsername(username.c_str());
		auction->setEndDate(endDate.c_str());
		auction->setLastBidUser(lastBidUser.c_str());

		auctions.add(auction);

		cardId = "";
		description = "";
		thumburl = "";
		fronturl = "";
		frontflipurl = "";
		backurl = "";
		backflipurl = "";
		openingBid = "";
		price = "";
		userCardId = "";
		auctionCardId = "";
		username = "";
		buyNowPrice = "";
		error_msg = "";
		endDate = "";
		lastBidUser = "";
	} else if(!strcmp(name, "error")) {
		notice->setCaption(error_msg.c_str());
		cardId = "";
		description = "";
		thumburl = "";
		fronturl = "";
		frontflipurl = "";
		backurl = "";
		backflipurl = "";
		openingBid = "";
		price = "";
		userCardId = "";
		auctionCardId = "";
		username = "";
		buyNowPrice = "";
		error_msg = "";
		endDate = "";
		lastBidUser = "";
	} else if (!strcmp(name, "auctionsincategory")) {
		notice->setCaption("Building list...");
		cardId = "";
		description = "";
		thumburl = "";
		fronturl = "";
		frontflipurl = "";
		backurl = "";
		backflipurl = "";
		openingBid = "";
		price = "";
		userCardId = "";
		auctionCardId = "";
		username = "";
		buyNowPrice = "";
		error_msg = "";
		endDate = "";
		lastBidUser = "";
		drawList();
	}
}

void AuctionListScreen::clearAuctions() {
	for (int i = 0; i < auctions.size(); i++) {
		if (auctions[i] != NULL) {
			deleted.add(auctions[i]);
			auctions.remove(i);
			i--;
			//delete auctions[i];
			//auctions[i] = NULL;
		}
	}
	auctions.clear();
}
void AuctionListScreen::deleteAuctions() {
	for (int i = 0; i < auctions.size(); i++) {
		if (auctions[i] != NULL) {
			delete auctions[i];
			auctions[i] = NULL;
		}
	}
	auctions.clear();
	for (int i = 0; i < deleted.size(); i++) {
		if (deleted[i] != NULL) {
			delete deleted[i];
			deleted[i] = NULL;
		}
	}
	deleted.clear();
}

void AuctionListScreen::mtxParseError(int) {
}

void AuctionListScreen::mtxEmptyTagEnd() {
}

void AuctionListScreen::mtxTagStartEnd() {
}
