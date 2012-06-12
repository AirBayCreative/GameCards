#include <conprint.h>
#include <MAUtil/Graphics.h>
#include <mastdlib.h>
#include <madmath.h>

#include "GamePlayScreen.h"
#include "../utils/Util.h"
#include "ImageScreen.h"
#include "OptionsScreen.h"
#include "AlbumLoadScreen.h"
#include "../UI/Button.h"

//in the case of a new game, identifier is the categoryId. For an existing game, it is the gameId.
GamePlayScreen::GamePlayScreen(MainScreen *previous, Feed *feed, bool newGame, String identifier,
		String newGameType, bool againstFriend, String deckId, int lobby, String gameid) : mHttp(this),
		newGame(newGame), newGameType(newGameType), deckId(deckId) {
	lprintfln("GamePlayScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	this->feed = feed;
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	parentTag = "";
	cardText = "";
	id = "";
	description = "";
	thumburl = "";
	fronturl = "";
	backurl = "";
	error_msg = "";
	gamePlayerCardId = "";
	statType = "";
	statDescription = "";
	cardStatId = "";
	cardName = "";
	explanation = "";
	outcome = "";
	message = "";
	frontflipurl = "";
	backflipurl = "";
	userCards = "";
	oppCards = "";
	lastMove = "";
	creator = "";
	userName = "";
	oppName = "";

	feedLayouts = NULL;
	next = NULL;

	busy = false;
	flip = false;
	active = false;
	checking = false;
	selectingStat = false;

	currentSelectedStat = -1;
	flipOrSelect = 0;
	cardIndex = 0;
	yOffset = 0;
	storeHeight = 0;
	ticks = 0;
	lfmTicks = 1;

	card = NULL;
	oppCard = NULL;

	//this card is used for the gamecards logo card
	gcCard = new Card();
	gcCard->setId("gc");

	userImage = NULL;
	oppImage = NULL;

	imageCacheUser = new ImageCache();
	imageCacheOpp = new ImageCache();

	mainLayout = Util::createMainLayout("", "Back", "", true);
	kinListBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setDrawBackground(false);

	kinListBox->setHeight(kinListBox->getHeight() - 20);
	kinListBox->setEnabled(false);
	storeHeight = mainLayout->getChildren()[0]->getChildren()[0]->getHeight();

	phase = P_LOADING;

	char *url;
	if (newGame) {
		if (againstFriend) {
			phase = P_FRIEND;
			categoryId = identifier;

			this->setMain(mainLayout);
			moved=0;
			orig = this;

			drawFriendNameScreen();

			return;
		}
		else {
			categoryId = identifier;
			notice->setCaption("Initialising new game...");
			if(lobby == 1){
				int urlLength = 97 + URLSIZE + categoryId.length() +
					newGameType.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
				url = new char[urlLength];
				memset(url,'\0',urlLength);
				sprintf(url, "%s?hostgame=1&categoryid=%s&newgametype=%s&height=%d&width=%d&deckid=%s&jpg=1", URL,
					categoryId.c_str(), newGameType.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), deckId.c_str());
			}else if (lobby == 2){
				int urlLength = 105 + URLSIZE + categoryId.length() + gameId.length() +
					newGameType.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
				url = new char[urlLength];
				memset(url,'\0',urlLength);
				sprintf(url, "%s?joingame=1&categoryid=%s&newgametype=%s&height=%d&width=%d&deckid=%s&gameid=%s&jpg=1", URL,
					categoryId.c_str(), newGameType.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), deckId.c_str(), gameid.c_str());
			}else {
				//work out how long the url will be, the 4 is for the & and = symbals
				int urlLength = 96 + URLSIZE + categoryId.length() +
					newGameType.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
				url = new char[urlLength];
				memset(url,'\0',urlLength);
				sprintf(url, "%s?newgame=1&categoryid=%s&newgametype=%s&height=%d&width=%d&deckid=%s&jpg=1", URL,
					categoryId.c_str(), newGameType.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), deckId.c_str());
			}
		}
	}
	else {
		gameId = identifier;
		notice->setCaption("Loading game...");

		//work out how long the url will be, the 17 is for the & and = symbals, as well as hard coded vars
		int urlLength = 68 + URLSIZE + gameId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
		url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s?loadgame=1&gameid=%s&height=%d&width=%d&jpg=1", URL,
				gameId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
	}
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		hasConnection = false;
		notice->setCaption("Connection error.");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();

	}
	delete [] url;
	url = NULL;
	this->setMain(mainLayout);

	moved=0;

	orig = this;
}

void GamePlayScreen::clearListBox() {
	if (userImage != NULL &&
		userImage->getResource() != NULL) {
		maDestroyObject(userImage->getResource());
	}
	if (oppImage != NULL &&
		oppImage->getResource() != NULL) {
		maDestroyObject(oppImage->getResource());
	}

	imageCacheUser->clearImageCache();
	imageCacheOpp->clearImageCache();
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

	//reuse, dont delete
	userImage = NULL;
	oppImage = NULL;
}

