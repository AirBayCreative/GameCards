#include <conprint.h>

#include "AlbumLoadScreen.h"
#include "AlbumViewScreen.h"
#include "../utils/Util.h"

void AlbumLoadScreen::refresh() {
	show();
	mHttp = HttpConnection(this);
	int res = mHttp.create(ALBUMS.c_str(), HTTP_GET);

	if(res < 0) {

	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
}

AlbumLoadScreen::AlbumLoadScreen(Screen *previous, Feed *feed) : mHttp(this), previous(previous), feed(feed) {
	size = 0;
	moved = 0;
	labelList = NULL;

	next = new Screen();
	if (feed->getTouchEnabled()) {
		mainLayout = createMainLayout(back, "", true);
	} else {
		mainLayout = createMainLayout(back, select, true);
	}

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	album = this->feed->getAlbum();
	drawList();
	int res = mHttp.create(ALBUMS.c_str(), HTTP_GET);

	if(res < 0) {

	} else {
		notice->setCaption(checking_albums);

		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	this->setMain(mainLayout);

	orig = this;
}

AlbumLoadScreen::~AlbumLoadScreen() {
	//mainLayout->getChildren().clear();
	//listBox->getChildren().clear();

	//delete listBox;
	delete mainLayout;
	/*if (image != NULL) {
		delete image;
		image = NULL;
	}
	if (softKeys != NULL) {
		softKeys->getChildren().clear();
		delete softKeys;
		softKeys = NULL;
	}*/
	//delete label;
	//delete notice;
	delete next;
	delete [] labelList;
	parentTag="";
	temp="";
	temp1="";
	error_msg="";
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

void AlbumLoadScreen::clearLabelPointers() {
	for (int i = 0; i < size; i++) {
		if (labelList[i] != NULL) {
			delete labelList[i];
			labelList[i] = NULL;
		}
	}
	if (labelList != NULL) {
		delete [] labelList;
	}
}

void AlbumLoadScreen::drawList() {
	empt = false;
	listBox->getChildren().clear();

	clearLabelPointers();

	labelList = new Label*[album->size()];
	Vector<String> display = album->getNames();
	size = 0;
	for(Vector<String>::iterator itr = display.begin(); itr != display.end(); itr++) {
		label = createSubLabel(itr->c_str());
		label->addWidgetListener(this);
		listBox->add(label);

		labelList[size] = label;
		size++;
	}

	if (album->size() >= 1) {
		listBox->setSelectedIndex(0);
	} else {
		empt = true;
		label = createSubLabel(empty);
		label->addWidgetListener(this);
		listBox->add(label);

		labelList[size] = label;
		size++;
	}
}

void AlbumLoadScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontGrey);
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
			previous->show();
			break;
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			if (!empt) {
				String val= (album->getId(((Label *)listBox->getChildren()[listBox->getSelectedIndex()])->getCaption()));
				if (next != NULL) {
					delete next;
				}
				next = new AlbumViewScreen(this, feed, val);
				next->show();
			}
			break;
	}
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
	}
}

void AlbumLoadScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_albumname)) {
		notice->setCaption("");
		album->addAlbum(temp1.c_str(), temp.c_str());
		temp1 = "";
		temp = "";
	} else if (!strcmp(name, xml_albumdone)) {
		notice->setCaption("");
		drawList();
		saveData(ALBUM, album->getAll().c_str());
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
