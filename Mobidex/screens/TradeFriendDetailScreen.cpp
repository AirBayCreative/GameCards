#include "TradeFriendDetailScreen.h"
#include "AlbumViewScreen.h"
#include "OptionsScreen.h"
#include "../utils/Util.h"

TradeFriendDetailScreen::TradeFriendDetailScreen(Screen *previous, Feed *feed, Card *card) :previous(previous), feed(feed), card(card), mHttp(this) {
	sending = false;
	fresh = true;
	friendDetail = "";
	friendNote = "";
	methodLabel = "";
	method = "";
	result = "";
	menu = NULL;
	layout = createMainLayout(sharelbl, back, "", true);
	listBox = (KineticListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*)layout->getChildren()[0]->getChildren()[1];

	layout->setDrawBackground(TRUE);
	this->setMain(layout);

	method = by_phone_number;
	methodLabel = phoneNumlbl;
	drawDetailScreen();
}

TradeFriendDetailScreen::~TradeFriendDetailScreen() {
	method="";
	methodLabel="";
	friendDetail="";
	friendNote = "";
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

	updateSoftKeyLayout(select, back, "", layout);

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, selectFriendBy, 0, gFontWhite);
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
	setPadding(listBox);
	updateSoftKeyLayout(sharelbl, back, "", layout);

	Label* l;

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, methodLabel, 0, gFontWhite);
	lbl->setSkin(gSkinBack);

	lblMethod = createEditLabel("enter cell number");
	contactEditBox = new NativeEditBox(0, 0, lblMethod->getWidth()-PADDING*2, lblMethod->getHeight()-PADDING*2, 64, MA_TB_TYPE_PHONENUMBER/*MA_TB_TYPE_ANY*/, lblMethod, "enter cell number", L"", fresh);
	//if (strcmp(methodLabel.c_str(), phoneNumlbl) == 0) {
		contactEditBox->setInputMode(EditBox::IM_NUMBERS);
	//}
	contactEditBox->setDrawBackground(false);
	lblMethod->addWidgetListener(this);

	/*lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Enter the cell number of the person you want to share your card with", 0, gFontWhite);
	lbl->setMultiLine(true);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setSkin(gSkinBack);*/

	listBox->add(lbl);
	listBox->add(lblMethod);


	//contactEditBox->setText("");
	contactEditBox->setSelected(true);

	listBox->setSelectedIndex(1);

	l = lbl;

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, personalNotelbl, 0, gFontWhite);
	lbl->setSkin(gSkinBack);

	lblMethod =  new Label(0,0, scrWidth-(PADDING*2), (listBox->getHeight()-100-(PADDING)), NULL, "", 0, gFontWhite);
	lblMethod->setSkin(gSkinEditBox);
	setPadding(lblMethod);
	editBoxNote = new NativeEditBox(0, 0, lblMethod->getWidth()-PADDING*2, lblMethod->getHeight()-PADDING*2, 140, MA_TB_TYPE_ANY, lblMethod, "", L"Note:");
	editBoxNote->setDrawBackground(false);
	editBoxNote->setMaxLength(140);
	editBoxNote->setMultiLine(true);


	lblMethod->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(lblMethod);

	lbl = l;
	l = NULL;
}

void TradeFriendDetailScreen::drawConfirmScreen() {
	phase = SP_CONFIRM;

	notice->setCaption("");
	clearListBox();

	updateSoftKeyLayout(confirm, back, "", layout);

	String confirmLabel = sure_you_want_to_send + card->getText() + friend_with + methodLabel + " " + friendDetail + "?";

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, gFontWhite);
	lbl->setHorizontalAlignment(Label::HA_LEFT);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);

	confirmLabel = "Personal Note\n\n" + friendNote;

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, gFontWhite);
	lbl->setHorizontalAlignment(Label::HA_LEFT);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);
}