void GamePlayScreen::drawResultsScreen() {
	resetHeights();

	MAUtil::Environment::getEnvironment().removeTimer(this);
	clearListBox();

	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	Util::updateSoftKeyLayout("Continue", "Options", "", mainLayout);

	notice->setCaption("");
	Label *lbl = new Label(0, 0, scrWidth-(PADDING*2), 0, NULL);
	lbl->setFont(Util::getDefaultFont());
	lbl->setAutoSizeY(true);
	lbl->setDrawBackground(false);
	lbl->setMultiLine(true);

	lbl->setCaption("Match Results:");

	String display = explanation;
	kinListBox->add(lbl);

	lbl = new Label(0, 0, scrWidth-(PADDING*2), 0, NULL);
	lbl->setDrawBackground(false);
	lbl->setFont(Util::getDefaultFont());
	lbl->setAutoSizeY(true);
	lbl->setMultiLine(true);
	lbl->setCaption(display);
	kinListBox->add(lbl);

	explanation = "";
}

void GamePlayScreen::drawConfirmScreen() {
	MAUtil::Environment::getEnvironment().removeTimer(this);
	clearListBox();

	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	Util::updateSoftKeyLayout("Yes", "No", "", mainLayout);

	notice->setCaption("");
	Label *lbl = new Label(0, 0, scrWidth-(PADDING*2), 0, NULL);
	lbl->setFont(Util::getDefaultFont());
	lbl->setAutoSizeY(true);
	lbl->setMultiLine(true);

	lbl->setCaption(creator + " wants to play against you, do you want to take them on?");

	kinListBox->add(lbl);
}

void GamePlayScreen::drawClosedScreen() {
	MAUtil::Environment::getEnvironment().removeTimer(this);
	clearListBox();

	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	Util::updateSoftKeyLayout("", "Back", "", mainLayout);

	notice->setCaption("");
	Label *lbl = new Label(0, 0, scrWidth-(PADDING*2), 0, NULL);
	lbl->setFont(Util::getDefaultFont());
	lbl->setAutoSizeY(true);
	lbl->setMultiLine(true);

	lbl->setCaption("The game you are trying to join has already started!");

	kinListBox->add(lbl);
}

void GamePlayScreen::drawDeclinedScreen() {
	MAUtil::Environment::getEnvironment().removeTimer(this);
	clearListBox();

	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	Util::updateSoftKeyLayout("", "Back", "", mainLayout);

	notice->setCaption("");
	Label *lbl = new Label(0, 0, scrWidth-(PADDING*2), 0, NULL);
	lbl->setFont(Util::getDefaultFont());
	lbl->setAutoSizeY(true);
	lbl->setMultiLine(true);

	lbl->setCaption("The person you wanted to play against declined the game.");

	kinListBox->add(lbl);
}

void GamePlayScreen::drawFriendNameScreen() {
	clearListBox();

	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	Util::updateSoftKeyLayout("Play", "Back", "", mainLayout);

	notice->setCaption("");
	Label *lbl = new Label(0, 0, scrWidth-(PADDING*2), 0, NULL);
	lbl->setAutoSizeY(true);
	lbl->setMultiLine(true);

	lbl->setCaption("Enter the username of the person you want to play against");

	kinListBox->add(lbl);

	lbl = Util::createEditLabel("");
	editBoxFriend = new NativeEditBox(0, 0, lbl->getWidth()-PADDING*2, lbl->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, lbl, "", L"Friend");
	editBoxFriend->setDrawBackground(false);
	lbl->addWidgetListener(this);
	kinListBox->add(lbl);

	kinListBox->setSelectedIndex(1);
	editBoxFriend->setSelected(true);
}

void GamePlayScreen::drawCardSelectStatScreen() {
	MAUtil::Environment::getEnvironment().removeTimer(this);
	currentSelectedStat = -1;

	imageCacheUser->clearImageCache();
	imageCacheOpp->clearImageCache();
	phase = P_CARD_DETAILS;

	mainLayout->getChildren()[0]->getChildren()[0]->setHeight(0);
	kinListBox->setHeight(scrHeight-(mainLayout->getChildren()[1]->getHeight()));
	kinListBox->setPosition(0, 0);
	kinListBox->setEnabled(false);

	flip = true;

	notice->setCaption("");
	clearListBox();

	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	Util::updateSoftKeyLayout(active?"":"", "Options", "", mainLayout);

	int height = kinListBox->getHeight() - (2 * DEFAULT_SMALL_LABEL_HEIGHT);
	String lblString = userName + ": ";
	lblString += userCards;
	lblString += " cards, ";
	lblString += active?"Select a stat":"Waiting";
	Label *userLabel = new Label(0, 0, scrWidth - PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, kinListBox, lblString,0,Util::getDefaultFont());
	userLabel->setDrawBackground(false);
	userImage = new MobImage(0, 0, scrWidth-PADDING*2 - 25, height/2, kinListBox, false, false, Util::loadImageFromResource(RES_LOADING_FLIP1));

	Util::retrieveBackFlip(userImage, card, height-PADDING*2, imageCacheUser);

	//if the opponent is active, we can draw the front of their card. If the user is active, we draw a generic card
	oppImage = new MobImage(0, 0, scrWidth-PADDING*2 - 25, height/2, kinListBox, false, false, Util::loadImageFromResource(RES_LOADING_FLIP1));

	lblString = oppName + ": ";
	lblString += oppCards;
	lblString += " cards, ";
	lblString += (!active)?"Selecting stat...":"Waiting";
	userLabel = new Label(0, 0, scrWidth - PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, kinListBox, lblString,0,Util::getDefaultFont());
	userLabel->setDrawBackground(false);
	if (!active) {
		Util::retrieveBackFlip(oppImage, oppCard, height-PADDING*2, imageCacheOpp);
	}
	else {
		Util::retrieveBackFlip(oppImage, gcCard, height-PADDING*2, imageCacheOpp);
	}
}

