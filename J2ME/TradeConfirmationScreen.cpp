#include "Header.h"
#include "TradeConfirmationScreen.h"
#include <madmath.h>

TradeConfirmationScreen::TradeConfirmationScreen(Screen *previous, Feed *feed, Card card, String method, String friendDetail)
		:previous(previous), feed(feed), card(card), method(method), friendDetail(friendDetail) {
	layout = createMainLayout(back, confirm);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];

	String confirmLabel = "Are you sure you want to send your " + card.getText() + " to your friend with " + method + " " + friendDetail;

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, gFontGrey);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);

	this->setMain(layout);
}

TradeConfirmationScreen::~TradeConfirmationScreen() {
}

void TradeConfirmationScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeConfirmationScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeConfirmationScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void TradeConfirmationScreen::locateItem(MAPoint2d point)
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

void TradeConfirmationScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_SOFTRIGHT:
			//menu = new TradeFriendMethodScreen(this, feed, card);
			//menu->show();
			break;
		case MAK_SOFTLEFT:
			previous->show();
			break;
	}
}
