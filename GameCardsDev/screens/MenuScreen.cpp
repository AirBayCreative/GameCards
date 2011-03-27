#include <conprint.h>

#include "AlbumLoadScreen.h"
#include "DetailScreen.h"
#include "ImageScreen.h"
#include "MenuScreen.h"
#include "ShopCategoriesScreen.h"
#include "OptionsScreen.h"
#include "Logout.h"
#include "NewVersionScreen.h"
#include "../utils/MAHeaders.h"
#include "../utils/Util.h"

MenuScreen::MenuScreen(Feed *feed) : feed(feed), mHttp(this) {
	c=0;
	menu = new Screen();
#if defined(MA_PROF_SUPPORT_STYLUS)
		mainLayout = createMainLayout(exit, "", true);
#else
		mainLayout = createMainLayout(exit, select, true);
#endif
	listBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];
	label = createSubLabel(albumlbl);
	label->addWidgetListener(this);
	listBox->add(label);
	label = createSubLabel(play);
	label->addWidgetListener(this);
	listBox->add(label);
	label = createSubLabel(shoplbl);
	label->addWidgetListener(this);
	listBox->add(label);
	label = createSubLabel(auctionlbl);
	label->addWidgetListener(this);
	listBox->add(label);
	label = createSubLabel(ballbl);
	label->addWidgetListener(this);
	listBox->add(label);
	label = createSubLabel(proflbl);
	label->addWidgetListener(this);
	listBox->add(label);
	label = createSubLabel(logout);
	label->addWidgetListener(this);
	listBox->add(label);

	listBox->setSelectedIndex(0);

	moved=0;

	//char buf[64] = "";
	//int imsi = maGetSystemProperty("mosync.imsi", buf, sizeof(buf));
	//int imei = maGetSystemProperty("mosync.imei", buf, sizeof(buf));
	//int msisdn = maGetSystemProperty("mosync.msisdn", buf, sizeof(buf));
	//lprintfln("imsi: %d", imsi);
	//lprintfln("imei: %d", imei);
	//lprintfln("msisdn: %d", msisdn);
	//update=_versionnumber&msisdn=_msisdn&imsi=_imsi&imei=_imei&os=_os&make=_make&model=_model&osver=_osver&touch=1/2&width=_screenWidht&height=_screenHeight

	//when the page has loaded, check for a new version in the background
	//www.mytcg.net/_phone/update=version_number
	int res = mHttp.create(UPDATE.c_str(), HTTP_GET);
	if(res < 0) {

	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}

	this->setMain(mainLayout);

	origMenu = this;
}

MenuScreen::~MenuScreen() {
}
#if defined(MA_PROF_SUPPORT_STYLUS)
void MenuScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void MenuScreen::pointerMoveEvent(MAPoint2d point)
{
	moved++;
    locateItem(point);
}

void MenuScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		}
	}
	moved = 0;
}

void MenuScreen::locateItem(MAPoint2d point)
{
	if (feed->setTouch(truesz)) {
		saveData(FEED, feed->getAll().c_str());
	}
	list = false;
	left = false;
	right = false;

    Point p;
    p.set(point.x, point.y);
    for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
    {
        if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
        {
        	list = true;
        }
    }
    for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{

			if (i == 0) {
				moved=0;
				left = true;
			} else if (i == 2) {
				moved=0;
				right = true;
			}
			return;
		}
	}
}
#endif

void MenuScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontBlack);
	}
}

void MenuScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			int index = listBox->getSelectedIndex();
			if(index == 0) {
				menu = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_ALBUMS);
				menu->show();
			} /*else if(index == 1) {
				delete menu;
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_SHOP);
				menu->show();
			} else if(index == 2) {
				delete menu;
				menu = new OptionsScreen(this, feed, NULL, OptionsScreen::ST_AUCTION_OPTIONS);
				menu->show();
			} else if(index == 3) {
				delete menu;
				menu = new DetailScreen(this, feed, DetailScreen::BALANCE);
				menu->show();
			} else if(index == 4) {
				delete menu;
				menu = new DetailScreen(this, feed, DetailScreen::PROFILE);
				menu->show();
			} else if (index == 5) {
				delete menu;
				menu = new Logout(this, feed);
				menu->show();
			}*/else if(index == 1) {
				delete menu;
				menu = new OptionsScreen(this, feed, OptionsScreen::ST_PLAY_OPTIONS);
				menu->show();
			} else if(index == 2) {
				delete menu;
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_SHOP);
				menu->show();
			} else if(index == 3) {
				delete menu;
				menu = new OptionsScreen(this, feed, OptionsScreen::ST_AUCTION_OPTIONS);
				menu->show();
			} else if(index == 4) {
				delete menu;
				menu = new DetailScreen(this, feed, DetailScreen::BALANCE);
				menu->show();
			} else if(index == 5) {
				delete menu;
				menu = new DetailScreen(this, feed, DetailScreen::PROFILE, NULL);
				menu->show();
			} else if (index == 6) {
				delete menu;
				menu = new Logout(this, feed);
				menu->show();
			}
			break;
		case MAK_SOFTLEFT:
			int seconds = maLocalTime();
			int secondsLength = intlen(seconds);
			char *secString = new char[secondsLength];
			memset(secString,'\0',secondsLength);
			sprintf(secString, "%d", seconds);
			feed->setSeconds(secString);
			saveData(FEED, feed->getAll().c_str());
			maExit(0);
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
	}
}

void MenuScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
	}
}

void MenuScreen::connReadFinished(Connection* conn, int result) {
}

void MenuScreen::xcConnError(int code) {
}

void MenuScreen::mtxEncoding(const char* ) {
}

void MenuScreen::mtxTagStart(const char* name, int len) {
}

void MenuScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void MenuScreen::mtxTagData(const char* data, int len) {
	if (len > 0) {
		delete menu;
		menu = new NewVersionScreen(this, data, feed);
		menu->show();
	}
}

void MenuScreen::mtxTagEnd(const char* name, int len) {
}

void MenuScreen::mtxParseError() {
}

void MenuScreen::mtxEmptyTagEnd() {
}

void MenuScreen::mtxTagStartEnd() {
}
