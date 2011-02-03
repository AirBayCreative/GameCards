#include "TradeOptionsScreen.h"
#include "TradeFriendMethodScreen.h"
#include "TradeFriendDetailScreen.h"
#include "ShopCategoriesScreen.h"
#include "AuctionCreateScreen.h"
#include "AuctionListScreen.h"
#include "AlbumLoadScreen.h"
#include "GameDetailsScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"
#include "../utils/Albums.h"

TradeOptionsScreen::TradeOptionsScreen(Screen *previous, Feed *feed, int screenType, Card *card) :mHttp(this), previous(previous), feed(feed), card(card), screenType(screenType) {
	temp = "";
	temp1 = "";
	error_msg = "";

	menu = new Screen();
	layout = createMainLayout(back, select);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];

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
		case ST_PLAY_OPTIONS:
			/*lbl = createSubLabel(new_game);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(existing_game);
			lbl->addWidgetListener(this);
			listBox->add(lbl);*/
			checkForGames();
			this->setMain(layout);
			return;
			//break;
		case ST_GAME_OPTIONS:
			lbl = createSubLabel(leave_game);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(view_details);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
	}

	listBox->setSelectedIndex(0);

	this->setMain(layout);
}

TradeOptionsScreen::~TradeOptionsScreen() {
	temp = "";
	temp1 = "";
	error_msg = "";

	delete layout;
	delete menu;
}

void TradeOptionsScreen::checkForGames() {
	album = new Albums();

	notice->setCaption(checking_games);
	int res = mHttp.create(LISTGAMES.c_str(), HTTP_GET);

	if(res < 0) {
		notice->setCaption("Connection Error");
	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
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
				case ST_PLAY_OPTIONS:
					if(index == 0) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_PLAY);
						menu->show();
					}
					else if (index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_GAMES, album);
						menu->show();
					}
					break;
				case ST_GAME_OPTIONS:
					if(index == 0) {
						origMenu->show();
					}
					else if (index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new GameDetailsScreen(feed);
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

void TradeOptionsScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption("");
	}
}

void TradeOptionsScreen::connReadFinished(Connection* conn, int result) {}

void TradeOptionsScreen::xcConnError(int code) {
	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
}

void TradeOptionsScreen::mtxEncoding(const char* ) {
}

void TradeOptionsScreen::mtxTagStart(const char* name, int len) {
	if (!strcmp(name, xml_albumdone)) {
		album->clearAll();
	}
	parentTag = name;
}

void TradeOptionsScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void TradeOptionsScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), xml_game_description)) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), xml_game_id)) {
		temp += data;
	}
}

void TradeOptionsScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_game_description)) {
		album->addAlbum(temp1.c_str(), temp.c_str());
		temp1 = "";
		temp = "";
	} else if (!strcmp(name, xml_games)) {
		notice->setCaption("");
		if (album->size() > 0) {
			lbl = createSubLabel(new_game);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(existing_game);
			lbl->addWidgetListener(this);
			listBox->add(lbl);

			listBox->setSelectedIndex(0);
		}
		else {
			if (menu != NULL) {
				delete menu;
			}
			menu = new AlbumLoadScreen(previous, feed, AlbumLoadScreen::ST_PLAY);
			menu->show();
		}
	} else if(!strcmp(name, xml_error)) {
		notice->setCaption(error_msg.c_str());
	} else {
		notice->setCaption("");
	}
}

void TradeOptionsScreen::mtxParseError() {
}

void TradeOptionsScreen::mtxEmptyTagEnd() {
}

void TradeOptionsScreen::mtxTagStartEnd() {
}
