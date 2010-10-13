
#include "AlbumLoadScreen.h"
#include "DetailScreen.h"
#include "ImageScreen.h"
#include "MenuScreen.h"
#include "MAHeaders.h"
#include "Logout.h"
#include "Util.h"

#include "MAP/MemoryMgr.h"

MenuScreen::MenuScreen(Feed *feed) : feed(feed) {
	c=0;
	menu = new Screen();
	if (feed->getTouchEnabled()) {
		mainLayout = createMainLayout(exit, "", true);
	} else {
		mainLayout = createMainLayout(exit, select, true);
	}
	listBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];
	label = createSubLabel(albumlbl);
	label->addWidgetListener(this);
	listBox->add(label);
	/*label = createSubLabel(shoplbl);
	label->addWidgetListener(this);
	listBox->add(label);
	label = createSubLabel(auctionlbl);
	label->addWidgetListener(this);
	listBox->add(label);
	label = createSubLabel(ballbl);
	label->addWidgetListener(this);
	listBox->add(label);*/
	label = createSubLabel(proflbl);
	label->addWidgetListener(this);
	listBox->add(label);
	label = createSubLabel(logout);
	label->addWidgetListener(this);
	listBox->add(label);
	this->setMain(mainLayout);

	listBox->setSelectedIndex(0);

	moved=0;
}

MenuScreen::~MenuScreen() {
}

void MenuScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void MenuScreen::pointerMoveEvent(MAPoint2d point)
{
	moved++;
    locateItem(point);
}

void MenuScreen::pointerReleaseEvent(MAPoint2d point)
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
	moved = 0;
}

void MenuScreen::locateItem(MAPoint2d point)
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


void MenuScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontGrey);
	}
}

void MenuScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			int index = listBox->getSelectedIndex();
			if(index == 0) {
				menu = new AlbumLoadScreen(this, feed);
				menu->show();
			} /*else if(index == 1) {
				delete menu;
				menu = new ImageScreen(this,RES_SOON,false,NULL);
				menu->show();
			} else if(index == 2) {
				delete menu;
				menu = new ImageScreen(this,RES_SOON,false,NULL);
				menu->show();
			} else if(index == 3) {
				delete menu;
				menu = new DetailScreen(this, feed, SHOWCREDIT);
				menu->show();
			} else */if(index == 1) {
				delete menu;
				menu = new DetailScreen(this, feed, SHOWUSER);
				menu->show();
			} else if (index == 2) {
				delete menu;
				menu = new Logout(this, feed);
				menu->show();
			}
			break;
		case MAK_SOFTLEFT:
			maExit(0);
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
	}
}
