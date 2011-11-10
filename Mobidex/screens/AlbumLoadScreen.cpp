#include <conprint.h>
#include <mastdlib.h>

#include "AlbumLoadScreen.h"
#include "AlbumViewScreen.h"
#include "SearchScreen.h"
#include "DetailScreen.h"
#include "../utils/Util.h"
#include "../utils/Albums.h"
#include "../utils/Album.h"

void AlbumLoadScreen::refresh() {
	show();
	path.clear();
	notice->setCaption("Checking for new albums...");
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int urlLength = 52+URLSIZE + feed->getSeconds().length();
	char* url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s?usercategories=1&seconds=%s", URL, feed->getSeconds().c_str());
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		hasConnection = false;
		notice->setCaption("");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();
	}
	delete url;
}

AlbumLoadScreen::AlbumLoadScreen(Feed *feed, Albums *al) : mHttp(this), feed(feed) {
	lprintfln("AlbumLoadScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	size = 0;
	moved = 0;
	collapsed = false;
	int res = -1;
	char *url = NULL;
	int urlLength = 0;
	first = 1;

	hasCards = "";
	temp = "";
	temp1 = "";
	updated = "0";

	next = NULL;
	mainLayout = Util::createMainLayout("", "Exit", true);

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	album = new Albums();

	if (al == NULL) {
		album->setAll(this->feed->getAlbum()->getAll().c_str());
	}
	else {
		album = al;
	}

	notice->setCaption("Checking for new albums...");
	drawList();
	urlLength = 60 + URLSIZE + feed->getSeconds().length();
	url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s?usercategories=1&seconds=%s", URL, feed->getSeconds().c_str());
	res = mHttp.create(url, HTTP_GET);

	if(res < 0) {
		hasConnection = false;
		notice->setCaption("");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
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
		feed->remHttp();
	}
	parentTag="";
	notedate="";
	temp="";
	temp1="";
	error_msg="";
	hasCards="";
	updated="";

	delete album;
	album = NULL;
}

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
			keyPressEvent(MAK_SOFTLEFT);
		} else if (mid) {
			keyPressEvent(MAK_FIRE);
		}
	}
	moved=0;
}

void AlbumLoadScreen::locateItem(MAPoint2d point)
{
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

void AlbumLoadScreen::drawList() {
	empt = false;
	int index = listBox->getSelectedIndex();
	clearListBox();

	Vector<String> display = album->getNames();
	size = 0;

	if (path.size() == 0) {
		label = Util::createSubLabel("Search Cards");
		label->setPaddingBottom(5);
		label->setPaddingLeft(5);
		label->addWidgetListener(this);
		listBox->add(label);
		size++;
	}

	int count = 0;
	bool dirc = false;
	for(Vector<String>::iterator itr = display.begin(); itr != display.end(); itr++) {
		label = Util::createSubLabel(itr->c_str());
		label->setPaddingBottom(5);
		label->setPaddingLeft(5);
		if (dirc) {
			label->setPaddingLeft(20);
		} else {
			label->addWidgetListener(this);
		}
		if (label->getCaption() == "My Cards") {
			delete label;
			if (!collapsed) {
				label = Util::createSubLabel("- My Directories");
				label->setPaddingBottom(5);
				label->setPaddingLeft(5);
				listBox->add(label);
				size++;
				label = Util::createSubLabel(itr->c_str());
				label->setPaddingBottom(5);
				label->setPaddingLeft(20);
				label->addWidgetListener(this);
				dirc = true;
			} else {
				label = Util::createSubLabel("+ My Directories");
				label->setPaddingBottom(5);
				label->setPaddingLeft(5);
				listBox->add(label);
				size++;
				dirc = true;
			}
		} else {
			label->addWidgetListener(this);
		}
		if ((!collapsed)||(!dirc)) {
			listBox->add(label);
			size++;
		}
		count++;
	}

	if (album->size() == 0) {
		empt = true;
		label = Util::createSubLabel("Empty");
		label->setPaddingBottom(5);
		label->setPaddingLeft(5);
		label->addWidgetListener(this);
		listBox->add(label);

		size++;
	}

	//add the Notifications option
	if(feed->getNoteLoaded()){
		noteLabel = Util::createSubLabel("*Notifications");
	}else{
		noteLabel = Util::createSubLabel("Notifications");
	}
	noteLabel->setPaddingBottom(5);
	noteLabel->setPaddingLeft(5);
	noteLabel->addWidgetListener(this);
	listBox->add(noteLabel);
	size++;

	//add the logout option
	label = Util::createSubLabel("Log Out");
	label->setPaddingBottom(5);
	label->setPaddingLeft(5);
	label->addWidgetListener(this);
	listBox->add(label);
	size++;

	if (index < size) {
		listBox->setSelectedIndex(index);
	} else {
		listBox->setSelectedIndex(index);
	}
	display.clear();
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
		((Label *)widget)->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget)->setFont(Util::getDefaultFont());
	}
}

