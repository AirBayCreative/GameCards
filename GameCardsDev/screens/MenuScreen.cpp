#include <conprint.h>

#include "RedeemScreen.h"
#include "AlbumLoadScreen.h"
#include "DetailScreen.h"
#include "ImageScreen.h"
#include "MenuScreen.h"
#include "ShopCategoriesScreen.h"
#include "OptionsScreen.h"
#include "NewVersionScreen.h"
#include "../utils/MAHeaders.h"
#include "../utils/Util.h"

MenuScreen::MenuScreen(Feed *feed) : GameCardScreen(NULL, feed, -1) {
	c=0;
	menu = NULL;
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
	label = createSubLabel(redeemlbl);
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

	char buf[64] = "";
	int imsi = maGetSystemProperty("mosync.imsi", buf, sizeof(buf));
	int imei = maGetSystemProperty("mosync.imei", buf, sizeof(buf));
	char *os = MA_PROF_STRING_PLATFORM;
	char *make = MA_PROF_STRING_VENDOR;
	char *model = "temp";//MA_PROF_STRING_DEVICE;
	int touch = 0;
#if defined(MA_PROF_SUPPORT_STYLUS)
	touch = 1;
#endif
	//work out how long the url will be, the 16 is for the & and = symbals
	int urlLength = UPDATE.length() + strlen(update_imsi) + intlen(imsi) + strlen(update_imei) + intlen(imei)
			+ strlen(update_os) + strlen(os) + strlen(update_make) + strlen(make)
			+ strlen(update_model) + strlen(model) + strlen(update_touch) + intlen(touch) + 16
			+ strlen(update_width) + intlen(scrWidth) + strlen(update_height) + intlen(scrHeight);
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s&%s=%d&%s=%d&%s=%s&%s=%s&%s=%s&%s=%d&%s=%d&%s=%d", UPDATE.c_str(), update_imsi,
			imsi, update_imei, imei, update_os, os, update_make, make, update_model, model, update_touch, touch,
			update_width, scrWidth, update_height, scrHeight);
	//update=_versionnumber&imsi=_imsi&imei=_imei&os=_os&make=_make&model=_model&touch=1/2&width=_screenWidht&height=_screenHeight
	//when the page has loaded, check for a new version in the background
	//www.mytcg.net/_phone/update=version_number
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {

	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}

	delete [] url;

	this->setMain(mainLayout);

	origMenu = this;
}

MenuScreen::~MenuScreen() {
	delete mainLayout;
	if(menu!=NULL){
		delete menu;
	}
}

void MenuScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontBlack);
	}
}

void MenuScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void MenuScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void MenuScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			int index = listBox->getSelectedIndex();
			if(index == 0) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_ALBUMS);
				menu->show();
			} else if(index == 1) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new OptionsScreen(feed, OptionsScreen::ST_PLAY_OPTIONS, this);
				menu->show();
			} else if(index == 2) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_SHOP);
				menu->show();
			} else if(index == 3) {
				if(menu!=NULL){
					delete menu;
				}
				//menu = new OptionsScreen(feed, OptionsScreen::ST_AUCTION_OPTIONS, this);
				//menu->show();
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_AUCTIONS);
				menu->show();
			} else if(index == 4) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new RedeemScreen(feed, this);
				menu->show();
			} else if(index == 5) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new DetailScreen(this, feed, DetailScreen::BALANCE);
				menu->show();
			} else if(index == 6) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new DetailScreen(this, feed, DetailScreen::PROFILE, NULL);
				menu->show();
			} else if (index == 7) {
				if(menu!=NULL){
					delete menu;
				}
				Albums *albums = feed->getAlbum();
				Vector<String> tmp = albums->getIDs();
				for (Vector<String>::iterator itr = tmp.begin(); itr != tmp.end(); itr++) {
					String s = itr->c_str();
					s+="-lst.sav";
					saveData(s.c_str(),"");
				}
				feed->setAll("");
				saveData(FEED,"");
				saveData(ALBUM,"");

				maExit(0);
				//menu = new Logout(this, feed);
				//menu->show();
			}
			break;
		case MAK_BACK:
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

void MenuScreen::mtxTagData(const char* data, int len) {
	if (len > 0) {
		if(menu!=NULL){
			delete menu;
		}
		menu = new NewVersionScreen(this, data, feed);
		menu->show();
	}
}
