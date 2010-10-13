#include <conprint.h>

#include "RedeemConfirmationScreen.h"
#include "TradeCompleteScreen.h"
#include "Util.h"

RedeemConfirmationScreen::RedeemConfirmationScreen(Screen *previous, Feed *feed, Card card)
		:previous(previous), feed(feed), card(card), mHttp(this) {
	sending = false;

	layout = createMainLayout(back, confirm);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];

	String confirmLabel = sure_you_want_to_redeem + card.getText() + " " + voucherlbl + "?";

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, gFontGrey);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);

	this->setMain(layout);
}

RedeemConfirmationScreen::~RedeemConfirmationScreen() {
}

void RedeemConfirmationScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void RedeemConfirmationScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void RedeemConfirmationScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void RedeemConfirmationScreen::locateItem(MAPoint2d point)
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

void RedeemConfirmationScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_SOFTRIGHT:
			if (!sending) {

				sending = true;

				lbl->setCaption(sending_card_message);


				//make the http connection to trade the card

				char *url = new char[255];
				memset(url, '\0', 255);
				//www.mytcg.net/_phone/tradecard=1&detail=072623672&cardid=40
				sprintf(url, "%s&%s=%s&%s=%s", TRADE.c_str(), trade_by_detail, redeem_number, trade_cardid, card.getId().c_str());
				int res = mHttp.create(url, HTTP_GET);

				mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
				mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());

				//printf("feed->getEncrypt().c_str(): %s", feed->getEncrypt().c_str());
				//printf("card.getId().c_str(): %s", card.getId().c_str());

				/*if (strcmp(method.c_str(), userlblNoColon)) {
					mHttp.setRequestHeader(trade_by, by_username);
				}
				else if (strcmp(method.c_str(), emaillblNoColon)) {
					mHttp.setRequestHeader(trade_by, by_email);
				}
				else if (strcmp(method.c_str(), phoneNumlbl)) {
					mHttp.setRequestHeader(trade_by, by_phone_number);
				}*/
				/*mHttp.setRequestHeader(trade_cardid, card.getId().c_str());
				mHttp.setRequestHeader(trade_by_detail, friendDetail.c_str());*/
				if(res < 0) {

				} else {
					mHttp.finish();
				}
			}

			break;
		case MAK_SOFTLEFT:
			previous->show();
			break;
	}
}

void RedeemConfirmationScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		sending = false;

		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
	}
}

void RedeemConfirmationScreen::connReadFinished(Connection* conn, int result) {}

void RedeemConfirmationScreen::xcConnError(int code) {
	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
}

void RedeemConfirmationScreen::mtxEncoding(const char* ) {
}

void RedeemConfirmationScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
	//printf("startTag: %s", name);
}

void RedeemConfirmationScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
	//printf("attrName: %s\nattrValue: %s", attrName, attrValue);
}

void RedeemConfirmationScreen::mtxTagData(const char* data, int len) {
	//printf("data: %s", data);
	if (strcmp(data, "1") == 0) {
		menu = new TradeCompleteScreen(feed, voucher_redeemed);
		menu->show();
	}
	else {
		lbl->setCaption(error_sending_card_message);
	}
}

void RedeemConfirmationScreen::mtxTagEnd(const char* name, int len) {
	//printf("endTag: %s", name);
}

void RedeemConfirmationScreen::mtxParseError() {
}

void RedeemConfirmationScreen::mtxEmptyTagEnd() {
}

void RedeemConfirmationScreen::mtxTagStartEnd() {
}