void GamePlayScreen::drawLFMScreen() {
	if (ticks == 0) {
		clearListBox();
		userImage = new MobImage(0, 0, scrWidth-PADDING*2, kinListBox->getHeight(), kinListBox, false, false, Util::loadImageFromResource(RES_LOADING1));
		Util::retrieveBack(userImage, gcCard, kinListBox->getHeight()-PADDING*2, imageCacheUser);
		currentSelectedKey = NULL;
		currentKeyPosition = -1;
		Util::updateSoftKeyLayout("", "Back", "", mainLayout);
	}

	String caption = "Looking for opponent";
	for (int i = 0; i < ticks; i++) {
		caption+=".";
	}
	notice->setCaption(caption);
}

void GamePlayScreen::pointerPressEvent(MAPoint2d point) {
	pointPressed = point;
    locateItem(point);
}

void GamePlayScreen::pointerMoveEvent(MAPoint2d point) {
    locateItem(point);
    moved++;
}

void GamePlayScreen::pointerReleaseEvent(MAPoint2d point) {
	pointReleased = point;
	if (moved <= 8 || phase == P_CARD_DETAILS) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			if (phase == P_CARD_DETAILS){
				if (Util::absoluteValue(pointPressed.x-pointReleased.x) >userImage->getWidth()/100*15||Util::absoluteValue(pointPressed.x-pointReleased.x) > 45){
					flipOrSelect = 1;
				} else if (active && !busy) {
					flipOrSelect = 0;
					currentSelectedStat = -1;
					if(phase==P_CARD_DETAILS) {
						for(int i = 0;i<card->getStats().size();i++) {
							if(flip==card->getStats()[i]->getFrontOrBack()) {
								if(userImage->statContains(card->getStats()[i]->getLeft(),card->getStats()[i]->getTop(),
										card->getStats()[i]->getWidth(),card->getStats()[i]->getHeight(),point.x, point.y, MobImage::LANDSCAPE)) {
									currentSelectedStat = i;
								}
							}
						}
					}
				}
			}
			keyPressEvent(MAK_FIRE);
		}
	}
	moved=0;
}

void GamePlayScreen::locateItem(MAPoint2d point) {
	list = false;
	left = false;
	right = false;

	Point p;
	p.set(point.x, point.y);

	//this is for if you want a click in the list to trigger an event
	if (phase == P_CARD_DETAILS) {
		for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
		{
			if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
			{
				list = true;
			}
		}
	}

	//this is for the buttons at the bottom
	for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++) {
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p)) {
			if (i == 0) {
				left = true;
				moved=0;
			}
			else if (i == 1) {
				list = true;
				moved = 0;
			}
			else if (i == 2) {
				right = true;
				moved=0;
			}
			return;
		}
	}
}

