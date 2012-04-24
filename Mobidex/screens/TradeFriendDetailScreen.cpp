#include "TradeFriendDetailScreen.h"
#include "AlbumViewScreen.h"
#include "OptionsScreen.h"
#include "DetailScreen.h"
#include "ContactScreen.h"
#include "../utils/Util.h"

TradeFriendDetailScreen::TradeFriendDetailScreen(MainScreen *previous, Feed *feed, Card *card):mHttp(this) {
	this->previous = previous;
	this->feed = feed;
	this->card = card;
	lprintfln("TradeFriendDetailScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	sending = false;
	fresh = true;
	friendDetail = "";
	friendNote = "";
	methodLabel = "";
	method = "";
	result = "";
	next = NULL;
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
	if (next != NULL) {
		delete next;
		next = NULL;
	}
}

void TradeFriendDetailScreen::drawMethodScreen() {
	phase = SP_METHOD;

	notice->setCaption("");
	clearListBox();

	Util::updateSoftKeyLayout("", "Back", "", layout);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Select friend by:", 0, Util::getDefaultFont());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setSkin(Util::getSkinBack());
	listBox->add(label);
	label = Util::createSubLabel("Username");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Email");
	label->addWidgetListener(this);
	listBox->add(label);
	listBox->setSelectedIndex(2);
	label = Util::createSubLabel("Cell Number");
	label->addWidgetListener(this);
	listBox->add(label);
	listBox->setSelectedIndex(1);
}

void TradeFriendDetailScreen::drawDetailScreen() {
	phase = SP_DETAIL;

	notice->setCaption("");
	clearListBox();
	listBox->setPaddingLeft(PADDING);
	//Util::setPadding(listBox);
	Util::updateSoftKeyLayout("Share", "Back", /*"Contacts"*/"", layout);

	/*Label* l;*/

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, methodLabel, 0, Util::getDefaultFont());
	label->setSkin(Util::getSkinBack());

	lblMethod = Util::createEditLabel("");
	contactEditBox = new NativeEditBox(0, 0, lblMethod->getWidth()-PADDING*2, lblMethod->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, lblMethod, "", L"Cell Number:");
#if defined(MA_PROF_SUPPORT_STYLUS)

#else
	contactEditBox->setInputMode(NativeEditBox::IM_NUMBERS);
#endif
	contactEditBox->setDrawBackground(false);
	lblMethod->addWidgetListener(this);

	listBox->add(label);
	listBox->add(lblMethod);

	/*contactEditBox->setSelected(true);*/

	/*l = lbl;*/

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Add a personal note", 0, Util::getDefaultFont());
	label->setSkin(Util::getSkinBack());

	lblMethod =  new Label(0,0, scrWidth-(PADDING*2), (listBox->getHeight()-100-(PADDING)), NULL, "", 0, Util::getDefaultFont());
	lblMethod->setSkin(Util::getSkinEditBox());
	Util::setPadding(lblMethod);
	editBoxNote = new NativeEditBox(0, 0, lblMethod->getWidth()-PADDING*2, lblMethod->getHeight()-PADDING*2, 140, MA_TB_TYPE_ANY, lblMethod, "", L"Note:");
	editBoxNote->setDrawBackground(false);
	editBoxNote->setMaxLength(140);
	editBoxNote->setMultiLine(true);


	lblMethod->addWidgetListener(this);

	listBox->add(label);
	listBox->add(lblMethod);

	contactEditBox->setSelected(true);
	listBox->setSelectedIndex(1);

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

	label = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, Util::getDefaultFont());
	label->setHorizontalAlignment(Label::HA_LEFT);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setSkin(Util::getSkinBack());
	label->setMultiLine(true);
	listBox->add(label);

	confirmLabel = "Personal Note\n\n" + friendNote;

	label = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, Util::getDefaultFont());
	label->setHorizontalAlignment(Label::HA_LEFT);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setSkin(Util::getSkinBack());
	label->setMultiLine(true);
	listBox->add(label);
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
	} else if (phase == SP_DETAIL && list) {
		//keyPressEvent(MAK_FIRE);
	} else if (center) {
		keyPressEvent(MAK_FIRE);
	}
}

void TradeFriendDetailScreen::locateItem(MAPoint2d point) {
	list = false;
	left = false;
	right = false;
	center = false;

	Point p;
	p.set(point.x, point.y);
	for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
		{
			//((KineticListBox *)this->getMain()->getChildren()[0]->getChildren()[2])->setSelectedIndex(i);
			//list = true;
		}
	}
	for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
			if (i == 0) {
				left = true;
			}else if (i == 1) {
				//list = true;
				center = true;
			}else if (i == 2) {
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

void TradeFriendDetailScreen::show() {
	contactEditBox->setSelected(true);
	contactEditBox->enableListener();
	Screen::show();
}

void TradeFriendDetailScreen::hide() {
	contactEditBox->setSelected(false);
	contactEditBox->disableListener();
	Screen::hide();
}

void TradeFriendDetailScreen::contactSelected(String number) {
	if (phase == SP_DETAIL) {
		contactEditBox->setText(number);

		show();
	}
}

void TradeFriendDetailScreen::keyPressEvent(int keyCode) {
	int index = listBox->getSelectedIndex();
	switch(keyCode) {
	case MAK_FIRE:
		/*menu = new ContactScreen(this);
		menu->show();
		break;*/
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
					String numStr = Util::base64_encode(reinterpret_cast<const unsigned char*>(friendDetail.c_str()), friendDetail.length());

					//make the http connection to trade the card
					int urlLength = 60 + URLSIZE + card->getId().length() +
							method.length() + numStr.length() + 6 + noteStr.length();
					char *url = new char[urlLength];
					memset(url, '\0', urlLength);

					sprintf(url, "%s?tradecard=%s&trademethod=%s&detail=%s&note=%s", URL_PHONE.c_str(), card->getId().c_str(),
							method.c_str(), numStr.c_str(), noteStr.c_str());

					lprintfln("%s", url);
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

void TradeFriendDetailScreen::menuOptionSelected(int index) {
	this->show();
	previous->pop();
}
void TradeFriendDetailScreen::mtxTagData(const char* data, int len) {
	if (strcmp(parentTag.c_str(), "result") == 0) {
		String check = data;
		if (!(check.find("User not found."))) {
			maSendTextSMS(("+" + contactEditBox->getText()).c_str(), check.substr(16).c_str());
			result = "User not found. Invite Sent.";
		} else {
			result = data;
		}
	}
	else {
		result = "Error sending card.";
	}
	phase = SP_COMPLETE;

	MenuScreen *confirmation = new MenuScreen(RES_BLANK, result.c_str());
	confirmation->setMenuWidth(170);
	confirmation->setMarginX(5);
	confirmation->setMarginY(5);
	confirmation->setDock(MenuScreen::MD_CENTER);
	confirmation->setListener(this);
	confirmation->setMenuFontSel(Util::getDefaultFont());
	confirmation->setMenuFontUnsel(Util::getDefaultFont());
	confirmation->setMenuSkin(Util::getSkinDropDownItem());
	confirmation->addItem("Ok");
	confirmation->show();

	editBoxNote->setSelected(false);
	editBoxNote->disableListener();
	contactEditBox->setSelected(false);
	contactEditBox->disableListener();
}

void TradeFriendDetailScreen::mtxTagEnd(const char* name, int len) {
}

void TradeFriendDetailScreen::mtxParseError(int) {
}



void TradeFriendDetailScreen::mtxEmptyTagEnd() {
}

void TradeFriendDetailScreen::mtxTagStartEnd() {
}