void AlbumLoadScreen::show() {
	shown = true;
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void AlbumLoadScreen::hide() {
	shown = false;
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
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			if (path.size() > 0) {
				path.remove(path.size()-1);
				loadCategory();
			}
			else {
				if (feed->getHttps() > 0) {
					notice->setCaption("Please wait for all connections to finish before exiting. Try again in a few seconds.");
				} else {
					maExit(0);
				}
			}
			break;
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			if (((((Label *)listBox->getChildren()[listBox->getSelectedIndex()])->getCaption()) == "- My Directories")||((((Label *)listBox->getChildren()[listBox->getSelectedIndex()])->getCaption()) == "+ My Directories")) {
				collapsed = !collapsed;
				drawList();
				break;
			}

			if (path.size() == 0 && listBox->getSelectedIndex() == (0)) {
				if (next != NULL) {
					feed->remHttp();
					delete next;
					next = NULL;
				}
				next = new SearchScreen(feed, this);
				next->show();
			}
			else if (listBox->getSelectedIndex() == (size-2)) {
				if(next!=NULL){
					feed->remHttp();
					delete next;
					next = NULL;
				}
				next = new DetailScreen(this, feed, DetailScreen::NOTIFICATIONS, NULL);
				next->show();
			}
			else if (listBox->getSelectedIndex() == (size-1)) {
				if (feed->getHttps() > 0) {
					notice->setCaption("Please wait for all connections to finish before exiting. Try again in a few seconds.");
				} else {
					cleanup();
				}
			}
			else if (!empt) {
				Album* val = (album->getAlbum(((Label *)listBox->getChildren()[listBox->getSelectedIndex()])->getCaption()));
				if (next != NULL) {
					feed->remHttp();
					delete next;
					next = NULL;
				}
				if (val->getHasCards()) {
					if (strcmp(val->getId().c_str(), "-1") == 0) {
						next = new AlbumViewScreen(this, feed, val->getId(), Util::AT_SHARE);
						next->show();
					} else if (strcmp(val->getId().c_str(), "-2") == 0) {
						next = new AlbumViewScreen(this, feed, val->getId(), Util::AT_NEW_CARDS);
						next->show();
					}
					else {
						next = new AlbumViewScreen(this, feed, val->getId());
						next->show();
					}
				}
				else {
					path.add(val->getId());
					loadCategory();
				}
				break;
			}
			break;
	}
}

void AlbumLoadScreen::loadCategory() {
	Util::updateSoftKeyLayout(path.size() == 0?"Exit":"Back", "", "", mainLayout);
	album->clearAll();
	clearListBox();
	notice->setCaption("Checking for new albums...");
	if (path.size() == 0) {
		album->setAll(this->feed->getAlbum()->getAll().c_str());
	}
	else {
		char *file = new char[path[path.size()-1].length() + 6];
		memset(file, 0, path[path.size()-1].length() + 6);
		sprintf(file, "a%s.sav", path[path.size()-1].c_str());
		String filecards = "";
		Util::getData(file, filecards);
		album->setAll(filecards.c_str());
		filecards = "";
		delete file;
	}
	drawList();
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
			urlLength = 60 + URLSIZE + feed->getSeconds().length();
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s?usercategories=1&seconds=%s", URL, feed->getSeconds().c_str());
			res = mHttp.create(url, HTTP_GET);
		}
		else {
			//work out how long the url will be, the 4 is for the & and = symbols
			urlLength = 70 + URLSIZE + path[path.size()-1].length() + feed->getSeconds().length();
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s?usersubcategories=1&category=%s&seconds=%s", URL, path[path.size()-1].c_str(), feed->getSeconds().c_str());
			res = mHttp.create(url, HTTP_GET);
		}

		if(res < 0) {
			notice->setCaption("");
		} else {
			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();
		}

		if (url != NULL) {
			delete url;
			url = NULL;
		}
	}
}