void TradeFriendDetailScreen::drawCompleteScreen() {
	phase = SP_COMPLETE;

	notice->setCaption(result);
	//lbl->setCaption("");
	//clearListBox();

	//updateSoftKeyLayout(continuelbl, "", "", layout);

	//lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, result, 0, gFontWhite);
	//lbl->setHorizontalAlignment(Label::HA_CENTER);
	//lbl->setVerticalAlignment(Label::VA_CENTER);
	//lbl->setSkin(gSkinBack);
	//lbl->setMultiLine(true);
	//listBox->add(lbl);
}

void TradeFriendDetailScreen::clearListBox() {
	listBox->setPaddingLeft(0);
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
	} else if (phase != SP_DETAIL && list) {
		keyPressEvent(MAK_FIRE);
	}
}

void TradeFriendDetailScreen::locateItem(MAPoint2d point) {
	list = false;
	left = false;
	right = false;

	Point p;
	p.set(point.x, point.y);
	for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
		{
			//((KineticListBox *)this->getMain()->getChildren()[0]->getChildren()[2])->setSelectedIndex(i);
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
#endif

void TradeFriendDetailScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
			widget->getChildren()[0]->setSelected(true);
		} else {
			widget->getChildren()[0]->setSelected(false);
		}
}

void TradeFriendDetailScreen::keyPressEvent(int keyCode) {
	int index = listBox->getSelectedIndex();
	if (fresh) {
		String text = contactEditBox->getText();
		if (text.length() == 16) {
			text.remove(0,text.length());
		} else if (text.length() == 17){
			text.remove(0,17);
		} else if (text.length() == 18) {
			text.remove(0,17);
		}
		contactEditBox->setText(text);
		fresh = !fresh;
	}
	switch(keyCode) {
	case MAK_FIRE:
		//break;
	case MAK_SOFTLEFT:
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
					break;
				}
				else {
					notice->setCaption("");
					friendDetail = contactEditBox->getText();
					friendNote = editBoxNote->getText();
					//drawConfirmScreen();
					phase = SP_CONFIRM;
				}
			case SP_CONFIRM:
				if (!sending) {
					sending = true;

					notice->setCaption(sending_card_message);

					String noteStr = base64_encode(reinterpret_cast<const unsigned char*>(friendNote.c_str()), friendNote.length());

					//make the http connection to trade the card
					int urlLength = TRADE.length() + card->getId().length() + strlen(trade_method) +
							method.length() + strlen(trade_by_detail) + friendDetail.length() + 6 + strlen(noteLlbl) + noteStr.length();
					char *url = new char[urlLength];
					memset(url, '\0', urlLength);

					sprintf(url, "%s%s&%s=%s&%s=%s&%s=%s", TRADE.c_str(), card->getId().c_str(),
							trade_method, method.c_str(), trade_by_detail, friendDetail.c_str(), noteLlbl, noteStr.c_str());
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
	case MAK_BACK:
	case MAK_SOFTRIGHT:
		//previous = new OptionsScreen(feed, OptionsScreen::ST_CARD_OPTIONS,
									//this, card);
		editBoxNote->setSelected(false);
		editBoxNote->disableListener();
		contactEditBox->setSelected(false);
		contactEditBox->disableListener();
		previous->show();
		break;
	case MAK_DOWN:
		if (index == 1) {
			listBox->setSelectedIndex(3);
		} else if (index == 3) {
			listBox->setSelectedIndex(1);
		}
		break;
	case MAK_UP:
		//int index = listBox->getSelectedIndex();
		if (index == 3) {
			listBox->setSelectedIndex(1);
		} else if (index == 1) {
			listBox->setSelectedIndex(3);
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
		String check = data;
		if (!(check.find("User not found."))) {
			maSendTextSMS(contactEditBox->getText().c_str(), check.substr(16).c_str());
			result = "User not found. Invite Sent.";
		} else {
			result = data;
		}
	}
	else {
		result = error_sending_card_message;
	}
	drawCompleteScreen();
}

void TradeFriendDetailScreen::mtxTagEnd(const char* name, int len) {
}

void TradeFriendDetailScreen::mtxParseError(/*int offSet*/) {
}



void TradeFriendDetailScreen::mtxEmptyTagEnd() {
}

void TradeFriendDetailScreen::mtxTagStartEnd() {
}
