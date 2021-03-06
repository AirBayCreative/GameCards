#include <conprint.h>

#include "AlbumLoadScreen.h"
#include "AlbumViewScreen.h"
#include "ShareScreen.h"
#include "NewVersionScreen.h"
#include "../utils/Util.h"
#include "../utils/Albums.h"
#include "../utils/Album.h"

void AlbumLoadScreen::refresh() {
	show();
	path.clear();
	mHttp = HttpConnection(this);
	int res = mHttp.create(ALBUMS.c_str(), HTTP_GET);

	if(res < 0) {

	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
}

AlbumLoadScreen::AlbumLoadScreen(Feed *feed, Albums *al) : mHttp(this),
		feed(feed) {
	canShare = false;
	checkedUpdate = false;
	size = 0;
	moved = 0;
	int res = -1;
	char *url = NULL;
	int urlLength = 0;

	hasCards = "";
	temp = "";
	temp1 = "";
	updated = "0";
	urlData = "";

//check the platform, and if it supports pim
#if defined(MA_PROF_STRING_PLATFORM)
	String platform = MA_PROF_STRING_PLATFORM;
	if (strcmp(platform.c_str(), "s60v5") == 0 ||
			strcmp(platform.c_str(), "s60v3") == 0 ||
			strcmp(platform.c_str(), "JavaME") == 0 ||
			strcmp(platform.c_str(), "wm6pro") == 0) {
		canShare = true;
	}
	platform = "";
#endif

	next = NULL;
	#if defined(MA_PROF_SUPPORT_STYLUS)
		mainLayout = createMainLayout(exit, "", true);
  	#else
		mainLayout = createMainLayout(exit, select, true);
  	#endif

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	if (al == NULL) {
		album = new Albums();
		album->setAll(this->feed->getAlbum()->getAll().c_str());
	}
	else {
		album = al;
	}

	notice->setCaption(checking_albums);
	drawList();
	urlLength = ALBUMS.length() + strlen(seconds) + feed->getSeconds().length() + 2;
	url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s&%s=%s", ALBUMS.c_str(), seconds, feed->getSeconds().c_str());
	res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		hasConnection = false;
		notice->setCaption("");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	this->setMain(mainLayout);

	if (url != NULL) {
		delete url;
	}

	orig = this;
}

AlbumLoadScreen::~AlbumLoadScreen() {
	delete mainLayout;
	if(next!=NULL){
		delete next;
	}
	parentTag="";
	temp="";
	temp1="";
	error_msg="";
	hasCards="";
	updated="";

	delete album;
	album = NULL;
}

#if defined(MA_PROF_SUPPORT_STYLUS)

void AlbumLoadScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void AlbumLoadScreen::pointerMoveEvent(MAPoint2d point)
{
	moved++;
    locateItem(point);
}

void AlbumLoadScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (mid) {
			keyPressEvent(MAK_FIRE);
		}
	}
	moved=0;
}

void AlbumLoadScreen::locateItem(MAPoint2d point)
{
	if (feed->setTouch(truesz)) {
		saveData(FEED, feed->getAll().c_str());
	}

	list = false;
	left = false;
	right = false;
	mid = false;

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
			} else if (i == 1) {
				moved=0;
				mid = true;
			} else if (i == 2) {
				moved=0;
				right = true;
			}
			return;
		}
	}
}

#endif

void AlbumLoadScreen::drawList() {
	empt = false;
	clearListBox();

	Vector<String> display = album->getNames();
	size = 0;
	for(Vector<String>::iterator itr = display.begin(); itr != display.end(); itr++) {
		label = createSubLabel(itr->c_str());
		label->setPaddingBottom(5);
		label->addWidgetListener(this);
		listBox->add(label);

		size++;
	}

	if (size == 0) {
		//add the empty album
		empt = true;
		label = createSubLabel(empty);
		label->setPaddingBottom(5);
		label->addWidgetListener(this);
		listBox->add(label);
		size++;
	}

	if (canShare) {
		//add the share option
		label = createSubLabel(sharelbl);
		label->setPaddingBottom(5);
		label->addWidgetListener(this);
		listBox->add(label);
		size++;
	}
	//add the logout option
	label = createSubLabel(logout);
	label->setPaddingBottom(5);
	label->addWidgetListener(this);
	listBox->add(label);
	size++;

	listBox->setSelectedIndex(0);
}

void AlbumLoadScreen::clearListBox() {
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

void AlbumLoadScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlueBold);
	} else {
		((Label *)widget)->setFont(gFontBlackBold);
	}
}

void AlbumLoadScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void AlbumLoadScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void AlbumLoadScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_SOFTLEFT:
			if (path.size() > 0) {
				path.remove(path.size()-1);
				loadCategory();
			}
			else {
				maExit(0);
			}
			break;
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			if (!empt) {
				if (listBox->getSelectedIndex() == (size-1)) {
					cleanup();
				}
				else if (canShare && listBox->getSelectedIndex() == (size-2)) {
					//the share option
					if (next != NULL) {
						delete next;
						next = NULL;
					}
					next = new ShareScreen(this, feed);
					next->show();
				}
				else {
					Album* val = (album->getAlbum(((Label *)listBox->getChildren()[listBox->getSelectedIndex()])->getCaption()));
					if (val->getHasCards()) {
						if (next != NULL) {
							delete next;
							next = NULL;
						}
						if (strcmp(val->getId().c_str(), album_newcards) == 0) {
							next = new AlbumViewScreen(this, feed, val->getId());
							next->show();
						}
						else {
							next = new AlbumViewScreen(this, feed, val->getId());
							next->show();
						}
					}
					else {
						//if a category has no cards, it means it has sub categories.
						//it is added to the path so we can back track
						path.add(val->getId());
						//then it must be loaded
						loadCategory();
					}
				}
			}
			break;
	}
}

