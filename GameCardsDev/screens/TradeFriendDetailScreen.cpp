#include "TradeFriendDetailScreen.h"
#include "AlbumViewScreen.h"
#include "../utils/Util.h"

TradeFriendDetailScreen::TradeFriendDetailScreen(Screen *previous, Feed *feed, Card *card) :previous(previous), feed(feed), card(card), mHttp(this) {
	lprintfln("TradeFriendDetailScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	sending = false;
	friendDetail = "";
	methodLabel = "";
	method = "";
	result = "";
	moved = 0;
	menu = NULL;
	layout = Util::createMainLayout("Continue", "Back", "", true);

	layout->setDrawBackground(TRUE);

	listBox = (KineticListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*)layout->getChildren()[0]->getChildren()[1];
	notice->setMultiLine(true);

	drawMethodScreen();

	this->setMain(layout);
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
	moved = 0;
	changed = false;

	notice->setCaption("");
	clearListBox();

	Util::updateSoftKeyLayout("Continue", "Back", "", layout);

	Layout *feedlayout;

	mImageCache = new ImageCache();

	String cardText = "";
	cardText += (card->getUpdated()?"*":"")+card->getText();
	cardText += " (";
	cardText += card->getQuantity();
	cardText += ")\n";
	cardText += card->getRarity();
	cardText += "\nRating: ";
	cardText += card->getRanking();
	//cardText += "\nRarity: ";

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 3, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(true);
	//feedlayout->addWidgetListener(this);

	if (strcmp(card->getQuantity().c_str(), "0") != 0) {
		//if the user has one or more of the card, the image must be downloaded
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);
		tempImage->setHasNote(card->getNote().length()>0);
		Util::retrieveThumb(tempImage, card, mImageCache);
	}
	else {
		//we use the blank image for cards they dont have yet
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_MISSINGTHUMB);
	}

	lbl = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, Util::getDefaultFont());
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setAutoSizeY();
	lbl->setAutoSizeX();
	lbl->setMultiLine();

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Share with Username", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	usernameEditBox = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"");
	usernameEditBox->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Share with Email", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	emailEditBox = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_EMAILADDR, label, "", L"");
	emailEditBox->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Share with Phone Number", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	phonenumberEditBox = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"");
	phonenumberEditBox->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	listBox->setSelectedIndex(2);
}

void TradeFriendDetailScreen::drawConfirmScreen() {
	phase = SP_CONFIRM;
	moved = 0;
	changed = false;

	notice->setCaption("");
	clearListBox();

	Util::updateSoftKeyLayout("Confirm", "Back", "", layout);

	String confirmLabel = "Send " + card->getText() + " to " + friendDetail + "?";

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, Util::getDefaultFont());
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	//lbl->setSkin(Util::getSkinBack());
	lbl->setMultiLine(true);
	listBox->add(lbl);

	mImageCache = new ImageCache();

	String cardText = "";
	cardText += (card->getUpdated()?"*":"")+card->getText();
	cardText += " (";
	cardText += card->getQuantity();
	cardText += ")\n";
	cardText += card->getRarity();
	cardText += "\nRating: ";
	cardText += card->getRanking();
	//cardText += "\nRarity: ";

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 3, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(true);
	//feedlayout->addWidgetListener(this);

	if (strcmp(card->getQuantity().c_str(), "0") != 0) {
		//if the user has one or more of the card, the image must be downloaded
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);
		tempImage->setHasNote(card->getNote().length()>0);
		Util::retrieveThumb(tempImage, card, mImageCache);
	}
	else {
		//we use the blank image for cards they dont have yet
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_MISSINGTHUMB);
	}

	lbl = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, Util::getDefaultFont());
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setAutoSizeY();
	lbl->setAutoSizeX(true);
	lbl->setMultiLine(true);
}

