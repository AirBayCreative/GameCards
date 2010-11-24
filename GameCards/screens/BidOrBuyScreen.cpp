#include <madmath.h>

#include "BidOrBuyScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"

BidOrBuyScreen::BidOrBuyScreen(Screen *previous, Feed *feed, Auction *auction):mHttp(this), previous(previous), feed(feed), auction(auction) {
	canPurchase = false;
	busy = false;

	bidEditBox = NULL;
	editBoxLabel = NULL;

	layout = createMainLayout(back, select);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];

	screenPhase = SP_CHOOSE_ACTION;
	drawChoosePhase();

	this->setMain(layout);

	keyboard = new MobKeyboard(0, (int)floor((double)scrHeight - ((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER)),
		scrWidth, (int)floor((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER));
}

BidOrBuyScreen::~BidOrBuyScreen() {
	layout->getChildren().clear();
	listBox->getChildren().clear();
	delete listBox;
	delete layout;
	if (softKeys != NULL) {
		softKeys->getChildren().clear();
		delete softKeys;
		softKeys = NULL;
	}
	if (editBoxLabel != NULL) {
		delete editBoxLabel;
		editBoxLabel = NULL;
	}
	if (keyboard != NULL) {
		delete keyboard;
		keyboard = NULL;
	}
	delete lbl;
	delete notice;
}

void BidOrBuyScreen::drawChoosePhase() {
	listBox->getChildren().clear();

	updateSoftKeyLayout(back, select, "", layout);

	lbl = createSubLabel(place_bid);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = createSubLabel(buy_now);
	lbl->addWidgetListener(this);
	listBox->add(lbl);

	listBox->setSelectedIndex(0);
}

void BidOrBuyScreen::drawBuyNowPhase() {
	listBox->getChildren().clear();

	//check that the user can afford the buy out price
	if (atof(feed->getCredits().c_str()) >= atof(auction->getBuyNowPrice().c_str())) {
		canPurchase = true;
	}
	else {
		canPurchase = false;
	}

	String confirmLabel = "";
	if (canPurchase) {
		updateSoftKeyLayout(back, confirm, "", layout);
		confirmLabel += sure_you_want_to_buy_now + auction->getCard()->getText() + priceFor +
				auction->getBuyNowPrice() + " credits?";
	}
	else {
		updateSoftKeyLayout(back, "", "", layout);
		confirmLabel += not_enough_credits;
	}

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, listBox, confirmLabel, 0, gFontGrey);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);

	listBox->requestRepaint();
}

void BidOrBuyScreen::drawPostSubmitPhase(String message) {
	listBox->getChildren().clear();

	updateSoftKeyLayout("", confirm, "", layout);

	lbl = new Label(0,0, scrWidth-PADDING*2, 0, NULL, message, 0, gFontGrey);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setAutoSizeY(true);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);
}

void BidOrBuyScreen::drawPlaceBidPhase() {
	listBox->getChildren().clear();

	updateSoftKeyLayout(back, bid, "", layout);

	String bidDetails = "";

	if (!strcmp(auction->getPrice().c_str(), "")) {
		bidDetails += "Opening Bid: " + auction->getOpeningBid();
	}
	else {
		bidDetails += "Current Bid: " + auction->getPrice();
	}

	bidDetails += "\nBuy Now Price: " + auction->getBuyNowPrice();
	bidDetails += "\nEnd Date: " + auction->getEndDate();
	bidDetails += "\nYour Bid: ";

	lbl = new Label(0,0, scrWidth-PADDING*2, 0, NULL, bidDetails, 0, gFontGrey);
	lbl->setAutoSizeY(true);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);

	editBoxLabel = createEditLabel("");
	bidEditBox = new MobEditBox(0, 12, editBoxLabel->getWidth()-PADDING*2, editBoxLabel->getHeight()-PADDING*2, editBoxLabel, "", 0, gFontBlack, true, false);
	bidEditBox->setInputMode(MobEditBox::IM_NUMBERS);
	bidEditBox->setDrawBackground(false);
	editBoxLabel->addWidgetListener(this);
	listBox->add(editBoxLabel);

	bidEditBox->setSelected(true);
}

/**
* Returns a blank string if the bid is valid.
*/
String BidOrBuyScreen::validateBid(){
	String bid = bidEditBox->getCaption();
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
	else if (atof(auction->getBuyNowPrice().c_str()) <= atof(bid.c_str())) {
		errorString = "Your bid should be lower than the buy now price.";
	}

	return errorString;
}

void BidOrBuyScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void BidOrBuyScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void BidOrBuyScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (!(keyboard->isShown()) && right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (!(keyboard->isShown()) && left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}

	int yClick = point.y;
	int keyboardY = keyboard->getPosition().y;

	switch (screenPhase) {
		case SP_PLACE_BID:
			if (list && !(keyboard->isShown())) {
				keyboard->attachWidget(bidEditBox);
				keyboard->show();
			}
			else if (yClick < keyboardY || yClick > keyboardY + keyboard->getHeight()) {
				keyboard->deAttachEditBox();
				keyboard->hide();

				layout->draw(true);
			}
			break;
	}
}

