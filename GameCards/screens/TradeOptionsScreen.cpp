#include "TradeOptionsScreen.h"
#include "TradeFriendMethodScreen.h"
#include "TradeFriendDetailScreen.h"
#include "ShopCategoriesScreen.h"
#include "AuctionCreateScreen.h"
#include "AuctionListScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"

TradeOptionsScreen::TradeOptionsScreen(Screen *previous, Feed *feed, Card *card, int screenType) :previous(previous), feed(feed), card(card), screenType(screenType) {
	menu = new Screen();
	layout = createMainLayout(back, select);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];

	switch(screenType) {
		case ST_TRADE_OPTIONS:
			lbl = createSubLabel(sendToAuctionlbl);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(sendToFriendlbl);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_AUCTION_OPTIONS:
			lbl = createSubLabel(all_auctions);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(my_auctions);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
	}

	listBox->setSelectedIndex(0);

	this->setMain(layout);
}

TradeOptionsScreen::~TradeOptionsScreen() {
	layout->getChildren().clear();
	listBox->getChildren().clear();
	delete listBox;
	delete layout;
	if (softKeys != NULL) {
		softKeys->getChildren().clear();
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
			switch(screenType) {
				case ST_TRADE_OPTIONS:
					if(index == 0) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new AuctionCreateScreen(this, feed, card);
						menu->show();
					} else if(index == 1) {
						//the users will eventually have the ability to decide how to identify their friends. Until then we will default to phone number
						//menu = new TradeFriendMethodScreen(this, feed, card);
						//menu->show();

						//this is just temporary. The full solution is the commented one above.
						if (menu != NULL) {
							delete menu;
						}
						menu = new TradeFriendDetailScreen(this, feed, card, phoneNumlbl);
						menu->show();
					}
					break;
				case ST_AUCTION_OPTIONS:
					if(index == 0) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_AUCTIONS);
						menu->show();
					}
					else if (index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new AuctionListScreen(this, feed, AuctionListScreen::ST_USER);
						menu->show();
					}
					break;
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
