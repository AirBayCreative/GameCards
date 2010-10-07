#include "TradeFriendMethodScreen.h"
#include <madmath.h>

TradeFriendMethodScreen::TradeFriendMethodScreen(Screen *previous, Feed *feed, Card card) :previous(previous), feed(feed), card(card) {
	layout = createMainLayout(back, select);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, selectFriendBy, 0, gFontGrey);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	listBox->add(lbl);
	lbl = createSubLabel(userlblNoColon);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = createSubLabel(emaillblNoColon);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = createSubLabel(phoneNumlbl);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	listBox->setSelectedIndex(1);

	this->setMain(layout);
}

TradeFriendMethodScreen::~TradeFriendMethodScreen() {
}
void TradeFriendMethodScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeFriendMethodScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeFriendMethodScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void TradeFriendMethodScreen::locateItem(MAPoint2d point)
{
	list = false;
	left = false;
	right = false;

    Point p;
    p.set(point.x, point.y);
    for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
    {
        if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p) && i > 0)
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


void TradeFriendMethodScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontGrey);
	}
}

void TradeFriendMethodScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			index = listBox->getSelectedIndex();
			if (index == 0) {
				listBox->setSelectedIndex(1);
			}
			else {
				if(index == 1) {
					menu = new TradeFriendDetailScreen(this, feed, card, userlblNoColon);
				} else if(index == 2) {
					menu = new TradeFriendDetailScreen(this, feed, card, emaillblNoColon);
				} else if(index == 3) {
					menu = new TradeFriendDetailScreen(this, feed, card, phoneNumlbl);
				}
				menu->show();
			}
			break;
		case MAK_SOFTLEFT:
			//maExit(0);
			previous->show();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_UP:
			if (listBox->getSelectedIndex() > 1)
				listBox->selectPreviousItem();
			break;
	}
}
