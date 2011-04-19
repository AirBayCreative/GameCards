#include "TradeFriendDetailScreen.h"
#include "AlbumViewScreen.h"
#include "../utils/Util.h"

TradeFriendDetailScreen::TradeFriendDetailScreen(Screen *previous, Feed *feed, Card *card) :previous(previous), feed(feed), card(card), mHttp(this) {
	sending = false;
	friendDetail = "";
	methodLabel = "";
	method = "";
	result = "";
	menu = NULL;
	layout = createMainLayout(back, continuelbl);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*)layout->getChildren()[0]->getChildren()[1];

	layout->setDrawBackground(TRUE);
	this->setMain(layout);

	drawMethodScreen();
}

TradeFriendDetailScreen::~TradeFriendDetailScreen() {
	method="";
	methodLabel="";
	friendDetail="";
	parentTag="";
	temp="";
	temp1="";
	error_msg="";
	result="";
	delete layout;
	if (menu != NULL) {
		delete menu;
		menu = NULL;
	}
}

void TradeFriendDetailScreen::drawMethodScreen() {
	phase = SP_METHOD;

	notice->setCaption("");
	clearListBox();

	updateSoftKeyLayout(back, select, "", layout);

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, selectFriendBy, 0, gFontBlack);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	listBox->add(lbl);
	lbl = createSubLabel(userlblNoColon);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = createSubLabel(emaillblNoColon);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	listBox->setSelectedIndex(2);
	lbl = createSubLabel(phoneNumlbl);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	listBox->setSelectedIndex(1);
}

void TradeFriendDetailScreen::drawDetailScreen() {
	phase = SP_DETAIL;

	notice->setCaption("");
	clearListBox();

	updateSoftKeyLayout(back, continuelbl, "", layout);

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, methodLabel+":", 0, gFontBlack);
	lbl->setSkin(gSkinBack);

	lblMethod = createEditLabel("");
	contactEditBox = new NativeEditBox(0, 0, lblMethod->getWidth()-PADDING*2, lblMethod->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, lblMethod, "", L"");
	if (strcmp(methodLabel.c_str(), phoneNumlbl) == 0) {
		contactEditBox->setInputMode(EditBox::IM_NUMBERS);
	}
	contactEditBox->setDrawBackground(false);
	lblMethod->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(lblMethod);

	contactEditBox->setText("");
	contactEditBox->setSelected(true);
	listBox->setSelectedIndex(1);
}

void TradeFriendDetailScreen::drawConfirmScreen() {
	phase = SP_CONFIRM;

	notice->setCaption("");
	clearListBox();

	updateSoftKeyLayout(back, confirm, "", layout);

	String confirmLabel = sure_you_want_to_send + card->getText() + friend_with + methodLabel + " " + friendDetail + "?";

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, gFontBlack);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);
}

void TradeFriendDetailScreen::drawCompleteScreen() {
	phase = SP_COMPLETE;

	notice->setCaption("");
	clearListBox();

	updateSoftKeyLayout("", continuelbl, "", layout);

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, result, 0, gFontBlack);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);
}

void TradeFriendDetailScreen::clearListBox() {
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
#if defined(MA_PROF_SUPPORT_STYLUS)
void TradeFriendDetailScreen::pointerPressEvent(MAPoint2d point) {
	locateItem(point);
}

void TradeFriendDetailScreen::pointerMoveEvent(MAPoint2d point) {
	locateItem(point);
}

void TradeFriendDetailScreen::pointerReleaseEvent(MAPoint2d point) {
	if (phase == SP_DETAIL) {
		int yClick = point.y;
	}

	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (phase != SP_DETAIL) {
		keyPressEvent(MAK_FIRE);
	}
}

void TradeFriendDetailScreen::locateItem(MAPoint2d point) {
	left = false;
	right = false;

	Point p;
	p.set(point.x, point.y);
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
#endif

void TradeFriendDetailScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontBlack);
	}
}

void TradeFriendDetailScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
	case MAK_FIRE:
		//break;
	case MAK_SOFTRIGHT:
		switch(phase) {
			case SP_METHOD:
				int index = listBox->getSelectedIndex();
				if (index == 0) {
					listBox->setSelectedIndex(1);
				}
				else {
					if(index == 1) {
						method = by_username;
						methodLabel = userlblNoColon;
					} else if(index == 2) {
						method = by_email;
						methodLabel = emaillblNoColon;
					} else if(index == 3) {
						method = by_phone_number;
						methodLabel = phoneNumlbl;
					}
					drawDetailScreen();
				}
				break;
			case SP_DETAIL:
				if (contactEditBox->getText() == "") {
					notice->setCaption(no_contact + method + ".");
				}
				else {
					notice->setCaption("");
					friendDetail = contactEditBox->getText();
					drawConfirmScreen();
				}
				break;
			case SP_CONFIRM:
				if (!sending) {
					sending = true;

					lbl->setCaption(sending_card_message);

					//make the http connection to trade the card
					int urlLength = TRADE.length() + card->getId().length() + strlen(trade_method) +
							method.length() + strlen(trade_by_detail) + friendDetail.length() + 4;
					char *url = new char[urlLength];
					memset(url, '\0', urlLength);

					sprintf(url, "%s%s&%s=%s&%s=%s", TRADE.c_str(), card->getId().c_str(),
							trade_method, method.c_str(), trade_by_detail, friendDetail.c_str());
					//url.append("&sms=Yes", 8);
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
				break;
			case SP_COMPLETE:
				((AlbumViewScreen *)origAlbum)->refresh();
				break;
		}
		break;
	case MAK_SOFTLEFT:
		switch(phase) {
			case SP_METHOD:
				previous->show();
				break;
			case SP_DETAIL:
				contactEditBox->setSelected(false);
				drawMethodScreen();
				break;
			case SP_CONFIRM:
				drawDetailScreen();
				break;
		}
		break;
	case MAK_DOWN:
		switch(phase) {
			case SP_METHOD:
				listBox->selectNextItem();
				break;
			case SP_DETAIL:
				contactEditBox->setSelected(true);
				break;
		}
		break;
	case MAK_UP:
		switch(phase) {
			case SP_METHOD:
				if (listBox->getSelectedIndex() > 1)
					listBox->selectPreviousItem();
				break;
			case SP_DETAIL:
				contactEditBox->setSelected(true);
				break;
		}
		break;
	}
}

void TradeFriendDetailScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		sending = false;

		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
	}
}

void TradeFriendDetailScreen::connReadFinished(Connection* conn, int result) {
}

void TradeFriendDetailScreen::xcConnError(int code) {

}

void TradeFriendDetailScreen::mtxEncoding(const char* ) {
}

void TradeFriendDetailScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void TradeFriendDetailScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void TradeFriendDetailScreen::mtxTagData(const char* data, int len) {
	if (strcmp(parentTag.c_str(), xml_result) == 0) {
		result = data;
	}
	else {
		result = error_sending_card_message;
	}
	drawCompleteScreen();
}

void TradeFriendDetailScreen::mtxTagEnd(const char* name, int len) {
}

void TradeFriendDetailScreen::mtxParseError() {
}

void TradeFriendDetailScreen::mtxEmptyTagEnd() {
}

void TradeFriendDetailScreen::mtxTagStartEnd() {
}
