#include "Header.h"
#include "Util.h"
#include <madmath.h>

MenuScreen::MenuScreen(Feed *feed) : feed(feed) {
	layout = createMainLayout(exit, select);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];

	lbl = createSubLabel(albumlbl);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = createSubLabel(shoplbl);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = createSubLabel(auctionlbl);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = createSubLabel(ballbl);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = createSubLabel(proflbl);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = createSubLabel(logout);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	listBox->setSelectedIndex(0);

	this->setMain(layout);
}

MenuScreen::~MenuScreen() {
}
void MenuScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void MenuScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void MenuScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void MenuScreen::locateItem(MAPoint2d point)
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
			index = listBox->getSelectedIndex();
			if(index == 0) {
				menu = new AlbumLoadScreen(this, feed);
				menu->show();
			} else if(index == 1) {
				menu = new ImageScreen(this,RES_SOON,RES_SOON,false,NULL,false,NULL);
				menu->show();
			} else if(index == 2) {
				menu = new ImageScreen(this,RES_SOON,RES_SOON,false,NULL,false,NULL);
				menu->show();
			} else if(index == 3) {
				menu = new CreditScreen(this, feed);
				menu->show();
			} else if(index == 4) {
				menu = new ProfileScreen(this, feed);
				menu->show();
			} else if (index == 5) {
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