GamePlayScreen::~GamePlayScreen() {
	lprintfln("~GamePlayScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	clearListBox();
	kinListBox->clear();
	delete mainLayout;
	mainLayout = NULL;

	if (next != NULL) {
		delete next;
		feed->remHttp();
		next = NULL;
	}
	delete imageCacheUser;
	imageCacheUser = NULL;
	delete imageCacheOpp;
	imageCacheOpp = NULL;

	delete [] feedLayouts;
	feedLayouts = NULL;

	delete gcCard;
	gcCard = NULL;

	clearCardStats();
	parentTag="";
	cardText="";
	id="";
	description="";
	thumburl="";
	fronturl="";
	backurl="";
	error_msg="";
	statType = "";
	statDescription = "";
	cardStatId = "";
	cardName = "";
	outcome = "";
	message = "";
	frontflipurl = "";
	backflipurl = "";
	deckId = "";
}

void GamePlayScreen::selectionChanged(Widget *widget, bool selected) {
}

void GamePlayScreen::show() {
	Screen::show();
}

void GamePlayScreen::hide() {
	Screen::hide();
}

void GamePlayScreen::drawRectangle(int x, int y, int width, int height){
	Gfx_line(x, y, x+width, y);
	Gfx_line(x, y, x, y+height);
	Gfx_line(x+width, y, x+width, y+height);
	Gfx_line(x, y+height, x+width, y+height);
}

void GamePlayScreen::keyPressEvent(int keyCode) {
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];
	switch(keyCode) {
		case MAK_DOWN:
			if(currentSelectedKey==NULL){
				for(int i = 0; i < currentSoftKeys->getChildren().size();i++){
					if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
						currentKeyPosition=i;
						currentSelectedKey= currentSoftKeys->getChildren()[i];
						currentSelectedKey->setSelected(true);
						break;
					}
				}
			}
			break;
		case MAK_UP:
			if(currentSelectedKey!=NULL){
				currentSelectedKey->setSelected(false);
				currentSelectedKey = NULL;
				currentKeyPosition = -1;
				switch (phase) {
					case P_CARD_DETAILS:
						if(currentSelectedStat != -1){
							if (userImage->getResource() != NULL && active) {
								userImage->refreshWidget();
								userImage->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),
										card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(),
										card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(),
										card->getStats()[currentSelectedStat]->getColorBlue(), MobImage::LANDSCAPE);
							}
						}
					break;
				}
			}
			break;
			/*switch(phase){
				case P_CARD_DETAILS:
					flip = !flip;
					int height = kinListBox->getHeight();
					if (userImage->getResource() != NULL) {
						maDestroyObject(userImage->getResource());
					}
					userImage->setResource(Util::loadImageFromResource(RES_LOADING_FLIP1));
					userImage->update();
					userImage->requestRepaint();
					maUpdateScreen();
					if (flip) {
						Util::retrieveBackFlip(userImage, card, height-PADDING*2, imageCacheUser);
					}
					else {
						Util::retrieveFrontFlip(userImage, card, height-PADDING*2, imageCacheUser);
					}
					currentSelectedStat=-1;
					break;
			}
			break;*/
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
				break;
			}
			switch (phase) {
				case P_CARD_DETAILS:
					if (userImage->getResource() != NULL && active) {
						if(card->getStats().size()>0){
							if(flip==card->getStats()[0]->getFrontOrBack()){
								currentSelectedStat--;
								if(currentSelectedStat < 0){
									currentSelectedStat = card->getStats().size()-1;
								}
								userImage->refreshWidget();
								userImage->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),
										card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(),
										card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(),
										card->getStats()[currentSelectedStat]->getColorBlue(), MobImage::LANDSCAPE);
							}
						}
					}
					break;
			}
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
				break;
			}
			switch (phase) {
				case P_CARD_DETAILS:
					if (userImage->getResource() != NULL && active) {
						if(card->getStats().size()>0){
							if(flip==card->getStats()[0]->getFrontOrBack()){
								if(currentSelectedStat < card->getStats().size()-1){
									currentSelectedStat++;
								}
								else {
									currentSelectedStat = 0;
								}
								userImage->refreshWidget();
								userImage->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),
										card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(),
										card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(),
										card->getStats()[currentSelectedStat]->getColorBlue(), MobImage::LANDSCAPE);
							}
						}
					}
					break;
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			MAUtil::Environment::getEnvironment().removeTimer(this);
			switch (phase) {
				case P_LOADING:
					previous->show();
					break;
				case P_FRIEND:
					editBoxFriend->setSelected(false);
					previous->show();
					break;
				case P_LFM:
					MAUtil::Environment::getEnvironment().removeTimer(this);
					previous->show();
					break;
				case P_CLOSED:
					MAUtil::Environment::getEnvironment().removeTimer(this);
					previous->refresh();
					break;
				case P_DECLINED:
					MAUtil::Environment::getEnvironment().removeTimer(this);
					previous->show();
					break;
				case P_CONFIRM:
					notice->setCaption("Finding new game...");
					phase = P_CARD_DETAILS;
					//work out how long the url will be, the 17 is for the & and = symbals, as well as hard coded vars
					int urlLength = 81 + URLSIZE + gameId.length() +
							categoryId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
					char *url = new char[urlLength];
					memset(url,'\0',urlLength);
					sprintf(url, "%s?declinegame=1&gameid=%s&categoryid=%s&height=%d&width=%d&deckid=%s&jpg=1", URL,
						gameId.c_str(), categoryId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), deckId.c_str());
					if(mHttp.isOpen()){
						mHttp.close();
					}
					mHttp = HttpConnection(this);
					int res = mHttp.create(url, HTTP_GET);
					if(res < 0) {
						hasConnection = false;
						notice->setCaption("Connection error.");
					} else {
						hasConnection = true;
						mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
						mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
						mHttp.finish();
					}
					break;
				default:
					if (next != NULL) {
						delete next;
						feed->remHttp();
						next = NULL;
					}
					feed->setGameId(gameId.c_str());
					next = new OptionsScreen(feed, OptionsScreen::ST_GAME_OPTIONS, this);
					next->show();
					break;
			}
			break;
		case MAK_FIRE:
			if(currentSoftKeys->getChildren()[0]->isSelected()){
				keyPressEvent(MAK_SOFTLEFT);
				break;
			}else if(currentSoftKeys->getChildren()[2]->isSelected()){
				keyPressEvent(MAK_SOFTRIGHT);
				break;
			}
			switch (phase) {
				case P_CARD_DETAILS:
					if (flipOrSelect) {
						flip = !flip;
						int height = kinListBox->getHeight();
						if (userImage->getResource() != NULL) {
							maDestroyObject(userImage->getResource());
						}
						userImage->setResource(Util::loadImageFromResource(RES_LOADING_FLIP1));
						userImage->update();
						userImage->requestRepaint();
						maUpdateScreen();
						if (flip) {
							Util::retrieveBackFlip(userImage, card, height-PADDING*2, imageCacheUser);
						}
						else {
							Util::retrieveFrontFlip(userImage, card, height-PADDING*2, imageCacheUser);
						}
						flipOrSelect=0;
						currentSelectedStat=-1;
					} else if (active) {
						if (!busy) {
							if (userImage->getResource() != NULL) {
								if(currentSelectedStat>-1){
									if(flip==card->getStats()[currentSelectedStat]->getFrontOrBack()){
										busy = true;
										userImage->refreshWidget();
										userImage->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),
												card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(),
												card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(),
												card->getStats()[currentSelectedStat]->getColorBlue(), MobImage::LANDSCAPE);

										selectStat();
									}
								}
							}
						}
					}
					break;
			}
			break;
		case MAK_SOFTLEFT:
			if (!busy) {
				busy = true;
				switch (phase) {
					case P_CARD_DETAILS:
						if(currentSelectedStat>-1){
							selectStat();
						}
						break;
					case P_RESULTS:
						/*origMenu->show();*/
						previous->pop();
						break;
					case P_CONFIRM:
						notice->setCaption("Confirming...");
						phase = P_CARD_DETAILS;
						//work out how long the url will be, the 17 is for the & and = symbals, as well as hard coded vars
						int urlLength = 75 + URLSIZE + gameId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
						char *url = new char[urlLength];
						memset(url,'\0',urlLength);
						sprintf(url, "%s?confirmgame=1&gameid=%s&height=%d&width=%d&deckid=%s&jpg=1", URL,
							gameId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), deckId.c_str());
						if(mHttp.isOpen()){
							mHttp.close();
						}
						mHttp = HttpConnection(this);
						int res = mHttp.create(url, HTTP_GET);
						if(res < 0) {
							hasConnection = false;
							notice->setCaption("Connection error.");
						} else {
							hasConnection = true;
							mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
							mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
							feed->addHttp();
							mHttp.finish();
						}
						break;
					case P_FRIEND:
						if (editBoxFriend->getCaption().length() == 0) {
							notice->setCaption("Please enter a username");
							busy = false;
						}
						else if (strcmp(editBoxFriend->getCaption().c_str(), feed->getUsername().c_str()) == 0) {
							notice->setCaption("You cannot play against yourself");
							busy = false;
						}
						else {
							String base64Friend = Util::base64_encode(reinterpret_cast<const unsigned char*>(editBoxFriend->getCaption().c_str()),
									strlen(editBoxFriend->getCaption().c_str()));

							notice->setCaption("Initialising new game...");

							clearListBox();

							phase = P_LOADING;

							//work out how long the url will be, the 4 is for the & and = symbals
							int urlLength = 92 + URLSIZE + categoryId.length() +
								newGameType.length() + base64Friend.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
							url = new char[urlLength];
							memset(url,'\0',urlLength);
							sprintf(url, "%s?newgame=1&categoryid=%s&newgametype=%s&friend=%s&height=%d&width=%d&deckid=%s&jpg=1", URL,
								categoryId.c_str(), newGameType.c_str(), base64Friend.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), deckId.c_str());
							if(mHttp.isOpen()){
								mHttp.close();
							}
							mHttp = HttpConnection(this);
							int res = mHttp.create(url, HTTP_GET);
							if(res < 0) {
								hasConnection = false;
								notice->setCaption("Connection error.");
							} else {
								hasConnection = true;
								mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
								mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
								mHttp.finish();
							}
							res = 0;
							delete [] url;
							url = NULL;
							base64Friend = "";
						}
						break;
				}
			}
			break;

	}
}

