#include <conprint.h>
#include <madmath.h>
#include <MAUI/Image.h>

#include "../utils/Util.h"

#include "GameCardScreen.h"

GameCardScreen::GameCardScreen(MainScreen *previous, Feed *feed, int screenType)
	: mHttp(this), screenType(screenType) {
	this->previous = previous;
	this->feed = feed;
	moved=0;
}
void GameCardScreen::clearListBox() {
	Vector<Widget*> tempWidgets;
	for (int i = 0; i < kinListBox->getChildren().size(); i++) {
		tempWidgets.add(kinListBox->getChildren()[i]);
	}
	kinListBox->clear();
	kinListBox->getChildren().clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
}

GameCardScreen::~GameCardScreen() {

}

void GameCardScreen::keyPressEvent(int keyCode) {

}

void GameCardScreen::pointerPressEvent(MAPoint2d point)
{
	//locateItem(point);
}

void GameCardScreen::pointerMoveEvent(MAPoint2d point)
{
	//locateItem(point);
	//moved++;
}

void GameCardScreen::pointerReleaseEvent(MAPoint2d point)
{
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

void GameCardScreen::locateItem(MAPoint2d point)
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

void GameCardScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		feed->remHttp();
	}
}

void GameCardScreen::connReadFinished(Connection* conn, int result) {}

void GameCardScreen::xcConnError(int code) {
	feed->remHttp();
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

void GameCardScreen::mtxParseError(int) {
}

void GameCardScreen::mtxEmptyTagEnd() {
}

void GameCardScreen::mtxTagStartEnd() {
}
