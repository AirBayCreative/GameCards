#include <conprint.h>

#include "AuctionListScreen.h"
#include "ShopDetailsScreen.h"
#include "BidOrBuyScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"

AuctionListScreen::AuctionListScreen(Screen *previous, Feed *feed, int screenType, String catId) : mHttp(this), screenType(screenType), categoryId(catId), previous(previous), feed(feed) {
	emp = true;
	left = false;
	right = false;
	list = false;

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

	next = new Screen();

	label = NULL;
	tempImage = NULL;

	mImageCache = new ImageCache();

	switch (screenType) {
		case ST_CATEGORY:
			mainLayout = createMainLayout(back, bidOrBuy, details, true);
			break;
		case ST_USER:
			mainLayout = createMainLayout(back, "", details, true);
			break;
	}
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setCaption(checking_auctions);

	//work out how long the url will be, the number is for the & and = symbols as well as hard coded params
	int urlLength = 0;
	switch (screenType) {
		case ST_CATEGORY:
			urlLength = CATEGORY_AUCTION.length() + categoryId.length() + intlen(scrHeight) + intlen(scrWidth) + 28;
			break;
		case ST_USER:
			urlLength = USER_AUCTION.length() + feed->getUsername().length() +  + intlen(scrHeight) + intlen(scrWidth) + 25;
			break;
	}
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	switch (screenType) {
		case ST_CATEGORY:
			sprintf(url, "%s&category_id=%s&heigth=%d&width=%d", CATEGORY_AUCTION.c_str(), categoryId.c_str(), scrHeight, scrWidth);
			break;
		case ST_USER:
			sprintf(url, "%s&username=%s&heigth=%d&width=%d", USER_AUCTION.c_str(), feed->getUsername().c_str(), scrHeight, scrWidth);
			break;
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		drawList();

		notice->setCaption(no_connect);
	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;

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
	listBox->getChildren().clear();
	for(auctionIter = auctions.begin(); auctionIter != auctions.end(); auctionIter++) {
		cardText = auctionIter->getCard()->getText();
		if (strcmp(auctionIter->getPrice().c_str(), "")) {
			cardText += "\nCurrent bid: ";
			cardText += auctionIter->getPrice();
		}
		else {
			cardText += "\nOpening bid: ";
			cardText += auctionIter->getOpeningBid();
		}
		cardText += "\nBuy now price: ";
		cardText += auctionIter->getBuyNowPrice();

		feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 2, 1);
		feedlayout->setSkin(gSkinAlbum);
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		tempImage = new Image(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

		Card *tmp;
		tmp = auctionIter->getCard();

		retrieveThumb(tempImage, tmp, mImageCache);

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, gFontWhite);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setMultiLine(true);
	}

	notice->setCaption("");

	if (auctions.size() >= 1) {
		emp = false;
		listBox->setSelectedIndex(0);
	} else {
		emp = true;
		listBox->add(createSubLabel(empty));
		listBox->setSelectedIndex(0);
	}
}

AuctionListScreen::~AuctionListScreen() {
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
	if (label != NULL) {
		delete label;
		label = NULL;
	}
	delete notice;
	if (next != NULL) {
		delete next;
	}
	delete mImageCache;
	if (tempImage != NULL) {
		delete tempImage;
		tempImage = NULL;
	}

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
		((Label *)widget->getChildren()[1])->setFont(gFontBlue);
	} else {
		((Label *)widget->getChildren()[1])->setFont(gFontWhite);
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
		case MAK_SOFTLEFT:
			previous->show();
			break;
		case MAK_FIRE:
			if (!emp) {
				if (next != NULL) {
					delete next;
				}
				next = new ShopDetailsScreen(this, feed, ShopDetailsScreen::ST_AUCTION, NULL, auctions[listBox->getSelectedIndex()].getCard());
				next->show();
			}
			break;
		case MAK_SOFTRIGHT:
			if (!emp) {
				switch (screenType) {
					case ST_CATEGORY:
						if (next != NULL) {
							delete next;
						}
						next = new BidOrBuyScreen(this, feed, &auctions[listBox->getSelectedIndex()]);
						next->show();
						break;
				}
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
		notice->setCaption("");
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
	if(!strcmp(parentTag.c_str(), xml_cardid)) {
		cardId += data;
	} else if(!strcmp(parentTag.c_str(), xml_carddescription)) {
		description += data;
	} else if(!strcmp(parentTag.c_str(), xml_thumburl)) {
		thumburl += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), xml_opening_bid)) {
		openingBid += data;
	} else if(!strcmp(parentTag.c_str(), xml_price)) {
		price += data;
	} else if(!strcmp(parentTag.c_str(), xml_user_card_id)) {
		userCardId += data;
	} else if(!strcmp(parentTag.c_str(), xml_auction_card_id)) {
		auctionCardId += data;
	} else if(!strcmp(parentTag.c_str(), xml_username)) {
		username += data;
	} else if(!strcmp(parentTag.c_str(), xml_buy_now_price)) {
		buyNowPrice += data;
	} else if(!strcmp(parentTag.c_str(), xml_end_date)) {
		endDate += data;
	} else if(!strcmp(parentTag.c_str(), xml_last_bid_user)) {
		lastBidUser += data;
	}
}

void AuctionListScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_thumburl)) {
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

		auctions.add(*auction);

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
	} else if(!strcmp(name, xml_error)) {
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, xml_auctionsdone)) {
		notice->setCaption("Building list...");
		drawList();
	}
}

void AuctionListScreen::mtxParseError() {
}

void AuctionListScreen::mtxEmptyTagEnd() {
}

void AuctionListScreen::mtxTagStartEnd() {
}
