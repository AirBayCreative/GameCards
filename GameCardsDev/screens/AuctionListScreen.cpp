#include <conprint.h>

#include "AuctionListScreen.h"
#include "ShopDetailsScreen.h"
#include "../utils/Util.h"

AuctionListScreen::AuctionListScreen(Screen *previous, Feed *feed, int screenType, String catId) : mHttp(this), screenType(screenType), categoryId(catId), previous(previous), feed(feed) {
	lprintfln("AuctionListScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	emp = true;
	left = false;
	right = false;
	list = false;
	shouldUpdateAuction = false;

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
	fullDesc = "";
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

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setCaption("Getting auctions...");

	//work out how long the url will be, the number is for the & and = symbols as well as hard coded params
	int urlLength = 0;
	switch (screenType) {
		case ST_CATEGORY:
			urlLength = 74 + categoryId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
		case ST_USER:
			urlLength = 67 + feed->getUsername().length() +  + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
	}
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	switch (screenType) {
		case ST_CATEGORY:
			sprintf(url, "http://dev.mytcg.net/_phone/?categoryauction=1&category_id=%s&height=%d&width=%d",
					categoryId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
			break;
		case ST_USER:
			sprintf(url, "http://dev.mytcg.net/_phone/?userauction=1&username=%s&height=%d&width=%d",
					feed->getUsername().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
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
		mHttp.finish();
	}
	delete [] url;

	this->setMain(mainLayout);
}

#if defined(MA_PROF_SUPPORT_STYLUS)
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
#endif

void AuctionListScreen::drawList() {
	Layout *feedlayout;
	int ind = listBox->getSelectedIndex();
	if (ind < 0) {
		ind = 0;
	}
	clearListBox();
	for(int i = 0; i < auctions.size(); i++) {
		cardText = auctions[i]->getCard()->getText();
		if (strcmp(auctions[i]->getPrice().c_str(), "")) {
			cardText += "\nCurrent Bid: ";
			cardText += auctions[i]->getPrice();
		}
		else {
			cardText += "\nOpening Bid: ";
			cardText += auctions[i]->getOpeningBid();
		}
		cardText += "\nEnd Date: ";
		cardText += auctions[i]->getEndDate();

		feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 2, 1);
		feedlayout->setSkin(Util::getSkinAlbum());
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

		Card *tmp;
		tmp = auctions[i]->getCard();

		Util::retrieveThumb(tempImage, tmp, mImageCache);

		if (strcmp(auctions[i]->getUsername().c_str(), feed->getUsername().c_str()) == 0)
			tempImage->setHasNote(true);

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, Util::getDefaultFont());
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setMultiLine();
	}

	notice->setCaption("");

	if (auctions.size() >= 1) {
		emp = false;
		listBox->setSelectedIndex(ind);
	} else {
		emp = true;
		listBox->add(Util::createSubLabel("Empty"));
		listBox->setSelectedIndex(ind);
	}
}

void AuctionListScreen::clearListBox() {
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
}

void AuctionListScreen::refresh()
{
	clearAuctions();

	//work out how long the url will be, the number is for the & and = symbols as well as hard coded params
	int urlLength = 0;
	switch (screenType) {
		case ST_CATEGORY:
			urlLength = 74 + categoryId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
		case ST_USER:
			urlLength = 67 + feed->getUsername().length() +  + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
	}
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	switch (screenType) {
		case ST_CATEGORY:
			sprintf(url, "http://dev.mytcg.net/_phone/?categoryauction=1&category_id=%s&height=%d&width=%d",
					categoryId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
			break;
		case ST_USER:
			sprintf(url, "http://dev.mytcg.net/_phone/?userauction=1&username=%s&height=%d&width=%d",
					feed->getUsername().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
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
		mHttp.finish();
	}
	delete [] url;

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
			urlLength = 74 + categoryId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
		case ST_USER:
			urlLength = 67 + feed->getUsername().length() +  + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			break;
	}
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	switch (screenType) {
		case ST_CATEGORY:
			sprintf(url, "http://dev.mytcg.net/_phone/?categoryauction=1&category_id=%s&height=%d&width=%d",
					categoryId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
			break;
		case ST_USER:
			sprintf(url, "http://dev.mytcg.net/_phone/?userauction=1&username=%s&height=%d&width=%d",
					feed->getUsername().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
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
		mHttp.finish();
	}
	delete [] url;
}

AuctionListScreen::~AuctionListScreen() {
	delete mainLayout;
	if (next != NULL) {
		delete next;
		next = NULL;
	}
	delete mImageCache;

	clearAuctions();

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
	fullDesc="";
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
	int selected = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
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
				}
				if (screenType == ST_USER) {
					next = new ShopDetailsScreen(this, feed, ShopDetailsScreen::ST_USER, false, NULL, auctions[listBox->getSelectedIndex()], false);
				} else {
					next = new ShopDetailsScreen(this, feed, ShopDetailsScreen::ST_AUCTION, false, NULL, auctions[listBox->getSelectedIndex()], false);
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

		notice->setCaption("Unable to connect, try again later...");
	}
}

void AuctionListScreen::connReadFinished(Connection* conn, int result) {}

void AuctionListScreen::xcConnError(int code) {

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
		cardId = data;
	} else if(!strcmp(parentTag.c_str(), "description")) {
		description = data;
	} else if(!strcmp(parentTag.c_str(), "thumburl")) {
		thumburl = data;
	} else if(!strcmp(parentTag.c_str(), "fronturl")) {
		fronturl = data;
	} else if(!strcmp(parentTag.c_str(), "frontflipurl")) {
		frontflipurl = data;
	} else if(!strcmp(parentTag.c_str(), "backurl")) {
		backurl = data;
	} else if(!strcmp(parentTag.c_str(), "backflipurl")) {
		backflipurl = data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg = data;
	} else if(!strcmp(parentTag.c_str(), "openingbid")) {
		openingBid = data;
	} else if(!strcmp(parentTag.c_str(), "price")) {
		price = data;
	} else if(!strcmp(parentTag.c_str(), "usercardid")) {
		userCardId = data;
	} else if(!strcmp(parentTag.c_str(), "auctioncardid")) {
		auctionCardId = data;
	} else if(!strcmp(parentTag.c_str(), "username")) {
		username = data;
	} else if(!strcmp(parentTag.c_str(), "buynowprice")) {
		buyNowPrice = data;
	} else if(!strcmp(parentTag.c_str(), "endDate")) {
		endDate = data;
	} else if(!strcmp(parentTag.c_str(), "lastBidUser")) {
		lastBidUser = data;
	}
}

void AuctionListScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "auction")) {
		fullDesc = "";
		if (strcmp(price.c_str(), "")) {
			fullDesc += "Current bid: ";
			fullDesc += price;
		}
		else {
			fullDesc += "Opening bid: ";
			fullDesc += openingBid;
		}
		fullDesc += "\nBy: ";
		if (strcmp(lastBidUser.c_str(), "")) {
			fullDesc += lastBidUser;
		}
		else {
			fullDesc += username;
		}
		fullDesc += "\nBuy now price: ";
		fullDesc += buyNowPrice;
		fullDesc += "\nEnd date: ";
		fullDesc += endDate;

		card = new Card();
		card->setId(cardId.c_str());
		card->setText(description.c_str());
		card->setThumb(thumburl.c_str());
		card->setFullDesc(fullDesc.c_str());
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
		fullDesc = "";
		endDate = "";
		lastBidUser = "";
	} else if(!strcmp(name, "error")) {
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, "auctionsincategory")) {
		if (!shouldUpdateAuction)
		{
			notice->setCaption("Building list...");
			drawList();
		}
		else
		{
			((ShopDetailsScreen*)next)->auction = auctions[listBox->getSelectedIndex()];
			shouldUpdateAuction = false;
		}
	}
}

void AuctionListScreen::clearAuctions() {
	for (int i = 0; i < auctions.size(); i++) {
		if (auctions[i] != NULL) {
			delete auctions[i];
			auctions[i] = NULL;
		}
	}
	auctions.clear();
}

void AuctionListScreen::mtxParseError() {
}

void AuctionListScreen::mtxEmptyTagEnd() {
}

void AuctionListScreen::mtxTagStartEnd() {
}
