#include <conprint.h>
#include <mastdlib.h>

#include "DeckListScreen.h"
#include "RedeemScreen.h"
#include "AlbumLoadScreen.h"
#include "DetailScreen.h"
#include "ImageScreen.h"
#include "MenuScreen.h"
#include "ShopCategoriesScreen.h"
#include "OptionsScreen.h"
#include "NewVersionScreen.h"
#include "TradeFriendDetailScreen.h"
#include "../utils/Util.h"

MenuScreen::MenuScreen(Feed *feed) : GameCardScreen(NULL, feed, -1) {
	lprintfln("MenuScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	c=0;
	versionChecked=0;
	menu = NULL;
#if defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
	mainLayout = Util::createMainLayout("", "", true);
#else
	mainLayout = Util::createMainLayout("", "Exit", true);
#endif

	listBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];
	label = Util::createSubLabel("Albums");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Play");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Decks");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Shop");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Auctions");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Credits");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Profile");
	label->addWidgetListener(this);
	listBox->add(label);
	if(feed->getNoteLoaded()){
		noteLabel = Util::createSubLabel("*Notifications");
	}else{
		noteLabel = Util::createSubLabel("Notifications");
	}
	noteLabel->addWidgetListener(this);
	listBox->add(noteLabel);
	label = Util::createSubLabel("Rankings");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Friend Ranks");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Friends");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Invite Friends");
	label->addWidgetListener(this);
	listBox->add(label);
	label = Util::createSubLabel("Redeem");
	label->addWidgetListener(this);
	listBox->add(label);
#if not defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
	label = Util::createSubLabel("Log Out");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
	label = new Label(0, 0, scrWidth-(PADDING*2), 72, NULL, "", 0, Util::getDefaultFont());
	listBox->add(label);

	listBox->setSelectedIndex(0);

	moved=0;

	this->setMain(mainLayout);

	origMenu = this;


	 if (strcmp("0", feed->getFreebie().c_str()) == 0) {
		 if (menu!=NULL) {
			 delete menu;
		 }
		menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_FREEBIE);
	}
}

MenuScreen::~MenuScreen() {
	clearListBox();
	listBox->clear();
	delete mainLayout;
	if(menu!=NULL){
		delete menu;
	}
	parentTag="";
	notedate="";
}
void MenuScreen::clearListBox() {
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

void MenuScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget)->setFont(Util::getDefaultFont());
	}
}

void MenuScreen::refresh() {
	if(feed->getNoteLoaded()){
		noteLabel->setCaption("*Notifications");
	}else{
		noteLabel->setCaption("Notifications");
	}
}

void MenuScreen::show() {
	if(feed->getNoteLoaded()==false){
		if(mHttp.isOpen()){
			mHttp.close();
		}
		mHttp = HttpConnection(this);
		int urlLength = 11 + URLSIZE;
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?notedate=1", URL);
		lprintfln("url %s",url);
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
					feed->remHttp();
				}
				menu = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_ALBUMS);
				menu->show();
			} else if(index == 1) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new OptionsScreen(feed, OptionsScreen::ST_PLAY_OPTIONS, this);
				menu->show();
			} else if(index == 2) {//decks
				if(menu!=NULL){
					delete menu;
				}
				menu = new DeckListScreen(this, feed);
				menu->show();
			} else if(index == 3) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_SHOP);
				menu->show();
			} else if(index == 4) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_AUCTIONS);
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
			} else if(index == 7) {
				if(menu!=NULL){
					delete menu;
				}
				/* Notifications */
				menu = new DetailScreen(this, feed, DetailScreen::NOTIFICATIONS, NULL);
				menu->show();
			} else if(index == 8) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_RANKING);
				menu->show();
			} else if(index == 9) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_FRIEND);
				menu->show();
			} else if(index == 10) {
				if(menu!=NULL){
					delete menu;
				}
				/* Notifications */
				menu = new DetailScreen(this, feed, DetailScreen::FRIENDS, NULL);
				menu->show();
			} else if(index == 11) {
				if(menu!=NULL){
					delete menu;
				}
				/*Invite Friend */
				menu = new TradeFriendDetailScreen(this, feed, NULL);
				menu->show();
			} else if(index == 12) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new RedeemScreen(feed, this);
				menu->show();
			} else if (index == 13) {
#if not defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
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

				if (feed->getHttps() > 0) {
					label = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
					label->setCaption("Please wait for all connections to finish before exiting. Try again in a few seconds.");
				} else {
					if(menu!=NULL){
						delete menu;
					}
					maExit(0);
				}
#endif
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
#if not defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
			if (menu!=NULL) {
				delete menu;
			}
			int seconds = maLocalTime();
			int secondsLength = Util::intlen(seconds);
			char *secString = new char[secondsLength+1];
			memset(secString,'\0',secondsLength+1);
			sprintf(secString, "%d", seconds);
			feed->setSeconds(secString);
			Util::saveData("fd.sav", feed->getAll().c_str());

			if (feed->getHttps() > 0) {
				label = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
				label->setCaption("Please wait for all connections to finish before exiting. Try again in a few seconds.");
			} else {
				maExit(0);
			}
#endif
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
	}
}

void MenuScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
	lprintfln("parentTag %s",parentTag.c_str());
}

void MenuScreen::mtxTagData(const char* data, int len) {
	lprintfln("mtxTagData() %s", data);
	if(!strcmp(parentTag.c_str(), "notedate")) {
			notedate = data;
			tm t;
			t.tm_year = atoi(notedate.substr(0,4).c_str())-1900;
			t.tm_mon = atoi(notedate.substr(5,2).c_str())-1;
			t.tm_mday = atoi(notedate.substr(8,2).c_str());
			t.tm_hour = atoi(notedate.substr(11,2).c_str());
			t.tm_min = atoi(notedate.substr(14,2).c_str());
			t.tm_sec = atoi(notedate.substr(17,2).c_str());
			int ndate = mktime(&t);
			lprintfln("notedate %d",ndate);
			lprintfln("feed->getNoteSeconds() %s",feed->getNoteSeconds().c_str());
			if(ndate > atoi(feed->getNoteSeconds().c_str())){
				feed->setNoteLoaded(true);
				noteLabel->setCaption("*Notifications");
			}
	}
	else if (len > 0) {
		if(menu!=NULL){
			delete menu;
		}
		String find = String(data);
		if (find.find("http://") == 0) {
			menu = new NewVersionScreen(this, data, feed);
			menu->show();
		}
	}
}

void MenuScreen::mtxParseError() {
	lprintfln("mtxParseError()");
	if(versionChecked ==0){
		char buf[128] = "";
		memset(buf, 0, 128);
		int imsi = maGetSystemProperty("mosync.imsi", buf, sizeof(buf));
		memset(buf, 0, 128);
		int imei = maGetSystemProperty("mosync.imei", buf, sizeof(buf));
		memset(buf, 0, 128);

		char *os = new char[strlen(MA_PROF_STRING_PLATFORM)+1];
		memset(os, 0, strlen(MA_PROF_STRING_PLATFORM)+1);
		sprintf(os, "%s", MA_PROF_STRING_PLATFORM);

		char *make = new char[strlen(MA_PROF_STRING_VENDOR)+1];
		memset(make, 0, strlen(MA_PROF_STRING_VENDOR)+1);
		sprintf(make, "%s", MA_PROF_STRING_VENDOR);

		//char *model = "temp";//MA_PROF_STRING_DEVICE;
		char *model = new char[strlen("temp")+1];
		memset(model, 0, strlen("temp")+1);
		sprintf(model, "%s", "temp");

		int touch = 0;
	#if defined(MA_PROF_SUPPORT_STYLUS)
		touch = 1;
	#endif

		if(mHttp.isOpen()){
			mHttp.close();
		}
		mHttp = HttpConnection(this);
		//work out how long the url will be, the 16 is for the & and = symbals
		int urlLength = 91 + URLSIZE + Util::intlen(imsi) + Util::intlen(imei) + strlen(os) + strlen(make)
				+ strlen(model) + Util::intlen(touch) + Util::intlen(scrWidth) + Util::intlen(scrHeight);

		char *url = new char[urlLength+1];

		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?update=1.02&imsi=%d&imei=%d&os=%s&make=%s&model=%s&touch=%d&width=%d&height=%d", URL,
				imsi, imei, os, make, model, touch, scrWidth, scrHeight);
		int res = mHttp.create(url, HTTP_GET);
		if(res < 0) {

		} else {
			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();
		}

		delete [] url;
		versionChecked = 1;
	}
}
