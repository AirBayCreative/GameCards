#include <conprint.h>

#include "TradeConfirmationScreen.h"
#include "TradeCompleteScreen.h"
#include "Util.h"

TradeConfirmationScreen::TradeConfirmationScreen(Screen *previous, Feed *feed, Card *card, String message, String phoneNum)
		:previous(previous), feed(feed), card(card), mHttp(this), phoneNum(phoneNum) {
	sending = false;
	menu = new Screen();

	layout = createMainLayout(back, confirm);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];
	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, message, 0, gFontWhite);
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
	softKeys->getChildren().clear();
	delete listBox;
	delete layout;
	if (image != NULL) {
		delete image;
		image = NULL;
	}
	if (softKeys != NULL) {
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

				char *url = new char[255];
				memset(url, '\0', 255);
				sprintf(url, "%s&%s=%s&%s=%s", TRADE.c_str(), trade_by_detail, phoneNum.c_str(), trade_cardid, card->getId().c_str());

				int res = mHttp.create(url, HTTP_GET);

				mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
				mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());

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
