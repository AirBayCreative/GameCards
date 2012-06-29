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
#include "../utils/Albums.h"
#include "../UI/Button.h"

OptionsScreen::OptionsScreen(Feed *feed, int screenType, MainScreen *previous, Card *card, String number, String deckId) :mHttp(this),
card(card), screenType(screenType), number(number), deckId(deckId) {
	lprintfln("OptionsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	this->feed = feed;
	temp = "";
	temp1 = "";
	error_msg = "";

	moved = 0;

	connError = false;
	busy = false;

	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	menu = NULL;

	next = NULL;
	album = NULL;
	if (screenType == ST_LOGIN_OPTIONS) {
		mainLayout = Util::createMainLayout("", "Exit", "", true);
	}
	else {
		mainLayout = Util::createMainLayout("", "Back", "", true);
	}
	kinListBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	switch(screenType) {
		case ST_TRADE_OPTIONS:
			label = Util::createSubLabel("Send card to auction");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("Send card to friend");
			label->addWidgetListener(this);
			kinListBox->add(label);
			break;
		case ST_AUCTION_OPTIONS:
			label = Util::createSubLabel("My Auctions");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("Create New Auction");
			label->addWidgetListener(this);
			kinListBox->add(label);
			break;
		case ST_PLAY_OPTIONS:
			checkForGames();
			this->setMain(mainLayout);
			return;
		case ST_GAME_OPTIONS:
			label = Util::createSubLabel("Leave Game");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("View Game Log");
			label->addWidgetListener(this);
			kinListBox->add(label);
			break;
		case ST_NEW_GAME_OPTIONS:
			label = Util::createSubLabel("Play versus PC");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("Play Quick Match");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("Play versus friend");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("Game Lobby");
			label->addWidgetListener(this);
			kinListBox->add(label);
			break;
		case ST_CARD_OPTIONS:
			label = Util::createSubLabel("Notes");
			label->addWidgetListener(this);
			kinListBox->add(label);
			//label = Util::createSubLabel("Share");
			//label->addWidgetListener(this);
			//kinListBox->add(label);
			label = Util::createSubLabel("Auction");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("Compare");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("Details");
			label->addWidgetListener(this);
			kinListBox->add(label);
			break;
		case ST_NEW_CARD:
			label = Util::createSubLabel("Accept");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("Reject");
			label->addWidgetListener(this);
			kinListBox->add(label);
			break;
		case ST_NUMBER_OPTIONS:
			label = Util::createSubLabel("Call");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("SMS");
			label->addWidgetListener(this);
			kinListBox->add(label);
			break;
		case ST_LOGIN_OPTIONS:
			label = Util::createSubLabel("Log In");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("Register");
			label->addWidgetListener(this);
			kinListBox->add(label);
			break;
	}

	kinListBox->setSelectedIndex(0);

	this->setMain(mainLayout);
}

OptionsScreen::~OptionsScreen() {
	lprintfln("~OptionsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	temp = "";
	temp1 = "";
	error_msg = "";
	number = "";
	deckId = "";

	clearListBox();
	kinListBox->clear();
	delete mainLayout;
	mainLayout = NULL;
	if(next!=NULL){
		delete next;
		feed->remHttp();
		next = NULL;
	}

	if (album != NULL) {
		delete album;
		album = NULL;
	}
}

void OptionsScreen::clearListBox() {
	Vector<Widget*> tempWidgets;
	for (int i = 0; i < kinListBox->getChildren().size(); i++) {
		tempWidgets.add(kinListBox->getChildren()[i]);
	}
	kinListBox->clear();
	kinListBox->getChildren().clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
}

void OptionsScreen::show() {
	if (kinListBox->getChildren().size() > kinListBox->getSelectedIndex()) {
		kinListBox->getChildren()[kinListBox->getSelectedIndex()]->setSelected(true);
	}
	Screen::show();

	if ((strcmp(feed->getRegistered().c_str(), "1") == 0)&&(screenType == ST_LOGIN_OPTIONS)) {
		next = new Login(this, feed, Login::S_LOGIN);
		next->show();
	}
}

void OptionsScreen::hide() {
    //kinListBox->getChildren()[kinListBox->getSelectedIndex()]->setSelected(false);
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
	int urlLength = 38 + URLSIZE;
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?getusergames=1", URL);
	lprintfln("%s", url);
	int res = mHttp.create(url, HTTP_GET);

	if(res < 0) {
		notice->setCaption("Connection Error");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();
	}
	delete [] url;
	url = NULL;
}

void OptionsScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
    moved = 0;
}

void OptionsScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void OptionsScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 9) {
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

void OptionsScreen::locateItem(MAPoint2d point)
{
	list = false;
	left = false;
	right = false;

	Point listP, p;
	p.set(point.x, point.y);
	listP.set(point.x, point.y - (kinListBox->getYOffset()>>16));
    for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
    {
        if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(listP))
        {
        	((KineticListBox *)this->getMain()->getChildren()[0]->getChildren()[2])->setSelectedIndex(i);
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
void OptionsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget)->setFont(Util::getDefaultFont());
	}
}

