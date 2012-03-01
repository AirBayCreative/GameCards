#include "OptionsScreen.h"
#include "TradeFriendDetailScreen.h"
#include "AlbumLoadScreen.h"
#include "AlbumViewScreen.h"
#include "NoteScreen.h"
#include "DetailScreen.h"
#include "DeckListScreen.h"
#include "Login.h"
#include "../utils/Util.h"
#include "../MAHeaders.h"
#include "../utils/Albums.h"

OptionsScreen::OptionsScreen(Feed *feed, int screenType, Screen *previous, Card *card, String num) :mHttp(this), previous(previous), feed(feed), card(card), screenType(screenType), number(num) {
	lprintfln("OptionsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	error_msg = "";
	moved = 0;

	connError = false;
	busy = false;

	menu = NULL;
	confirmation = NULL;

	if (screenType == ST_LOGIN_OPTIONS) {
		layout = Util::createMainLayout("", "Exit", true);
	}
	else {
		layout = Util::createMainLayout("", "Back", true);
	}
	listBox = (KineticListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];

	switch(screenType) {
		case ST_CARD_OPTIONS:
			lbl = Util::createSubLabel("Add to Album");
			lbl->setPaddingLeft(5);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Notes");
			lbl->setPaddingLeft(5);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Share");
			lbl->setPaddingLeft(5);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Contact");
			lbl->setPaddingLeft(5);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Delete");
			lbl->setPaddingLeft(5);
			lbl->addWidgetListener(this);
			listBox->add(lbl);

			confirmation = new MenuScreen(RES_BLANK, "Are you sure?");
			confirmation->setMenuWidth(120);
			confirmation->setMarginX(5);
			confirmation->setMarginY(5);
			confirmation->setDock(MenuScreen::MD_CENTER);
			confirmation->setListener(this);
			confirmation->setMenuFontSel(Util::getDefaultFont());
			confirmation->setMenuFontUnsel(Util::getDefaultFont());
			confirmation->setMenuSkin(Util::getSkinDropDownItem());
			confirmation->addItem("Yes");
			confirmation->addItem("No");

			break;
		case ST_NEW_CARD:
			lbl = Util::createSubLabel("Accept Card");
			lbl->setPaddingLeft(5);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Reject Card");
			lbl->setPaddingLeft(5);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
		case ST_NUMBER_OPTIONS:
			while (number.find(" ") != -1) {
				number = number.substr(0, number.find(" ")) + number.substr(number.find(" ") + 1, number.length() - (number.find(" ") + 1));
			}
			lbl = Util::createSubLabel("Call");
			lbl->setPaddingLeft(5);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("SMS");
			lbl->setPaddingLeft(5);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_LOGIN_OPTIONS:
			lbl = Util::createSubLabel("Log In");
			lbl->setPaddingLeft(5);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Register");
			lbl->setPaddingLeft(5);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
	}

	listBox->setSelectedIndex(0);

	this->setMain(layout);
}

OptionsScreen::~OptionsScreen() {
	error_msg = "";
	number="";

	if (confirmation != NULL) {
		delete confirmation;
		confirmation = NULL;
	}

	delete layout;
	if(menu!=NULL){
		delete menu;
	}
}

void OptionsScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
    moved = 0;
}

void OptionsScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void OptionsScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved < 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		}
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
void OptionsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget)->setFont(Util::getDefaultFont());
	}
}

void OptionsScreen::show() {
	Screen::show();

	if ((strcmp(feed->getRegistered().c_str(), "1") == 0)&&(screenType == ST_LOGIN_OPTIONS)) {
		menu = new Login(feed, this, Login::S_LOGIN);
		menu->show();
	}
}

void OptionsScreen::keyPressEvent(int keyCode) {
	int index = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			index = listBox->getSelectedIndex();
			switch(screenType) {
				case ST_CARD_OPTIONS:
					if (index == 0) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new DeckListScreen(this, feed, card);
						menu->show();
					}
					else if (index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new NoteScreen(this, feed, card);
						menu->show();
					}
					else if (index == 2) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new TradeFriendDetailScreen(this, feed, card);
						menu->show();
					}
					else if (index == 3) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new DetailScreen(this, feed,
								DetailScreen::CARD, card);
						menu->show();
					}
					else if (index == 4 && !busy) {
						confirmation->show();
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
						maPlatformRequest(("tel://"+number).c_str());
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
						menu = new Login(feed, this, Login::S_LOGIN);
						menu->show();
					}
					else if(index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new Login(feed, this, Login::S_REGISTER);
						menu->show();
					}
					break;
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			switch(screenType) {
				case ST_LOGIN_OPTIONS:
					if (feed->getHttps() > 0) {
						notice->setCaption("Please wait for all connections to finish before exiting. Try again in a few seconds.");
					} else {
						maExit(0);
					}
					break;
				default:
					previous->show();
					break;
			}
			break;
		case MAK_DOWN:
			if (index == listBox->getChildren().size()-1) {
				listBox->setSelectedIndex(0);
			} else {
				listBox->selectNextItem();
			}
			break;
		case MAK_UP:
			if (index == 0) {
				listBox->setSelectedIndex(listBox->getChildren().size()-1);
			} else {
				listBox->selectPreviousItem();
			}
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
	sprintf(url, "%s?rejectcard=%s", URL, card->getId().c_str());
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

void OptionsScreen::deleteCard() {
	//work out how long the url will be
	int urlLength = 20 + URLSIZE + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s?deletecard=%s", URL, card->getId().c_str());
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
	} else {
		connError = true;
		mHttp.close();
		notice->setCaption("Unable to connect, try again later...");
		feed->remHttp();
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
}

void OptionsScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void OptionsScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(data, "Complete!")) {
		notice->setCaption("Action completed.");
	}

}

void OptionsScreen::mtxTagEnd(const char* name, int len) {

}

void OptionsScreen::mtxParseError(int) {
}

void OptionsScreen::mtxEmptyTagEnd() {
}

void OptionsScreen::mtxTagStartEnd() {
}

void OptionsScreen::menuOptionSelected(int index) {
	this->show();
	if (index == 0) {
		busy = true;
		notice->setCaption("Deleting...");
		deleteCard();
	}
}
