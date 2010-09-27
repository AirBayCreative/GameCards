/*
 * MoTweet
 * Logout.cpp
 *
 * This screen is to confirm if the user is logging out of MoTweet.
 *
 * Done by Tay Yu Jie (0701038B) & Khairul Adlee (0704044G)
 */

#include "Header.h"
#include <MAUtil/Vector.h>
#include <MAUtil/String.h>

using namespace MAUtil;

Logout::Logout(Screen *previous, Feed *feed) : previous(previous), feed(feed) {
	mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 3);
	setPadding(mainLayout);
	mainLayout->setSkin(gSkinBack);

	Widget *softKeys = createSoftKeyBar(48, logout, back);

	Image *head = new Image(0, 0, scrWidth,  scrHeight/6, NULL, false, false, RES_IMAGE);
	head->setSkin(gSkinBack);

	int height = scrHeight-(head->getHeight()+softKeys->getHeight());
	mainLayout->add(head);
	imge = new Image(0, 0, scrWidth-PADDING*2, height, mainLayout, false, false, resize(RES_LOGOUT, height-PADDING*2));
	imge->setSkin(gSkinBack);
	mainLayout->add(softKeys);
	this->setMain(mainLayout);
}

Logout::~Logout() {
}

void Logout::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void Logout::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void Logout::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void Logout::locateItem(MAPoint2d point)
{
	list = false;
	left = false;
	right = false;

    Point p;
    p.set(point.x, point.y);
    for(int i = 0; i < (this->getMain()->getChildren()[2]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[2]->getChildren()[i]->contains(p))
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

void Logout::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}

void Logout::show() {
	Screen::show();
}

void Logout::hide() {
	Screen::hide();
}

void Logout::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			// Go back to menu screen
			previous->show();
			break;
		case MAK_SOFTLEFT:
			// Clear user settings and redirect to login screen
			cleanup();
			break;
		case MAK_UP:
			break;
		case MAK_DOWN:
			break;
	}
}

void Logout::cleanup() {
	Albums *albums = feed->getAlbum();
	Vector<String> tmp = albums->getIDs();
	for (Vector<String>::iterator itr = tmp.begin(); itr != tmp.end(); itr++) {
		String s = itr->c_str();
		s+="-lst.sav";
		saveData(s.c_str(),blank);
	}
	feed->setAll(blank);
	saveData(FEED,blank);
	saveData(ALBUM,blank);

	previous = new Login(feed);
	previous->show();
}