void BidOrBuyScreen::locateItem(MAPoint2d point)
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
        	if (screenPhase != SP_BUY_NOW) {
        		((ListBox*)layout->getChildren()[0]->getChildren()[2])->setSelectedIndex(i);
        	}
        	list = true;
        }
    }
    for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
			if (i == 0) {
				left = true;
			} else if (i == 1) {
				list = true;
			} else if (i == 2) {
				right = true;
			}
			return;
		}
	}
}

void BidOrBuyScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontWhite);
	}
}

void BidOrBuyScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
			switch(screenPhase) {
				case SP_CHOOSE_ACTION:
					int index = listBox->getSelectedIndex();
					if(index == 0) {
						screenPhase = SP_PLACE_BID;
						drawPlaceBidPhase();
					} else if(index == 1) {
						screenPhase = SP_BUY_NOW;
						drawBuyNowPhase();
					}
					break;
			}
			break;
		case MAK_SOFTRIGHT:
			switch(screenPhase) {
				case SP_CHOOSE_ACTION:
					int index = listBox->getSelectedIndex();
					if(index == 0) {
						screenPhase = SP_PLACE_BID;
						drawPlaceBidPhase();
					} else if(index == 1) {
						screenPhase = SP_BUY_NOW;
						drawBuyNowPhase();
					}
					break;
				case SP_BUY_NOW:
					if (!busy) {
						busy = true;
						char *url = new char[100];
						memset(url,'\0',100);
						sprintf(url, "%s&username=%s&buynowprice=%s&auctioncardid=%s&usercardid=%s", BUY_AUCTION_NOW.c_str(),
								feed->getUsername().c_str(), auction->getBuyNowPrice().c_str(), auction->getAuctionCardId().c_str(), auction->getUserCardId().c_str());
						int res = mHttp.create(url, HTTP_GET);

						if(res < 0) {

						} else {
							mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
							mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
							mHttp.finish();
						}
					}
					break;
				case SP_POST_SUBMIT:
					orig->show();
					break;
				case SP_PLACE_BID:
					if (!busy) {
						String valid = validateBid();
						notice->setCaption(valid);

						if (valid.length() == 0) {
							busy = true;
							char *url = new char[100];
							memset(url,'\0',100);
							sprintf(url, "%s&username=%s&bid=%s&auctioncardid=%s", AUCTION_BID.c_str(),
									feed->getUsername().c_str(), bidEditBox->getCaption().c_str(), auction->getAuctionCardId().c_str());
							int res = mHttp.create(url, HTTP_GET);

							if(res < 0) {

							} else {
								mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
								mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
								mHttp.finish();
							}
						}
					}
					break;
			}
			break;
		case MAK_SOFTLEFT:
			switch(screenPhase) {
				case SP_CHOOSE_ACTION:
					previous->show();
					break;
				case SP_BUY_NOW:
					screenPhase = SP_CHOOSE_ACTION;
					drawChoosePhase();
					break;
				case SP_PLACE_BID:
					screenPhase = SP_CHOOSE_ACTION;
					drawChoosePhase();
					break;
			}
			break;
		case MAK_DOWN:
			switch(screenPhase) {
				case SP_CHOOSE_ACTION:
					listBox->selectNextItem();
					break;
			}
			break;
		case MAK_UP:
			switch(screenPhase) {
				case SP_CHOOSE_ACTION:
					listBox->selectPreviousItem();
					break;
			}
			break;
	}
}

void BidOrBuyScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
	}
}

void BidOrBuyScreen::connReadFinished(Connection* conn, int result) {}

void BidOrBuyScreen::xcConnError(int code) {
}

void BidOrBuyScreen::mtxEncoding(const char* ) {
}

void BidOrBuyScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void BidOrBuyScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void BidOrBuyScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "result")) {
		result += data;
	}
}

void BidOrBuyScreen::mtxTagEnd(const char* name, int len) {
	switch(screenPhase) {
		case SP_BUY_NOW:
			if(!strcmp(name, "result")) {
				screenPhase = SP_POST_SUBMIT;
				if (!strcmp(result.c_str(), xml_buyout_success)) {
					drawPostSubmitPhase("Purchase success!");
				}
				else {
					drawPostSubmitPhase("Purchase failed.");
				}
				busy = false;
			}
			break;
		case SP_PLACE_BID:
			if(!strcmp(name, "result")) {
				bidEditBox->setSelected(false);
				screenPhase = SP_POST_SUBMIT;
				if (!strcmp(result.c_str(), xml_bid_success)) {
					drawPostSubmitPhase("Bid success!");
				}
				else {
					drawPostSubmitPhase("Bid failed.");
				}
				busy = false;
			}
			break;
	}
}

void BidOrBuyScreen::mtxParseError() {
}

void BidOrBuyScreen::mtxEmptyTagEnd() {
}

void BidOrBuyScreen::mtxTagStartEnd() {
}