void GamePlayScreen::runTimerEvent() {
	if (phase == P_LFM) {
		drawLFMScreen();
		ticks = ticks>3?1:ticks+1;
		lfmTicks++;
	}
	if ((!active && phase == P_CARD_DETAILS && !selectingStat) || (!checking && lfmTicks%12 == 0)) {
		checking = true;
		//work out how long the url will be, the 19 is for the & and = symbals, as well as hard coded vars
		int urlLength = 82 + URLSIZE + gameId.length() + lastMove.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
		char *url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s?continuegame=1&gameid=%s&lastmove=%s&height=%d&width=%d&jpg=1", URL,
				gameId.c_str(), lastMove.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
		if(mHttp.isOpen()){
			mHttp.close();
		}
		mHttp = HttpConnection(this);
		int res = mHttp.create(url, HTTP_GET);
		if(res < 0) {
			hasConnection = false;
			notice->setCaption("Connection error.");
		} else {
			hasConnection = true;
			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();

		}
		delete [] url;
		url = NULL;
		urlLength = 0;
		return;
	}
	if (phase == P_LFM) {
		return;
	}
	ticks++;
	if (oppImage != NULL && userImage != NULL && currentSelectedStat >= 0) {
		if (!selected) {
			oppImage->selectStat(oppCard->getStats()[currentSelectedStat]->getLeft(),oppCard->getStats()[currentSelectedStat]->getTop(),
				oppCard->getStats()[currentSelectedStat]->getWidth(),oppCard->getStats()[currentSelectedStat]->getHeight(),
				oppCard->getStats()[currentSelectedStat]->getColorRed(), oppCard->getStats()[currentSelectedStat]->getColorGreen(),
				oppCard->getStats()[currentSelectedStat]->getColorBlue(), MobImage::LANDSCAPE);

			userImage->selectStat(card->getStats()[selected]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),
				card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(),
				card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(),
				card->getStats()[currentSelectedStat]->getColorBlue(), MobImage::LANDSCAPE);

			selected = true;
		}
		else {
			kinListBox->requestRepaint();
			selected = false;
		}

		double userIVal = ::atof(card->getStats()[currentSelectedStat]->getIVal().c_str());
		double oppIVal = ::atof(oppCard->getStats()[currentSelectedStat]->getIVal().c_str());

		MAExtent userImgSize = maGetImageSize(userImage->getResource());
		int userImgWidth = EXTENT_X(userImgSize);
		int userImgHeight = EXTENT_Y(userImgSize);

		MAExtent oppImgSize = maGetImageSize(oppImage->getResource());
		int oppImgWidth = EXTENT_X(oppImgSize);
		int oppImgHeight = EXTENT_Y(oppImgSize);

		//we need to draw a green rectangle around the winner, red around the looser
		if (userIVal > oppIVal) {
			Gfx_setColor(0, 255, 0);
			drawRectangle(userImage->getPaddedBounds().x + (userImage->getPaddedBounds().width - userImgWidth)/2,
				userImage->getPaddedBounds().y + (userImage->getPaddedBounds().height - userImgHeight)/2,
				userImgWidth, userImgHeight);

			Gfx_setColor(255, 0, 0);
			drawRectangle(oppImage->getPaddedBounds().x + (oppImage->getPaddedBounds().width - oppImgWidth)/2,
				oppImage->getPaddedBounds().y + (oppImage->getPaddedBounds().height - oppImgHeight)/2,
				oppImgWidth, oppImgHeight);
		}
		else if (oppIVal > userIVal) {
			Gfx_setColor(0, 255, 0);
			drawRectangle(oppImage->getPaddedBounds().x + (oppImage->getPaddedBounds().width - oppImgWidth)/2,
				oppImage->getPaddedBounds().y + (oppImage->getPaddedBounds().height - oppImgHeight)/2,
				oppImgWidth, oppImgHeight);

			Gfx_setColor(255, 0, 0);
			drawRectangle(userImage->getPaddedBounds().x + (userImage->getPaddedBounds().width - userImgWidth)/2,
				userImage->getPaddedBounds().y + (userImage->getPaddedBounds().height - userImgHeight)/2,
				userImgWidth, userImgHeight);
		}
		else {
			Gfx_setColor(255, 255, 0);
			drawRectangle(userImage->getPaddedBounds().x + (userImage->getPaddedBounds().width - userImgWidth)/2,
				userImage->getPaddedBounds().y + (userImage->getPaddedBounds().height - userImgHeight)/2,
				userImgWidth, userImgHeight);

			Gfx_setColor(255, 255, 0);
			drawRectangle(oppImage->getPaddedBounds().x + (oppImage->getPaddedBounds().width - oppImgWidth)/2,
				oppImage->getPaddedBounds().y + (oppImage->getPaddedBounds().height - oppImgHeight)/2,
				oppImgWidth, oppImgHeight);
		}

		userImgWidth = 0;
		userImgHeight = 0;
		oppImgWidth = 0;
		oppImgHeight = 0;
		Gfx_updateScreen();
	}
	if (phase == P_OPPMOVE && ticks == 7) {
		ticks = 0;
		//MAUtil::Environment::getEnvironment().removeTimer(this);
		//ticks = 0;
		//work out how long the url will be, the 17 is for the & and = symbals, as well as hard coded vars
		int urlLength = 68 + URLSIZE + gameId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
		char *url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s?loadgame=1&gameid=%s&height=%d&width=%d&jpg=1", URL,
			gameId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
		if(mHttp.isOpen()){
			mHttp.close();
		}
		mHttp = HttpConnection(this);
		int res = mHttp.create(url, HTTP_GET);
		if(res < 0) {
			hasConnection = false;
			notice->setCaption("Connection error.");
		} else {
			hasConnection = true;
			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();

		}
		delete [] url;
		url = NULL;
	}
	else if (selectingStat && ticks == 8) {
		MAUtil::Environment::getEnvironment().removeTimer(this);
		selectingStat = false;
		clearCardStats();

		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(tempHttp, this, this);
	}
}