void TradeFriendDetailScreen::drawCompleteScreen() {
	phase = SP_COMPLETE;
	moved = 0;
	changed = false;

	notice->setCaption("");
	clearListBox();

	Util::updateSoftKeyLayout("Confirm", "", "", layout);

	String confirmLabel = result;

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, Util::getDefaultFont());
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	//lbl->setSkin(Util::getSkinBack());
	lbl->setMultiLine(true);
	listBox->add(lbl);

	mImageCache = new ImageCache();

	String cardText = "";
	cardText += (card->getUpdated()?"*":"")+card->getText();
	cardText += " (";
	cardText += Convert::toString(Convert::toInt(card->getQuantity().c_str())-1);
	cardText += ")\n";
	cardText += card->getRarity();
	cardText += "\nRating: ";
	cardText += card->getRanking();
	//cardText += "\nRarity: ";

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 3, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(true);
	//feedlayout->addWidgetListener(this);

	if (strcmp(card->getQuantity().c_str(), "0") != 0) {
		//if the user has one or more of the card, the image must be downloaded
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);
		tempImage->setHasNote(card->getNote().length()>0);
		Util::retrieveThumb(tempImage, card, mImageCache);
	}
	else {
		//we use the blank image for cards they dont have yet
		tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_MISSINGTHUMB);
	}

	lbl = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, Util::getDefaultFont());
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setAutoSizeY();
	lbl->setAutoSizeX(true);
	lbl->setMultiLine(true);
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
	moved++;
}

void TradeFriendDetailScreen::pointerReleaseEvent(MAPoint2d point) {
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		}/* else if (mid) {
			keyPressEvent(MAK_FIRE);
		}*/

		if (!changed) {
			int yClick = point.y;
			int index = listBox->getSelectedIndex();
		}
		else {
			changed = false;
		}
	}
	else {
		moved = 0;
		changed = false;
	}
}

void TradeFriendDetailScreen::locateItem(MAPoint2d point) {
	list = false;
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

	for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
		{
			if (moved <= 1) listBox->setSelectedIndex(i);
			list = true;
			//return;
		}
	}

}
#endif

void TradeFriendDetailScreen::selectionChanged(Widget *widget, bool selected) {

	if ((!left)&&(!right)) {
		if(selected) {
			widget->getChildren()[0]->setSelected(true);
		} else {
			widget->getChildren()[0]->setSelected(false);
		}

		usernameEditBox->setText("");
		emailEditBox->setText("");
		phonenumberEditBox->setText("");
	}
}

void TradeFriendDetailScreen::keyPressEvent(int keyCode) {
	left = false;
	right = false;
	switch(keyCode) {
	case MAK_FIRE:
	case MAK_SOFTLEFT:
		switch(phase) {
			case SP_METHOD:
			case SP_DETAIL:
				if (usernameEditBox->getText() == ""
					&& emailEditBox->getText() == ""
					&& phonenumberEditBox->getText() == "") {
					notice->setCaption("Fill in at least one field.");
				}
				else {
					notice->setCaption("");
					if (usernameEditBox->getText() != "")
					{
						friendDetail = usernameEditBox->getText();
						methodLabel = "Username";
						method = "username";
					}
					else if (emailEditBox->getText() != "")
					{
						friendDetail = emailEditBox->getText();
						methodLabel = "Email";
						method = "email";
					}
					else if (phonenumberEditBox->getText() != "")
					{
						friendDetail = phonenumberEditBox->getText();
						methodLabel = "Phone Number";
						method = "phone_number";
					}
					drawConfirmScreen();
				}
				break;
			case SP_CONFIRM:
				if (!sending) {
					sending = true;

					notice->setCaption("Sending card...");

					//make the http connection to trade the card
					int urlLength = 60 + card->getId().length() + method.length() + friendDetail.length();
					char *url = new char[urlLength+1];
					memset(url, '\0', urlLength+1);

					sprintf(url, "http://dev.mytcg.net/_phone/?tradecard=%s&trademethod=%s&detail=%s", card->getId().c_str(),
							method.c_str(), friendDetail.c_str());
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
				int ind = listBox->getSelectedIndex();
				ind += 2;
				if (ind == 8) {
					ind = 2;
				}
				listBox->setSelectedIndex(ind);
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
				int ind = listBox->getSelectedIndex();
				ind -= 2;
				if (ind == 0) {
					ind = 6;
				}
				listBox->setSelectedIndex(ind);
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
		notice->setCaption("Unable to connect, try again later...");
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
	if (strcmp(parentTag.c_str(), "result") == 0) {
		result = data;
	}
	else {
		result = "Error sending card.";
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
