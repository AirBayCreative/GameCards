#include "OptionsScreen.h"
#include "TradeFriendDetailScreen.h"
#include "AlbumLoadScreen.h"
#include "AlbumViewScreen.h"
#include "NoteScreen.h"
#include "DetailScreen.h"
#include "Login.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"
#include "../utils/Albums.h"

OptionsScreen::OptionsScreen(Feed *feed, int screenType, Screen *previous, Card *card, String number) :mHttp(this), previous(previous), feed(feed), card(card), screenType(screenType), number(number) {
	error_msg = "";

	connError = false;
	busy = false;

	menu = NULL;

	if (screenType == ST_LOGIN_OPTIONS) {
		layout = createMainLayout(exit, select, true);
	}
	else {
		layout = createMainLayout(back, select, true);
	}
	listBox = (KineticListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];

	switch(screenType) {
		case ST_CARD_OPTIONS:
			lbl = createSubLabel(noteslbl);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(sharelbl);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(details);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(deletecardlbl);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_NEW_CARD:
			lbl = createSubLabel(acceptlbl);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(rejectlbl);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
		case ST_NUMBER_OPTIONS:
			lbl = createSubLabel(calllbl);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(smslbl);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_LOGIN_OPTIONS:
			lbl = createSubLabel(login);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(reg);
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

	delete layout;
	if(menu!=NULL){
		delete menu;
	}
}

#if defined(MA_PROF_SUPPORT_STYLUS)
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
void OptionsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontWhite);
	}
}

void OptionsScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			index = listBox->getSelectedIndex();
			switch(screenType) {
				case ST_CARD_OPTIONS:
					if (index == 0) {
						if (menu != NULL) {
							delete menu;
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
					else if (index == 2) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new DetailScreen(this, feed,
								DetailScreen::CARD, card);
						menu->show();
					}
					else if (index == 3 && !busy) {
						busy = true;
						notice->setCaption("Deleting...");
						deleteCard();
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
		case MAK_SOFTLEFT:
			switch(screenType) {
				case ST_LOGIN_OPTIONS:
					maExit(0);
					break;
				default:
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
	int urlLength = ACCEPTCARD.length() + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s%s", ACCEPTCARD.c_str(), card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption("");
	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;
}

void OptionsScreen::rejectCard() {
	//work out how long the url will be
	int urlLength = REJECTCARD.length() + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s%s", REJECTCARD.c_str(), card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption("");
	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;
}

void OptionsScreen::deleteCard() {
	//work out how long the url will be
	int urlLength = DELETECARD.length() + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s%s", DELETECARD.c_str(), card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption("");
	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
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
		notice->setCaption(no_connect);
	}
}

void OptionsScreen::connReadFinished(Connection* conn, int result) {}

void OptionsScreen::xcConnError(int code) {
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

}

void OptionsScreen::mtxTagEnd(const char* name, int len) {

}

void OptionsScreen::mtxParseError() {
}

void OptionsScreen::mtxEmptyTagEnd() {
}

void OptionsScreen::mtxTagStartEnd() {
}
