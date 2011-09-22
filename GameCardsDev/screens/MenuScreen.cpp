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
	first = 1;
#if defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
	mainLayout = Util::createMainLayout("", "", true);
#else
	mainLayout = Util::createMainLayout("", "Exit", true);
#endif

	listBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];

#if (OP_ALBUMS > -1)
		label = Util::createSubLabel("Albums");
		label->addWidgetListener(this);
		listBox->add(label);
#endif
#if (OP_PLAY > -1)
	label = Util::createSubLabel("Play");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
#if (OP_DECKS > -1)
	label = Util::createSubLabel("Decks");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
#if (OP_SHOP > -1)
	label = Util::createSubLabel("Shop");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
#if (OP_AUCTIONS > -1)
	label = Util::createSubLabel("Auctions");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
#if (OP_NOTIFICATIONS > -1)
	if(feed->getNoteLoaded()){
		noteLabel = Util::createSubLabel("*Notifications");
		noteLabel->setFont(Util::getDefaultSelected());
	}else{
		noteLabel = Util::createSubLabel("Notifications");
		noteLabel->setFont(Util::getDefaultFont());
	}
	noteLabel->addWidgetListener(this);
	listBox->add(noteLabel);
#endif
#if (OP_CREDITS > -1)
	label = Util::createSubLabel("Credits");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
#if (OP_PROFILE > -1)
	label = Util::createSubLabel("Profile");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
#if (OP_RANKINGS > -1)
	label = Util::createSubLabel("Rankings");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
#if (OP_FRIENDRANKS > -1)
	label = Util::createSubLabel("Friend Ranks");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
#if (OP_FRIENDS > -1)
	label = Util::createSubLabel("Friends");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
#if (OP_INVITEFRIENDS > -1)
	label = Util::createSubLabel("Invite Friends");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
#if (OP_REDEEM > -1)
	label = Util::createSubLabel("Redeem");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
#if (OP_LOGOUT > -1)
#if not defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
	label = Util::createSubLabel("Log Out");
	label->addWidgetListener(this);
	listBox->add(label);
#endif
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
		noteLabel->setFont(Util::getDefaultSelected());
	}else{
		noteLabel->setCaption("Notifications");
		noteLabel->setFont(Util::getDefaultFont());
	}
}

