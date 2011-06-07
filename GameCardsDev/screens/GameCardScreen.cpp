#include <conprint.h>
#include <madmath.h>
#include <MAUI/Image.h>

#include "../utils/Util.h"
#include "../utils/MAHeaders.h"

#include "GameCardScreen.h"

GameCardScreen::GameCardScreen(Screen *previous, Feed *feed, int screenType)
	: mHttp(this), previous(previous), feed(feed), screenType(screenType) {

	moved=0;
}

GameCardScreen::~GameCardScreen() {

}

void GameCardScreen::keyPressEvent(int keyCode) {

}

#if defined(MA_PROF_SUPPORT_STYLUS)
void GameCardScreen::pointerPressEvent(MAPoint2d point)
{
	locateItem(point);
}

void GameCardScreen::pointerMoveEvent(MAPoint2d point)
{
	//locateItem(point);
	moved++;
}

void GameCardScreen::pointerReleaseEvent(MAPoint2d point)
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

void GameCardScreen::locateItem(MAPoint2d point)
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
			((ListBox *)this->getMain()->getChildren()[0]->getChildren()[2])->setSelectedIndex(i);
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
#endif

void GameCardScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
	}
}

void GameCardScreen::connReadFinished(Connection* conn, int result) {}

void GameCardScreen::xcConnError(int code) {
}

void GameCardScreen::mtxEncoding(const char* ) {
}

void GameCardScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void GameCardScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void GameCardScreen::mtxTagData(const char* data, int len) {

}

void GameCardScreen::mtxTagEnd(const char* name, int len) {

}

void GameCardScreen::mtxParseError(int offSet) {
}

void GameCardScreen::mtxEmptyTagEnd() {
}

void GameCardScreen::mtxTagStartEnd() {
}
