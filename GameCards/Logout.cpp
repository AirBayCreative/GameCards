#include "Logout.h"
#include "Util.h"
#include "MAHeaders.h"
#include "Login.h"

using namespace MAUtil;

Logout::Logout(Screen *previous, Feed *feed) : previous(previous), feed(feed) {
	mainLayout = createMainLayout(logout, back);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	imge = new Image(0, 0, scrWidth-PADDING*2, listBox->getHeight(), listBox, false, false, resize(RES_LOGOUT, listBox->getHeight()-PADDING*2));
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