void AlbumLoadScreen::loadCategory() {
	#if defined(MA_PROF_SUPPORT_STYLUS)
		updateSoftKeyLayout(path.size()==0?exit:back, "", "", mainLayout);
	#else
		updateSoftKeyLayout(path.size()==0?exit:back, select, "", mainLayout);
	#endif

	//the list needs to be cleared
	album->clearAll();
	clearListBox();
	//then if the category has been loaded before, we need to load from the file
	notice->setCaption(checking_albums);
	if (path.size() == 0) {
		album->setAll(this->feed->getAlbum()->getAll().c_str());
	}
	else {
		char *file = new char[path.end()->length() + 5];
		sprintf(file, "%s%s%s", "a", path[path.size()-1].c_str(), ".sav");
		album->setAll(getData(file));
		delete file;
	}
	drawList();
	//then request up to date info, if there is a connection available
	if (hasConnection) {
		int res;
		int urlLength;
		char *url = NULL;
		if(mHttp.isOpen()){
			mHttp.close();
		}
		mHttp = HttpConnection(this);
		if (path.size() == 0) {
			//if path is empty, the list is at the top level
			//work out how long the url will be, the 2 is for the & and = symbols
			urlLength = ALBUMS.length() + strlen(seconds) + feed->getSeconds().length() + 2;
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&%s=%s", ALBUMS.c_str(), seconds, feed->getSeconds().c_str());
			res = mHttp.create(url, HTTP_GET);
		}
		else {
			//work out how long the url will be, the 4 is for the & and = symbols
			urlLength = SUBCATEGORIES.length() + strlen(category) + path[path.size()-1].length() + strlen(seconds) + feed->getSeconds().length() + 4;
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&%s=%s&%s=%s", SUBCATEGORIES.c_str(), category, path[path.size()-1].c_str(), seconds, feed->getSeconds().c_str());
			res = mHttp.create(url, HTTP_GET);
		}

		if(res < 0) {
			notice->setCaption("");
		} else {
			mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
			mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
			mHttp.finish();
		}

		if (url != NULL) {
			delete url;
			url = NULL;
		}
	}
}

void AlbumLoadScreen::updateApp() {
	checkedUpdate = true;

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

	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {

	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}

	delete [] url;
}

void AlbumLoadScreen::cleanup() {
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
}

void AlbumLoadScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption("");
	}
}

void AlbumLoadScreen::connReadFinished(Connection* conn, int result) {}

void AlbumLoadScreen::xcConnError(int code) {
	if (!checkedUpdate) {
		updateApp();
	}

	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
}

void AlbumLoadScreen::mtxEncoding(const char* ) {
}

void AlbumLoadScreen::mtxTagStart(const char* name, int len) {
	if (!strcmp(name, xml_albumdone)) {
		album->clearAll();
	}
	parentTag = name;
}

void AlbumLoadScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void AlbumLoadScreen::mtxTagData(const char* data, int len) {
	if (!strcmp(parentTag.c_str(), xml_albumdone)) {
		album->clearAll();
	} else if(!strcmp(parentTag.c_str(), xml_albumname)) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), xml_albumid)) {
		temp += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	} else if (!strcmp(parentTag.c_str(), xml_hascards)) {
		hasCards += data;
	} else if (!strcmp(parentTag.c_str(), xml_updated)) {
		updated += data;
	} else if (!strcmp(parentTag.c_str(), xml_result)) {
		urlData += data;
	}
}

void AlbumLoadScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_album)) {
		notice->setCaption("");
		album->addAlbum(temp.c_str(), temp1, (hasCards=="true"), (updated=="1"));
		temp1 = "";
		temp = "";
		hasCards = "";
		updated = "";
	} else if (!strcmp(name, xml_albumdone)) {
		drawList();
		notice->setCaption("");
		if (path.size() == 0) {
			this->feed->getAlbum()->setAll(album->getAll().c_str());
			saveData(ALBUM, album->getAll().c_str());
		}
		else {
			char *file = new char[path.end()->length() + 5];
			sprintf(file, "%s%s%s", "a", path[path.size()-1].c_str(), ".sav");
			saveData(file, album->getAll().c_str());
			delete file;
		}
	} else if(!strcmp(name, xml_result)) {
		if(next!=NULL){
			delete next;
		}
		next = new NewVersionScreen(this, urlData, feed);
		next->show();
	} else if(!strcmp(name, xml_error)) {
		notice->setCaption(error_msg.c_str());
	} else {
		notice->setCaption("");
	}
}

void AlbumLoadScreen::mtxParseError() {
}

void AlbumLoadScreen::mtxEmptyTagEnd() {
}

void AlbumLoadScreen::mtxTagStartEnd() {
}
int AlbumLoadScreen::getCount() {
	return size;
}
