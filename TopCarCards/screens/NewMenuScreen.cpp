#include <conprint.h>
#include <mastdlib.h>

#include "DeckListScreen.h"
#include "RedeemScreen.h"
#include "AlbumLoadScreen.h"
#include "DetailScreen.h"
#include "ImageScreen.h"
#include "NewMenuScreen.h"
#include "ShopCategoriesScreen.h"
#include "OptionsScreen.h"
#include "NewVersionScreen.h"
#include "TradeFriendDetailScreen.h"
#include "MenuTestScreen.h"
#include "TutorialScreen.h"
#include "../utils/Util.h"

static item menuItems[] =
{
	{ RES_ALBUM_THUMB, RES_ALBUM, OP_ALBUMS },
	{ RES_PLAY_THUMB, RES_PLAY, OP_PLAY },
	{ RES_DECKS_THUMB, RES_DECKS, OP_DECKS },
	{ RES_SHOP_THUMB, RES_SHOP, OP_SHOP },
	{ RES_AUCTIONS_THUMB, RES_AUCTIONS, OP_AUCTIONS },
	{ RES_NOTIFICATIONS_THUMB, RES_NOTIFICATIONS, OP_NOTIFICATIONS },
	{ RES_CREDITS_THUMB, RES_CREDITS, OP_CREDITS },
	{ RES_PROFILE_THUMB, RES_PROFILE, OP_PROFILE },
	{ RES_RANKINGS_THUMB, RES_RANKINGS, OP_RANKINGS },
	{ RES_FRIENDRANKS_THUMB, RES_FRIENDRANKS, OP_FRIENDRANKS },
	{ RES_FRIENDS_THUMB, RES_FRIENDS, OP_FRIENDS },
	{ RES_INVITE_THUMB, RES_INVITE, OP_INVITEFRIENDS },
	{ RES_REDEEM_THUMB, RES_REDEEM, OP_REDEEM },
	{ RES_LOGOUT_THUMB, RES_LOGOUT, OP_LOGOUT }
};

/*static tutItem tutItems[] =
{
	{RES_TUT_1, "1", 1},
	{RES_TUT_2, "2", 2},
	{RES_TUT_3, "3", 3},
	{RES_TUT_4, "4", 4},
	{RES_TUT_5, "5", 5},
	{RES_TUT_6, "6", 6},
	{RES_TUT_7, "7", 7}
};*/

NewMenuScreen::NewMenuScreen(Feed *feed) : mHttp(this), screenType(screenType) {
	lprintfln("NewMenuScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->feed = feed;

	int itemCount = sizeof(menuItems)/sizeof(item);

	c=0;
	versionChecked=0;
	next = NULL;
	first = 1;

	mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);

	MAExtent imgSize = maGetImageSize(RES_IMAGE);
	int imgHeight = EXTENT_Y(imgSize);

	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight, mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	listBox->setSkin(Util::getSkinBack());
	/*listBox->setSkin(Util::getSkinHeader());*/
	/*listBox->setDrawBackground(false);*/


	/*Layout *header = new Layout(0,0,scrWidth, imgHeight, NULL, 1, 1);
	header->setSkin(Util::getSkinHeader());*/

	ListBox *header = new ListBox(0, 0, scrWidth, imgHeight, NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	header->setSkin(Util::getSkinHeader());

	Image *image = new Image(0, 0, scrWidth,  imgHeight, NULL, true, true, RES_IMAGE);
	header->add(image);

	listBox->add(header);

	label = new Label(0,0,scrWidth,36,NULL,"",0,Util::getDefaultSelected());
	label->setMultiLine(true);
	label->setAutoSizeY();
	label->setMultiLine(true);
	label->setDrawBackground(false);
	listBox->add(label);

	menu = new GCMenu(menuItems, itemCount, 0, 0, scrWidth, listBox->getHeight() - imgHeight, false, false, listBox);

	setMain(mainLayout);

	origMenu = this;
}

NewMenuScreen::~NewMenuScreen() {
	lprintfln("~NewMenuScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	delete mainLayout;
	mainLayout = NULL;
	if(next!=NULL){
		delete next;
		feed->remHttp();
		next = NULL;
	}
	parentTag="";
	notedate="";
}

void NewMenuScreen::locateItem(MAPoint2d point)
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
			list = true;
		}
	}
	for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
			if (i == 0) {
				left = true;
				moved=0;
			} else if (i == 1) {
				list = true;
				moved = 0;
			} else if (i == 2) {
				right = true;
				moved=0;
			}
			return;
		}
	}
}

void NewMenuScreen::selectionChanged(Widget *widget, bool selected) {

}

void NewMenuScreen::pointerPressEvent(MAPoint2d point)
{
	moved = 0;
}

void NewMenuScreen::pointerMoveEvent(MAPoint2d point)
{
	moved++;
}

void NewMenuScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved < 8 && menu->imageContains(point.x, point.y)) {
		keyPressEvent(MAK_FIRE);
	}
}

void NewMenuScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			int index = menu->getSelectedKey();
			if(index == OP_ALBUMS) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				next = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_ALBUMS);
				next->show();
				/*if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				next = new TutorialScreen(this, tutItems, sizeof(tutItems)/sizeof(tutItem));
				next->show();*/
			} else if(index == OP_PLAY) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				next = new OptionsScreen(feed, OptionsScreen::ST_PLAY_OPTIONS, this);
				next->show();
			} else if(index == OP_DECKS) {//decks
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				next = new DeckListScreen(this, feed);
				next->show();
			} else if(index == OP_SHOP) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				next = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_SHOP);
				next->show();
			} else if(index == OP_AUCTIONS) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				next = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_AUCTIONS);
				next->show();
			} else if(index == OP_CREDITS) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				next = new DetailScreen(this, feed, DetailScreen::BALANCE);
				next->show();
			} else if(index == OP_PROFILE) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				next = new DetailScreen(this, feed, DetailScreen::PROFILE, NULL);
				next->show();
			} else if(index == OP_NOTIFICATIONS) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				/* Notifications */
				next = new DetailScreen(this, feed, DetailScreen::NOTIFICATIONS, NULL);
				next->show();
			} else if(index == OP_RANKINGS) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				next = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_RANKING);
				next->show();
			} else if(index == OP_FRIENDRANKS) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				next = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_FRIEND);
				next->show();
			} else if(index == OP_FRIENDS) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				/* Notifications */
				next = new DetailScreen(this, feed, DetailScreen::FRIENDS, NULL);
				next->show();
			} else if(index == OP_INVITEFRIENDS) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				/*Invite Friend */
				next = new TradeFriendDetailScreen(this, feed, NULL);
				next->show();
			} else if(index == OP_REDEEM) {
				if(next!=NULL){
					delete next;
					feed->remHttp();
					next = NULL;
				}
				next = new RedeemScreen(feed, this);
				next->show();
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
					if(next!=NULL){
						//delete next;
					}
					maExit(0);
				}
#endif
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
#if not defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
			/*if (next!=NULL) {
					delete next;
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
	}
}

void NewMenuScreen::refresh() {
	/*if(feed->getNoteLoaded()){
		noteLabel->setCaption("*Notifications");
		noteLabel->setFont(Util::getDefaultSelected());
	}else{
		noteLabel->setCaption("Notifications");
		noteLabel->setFont(Util::getDefaultFont());
	}*/
}

void NewMenuScreen::show() {
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
		lprintfln("%s", url);
		int res = mHttp.create(url, HTTP_GET);
		if(res < 0) {
		} else {
			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();
		}
		delete url;
		url = NULL;
	}
	versionChecked = 0;
	Screen::show();
}

void NewMenuScreen::hide() {
	shown = false;
	Screen::hide();
}

void NewMenuScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		feed->remHttp();
	}
}

void NewMenuScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void NewMenuScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void NewMenuScreen::mtxTagData(const char* data, int len) {
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
			int seconds = maLocalTime();
			int secondsLength = Util::intlen(seconds);
			char *secString = new char[secondsLength+1];
			memset(secString,'\0',secondsLength+1);
			sprintf(secString, "%d", seconds);
			feed->setNoteSeconds(secString);
			delete secString;
			secString = NULL;

			Util::saveData("fd.sav",feed->getAll().c_str());

			if(first==1){
				first = 0;
				feed->remHttp();

				if (shown) {
					if(next!=NULL){
						delete next;
						feed->remHttp();
						next = NULL;
					}
					/* Notifications */
					next = new DetailScreen(this, feed, DetailScreen::NOTIFICATIONS, NULL);
					next->show();
				}
			}
		}
	}
	else if (len > 0) {
		if(next!=NULL){
			//delete next;
		}
		String find = String(data);
		if (find.find("http://") == 0) {
			feed->remHttp();
			if (shown) {
				next = new NewVersionScreen(this, data, feed);
				next->show();
			}
		}
	}
}

void NewMenuScreen::mtxTagEnd(const char* name, int len) {}

void NewMenuScreen::xcConnError(int code) {
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

			char *os = new char[strlen("temp")+1];
			memset(os, 0, strlen("temp")+1);
			sprintf(os, "%s", "temp");

			char *make = new char[strlen("temp")+1];
			memset(make, 0, strlen("temp")+1);
			sprintf(make, "%s", "temp");

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
			lprintfln("%s", url);
			int res = mHttp.create(url, HTTP_GET);
			if(res < 0) {

			} else {
				mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
				mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
				feed->addHttp();
				mHttp.finish();
			}

			delete [] url;
			url = NULL;
			versionChecked = 1;
		}
	} else {

	}
}

void NewMenuScreen::mtxEmptyTagEnd() {}

void NewMenuScreen::connReadFinished(Connection* conn, int result) {}

void NewMenuScreen::mtxParseError(int code) {}

void NewMenuScreen::mtxEncoding(const char* ) {}

void NewMenuScreen::mtxTagStartEnd() {}
