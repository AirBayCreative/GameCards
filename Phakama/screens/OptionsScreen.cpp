#include "OptionsScreen.h"
#include "TradeFriendDetailScreen.h"
#include "ShopCategoriesScreen.h"
#include "AlbumLoadScreen.h"
#include "AlbumViewScreen.h"
#include "NoteScreen.h"
#include "DetailScreen.h"
#include "Login.h"
#include "../utils/Util.h"
#include "../utils/Albums.h"

OptionsScreen::OptionsScreen(Feed *feed, int screenType, Screen *previous, Card *card, String number, String deckId) :mHttp(this),
previous(previous), feed(feed), card(card), screenType(screenType), number(number), deckId(deckId) {
	lprintfln("OptionsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	temp = "";
	temp1 = "";
	error_msg = "";

	connError = false;
	busy = false;

	menu = NULL;
	album = NULL;
	if (screenType == ST_LOGIN_OPTIONS) {
	#if defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
		layout = Util::createMainLayout("", "");
	#else
		layout = Util::createMainLayout("", "Exit");
	#endif
	}
	else {
		layout = Util::createMainLayout("", "Back");
	}
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];

	switch(screenType) {
		case ST_TRADE_OPTIONS:
			lbl = Util::createSubLabel("Send card to auction");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Send card to friend");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_CARD_OPTIONS:
			lbl = Util::createSubLabel("Notes");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Share");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Auction");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Compare");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Details");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_NEW_CARD:
			lbl = Util::createSubLabel("Accept");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Reject");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_NUMBER_OPTIONS:
			lbl = Util::createSubLabel("Call");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("SMS");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_LOGIN_OPTIONS:
			lbl = Util::createSubLabel("Log In");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Register");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
	}

	listBox->setSelectedIndex(0);

	this->setMain(layout);
}

OptionsScreen::~OptionsScreen() {
	lprintfln("~OptionsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	temp = "";
	temp1 = "";
	error_msg = "";
	number = "";
	deckId = "";

	clearListBox();
	listBox->clear();
	delete layout;
	if(menu!=NULL){
		delete menu;
	}

	if (album != NULL) {
		delete album;
		album = NULL;
	}
}

void OptionsScreen::clearListBox() {
	Vector<Widget*> tempWidgets;
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

void OptionsScreen::show() {
	if (listBox->getChildren().size() > listBox->getSelectedIndex()) {
		listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	}
	Screen::show();

	if ((strcmp(feed->getRegistered().c_str(), "1") == 0)&&(screenType == ST_LOGIN_OPTIONS)) {
		menu = new Login(this, feed, Login::S_LOGIN);
		menu->show();
	}
}

void OptionsScreen::hide() {
    //listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void OptionsScreen::checkForGames() {
	connError = true;
	album = new Albums();

	notice->setCaption("Checking games...");
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int urlLength = 38 + URLSIZE;
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?getusergames=1", URL);
	int res = mHttp.create(url, HTTP_GET);

	if(res < 0) {
		notice->setCaption("Connection Error");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();
	}
	delete [] url;
}

void OptionsScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void OptionsScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void OptionsScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void OptionsScreen::locateItem(MAPoint2d point)
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
void OptionsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget)->setFont(Util::getDefaultFont());
	}
}

void OptionsScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			index = listBox->getSelectedIndex();
			switch(screenType) {
				case ST_TRADE_OPTIONS:
					if(index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new TradeFriendDetailScreen(this, feed, card);
						menu->show();
					}
					break;
				case ST_CARD_OPTIONS:
					if (index == 0) {
						if (menu != NULL) {
							delete menu;
							menu = NULL;
						}
						menu = new NoteScreen(this, feed, card);
						menu->show();
					}
					else if (index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new TradeFriendDetailScreen(this, feed, card);
						menu->show();
					}
					else if (index == 4) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new DetailScreen(this, feed,
								DetailScreen::CARD, card);
						menu->show();
					}
					break;
				case ST_NEW_CARD:
					if(index == 0 && !busy) {
						busy = true;
						notice->setCaption("Accepting...");
						acceptCard();
					}
					else if (index == 1 && !busy) {
						busy = true;
						notice->setCaption("Rejecting...");
						rejectCard();
					}
					break;
				case ST_NUMBER_OPTIONS:
					if(index == 0) {
						maPlatformRequest(("tel:"+number).c_str());
					}
					else if (index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new NoteScreen(this, feed,
								card, NoteScreen::ST_SMS, number);
						menu->show();
					}
					break;
				case ST_LOGIN_OPTIONS:
					if(index == 0) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new Login(this, feed, Login::S_LOGIN);
						menu->show();
					}
					else if(index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new Login(this, feed, Login::S_REGISTER);
						menu->show();
					}
					break;
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			switch(screenType) {
				case ST_LOGIN_OPTIONS:
#if not defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
					maExit(0);
#endif
					break;
				default:
					clearListBox();
					previous->show();
					break;
			}
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
	}
}

void OptionsScreen::acceptCard() {
	//work out how long the url will be
	int urlLength = 38 + URLSIZE + card->getId().length();
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?savecard=%s", URL, card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption("");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();
	}
	delete [] url;
}

void OptionsScreen::rejectCard() {
	//work out how long the url will be
	int urlLength = 20 + URLSIZE + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s?rejectcard%s", URL, card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption("");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();
	}
	delete [] url;
}
void OptionsScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		connError = false;
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
		if (album == NULL) {
			album = new Albums();
		}
	} else {
		connError = true;
		mHttp.close();
		feed->remHttp();
		notice->setCaption("Unable to connect, try again later...");

		Util::updateSoftKeyLayout("", "Back", "", layout);
	}
}

void OptionsScreen::connReadFinished(Connection* conn, int result) {}

void OptionsScreen::xcConnError(int code) {
	feed->remHttp();
	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
}

void OptionsScreen::mtxEncoding(const char* ) {
}

void OptionsScreen::mtxTagStart(const char* name, int len) {
	if (!strcmp(name, "usercategories")) {
		album->clearAll();
	}
	parentTag = name;
}

void OptionsScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void OptionsScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "gamedescription")) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), "gameid")) {
		temp += data;
	} else if (!strcmp(parentTag.c_str(), "result")) {
		temp += data;
	}
}

void OptionsScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "result")) {
		((AlbumViewScreen *)origAlbum)->refresh();
	}  else if(!strcmp(name, "error")) {
		notice->setCaption(error_msg.c_str());
	} else {
		notice->setCaption("");
	}
}

void OptionsScreen::mtxParseError(int) {
}

void OptionsScreen::mtxEmptyTagEnd() {
}

void OptionsScreen::mtxTagStartEnd() {
}