void MenuScreen::show() {
	shown = true;
	if(feed->getNoteLoaded()==false){
		if(mHttp.isOpen()){
			mHttp.close();
		}
		mHttp = HttpConnection(this);
		int urlLength = 11 + URLSIZE;
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?notedate=1", URL);
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
	versionChecked = 0;
	//listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void MenuScreen::hide() {
	shown = false;
    //listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void MenuScreen::keyPressEvent(int keyCode) {
	int total = listBox->getChildren().size();
	int select = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			int index = listBox->getSelectedIndex();
			if(index == OP_ALBUMS) {
				if(menu!=NULL){
					delete menu;
					feed->remHttp();
				}
				menu = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_ALBUMS);
				menu->show();
			} else if(index == OP_PLAY) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new OptionsScreen(feed, OptionsScreen::ST_PLAY_OPTIONS, this);
				menu->show();
			} else if(index == OP_DECKS) {//decks
				if(menu!=NULL){
					delete menu;
				}
				menu = new DeckListScreen(this, feed);
				menu->show();
			} else if(index == OP_SHOP) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_SHOP);
				menu->show();
			} else if(index == OP_AUCTIONS) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_AUCTIONS);
				menu->show();
			} else if(index == OP_CREDITS) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new DetailScreen(this, feed, DetailScreen::BALANCE);
				menu->show();
			} else if(index == OP_PROFILE) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new DetailScreen(this, feed, DetailScreen::PROFILE, NULL);
				menu->show();
			} else if(index == OP_NOTIFICATIONS) {
				if(menu!=NULL){
					delete menu;
				}
				/* Notifications */
				menu = new DetailScreen(this, feed, DetailScreen::NOTIFICATIONS, NULL);
				menu->show();
			} else if(index == OP_RANKINGS) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_RANKING);
				menu->show();
			} else if(index == OP_FRIENDRANKS) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_FRIEND);
				menu->show();
			} else if(index == OP_FRIENDS) {
				if(menu!=NULL){
					delete menu;
				}
				/* Notifications */
				menu = new DetailScreen(this, feed, DetailScreen::FRIENDS, NULL);
				menu->show();
			} else if(index == OP_INVITEFRIENDS) {
				if(menu!=NULL){
					delete menu;
				}
				/*Invite Friend */
				menu = new TradeFriendDetailScreen(this, feed, NULL);
				menu->show();
			} else if(index == OP_REDEEM) {
				if(menu!=NULL){
					delete menu;
				}
				menu = new RedeemScreen(feed, this);
				menu->show();
			} else if (index == OP_LOGOUT) {
#if not defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
				Albums *albums = feed->getAlbum();
				Vector<String> tmp = albums->getIDs();
				for (Vector<String>::iterator itr = tmp.begin(); itr != tmp.end(); itr++) {
					String s = itr->c_str();
					s+="-lst.sav";
					Util::saveData(s.c_str(),"");
				}
				feed->setAll("");
				feed->setRegistered("1");
				Util::saveData("fd.sav",feed->getAll().c_str());
				Util::saveData("lb.sav","");

				if (feed->getHttps() > 0) {
					label = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
					label->setCaption("Please wait for all connections to finish before exiting. Try again in a few seconds.");
				} else {
					if(menu!=NULL){
						//delete menu;
					}
					maExit(0);
				}
#endif
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
#if not defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
			/*if (menu!=NULL) {
					delete menu;
			}*/
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
			if (select == total-1) {
				listBox->setSelectedIndex(0);
			} else {
				listBox->selectNextItem();
			}
			break;
		case MAK_UP:
			if (select == 0) {
				listBox->setSelectedIndex(total-1);
			} else {
				listBox->selectPreviousItem();
			}
			break;
	}
}

void MenuScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void MenuScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "notedate")) {
		parentTag = "";
		notedate = data;
		tm t;
		t.tm_year = atoi(notedate.substr(0,4).c_str())-1900;
		t.tm_mon = atoi(notedate.substr(5,2).c_str())-1;
		t.tm_mday = atoi(notedate.substr(8,2).c_str());
		t.tm_hour = atoi(notedate.substr(11,2).c_str());
		t.tm_min = atoi(notedate.substr(14,2).c_str());
		t.tm_sec = atoi(notedate.substr(17,2).c_str());
		int ndate = mktime(&t);
		if(ndate > atoi(feed->getNoteSeconds().c_str())){
			feed->setNoteLoaded(true);
			noteLabel->setCaption("*Notifications");
			noteLabel->setFont(Util::getDefaultSelected());

			if(first==1){
				first = 0;
				feed->remHttp();

				if (shown) {
					if(menu!=NULL){
						delete menu;
					}
					/* Notifications */
					menu = new DetailScreen(this, feed, DetailScreen::NOTIFICATIONS, NULL);
					menu->show();
				}
			}
		}
	}
	else if (len > 0) {
		if(menu!=NULL){
			//delete menu;
		}
		String find = String(data);
		if (find.find("http://") == 0) {
			feed->remHttp();
			if (shown) {
				menu = new NewVersionScreen(this, data, feed);
				menu->show();
			}
		}
	}
}

void MenuScreen::xcConnError(int code) {
	feed->remHttp();
	if (feed->getHttps() <= 0) {
		label = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
		label->setCaption("");
	}
	if (code == -6) {
		if(versionChecked ==0) {
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
			sprintf(url, "%s?update=1.04&imsi=%d&imei=%d&os=%s&make=%s&model=%s&touch=%d&width=%d&height=%d", URL,
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
	} else {

	}
}

void MenuScreen::mtxParseError(int code) {}