void OptionsScreen::keyPressEvent(int keyCode) {
	int ind = kinListBox->getSelectedIndex();
	int max = kinListBox->getChildren().size();
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];
	switch(keyCode) {
		case MAK_FIRE:
			if(currentSoftKeys->getChildren()[0]->isSelected()){
				keyPressEvent(MAK_SOFTLEFT);
				break;
			}else if(currentSoftKeys->getChildren()[2]->isSelected()){
				keyPressEvent(MAK_SOFTRIGHT);
				break;
			}
		case MAK_SOFTLEFT:
			index = kinListBox->getSelectedIndex();
			switch(screenType) {
				case ST_TRADE_OPTIONS:
					if(index == 0) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new AuctionCreateScreen(this, feed, card);
						next->show();
					} else if(index == 1) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new TradeFriendDetailScreen(this, feed, card);
						next->show();
					}
					break;
				case ST_AUCTION_OPTIONS:
					if(index == 0) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_AUCTIONS);
						next->show();
					}
					else if (index == 1) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new AuctionListScreen(this, feed, AuctionListScreen::ST_USER);
						next->show();
					}
					break;
				case ST_PLAY_OPTIONS:
					if(index == 0 && !connError) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_PLAY);
						next->show();
					}
					else if (index == 1 && !connError) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_GAMES, album);
						next->show();
					}
					break;
				case ST_GAME_OPTIONS:
					if(index == 0) {
						origMenu->show();
					}
					else if (index == 1) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new GameDetailsScreen(feed, GameDetailsScreen::ST_GAME_LOG);
						next->show();
					}
					break;
				case ST_NEW_GAME_OPTIONS:
					if (index == 0) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new GamePlayScreen(this, feed, true, number, "1", false, deckId);
						next->show();
					}
					else if (index == 1) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new GamePlayScreen(this, feed, true, number, "2", false, deckId);
						next->show();
					}
					else if (index == 2) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new GamePlayScreen(this, feed, true, number, "2", true, deckId);
						next->show();
					}
					else if (index == 3) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_LOBBY, album,false,NULL,number);
						((AlbumLoadScreen*)next)->setDeckId(deckId);
						next->show();
					}
					break;
				case ST_CARD_OPTIONS:
					if (index == 0) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new NoteScreen(this, feed, card);
						next->show();
					}
					/*else if (index == 1) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new TradeFriendDetailScreen(this, feed, card);
						next->show();
					}*/
					else if (index == 1/*2*/) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new AuctionCreateScreen(this, feed, card);
						next->show();
					}
					else if (index == 2/*3*/) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_COMPARE, NULL, false, card);
						next->show();
					}
					else if (index == 3/*4*/) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new DetailScreen(this, feed,
								DetailScreen::CARD, card);
						next->show();
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
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new NoteScreen(this, feed,
								card, NoteScreen::ST_SMS, number);
						next->show();
					}
					break;
				case ST_LOGIN_OPTIONS:
					if(index == 0) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new Login(this, feed, Login::S_LOGIN);
						next->show();
					}
					else if(index == 1) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new Login(this, feed, Login::S_REGISTER);
						next->show();
					}
					break;
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			switch(screenType) {
				case ST_LOGIN_OPTIONS:
#if not defined(MA_PROF_STRING_PLATFORM_IPHONEOS)
					maExit(0);
#endif
					break;
				default:
					clearListBox();
					previous->show();
					break;
			}
			break;
		case MAK_DOWN:
			if (ind+1 < kinListBox->getChildren().size()) {
				kinListBox->setSelectedIndex(ind+1);
			} else if (currentSelectedKey==NULL) {
				kinListBox->getChildren()[ind]->setSelected(false);
				for(int i = 0; i < currentSoftKeys->getChildren().size();i++){
					if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
						currentKeyPosition=i;
						currentSelectedKey= currentSoftKeys->getChildren()[i];
						currentSelectedKey->setSelected(true);
						break;
					}
				}
			}
			/*if (ind == max-1) {
				kinListBox->setSelectedIndex(0);
			} else {
				kinListBox->selectNextItem();
			}*/
			break;
		case MAK_UP:
			if(currentSelectedKey!=NULL){
				currentSelectedKey->setSelected(false);
				currentSelectedKey = NULL;
				currentKeyPosition = -1;
				kinListBox->getChildren()[kinListBox->getChildren().size()-1]->setSelected(true);
			}
			else if (ind > 0) {
				kinListBox->setSelectedIndex(ind-1);
			}/*if (ind == 0) {
				kinListBox->setSelectedIndex(max-1);
			} else {
				kinListBox->selectPreviousItem();
			}*/
			break;
		case MAK_LEFT:
			if(currentSelectedKey!=NULL){
				if(currentKeyPosition > 0){
					currentKeyPosition = currentKeyPosition - 1;
					for(int i = currentKeyPosition; i >= 0;i--){
						if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
							currentSelectedKey->setSelected(false);
							currentKeyPosition=i;
							currentSelectedKey= currentSoftKeys->getChildren()[i];
							currentSelectedKey->setSelected(true);
							break;
						}
					}
				}
			}
			break;
		case MAK_RIGHT:
			if(currentSelectedKey!=NULL){
				if(currentKeyPosition+1 < currentSelectedKey->getParent()->getChildren().size()){
					currentKeyPosition = currentKeyPosition + 1;
					for(int i = currentKeyPosition; i < currentSoftKeys->getChildren().size();i++){
						if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
							currentSelectedKey->setSelected(false);
							currentKeyPosition=i;
							currentSelectedKey= currentSoftKeys->getChildren()[i];
							currentSelectedKey->setSelected(true);
							break;
						}
					}
				}
			}
			break;
	}
}