void AlbumLoadScreen::cleanup() {
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

	maExit(0);
}

void AlbumLoadScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption("");
		feed->remHttp();
	}
}

void AlbumLoadScreen::connReadFinished(Connection* conn, int result) {}

void AlbumLoadScreen::xcConnError(int code) {
	feed->remHttp();

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
			//feed->addHttp();
			mHttp.finish();
		}
		delete [] url;
		feed->setNoteLoaded(true);
	} else {
		feed->setNoteLoaded(false);
	}
}

void AlbumLoadScreen::mtxEncoding(const char* ) {
}

void AlbumLoadScreen::mtxTagStart(const char* name, int len) {
	if (!strcmp(name, "usercategories") || !strcmp(name, "categories")) {
		album->clearAll();
	}
	parentTag = name;
}

void AlbumLoadScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void AlbumLoadScreen::mtxTagData(const char* data, int len) {
	if (!strcmp(parentTag.c_str(), "usercategories")) {
		album->clearAll();
	} else if(!strcmp(parentTag.c_str(), "albumname")) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), "albumid")) {
		temp += data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg += data;
	} else if (!strcmp(parentTag.c_str(), "hascards")) {
		hasCards += data;
	} else if (!strcmp(parentTag.c_str(), "updated")) {
		updated += data;
	} else if(!strcmp(parentTag.c_str(), "notedate")) {
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
		if(ndate > atoi(feed->getNoteSeconds().c_str())) {
			feed->setNoteLoaded(true);
			int seconds = maLocalTime();
			int secondsLength = Util::intlen(seconds);
			char *secString = new char[secondsLength+1];
			memset(secString,'\0',secondsLength+1);
			sprintf(secString, "%d", seconds);
			feed->setNoteSeconds(secString);
			Util::saveData("fd.sav", feed->getAll().c_str());

			noteLabel->setCaption("*Notifications");
			noteLabel->setFont(Util::getDefaultSelected());

			if(first==1){
				first = 0;
				feed->remHttp();

				if (shown) {
					if(next!=NULL){
						delete next;
					}
					next = new DetailScreen(this, feed, DetailScreen::NOTIFICATIONS, NULL);
					next->show();
				}
			}
		}
	}
}

void AlbumLoadScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "album")) {
		notice->setCaption("");
		album->addAlbum(temp.c_str(), temp1, (hasCards=="true"), (updated=="1"));
		temp1 = "";
		temp = "";
		hasCards = "";
		updated = "";
	} else if (!strcmp(name, "usercategories")) {
		drawList();
		notice->setCaption("");
		if (path.size() == 0) {
			this->feed->getAlbum()->setAll(album->getAll().c_str());
			Util::saveData("lb.sav", album->getAll().c_str());
		}
		else {
			char *file = new char[path.end()->length() + 5];
			sprintf(file, "%s%s%s", "a", path[path.size()-1].c_str(), ".sav");
			Util::saveData(file, album->getAll().c_str());
			delete file;
		}
	} else if(!strcmp(name, "error")) {
		notice->setCaption(error_msg.c_str());
	} else {
		notice->setCaption("");
	}
}

void AlbumLoadScreen::mtxParseError(int) {
}

void AlbumLoadScreen::mtxEmptyTagEnd() {
}

void AlbumLoadScreen::mtxTagStartEnd() {
}
int AlbumLoadScreen::getCount() {
	return size;
}
