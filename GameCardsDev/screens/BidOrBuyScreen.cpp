#include <madmath.h>

#include "BidOrBuyScreen.h"
#include "ShopCategoriesScreen.h"
#include "ImageScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"

BidOrBuyScreen::BidOrBuyScreen(Screen *previous, Feed *feed, Auction *auction, int phaseType, String bidAmount):mHttp(this), previous(previous), feed(feed), auction(auction) {
	canPurchase = false;
	busy = false;

	bidEditBox = NULL;
	editBoxLabel = NULL;

	layout = createMainLayout(back, select);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];


	if (phaseType == SP_BUY_NOW)
	{
		screenPhase = SP_BUY_NOW;
		drawBuyNowPhase();
	}
	else if (phaseType == SP_PLACE_BID)
	{
		screenPhase = SP_PLACE_BID;

		notice->setCaption("placing bid");

		if (!busy) {
			String valid = validateBid(bidAmount);
			notice->setCaption(valid);

			if (valid.length() == 0) {
				//bidEditBox->setSelected(false);

				busy = true;
				//work out how long the url will be, the number is for the & and = symbols and hard coded params
				int urlLength = AUCTION_BID.length() + feed->getUsername().length() +  bidEditBox->getCaption().length() +
						auction->getAuctionCardId().length() + 30;
				char *url = new char[urlLength];
				memset(url,'\0',urlLength);
				sprintf(url, "%s&username=%s&bid=%s&auctioncardid=%s", AUCTION_BID.c_str(),
						feed->getUsername().c_str(), bidEditBox->getCaption().c_str(), auction->getAuctionCardId().c_str());
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

	this->setMain(layout);
}

BidOrBuyScreen::~BidOrBuyScreen() {
	delete layout;
}

void BidOrBuyScreen::drawChoosePhase() {
	clearListBox();

#if defined(MA_PROF_SUPPORT_STYLUS)
	updateSoftKeyLayout(back, "", "", layout);
#else
	updateSoftKeyLayout(back, select, "", layout);
#endif

	lbl = createSubLabel(place_bid);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = createSubLabel(buy_now);
	lbl->addWidgetListener(this);
	listBox->add(lbl);

	listBox->setSelectedIndex(0);
}

void BidOrBuyScreen::drawBuyNowPhase() {
	clearListBox();

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

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, listBox, confirmLabel, 0, gFontBlack);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);

	listBox->requestRepaint();
}

void BidOrBuyScreen::drawPostSubmitPhase(String message) {
	clearListBox();


	updateSoftKeyLayout("", confirm, "", layout);

	lbl = new Label(0,0, scrWidth-PADDING*2, 0, NULL, message, 0, gFontBlack);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setAutoSizeY(true);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);

	Screen* next = new ImageScreen(orig, RES_LOADING, feed, false, auction->getCard());
	next->show();;
}

void BidOrBuyScreen::drawPlaceBidPhase() {
	clearListBox();

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

	lbl = new Label(0,0, scrWidth-PADDING*2, 0, NULL, bidDetails, 0, gFontBlack);
	lbl->setAutoSizeY(true);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);

	editBoxLabel = createEditLabel("");
	//bidEditBox = new MobEditBox(0, 12, editBoxLabel->getWidth()-PADDING*2, editBoxLabel->getHeight()-PADDING*2, editBoxLabel, "", 0, gFontBlack, true, false);
	bidEditBox = new NativeEditBox(0, 0, editBoxLabel->getWidth()-PADDING*2, editBoxLabel->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, editBoxLabel, "", L"Your Bid:");
	bidEditBox->setDrawBackground(false);
	editBoxLabel->addWidgetListener(this);
	listBox->add(editBoxLabel);

	bidEditBox->setSelected(true);
}

void BidOrBuyScreen::clearListBox() {
	for (int i = 0; i < listBox->getChildren().size(); i++) {
		tempWidgets.add(listBox->getChildren()[i]);
	}
	listBox->clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
}

/**
* Returns a blank string if the bid is valid.
*/
String BidOrBuyScreen::validateBid(String bidAmount){
	String bid = bidAmount;
	if (strcmp(bidAmount.c_str(), "") == 0)
	{
		bid = bidEditBox->getCaption();
	}
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

#if defined(MA_PROF_SUPPORT_STYLUS)
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
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}

	/*if (!fromChoose) {
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
	fromChoose = false;*/
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
#endif

void BidOrBuyScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontBlack);
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
						//work out how long the url will be, the 8 is for the & and = symbols and hard coded params
						int urlLength = BUY_AUCTION_NOW.length() +
								auction->getAuctionCardId().length() + 15;
						char *url = new char[urlLength];
						memset(url,'\0',urlLength);
						sprintf(url, "%s&auctioncardid=%s", BUY_AUCTION_NOW.c_str(),
								auction->getAuctionCardId().c_str());
						int res = mHttp.create(url, HTTP_GET);

						if(res < 0) {

						} else {
							mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
							mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
							mHttp.finish();
						}
						delete [] url;
					}
					break;
				case SP_POST_SUBMIT:
					((ShopCategoriesScreen *)orig)->refresh();
					break;
				case SP_PLACE_BID:
					if (!busy) {
						String valid = validateBid();
						notice->setCaption(valid);

						if (valid.length() == 0) {
							bidEditBox->setSelected(false);

							busy = true;
							//work out how long the url will be, the number is for the & and = symbols and hard coded params
							int urlLength = AUCTION_BID.length() + feed->getUsername().length() +  bidEditBox->getCaption().length() +
									auction->getAuctionCardId().length() + 30;
							char *url = new char[urlLength];
							memset(url,'\0',urlLength);
							sprintf(url, "%s&username=%s&bid=%s&auctioncardid=%s", AUCTION_BID.c_str(),
									feed->getUsername().c_str(), bidEditBox->getCaption().c_str(), auction->getAuctionCardId().c_str());
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
					break;
			}
			break;
		case MAK_BACK:
		case MAK_SOFTLEFT:
			previous->show();
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
				//bidEditBox->setSelected(false);
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
