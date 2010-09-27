#include "Header.h"
#include <mastdlib.h>


AlbumLoadScreen::AlbumLoadScreen(Screen *previous, Feed *feed) : mHttp(this), previous(previous), feed(feed) {
	Layout *mainLayout = createMainLayout(back,blank);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	userNotice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	userNotice->setCaption(checking_albums);
	album = this->feed->getAlbum();
	drawList();
	int res = mHttp.create(ALBUMS.c_str(), HTTP_GET);
	mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
	mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
	if(res < 0) {

	} else {
		mHttp.finish();
	}
	this->setMain(mainLayout);
}
void AlbumLoadScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void AlbumLoadScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void AlbumLoadScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void AlbumLoadScreen::locateItem(MAPoint2d point)
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
        	((ListBox *)this->getMain()->getChildren()[0]->getChildren()[2])->setSelectedIndex(i);
        	list = true;
            return;
        }
    }
    for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
			if (i == 0) {
				left = true;
			} else if (i == 2) {
				right = true;
			}
			return;
		}
	}
}

void AlbumLoadScreen::drawList() {
	empt = false;
	listBox->getChildren().clear();
	Vector<String> display = album->getNames();
	Label *lbl;
	for(Vector<String>::iterator itr = display.begin(); itr != display.end(); itr++) {
		lbl = createSubLabel(itr->c_str());
		lbl->addWidgetListener(this);
		listBox->add(lbl);
	}

	if (album->size() >= 1) {
		listBox->setSelectedIndex(0);
	} else {
		empt = true;
		lbl = createSubLabel(empty);
		lbl->addWidgetListener(this);
		listBox->add(lbl);
	}

}

AlbumLoadScreen::~AlbumLoadScreen() {
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
	int selected = listBox->getSelectedIndex();
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
			if (!empt) {
				//next = new AlbumViewScreen(this, feed, );
				String val= (album->getId(((Label *)listBox->getChildren()[listBox->getSelectedIndex()])->getCaption()));

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
		userNotice->setCaption(blank);
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
		userNotice->setCaption(blank);
		album->addAlbum(temp1.c_str(), temp.c_str());
		temp1 = blank;
		temp = blank;
	} else if (!strcmp(name, xml_albumdone)) {
		userNotice->setCaption(blank);
		drawList();
		saveData(ALBUM, album->getAll().c_str());
	} else if(!strcmp(name, xml_error)) {
		userNotice->setCaption(error_msg.c_str());
	} else {
		userNotice->setCaption(blank);
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