void OptionsScreen::acceptCard() {
	//work out how long the url will be
	int urlLength = 38 + URLSIZE + card->getId().length();
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?savecard=%s", URL, card->getId().c_str());
	lprintfln("%s", url);
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
		feed->addHttp();
		mHttp.finish();
	}
	delete [] url;
	url = NULL;
}

void OptionsScreen::rejectCard() {
	//work out how long the url will be
	int urlLength = 20 + URLSIZE + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s?rejectcard%s", URL, card->getId().c_str());
	lprintfln("%s", url);
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
		feed->addHttp();
		mHttp.finish();
	}
	delete [] url;
	url = NULL;
}
void OptionsScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		connError = false;
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
		if (album == NULL) {
			album = new Albums();
		}
	} else {
		connError = true;
		mHttp.close();
		feed->remHttp();
		notice->setCaption("Unable to connect, try again later...");

		Util::updateSoftKeyLayout("", "Back", "", mainLayout);
	}
}

void OptionsScreen::connReadFinished(Connection* conn, int result) {}

void OptionsScreen::xcConnError(int code) {
	feed->remHttp();
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
	if(!strcmp(name, "game")) {
		album->addAlbum(temp.c_str(), temp1.c_str());
		temp1 = "";
		temp = "";
	} else if (!strcmp(name, "games")) {
		notice->setCaption("");
		if (album->size() > 0) {
			label = Util::createSubLabel("New Game");
			label->addWidgetListener(this);
			kinListBox->add(label);
			label = Util::createSubLabel("Continue Game");
			label->addWidgetListener(this);
			kinListBox->add(label);

			kinListBox->setSelectedIndex(0);
		}
		else {
			if (next != NULL) {
				delete next;
				feed->remHttp();
				next = NULL;
			}
			next = new AlbumLoadScreen(previous, feed, AlbumLoadScreen::ST_PLAY);
			next->show();
		}
	} else if(!strcmp(name, "result")) {
		((AlbumViewScreen *)origAlbum)->refresh();
	}  else if(!strcmp(name, "error")) {
		notice->setCaption(error_msg.c_str());
	} else {
		notice->setCaption("");
	}
}

void OptionsScreen::mtxParseError(int) {
}

void OptionsScreen::mtxEmptyTagEnd() {
}

void OptionsScreen::mtxTagStartEnd() {
}
