#include "OptionsScreen.h"
#include "TradeFriendDetailScreen.h"
#include "ShopCategoriesScreen.h"
#include "AuctionCreateScreen.h"
#include "AuctionListScreen.h"
#include "AlbumLoadScreen.h"
#include "AlbumViewScreen.h"
#include "GameDetailsScreen.h"
#include "NoteScreen.h"
#include "DetailScreen.h"
#include "Login.h"
#include "CompareScreen.h"
#include "GamePlayScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"
#include "../utils/Albums.h"

OptionsScreen::OptionsScreen(Feed *feed, int screenType, Screen *previous, Card *card, String number) :mHttp(this), previous(previous), feed(feed), card(card), screenType(screenType), number(number) {
	lprintfln("OptionsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	temp = "";
	temp1 = "";
	error_msg = "";

	connError = false;
	busy = false;

	menu = NULL;

	if (screenType == ST_LOGIN_OPTIONS) {
		layout = Util::createMainLayout("Select", "Exit");
	}
	else {
		layout = Util::createMainLayout("Select", "Back");
	}
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];

	switch(screenType) {
		case ST_TRADE_OPTIONS:
			lbl = Util::createSubLabel("Send card to auction");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Send card to friend");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_AUCTION_OPTIONS:
			lbl = Util::createSubLabel("My Auctions");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Create New Auction");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_PLAY_OPTIONS:
			checkForGames();
			this->setMain(layout);
			return;
		case ST_GAME_OPTIONS:
			lbl = Util::createSubLabel("Leave Game");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("View Game Details");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("View Game Log");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_NEW_GAME_OPTIONS:
			lbl = Util::createSubLabel("Play versus PC");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Play versus player");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_CARD_OPTIONS:
			lbl = Util::createSubLabel("Notes");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Share");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Auction");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Compare");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Details");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_NEW_CARD:
			lbl = Util::createSubLabel("Accept");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Reject");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_NUMBER_OPTIONS:
			lbl = Util::createSubLabel("Call");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("SMS");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
		case ST_LOGIN_OPTIONS:
			lbl = Util::createSubLabel("Log In");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Register");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
	}

	listBox->setSelectedIndex(0);

	this->setMain(layout);
}

OptionsScreen::~OptionsScreen() {
	temp = "";
	temp1 = "";
	error_msg = "";
	number="";

	delete layout;
	if(menu!=NULL){
		delete menu;
	}
}

void OptionsScreen::show() {
	if (listBox->getChildren().size() > listBox->getSelectedIndex()) {
		listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	}
	Screen::show();
}

void OptionsScreen::hide() {
    //listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void OptionsScreen::checkForGames() {
	connError = true;
	album = new Albums();

	notice->setCaption("Checking games...");
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create("http://dev.mytcg.net/_phone/?getusergames=1", HTTP_GET);

	if(res < 0) {
		notice->setCaption("Connection Error");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		mHttp.finish();
	}
}
#if defined(MA_PROF_SUPPORT_STYLUS)
void OptionsScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void OptionsScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void OptionsScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void OptionsScreen::locateItem(MAPoint2d point)
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
#endif
void OptionsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(Util::getFontBlue());
	} else {
		((Label *)widget)->setFont(Util::getFontBlack());
	}
}

void OptionsScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTLEFT:
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
						if (menu != NULL) {
							delete menu;
						}
						menu = new TradeFriendDetailScreen(this, feed, card);
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
					if(index == 0 && !connError) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_PLAY);
						menu->show();
					}
					else if (index == 1 && !connError) {
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
						menu = new GameDetailsScreen(feed, GameDetailsScreen::ST_GAME_DETAILS);
						menu->show();
					}
					else if (index == 2) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new GameDetailsScreen(feed, GameDetailsScreen::ST_GAME_LOG);
						menu->show();
					}
					break;
				case ST_NEW_GAME_OPTIONS:
					if (index == 0) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new GamePlayScreen(this, feed, true, number, "1");
						menu->show();
					}
					else if (index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new GamePlayScreen(this, feed, true, number, "2");
						menu->show();
					}
					break;
				case ST_CARD_OPTIONS:
					if (index == 0) {
						if (menu != NULL) {
							delete menu;
							menu = NULL;
						}
						menu = new NoteScreen(this, feed, card);
						menu->show();
					}
					else if (index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new TradeFriendDetailScreen(this, feed, card);
						menu->show();
					}
					else if (index == 2) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new AuctionCreateScreen(this, feed, card);
						menu->show();
					}
					else if (index == 3) {
						if (menu != NULL) {
							delete menu;
						}
						//menu = new DetailScreen(this, feed,
							//	DetailScreen::CARD, card);
						//menu = new CompareScreen(this, RES_LOADING_FLIP, feed, false, card);
						menu = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_COMPARE, NULL, false, card);
						menu->show();
					}
					else if (index == 4) {
						if (menu != NULL) {
							delete menu;
						}
						//menu = new CompareScreen(this, RES_LOADING_FLIP, feed, false, card);
						menu = new DetailScreen(this, feed,
								DetailScreen::CARD, card);
						menu->show();
					}
					break;
				case ST_NEW_CARD:
					if(index == 0 && !busy) {
						busy = true;
						notice->setCaption("Accepting...");
						acceptCard();
					}
					else if (index == 1 && !busy) {
						busy = true;
						notice->setCaption("Rejecting...");
						rejectCard();
					}
					break;
				case ST_NUMBER_OPTIONS:
					if(index == 0) {
						maPlatformRequest(("tel:"+number).c_str());
					}
					else if (index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new NoteScreen(this, feed,
								card, NoteScreen::ST_SMS, number);
						menu->show();
					}
					break;
				case ST_LOGIN_OPTIONS:
					if(index == 0) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new Login(this, feed, Login::S_LOGIN);
						menu->show();
					}
					else if(index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new Login(this, feed, Login::S_REGISTER);
						menu->show();
					}
					break;
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			switch(screenType) {
				case ST_LOGIN_OPTIONS:
					maExit(0);
					break;
				default:
					previous->show();
					break;
			}
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
	}
}

void OptionsScreen::acceptCard() {
	//work out how long the url will be
	int urlLength = strlen("http://dev.mytcg.net/_phone/?savecard=") + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s%s", "http://dev.mytcg.net/_phone/?savecard=", card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption("");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;
}

void OptionsScreen::rejectCard() {
	//work out how long the url will be
	int urlLength = strlen("http://dev.mytcg.net/_phone/?rejectcard=") + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s%s", "http://dev.mytcg.net/_phone/?rejectcard=", card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption("");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;
}
void OptionsScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		connError = false;
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		connError = true;
		mHttp.close();
		notice->setCaption("Unable to connect, try again later...");

		Util::updateSoftKeyLayout("", "Back", "", layout);
	}
}

void OptionsScreen::connReadFinished(Connection* conn, int result) {}

void OptionsScreen::xcConnError(int code) {
	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
}

void OptionsScreen::mtxEncoding(const char* ) {
}

void OptionsScreen::mtxTagStart(const char* name, int len) {
	if (!strcmp(name, "usercategories")) {
		album->clearAll();
	}
	parentTag = name;
}

void OptionsScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void OptionsScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "gamedescription")) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), "gameid")) {
		temp += data;
	} else if (!strcmp(parentTag.c_str(), "result")) {
		temp += data;
	}
}

void OptionsScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "gamedescription")) {
		album->addAlbum(temp.c_str(), temp1.c_str());
		temp1 = "";
		temp = "";
	} else if (!strcmp(name, "games")) {
		notice->setCaption("");
		if (album->size() > 0) {
			lbl = Util::createSubLabel("New Game");
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = Util::createSubLabel("Continue Game");
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
	} else if(!strcmp(name, "result")) {
		((AlbumViewScreen *)origAlbum)->refresh();
	}  else if(!strcmp(name, "error")) {
		notice->setCaption(error_msg.c_str());
	} else {
		notice->setCaption("");
	}
}

void OptionsScreen::mtxParseError() {
}

void OptionsScreen::mtxEmptyTagEnd() {
}

void OptionsScreen::mtxTagStartEnd() {
}
