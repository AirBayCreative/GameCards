#include "TradeFriendDetailScreen.h"
#include "AlbumViewScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"

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

	cardText="";
	delete mImageCache;
}

void TradeFriendDetailScreen::drawMethodScreen() {
	phase = SP_DETAIL;

	notice->setCaption("");
	clearListBox();

	updateSoftKeyLayout(back, continuelbl, "", layout);

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Share Card " + card->getText() + " With?", 0, gFontBlack);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	listBox->add(lbl);

	Layout *feedlayout;

	mImageCache = new ImageCache();

	cardText = "Name: ";
	cardText += (card->getUpdated()?updated_symbol:"")+card->getText();
	cardText += "\tValue: ";
	cardText += "TODO";//cardText += itr->second->getValue();
	cardText += "\nRarity: ";
	cardText += "TODO";//cardText += itr->second->Rarity();
	cardText += "\tQuantity: ";
	cardText += card->getQuantity();

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 3, 1);
	feedlayout->setSkin(gSkinAlbum);
	feedlayout->setDrawBackground(true);
	//feedlayout->addWidgetListener(this);

	if (strcmp(card->getQuantity().c_str(), "0") != 0) {
		//if the user has one or more of the card, the image must be downloaded
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);
		tempImage->setHasNote(card->getNote().length()>0);
		retrieveThumb(tempImage, card, mImageCache);
	}
	else {
		//we use the blank image for cards they dont have yet
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_MISSINGTHUMB);
	}

	lbl = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, gFontBlack);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setAutoSizeY();
	lbl->setAutoSizeX(true);
	lbl->setMultiLine(true);

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlblNoColon, 0, gFontBlack);
	lbl->setSkin(gSkinBack);

	lblMethodUserName = createEditLabel("");
	usernameEditBox = new NativeEditBox(0, 0, lblMethodUserName->getWidth()-PADDING*2, lblMethodUserName->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, lblMethodUserName, "", L"");
	usernameEditBox->setOptions(MA_TB_TYPE_ANY);

	usernameEditBox->setDrawBackground(false);
	lblMethodUserName->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(lblMethodUserName);

	usernameEditBox->setText("");
	usernameEditBox->setSelected(true);

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, emaillblNoColon, 0, gFontBlack);
	lbl->setSkin(gSkinBack);

	lblMethodEmail = createEditLabel("");
	emailEditBox = new NativeEditBox(0, 0, lblMethodEmail->getWidth()-PADDING*2, lblMethodEmail->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, lblMethodEmail, "", L"");
	emailEditBox->setOptions(MA_TB_TYPE_EMAILADDR);

	emailEditBox->setDrawBackground(false);
	lblMethodEmail->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(lblMethodEmail);

	emailEditBox->setText("");
	emailEditBox->setSelected(true);

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, phoneNumlbl, 0, gFontBlack);
	lbl->setSkin(gSkinBack);

	lblMethodPhonenumber = createEditLabel("");
	phonenumberEditBox = new NativeEditBox(0, 0, lblMethodPhonenumber->getWidth()-PADDING*2, lblMethodPhonenumber->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, lblMethodPhonenumber, "", L"");
	phonenumberEditBox->setOptions(MA_TB_TYPE_NUMERIC);

	phonenumberEditBox->setDrawBackground(false);
	lblMethodPhonenumber->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(lblMethodPhonenumber);

	phonenumberEditBox->setText("");
	phonenumberEditBox->setSelected(true);
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

	mImageCache = new ImageCache();

	cardText = "Name: ";
	cardText += (card->getUpdated()?updated_symbol:"")+card->getText();
	cardText += "\tValue: ";
	cardText += "TODO";//cardText += itr->second->getValue();
	cardText += "\nRarity: ";
	cardText += "TODO";//cardText += itr->second->Rarity();
	cardText += "\tQuantity: ";
	cardText += card->getQuantity();

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 3, 1);
	feedlayout->setSkin(gSkinAlbum);
	feedlayout->setDrawBackground(true);
	//feedlayout->addWidgetListener(this);

	if (strcmp(card->getQuantity().c_str(), "0") != 0) {
		//if the user has one or more of the card, the image must be downloaded
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);
		tempImage->setHasNote(card->getNote().length()>0);
		retrieveThumb(tempImage, card, mImageCache);
	}
	else {
		//we use the blank image for cards they dont have yet
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_MISSINGTHUMB);
	}

	lbl = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, gFontBlack);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setAutoSizeY();
	lbl->setAutoSizeX(true);
	lbl->setMultiLine(true);
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
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
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
#endif

void TradeFriendDetailScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontBlack);
	}

	//notice->setCaption("");
	usernameEditBox->setText("");
	emailEditBox->setText("");
	phonenumberEditBox->setText("");
}

void TradeFriendDetailScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
	case MAK_FIRE:
	case MAK_SOFTRIGHT:
		switch(phase) {
			case SP_METHOD:
			case SP_DETAIL:
				if (usernameEditBox->getText() == ""
					&& emailEditBox->getText() == ""
					&& phonenumberEditBox->getText() == "") {
					notice->setCaption(no_contact + method + ".");
				}
				else {
					notice->setCaption("");
					if (usernameEditBox->getText() != "")
					{
						friendDetail = usernameEditBox->getText();
						methodLabel = userlblNoColon;
						method = by_username;
					}
					else if (emailEditBox->getText() != "")
					{
						friendDetail = emailEditBox->getText();
						methodLabel = emaillblNoColon;
						method = by_email;
					}
					else if (phonenumberEditBox->getText() != "")
					{
						friendDetail = phonenumberEditBox->getText();
						methodLabel = phoneNumlbl;
						method = by_phone_number;
					}
					drawConfirmScreen();
				}
				break;
			case SP_CONFIRM:
				if (!sending) {
					sending = true;

					notice->setCaption(sending_card_message);

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
	case MAK_BACK:
	case MAK_SOFTLEFT:
		switch(phase) {
			case SP_METHOD:
				previous->show();
				break;
			case SP_DETAIL:
				//contactEditBox->setSelected(false);
				previous->show();
				break;
			case SP_CONFIRM:
				drawMethodScreen();
				break;
		}
		break;
	case MAK_DOWN:
		switch(phase) {
			case SP_METHOD:
				listBox->selectNextItem();
				break;
			case SP_DETAIL:
				//contactEditBox->setSelected(true);
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
				//contactEditBox->setSelected(true);
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

void TradeFriendDetailScreen::mtxParseError(int offSet) {
}

void TradeFriendDetailScreen::mtxEmptyTagEnd() {
}

void TradeFriendDetailScreen::mtxTagStartEnd() {
}
