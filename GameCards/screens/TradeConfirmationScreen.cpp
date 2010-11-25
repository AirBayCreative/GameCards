#include <conprint.h>

#include "TradeConfirmationScreen.h"
#include "TradeCompleteScreen.h"
#include "../utils/Util.h"

TradeConfirmationScreen::TradeConfirmationScreen(Screen *previous, Feed *feed, Card *card, String method, String friendDetail)
		:previous(previous), feed(feed), card(card), method(method), friendDetail(friendDetail), mHttp(this) {
	sending = false;
	menu = new Screen();

	layout = createMainLayout(back, confirm);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];

	String confirmLabel = sure_you_want_to_send + card->getText() + friend_with + method + " " + friendDetail + "?";

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, gFontGrey);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);

	this->setMain(layout);
}

TradeConfirmationScreen::~TradeConfirmationScreen() {
	layout->getChildren().clear();
	listBox->getChildren().clear();

	delete listBox;
	delete layout;
	if (image != NULL) {
		delete image;
		image = NULL;
	}
	if (softKeys != NULL) {
		softKeys->getChildren().clear();
		delete softKeys;
		softKeys = NULL;
	}
	delete lbl;
	delete menu;
	parentTag="";
	notice="";
	temp="";
	temp1="";
	error_msg="";
}

void TradeConfirmationScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeConfirmationScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeConfirmationScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void TradeConfirmationScreen::locateItem(MAPoint2d point)
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
        	((ListBox *)this->getMain()->getChildren()[0]->getChildren()[2])->setSelectedIndex(i);
        	list = true;
        }
    }
    for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
			if (i == 0) {
				left = true;
			} else if (i == 2) {
				right = true;
			}
			return;
		}
	}
}

void TradeConfirmationScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_SOFTRIGHT:
			if (!sending) {

				sending = true;

				lbl->setCaption(sending_card_message);

				//make the http connection to trade the card

				int urlLength = TRADE.length() + strlen(trade_by_detail) + friendDetail.length() + strlen(trade_cardid) + card->getId().length() + 11;
				char *url = new char[urlLength];
				memset(url, '\0', urlLength);
				//www.mytcg.net/_phone/tradecard=1&detail=072623672&cardid=40
				sprintf(url, "%s&%s=%s&%s=%s&sms=No", TRADE.c_str(), trade_by_detail, friendDetail.c_str(), trade_cardid, card->getId().c_str());
				//url.append("&sms=Yes", 8);
				int res = mHttp.create(url, HTTP_GET);

				if(res < 0) {

				} else {
					mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
					mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());

					mHttp.finish();
				}
				delete url;
			}

			break;
		case MAK_SOFTLEFT:
			previous->show();
			break;
	}
}

void TradeConfirmationScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		sending = false;

		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
	}
}

void TradeConfirmationScreen::connReadFinished(Connection* conn, int result) {}

void TradeConfirmationScreen::xcConnError(int code) {

}

void TradeConfirmationScreen::mtxEncoding(const char* ) {
}

void TradeConfirmationScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void TradeConfirmationScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void TradeConfirmationScreen::mtxTagData(const char* data, int len) {
	if (strcmp(data, "1") == 0) {
		if (menu != NULL) {
			delete menu;
		}
		menu = new TradeCompleteScreen(feed);
		menu->show();
	}
	else if (strcmp(data, "-1") == 0) {
		lbl->setCaption(error_number_card_message);
	}
	else if (strcmp(data, "-2") == 0) {
		lbl->setCaption(error_numeric_card_message);
	}
	else {
		lbl->setCaption(error_sending_card_message);
	}
}

void TradeConfirmationScreen::mtxTagEnd(const char* name, int len) {
}

void TradeConfirmationScreen::mtxParseError() {
}

void TradeConfirmationScreen::mtxEmptyTagEnd() {
}

void TradeConfirmationScreen::mtxTagStartEnd() {
}