void GamePlayScreen::resetHeights() {
	mainLayout->getChildren()[0]->getChildren()[0]->setHeight(storeHeight);
	kinListBox->setHeight(scrHeight-(mainLayout->getChildren()[1]->getHeight()+storeHeight + 20));
}

void GamePlayScreen::animateSelectStat() {
	int height = kinListBox->getHeight();
	/** could potentially destroy gcflip **/
	if (oppImage->getResource() != NULL) {
		maDestroyObject(oppImage->getResource());
	}
	oppImage->setResource(Util::loadImageFromResource(RES_LOADING_FLIP1));
	oppImage->update();
	oppImage->requestRepaint();
	maUpdateScreen();
	Util::retrieveBackFlip(oppImage, oppCard, height-PADDING*2, imageCacheOpp);

	selected = false;
	ticks = 0;
	MAUtil::Environment::getEnvironment().addTimer(this, 500, -1);

}

void GamePlayScreen::selectStat() {
	selectingStat = true;

	char *url = NULL;
	int urlLength = 0;
	int res = 0;
	//currentSelectedStat = -1;
	//kinListBox->setEnabled(true);

	//work out how long the url will be, the 19 is for the & and = symbals, as well as the hard coded params
	urlLength = 78 + URLSIZE + gameId.length() + card->getStats()[currentSelectedStat]->getCardStatId().length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
	url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s?selectstat=1&gameid=%s&statid=%s&height=%d&width=%d&jpg=1", URL, gameId.c_str(),
			card->getStats()[currentSelectedStat]->getCardStatId().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());

	//clearCardStats();

	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		hasConnection = false;
		notice->setCaption("Connection error.");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();

	}

	delete url;
	url = NULL;
}

void GamePlayScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	error_msg = "";
	if (result == 200) {
		if (selectingStat) {
			tempHttp = http;

			animateSelectStat();
		}
		else {
			clearCardStats();

			xmlConn = XmlConnection::XmlConnection();
			xmlConn.parse(http, this, this);
		}
	} else {
		busy = false;
		mHttp.close();
		feed->remHttp();
		notice->setCaption("Unable to connect, try again later...");
	}
}

void GamePlayScreen::connReadFinished(Connection* conn, int result) {
}

void GamePlayScreen::connRecvFinished(Connection* conn, int result) {
}

void GamePlayScreen::xcConnError(int code) {
	feed->remHttp();
	char *url;
	if (newGame && phase != P_CONFIRM) {
		if (newGame) {
			notice->setCaption("Loading game...");
		}
		newGame = false;

		//work out how long the url will be, the 17 is for the & and = symbals, as well as hard coded vars
		int urlLength = 68 + URLSIZE + gameId.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
		url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s?loadgame=1&gameid=%s&height=%d&width=%d&jpg=1", URL,
				gameId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
		if(mHttp.isOpen()){
			mHttp.close();
		}
		mHttp = HttpConnection(this);
		int res = mHttp.create(url, HTTP_GET);
		if(res < 0) {
			hasConnection = false;
			notice->setCaption("Connection error.");
		} else {
			hasConnection = true;
			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();

		}
		delete [] url;
		url = NULL;
	}
	else if (!active && phase == P_CARD_DETAILS) {
		//notice->setCaption("Opponent is making choices...");

		ticks = 0;
		MAUtil::Environment::getEnvironment().addTimer(this, 3000, 1);
	}
	else if (phase == P_LFM) {
		checking = false;
	}
}

void GamePlayScreen::mtxEncoding(const char* ) {
}

void GamePlayScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void GamePlayScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
	if(!strcmp(parentTag.c_str(), "cardstat")) {
		if(!strcmp(attrName, "cardstat_id")) {
			cardStatId += attrValue;
		}else if(!strcmp(attrName, "desc")) {
			statDesc += attrValue;
		}else if(!strcmp(attrName, "ival")) {
			statIVal += attrValue;
		}else if(!strcmp(attrName, "top")) {
			statTop = atoi(attrValue);
		}else if(!strcmp(attrName, "left")) {
			statLeft = atoi(attrValue);
		}else if(!strcmp(attrName, "width")) {
			statWidth = atoi(attrValue);
		}else if(!strcmp(attrName, "height")) {
			statHeight = atoi(attrValue);
		}else if(!strcmp(attrName, "frontorback")) {
			statFrontOrBack = atoi(attrValue);
		}else if(!strcmp(attrName, "red")) {
			statRed = atoi(attrValue);
		}else if(!strcmp(attrName, "green")) {
			statGreen = atoi(attrValue);
		}else if(!strcmp(attrName, "blue")) {
			statBlue = atoi(attrValue);
		}
	}
}

void GamePlayScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "cardid")) {
		id = data;
	} else if(!strcmp(parentTag.c_str(), "description")) {
		description = data;
	} else if(!strcmp(parentTag.c_str(), "gameplayercard_id")) {
		gamePlayerCardId = data;
	} else if(!strcmp(parentTag.c_str(), "thumburl")) {
		thumburl = data;
	} else if(!strcmp(parentTag.c_str(), "fronturl")) {
		fronturl = data;
	} else if(!strcmp(parentTag.c_str(), "frontflipurl")) {
		frontflipurl = data;
	} else if(!strcmp(parentTag.c_str(), "backurl")) {
		backurl = data;
	} else if(!strcmp(parentTag.c_str(), "backflipurl")) {
		backflipurl = data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg = data;
	} else if(!strcmp(parentTag.c_str(), "gameid")) {
		gameId = data;
	} else if(!strcmp(parentTag.c_str(), "stat_type")) {
		statType = data;
	} else if(!strcmp(parentTag.c_str(), "stat_description")) {
		statDescription = data;
	} else if(!strcmp(parentTag.c_str(), "cardstat_id")) {
		cardStatId = data;
	} else if(!strcmp(parentTag.c_str(), "categorystat_id")) {
		categoryStatId = data;
	} else if(!strcmp(parentTag.c_str(), "card_name")) {
		cardName = data;
	} else if(!strcmp(parentTag.c_str(), "explanation")) {
		explanation = data;
	} else if(!strcmp(parentTag.c_str(), "outcome")) {
		outcome = data;
	} else if(!strcmp(parentTag.c_str(), "message")) {
		message = data;
	} else if(!strcmp(parentTag.c_str(), "usercards")) {
		userCards = data;
	} else if(!strcmp(parentTag.c_str(), "oppcards")) {
		oppCards = data;
	} else if(!strcmp(parentTag.c_str(), "username")) {
		userName = data;
	} else if(!strcmp(parentTag.c_str(), "oppname")) {
		oppName = data;
	} else if(!strcmp(parentTag.c_str(), "lastmove")) {
		lastMove = Util::base64_encode(reinterpret_cast<const unsigned char*>(data),strlen(data));
	} else if(!strcmp(parentTag.c_str(), "active")) {
		active = (strcmp(data, "1")==0);
	} else if(!strcmp(parentTag.c_str(), "gcurl")) {
		gcCard->setBack(data);
	} else if(!strcmp(parentTag.c_str(), "gcurlflip")) {
		gcCard->setBackFlip(data);
	} else if(!strcmp(parentTag.c_str(), "creator")) {
		creator = data;
	} else if (!strcmp(parentTag.c_str(), "phase")) {
		//kinListBox->setEnabled(true);
		if (!strcmp(data, "stat")) {
			phase = P_CARD_DETAILS;
		}
		else if (!strcmp(data, "result")) {
			phase = P_RESULTS;
		}
		else if (!strcmp(data, "oppmove")) {
			phase = P_OPPMOVE;
		}
		else if (!strcmp(data, "lfm")) {
			phase = P_LFM;
		}
		else if (!strcmp(data, "confirm")) {
			phase = P_CONFIRM;
		}
		else if (!strcmp(data, "declined")) {
			phase = P_DECLINED;
		}
		else if (!strcmp(data, "closed")) {
			phase = P_CLOSED;
		}
	}
}

