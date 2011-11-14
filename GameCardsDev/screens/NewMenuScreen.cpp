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
#include "../utils/Util.h"

static item menuItems[] =
{
	{ RES_MISSINGTHUMB, RES_LOADING1, 0 },
	{ RES_TEMPTHUMB, RES_LOADING2, 1 },
	{ RES_MISSINGTHUMB, RES_LOADING3, 2 },
	{ RES_TEMPTHUMB, RES_LOADING4, 3 },
	{ RES_MISSINGTHUMB, RES_LOADING5, 4 },
	{ RES_TEMPTHUMB, RES_LOADING6, 5 },
	{ RES_MISSINGTHUMB, RES_LOADING7, 6 },
	{ RES_TEMPTHUMB, RES_LOADING8, 7 },
	{ RES_MISSINGTHUMB, RES_LOADING9, 8 }
};

NewMenuScreen::NewMenuScreen(Feed *feed) : mHttp(this), feed(feed), screenType(screenType) {
	lprintfln("NewMenuScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());

	lprintfln("sizeof(menuItems): %d", sizeof(menuItems));
	lprintfln("sizeof(item): %d", sizeof(item));
	int itemCount = sizeof(menuItems)/sizeof(item);

	c=0;
	versionChecked=0;
	next = NULL;
	first = 1;

	mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight, mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);

	MAExtent imgSize = maGetImageSize(RES_IMAGE);
	int imgHeight = EXTENT_Y(imgSize);

	Image *image = new Image(0, 0, scrWidth,  imgHeight, NULL, false, false, RES_IMAGE);
	listBox->add(image);

	label = new Label(0,0,scrWidth,36,NULL,"",0,Util::getDefaultSelected());
	label->setMultiLine(true);
	label->setAutoSizeY();
	label->setMultiLine(true);
	listBox->add(label);

	menu = new GCMenu(menuItems, itemCount, 0, 0, scrWidth, listBox->getHeight() - imgHeight, false, false, listBox);

	setMain(mainLayout);

	origMenu = this;
}

NewMenuScreen::~NewMenuScreen() {
	lprintfln("~NewMenuScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	delete mainLayout;
	if(next!=NULL){
		delete next;
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
	//menu->selectionChanged(widget, selected);
}

void NewMenuScreen::pointerPressEvent(MAPoint2d point)
{
	//menu->pointerPressEvent(point);
	//locateItem(point);
}

void NewMenuScreen::pointerMoveEvent(MAPoint2d point)
{
	//menu->pointerMoveEvent(point);
	//locateItem(point);
	//moved++;
}

void NewMenuScreen::pointerReleaseEvent(MAPoint2d point)
{
	//menu->pointerReleaseEvent(point);
	/*if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		}
	}
	moved=0;*/
}

void NewMenuScreen::keyPressEvent(int keyCode) {
	/*switch(keyCode) {
		case MAK_RIGHT:
			menu->selectNext();
			break;
		case MAK_LEFT:
			menu->selectPrevious();
			break;
	}*/
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
			noteLabel->setCaption("*Notifications");
			noteLabel->setFont(Util::getDefaultSelected());

			if(first==1){
				first = 0;
				feed->remHttp();

				if (shown) {
					if(next!=NULL){
						delete next;
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

void NewMenuScreen::mtxEmptyTagEnd() {}

void NewMenuScreen::connReadFinished(Connection* conn, int result) {}

void NewMenuScreen::mtxParseError(int code) {}

void NewMenuScreen::mtxEncoding(const char* ) {}

void NewMenuScreen::mtxTagStartEnd() {}
