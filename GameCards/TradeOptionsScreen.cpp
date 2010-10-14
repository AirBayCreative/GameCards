#include "TradeOptionsScreen.h"
#include "TradeFriendDetailScreen.h"
#include "TradeConfirmationScreen.h"
#include "Util.h"
#include "MAHeaders.h"
#include "ImageScreen.h"

TradeOptionsScreen::TradeOptionsScreen(Screen *previous, Feed *feed, Card *card) :previous(previous), feed(feed), card(card) {
	menu = new Screen();
	layout = createMainLayout(back, select);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];
	lbl = createSubLabel(sendToFriendlbl);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	lbl = createSubLabel(redeemlbl);
	lbl->addWidgetListener(this);
	listBox->add(lbl);
	listBox->setSelectedIndex(0);

	this->setMain(layout);
}

TradeOptionsScreen::~TradeOptionsScreen() {
	layout->getChildren().clear();
	listBox->getChildren().clear();
	softKeys->getChildren().clear();
	delete listBox;
	delete layout;
	if (image != NULL) {
		delete image;
		image = NULL;
	}
	if (softKeys != NULL) {
		delete softKeys;
		softKeys = NULL;
	}
	delete lbl;
	delete menu;
}
void TradeOptionsScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeOptionsScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeOptionsScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void TradeOptionsScreen::locateItem(MAPoint2d point)
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

void TradeOptionsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontWhite);
	}
}

void TradeOptionsScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			index = listBox->getSelectedIndex();
			if (index == 0) {
				//the users will eventually have the ability to decide how to identify their friends. Until then we will default to phone number
				//menu = new TradeFriendMethodScreen(this, feed, card);
				//menu->show();

				//this is just temporary. The full solution is the commented one above.
				if (menu != NULL) {
					delete menu;
				}
				menu = new TradeFriendDetailScreen(this, feed, card);
				menu->show();
			} else if (index == 1) {
				String message = sure_you_want_to_redeem + card->getText() + " " + voucherlbl + "?";
				if (menu != NULL) {
					delete menu;
				}
				menu = new TradeConfirmationScreen(this, feed, card, message, "Vendor&sms=No");
				menu->show();
			}
			break;
		case MAK_SOFTLEFT:
			previous->show();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
	}
}