void GamePlayScreen::mtxTagEnd(const char* name, int len) {
	if (!strcmp(name, "usercard")) {
		if (card != NULL) {
			delete card;
			card = NULL;
		}
		card = new Card();
		card->setText(description.c_str());
		card->setThumb(thumburl.c_str());
		card->setFront(fronturl.c_str());
		card->setBack(backurl.c_str());
		card->setFrontFlip(frontflipurl.c_str());
		card->setBackFlip(backflipurl.c_str());
		card->setId(id.c_str());
		card->setGamePlayerCardId(gamePlayerCardId.c_str());
		card->setStats(cardStats);

		clearCardStats();

		id = "";
		description = "";
		thumburl = "";
		fronturl = "";
		backurl = "";
		gamePlayerCardId = "";
		frontflipurl = "";
		backflipurl = "";
	} else if (!strcmp(name, "oppcard")) {
		if (oppCard != NULL) {
			delete oppCard;
			oppCard = NULL;
		}
		oppCard = new Card();
		oppCard->setText(description.c_str());
		oppCard->setThumb(thumburl.c_str());
		oppCard->setFront(fronturl.c_str());
		oppCard->setBack(backurl.c_str());
		oppCard->setFrontFlip(frontflipurl.c_str());
		oppCard->setBackFlip(backflipurl.c_str());
		oppCard->setId(id.c_str());
		oppCard->setGamePlayerCardId(gamePlayerCardId.c_str());
		oppCard->setStats(cardStats);

		clearCardStats();

		id = "";
		description = "";
		thumburl = "";
		fronturl = "";
		backurl = "";
		gamePlayerCardId = "";
		frontflipurl = "";
		backflipurl = "";
	} else if (!strcmp(name, "cardstat")) {
		newStat = new Stat();
		newStat->setCardStatId(cardStatId.c_str());
		newStat->setDesc(statDesc.c_str());
		newStat->setDisplay(statDescription.c_str());
		newStat->setIVal(statIVal.c_str());
		newStat->setTop(statTop);
		newStat->setLeft(statLeft);
		newStat->setWidth(statWidth);
		newStat->setHeight(statHeight);
		newStat->setFrontOrBack(statFrontOrBack);
		newStat->setColorRed(statRed);
		newStat->setColorGreen(statGreen);
		newStat->setColorBlue(statBlue);
		newStat->setCategoryStatId(categoryStatId.c_str());
		cardStats.add(newStat);
		cardStatId = "";
		statDescription = "";
		statType = "";
		statDesc = "";
		statIVal = "";
		categoryStatId = "";
	} else if (!strcmp(name, "error")) {
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, "game")) {
		if (!newGame) {
			switch (phase) {
				case P_CARD_DETAILS:
					drawCardSelectStatScreen();
					break;
				case P_RESULTS:
					drawResultsScreen();
					break;
				case P_OPPMOVE:
					notice->setCaption("");
					int height = kinListBox->getHeight();
					Util::retrieveBackFlip(userImage, card, height, imageCacheUser);
					Util::retrieveBackFlip(oppImage, oppCard, height, imageCacheOpp);
					for (int i = 0; i < oppCard->getStats().size(); i++) {
						if (strcmp(oppCard->getStatAt(i)->getCategoryStatId().c_str(), categoryStatId.c_str()) == 0) {
							currentSelectedStat = i;
							break;
						}
					}
					selected = false;
					ticks = 0;
					MAUtil::Environment::getEnvironment().addTimer(this, 500, -1);
					break;
				case P_LFM:
					ticks = 0;
					ticks = 0;
					MAUtil::Environment::getEnvironment().addTimer(this, 250, -1);
					break;
				case P_CONFIRM:
					drawConfirmScreen();
					break;
				case P_DECLINED:
					drawDeclinedScreen();
					break;
			}
			busy = false;
		}
		else {
			switch (phase) {
				case P_CONFIRM:
					drawConfirmScreen();
					break;
				case P_CLOSED:
					drawClosedScreen();
					break;
			}
		}
	}
}

void GamePlayScreen::clearCardStats() {
	for (int i = 0; i < cardStats.size(); i++) {
		if (cardStats[i] != NULL) {
			cardStats[i] = NULL;
		}
	}
	cardStats.clear();
}

void GamePlayScreen::mtxParseError(int) {
}

void GamePlayScreen::mtxEmptyTagEnd() {
}

void GamePlayScreen::mtxTagStartEnd() {
}
