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
	mainLayout = Util::createMainLayout("", "Exit", true);

	listBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];
	label = Util::createSubLabel("Albums");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Play");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Shop");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Auctions");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Redeem");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("My Balance");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("My Profile");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Log Out");
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
	int urlLength = strlen("http://dev.mytcg.net/_phone/?update=1.02") + strlen("imsi") + Util::intlen(imsi) + strlen("os") + Util::intlen(imei)
			+ strlen("os") + strlen(os) + strlen("make") + strlen(make)
			+ strlen("model") + strlen(model) + strlen("touch") + Util::intlen(touch) + 16
			+ strlen("width") + Util::intlen(scrWidth) + strlen("height") + Util::intlen(scrHeight);
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s&%s=%d&%s=%d&%s=%s&%s=%s&%s=%s&%s=%d&%s=%d&%s=%d", "http://dev.mytcg.net/_phone/?update=1.02", "imsi",
			imsi, "os", imei, "os", os, "make", make, "model", model, "touch", touch,
			"width", scrWidth, "height", scrHeight);
	//update=_versionnumber&imsi=_imsi&imei=_imei&os=_os&make=_make&model=_model&touch=1/2&width=_screenWidht&height=_screenHeight
	//when the page has loaded, check for a new version in the background
	//www.mytcg.net/_phone/update=version_number
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {

	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
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
		((Label *)widget)->setFont(Util::getFontBlue());
	} else {
		((Label *)widget)->setFont(Util::getFontBlack());
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
		case MAK_SOFTLEFT:
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
					Util::saveData(s.c_str(),"");
				}
				feed->setAll("");
				Util::saveData("fd.sav","");
				Util::saveData("lb.sav","");

				maExit(0);
				//menu = new Logout(this, feed);
				//menu->show();
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			int seconds = maLocalTime();
			int secondsLength = Util::intlen(seconds);
			char *secString = new char[secondsLength];
			memset(secString,'\0',secondsLength);
			sprintf(secString, "%d", seconds);
			feed->setSeconds(secString);
			Util::saveData("fd.sav", feed->getAll().c_str());
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
