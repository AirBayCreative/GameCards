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
	layout = Util::createMainLayout("Share", "Back", "", true);
	listBox = (KineticListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*)layout->getChildren()[0]->getChildren()[1];

	layout->setDrawBackground(TRUE);
	this->setMain(layout);

	method = "phone_number";
	methodLabel = "Cell Number";
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

	Util::updateSoftKeyLayout("", "Back", "", layout);

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Select friend by:", 0, Util::getDefaultFont());
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(Util::getSkinBack());
	listBox->add(lbl);
	lbl = Util::createSubLabel("Username");
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = Util::createSubLabel("Email");
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	listBox->setSelectedIndex(2);
	lbl = Util::createSubLabel("Cell Number");
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	listBox->setSelectedIndex(1);
}

void TradeFriendDetailScreen::drawDetailScreen() {
	phase = SP_DETAIL;

	notice->setCaption("");
	clearListBox();
	//Util::setPadding(listBox);
	Util::updateSoftKeyLayout("Share", "Back", "", layout);

	/*Label* l;*/

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, methodLabel, 0, Util::getDefaultFont());
	lbl->setSkin(Util::getSkinBack());

	lblMethod = Util::createEditLabel("");
	contactEditBox = new NativeEditBox(0, 0, lblMethod->getWidth()-PADDING*2, lblMethod->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, lblMethod, "", L"Cell Number:");
#if defined(MA_PROF_SUPPORT_STYLUS)

#else
	contactEditBox->setInputMode(NativeEditBox::IM_NUMBERS);
#endif
	contactEditBox->setDrawBackground(false);
	lblMethod->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(lblMethod);

	/*contactEditBox->setSelected(true);*/

	listBox->setSelectedIndex(1);

	/*l = lbl;*/

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Add a personal note", 0, Util::getDefaultFont());
	lbl->setSkin(Util::getSkinBack());

	lblMethod =  new Label(0,0, scrWidth-(PADDING*2), (listBox->getHeight()-100-(PADDING)), NULL, "", 0, Util::getDefaultFont());
	lblMethod->setSkin(Util::getSkinEditBox());
	Util::setPadding(lblMethod);
	editBoxNote = new NativeEditBox(0, 0, lblMethod->getWidth()-PADDING*2, lblMethod->getHeight()-PADDING*2, 140, MA_TB_TYPE_ANY, lblMethod, "", L"Note:");
	editBoxNote->setDrawBackground(false);
	editBoxNote->setMaxLength(140);
	editBoxNote->setMultiLine(true);


	lblMethod->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(lblMethod);

	/*lbl = l;
	l = NULL;*/
}

void TradeFriendDetailScreen::drawConfirmScreen() {
	phase = SP_CONFIRM;

	notice->setCaption("");
	clearListBox();

	Util::updateSoftKeyLayout("Confirm", "Back", "", layout);

	String confirmLabel = "Are you sure you want to send your " + card->getText() +
			" to your friend with " + methodLabel + " " + friendDetail + "?";

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, Util::getDefaultFont());
	lbl->setHorizontalAlignment(Label::HA_LEFT);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(Util::getSkinBack());
	lbl->setMultiLine(true);
	listBox->add(lbl);

	confirmLabel = "Personal Note\n\n" + friendNote;

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, Util::getDefaultFont());
	lbl->setHorizontalAlignment(Label::HA_LEFT);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(Util::getSkinBack());
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

void TradeFriendDetailScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
			widget->getChildren()[0]->setSelected(true);
		} else {
			widget->getChildren()[0]->setSelected(false);
		}
}

void TradeFriendDetailScreen::keyPressEvent(int keyCode) {
	int index = listBox->getSelectedIndex();
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
						method = "username";
						methodLabel = "Username";
					} else if(index == 2) {
						method = "email";
						methodLabel = "Email";
					} else if(index == 3) {
						method = "phone_number";
						methodLabel = "Cell Number";
					}
					drawDetailScreen();
				}
				break;
			case SP_DETAIL:
				if (contactEditBox->getText() == "") {
					notice->setCaption("Ensure that you have entered\n your friend's " + method + ".");
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

					notice->setCaption("Sending card...");

					String noteStr = Util::base64_encode(reinterpret_cast<const unsigned char*>(friendNote.c_str()), friendNote.length());

					//make the http connection to trade the card
					int urlLength = 60 + URLSIZE + card->getId().length() +
							method.length() + friendDetail.length() + 6 + noteStr.length();
					char *url = new char[urlLength];
					memset(url, '\0', urlLength);

					sprintf(url, "%s?tradecard=%s&trademethod=%s&detail=%s&note=%s", URL, card->getId().c_str(),
							method.c_str(), friendDetail.c_str(), noteStr.c_str());
					//url.append("&sms=Yes", 8);

					if(mHttp.isOpen()){
						mHttp.close();
					}
					mHttp = HttpConnection(this);
					int res = mHttp.create(url, HTTP_GET);

					if(res < 0) {

					} else {
						mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
						mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
						feed->addHttp();
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
		feed->remHttp();
	}
}

void TradeFriendDetailScreen::connReadFinished(Connection* conn, int result) {
}

void TradeFriendDetailScreen::xcConnError(int code) {
	feed->remHttp();
}

void TradeFriendDetailScreen::mtxEncoding(const char* ) {
}

void TradeFriendDetailScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void TradeFriendDetailScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void TradeFriendDetailScreen::mtxTagData(const char* data, int len) {
	if (strcmp(parentTag.c_str(), "result") == 0) {
		String check = data;
		if (!(check.find("User not found."))) {
			maSendTextSMS(contactEditBox->getText().c_str(), check.substr(16).c_str());
			result = "User not found. Invite Sent.";
		} else {
			result = data;
		}
	}
	else {
		result = "Error sending card.";
	}
	drawCompleteScreen();
}

void TradeFriendDetailScreen::mtxTagEnd(const char* name, int len) {
}

void TradeFriendDetailScreen::mtxParseError(int) {
}



void TradeFriendDetailScreen::mtxEmptyTagEnd() {
}

void TradeFriendDetailScreen::mtxTagStartEnd() {
}
