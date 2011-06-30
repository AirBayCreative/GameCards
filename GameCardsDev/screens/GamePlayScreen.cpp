#include <conprint.h>
#include <mastdlib.h>

#include "GamePlayScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"
#include "ImageScreen.h"
#include "OptionsScreen.h"

//in the case of a new game, identifier is the categoryId. For an existing game, it is the gameId.
GamePlayScreen::GamePlayScreen(Screen *previous, Feed *feed, bool newGame, String identifier, String newGameType) : mHttp(this),
		previous(previous), feed(feed), newGame(newGame) {

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

	feedLayouts = NULL;
	next = NULL;

	busy = false;
	flip = false;
	active = false;
	checking = false;

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

	imageCache = new ImageCache();

	mainLayout = Util::createMainLayout("", "Back", "", true);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setDrawBackground(true);

	listBox->setHeight(listBox->getHeight() - 20);

	phase = P_LOADING;

	char *url;
	if (newGame) {
		categoryId = identifier;

		notice->setCaption("Initialising new game...");

		//work out how long the url will be, the 4 is for the & and = symbals
		int urlLength = strlen("http://dev.mytcg.net/_phone/?newgame=1") + 19 + strlen("categoryid") + categoryId.length() + strlen("newgametype") +
				newGameType.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
		url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s&%s=%s&%s=%s&height=%d&width=%d", "http://dev.mytcg.net/_phone/?newgame=1", "categoryid",
				categoryId.c_str(), "newgametype", newGameType.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
	}
	else {
		gameId = identifier;
		notice->setCaption("Loading game...");

		//work out how long the url will be, the 17 is for the & and = symbals, as well as hard coded vars
		int urlLength = strlen("http://dev.mytcg.net/_phone/?loadgame=1") + 17 + strlen("gameid") + gameId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
		url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s&%s=%s&height=%d&width=%d", "http://dev.mytcg.net/_phone/?loadgame=1", "gameid",
				gameId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
	}
	lprintfln(url);
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
	delete [] url;
	this->setMain(mainLayout);

	moved=0;

	orig = this;
}

void GamePlayScreen::clearListBox() {
	imageCache->clearImageCache();

	for (int i = 0; i < listBox->getChildren().size(); i++) {
		tempWidgets.add(listBox->getChildren()[i]);
	}
	listBox->clear();
	listBox->getChildren().clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
}

void GamePlayScreen::drawResultsScreen() {
	MAUtil::Environment::getEnvironment().removeTimer(this);
	lprintfln("drawResultsScreen");
	clearListBox();

	Util::updateSoftKeyLayout("Continue", "Options", "", mainLayout);

	notice->setCaption("");
	Label *lbl = new Label(0, 0, scrWidth-(PADDING*2), 0, NULL);
	lbl->setFont(Util::getDefaultFont());
	lbl->setAutoSizeY(true);
	lbl->setMultiLine(true);

	lbl->setCaption("Match Results:");

	String display = explanation;
	listBox->add(lbl);

	lbl = new Label(0, 0, scrWidth-(PADDING*2), 0, NULL);
	lbl->setFont(Util::getDefaultFont());
	lbl->setAutoSizeY(true);
	lbl->setMultiLine(true);
	lbl->setCaption(display);
	listBox->add(lbl);

	explanation = "";
}

void GamePlayScreen::drawCardSelectStatScreen() {
	lprintfln("drawCardSelectStatScreen");
	MAUtil::Environment::getEnvironment().removeTimer(this);
	currentSelectedStat = -1;

	imageCache->clearImageCache();
	listBox->setEnabled(false);
	phase = P_CARD_DETAILS;

	storeHeight = mainLayout->getChildren()[0]->getChildren()[0]->getHeight();
	mainLayout->getChildren()[0]->getChildren()[0]->setHeight(0);
	listBox->setHeight(scrHeight-(mainLayout->getChildren()[1]->getHeight()));
	listBox->setPosition(0, 0);

	flip = true;

	if (!active && phase == P_CARD_DETAILS) {
		notice->setCaption("Opponent is making choices...");
	}
	else {
		notice->setCaption("");
	}
	clearListBox();

	Util::updateSoftKeyLayout(active?"Play Stat":"", "Options", "", mainLayout);

	int height = listBox->getHeight();
	String lblString = "User: ";
	lblString += userCards;
	lblString += " cards, ";
	lblString += active?"Select a stat":"Waiting";
	Label *userLabel = new Label(0, 0, scrWidth - PADDING*2, 0, listBox, lblString,0,Util::getDefaultFont());
	userLabel->setAutoSizeY(true);
	userImage = new MobImage(0, 0, scrWidth-PADDING*2, height/2, listBox, false, false, RES_LOADING_FLIP);
	Util::retrieveBackFlip(userImage, card, height-PADDING*2, imageCache);

	//if the opponent is active, we can draw the front of their card. If the user is active, we draw a generic card
	oppImage = new MobImage(0, 0, scrWidth-PADDING*2, height/2, listBox, false, false, RES_LOADING_FLIP);
	lblString = "Opponent: ";
	lblString += oppCards;
	lblString += " cards, ";
	lblString += (!active)?"Selecting stat...":"Waiting";
	userLabel = new Label(0, 0, scrWidth - PADDING*2, 0, listBox, lblString,0,Util::getDefaultFont());
	userLabel->setAutoSizeY(true);
	if (!active) {
		Util::retrieveFrontFlip(oppImage, oppCard, height-PADDING*2, imageCache);
	}
	else {
		Util::retrieveBackFlip(oppImage, gcCard, height-PADDING*2, imageCache);
	}
}

void GamePlayScreen::drawLFMScreen() {
	lprintfln("drawLFMScreen");
	if (ticks == 0) {
		clearListBox();
		userImage = new MobImage(0, 0, scrWidth-PADDING*2, listBox->getHeight(), listBox, false, false, RES_LOADING);
		Util::retrieveBack(oppImage, gcCard, listBox->getHeight()-PADDING*2, imageCache);
		Util::updateSoftKeyLayout("", "Back", "", mainLayout);
	}

	String caption = "Looking for opponent";
	for (int i = 0; i < ticks; i++) {
		caption+=".";
	}
	notice->setCaption(caption);
}

#if defined(MA_PROF_SUPPORT_STYLUS)
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
				} else if (active) {
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
#endif
GamePlayScreen::~GamePlayScreen() {
	delete mainLayout;

	if (next != NULL) {
		delete next;
		next = NULL;
	}
	delete imageCache;

	delete [] feedLayouts;

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
}

void GamePlayScreen::selectionChanged(Widget *widget, bool selected) {
}

void GamePlayScreen::show() {
	Screen::show();
}

void GamePlayScreen::hide() {
	Screen::hide();
}

void GamePlayScreen::keyPressEvent(int keyCode) {
	int selected = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_LEFT:
		case MAK_RIGHT:
			switch(phase){
				case P_CARD_DETAILS:
					flip = !flip;
					int height = listBox->getHeight();
					if (userImage->getResource() != RES_LOADING_FLIP && userImage->getResource() != RES_TEMP) {
						maDestroyObject(userImage->getResource());
					}
					userImage->setResource(RES_LOADING_FLIP);
					userImage->update();
					userImage->requestRepaint();
					maUpdateScreen();
					if (flip) {
						Util::retrieveBackFlip(userImage, card, height-PADDING*2, imageCache);
					}
					else {
						Util::retrieveFrontFlip(userImage, card, height-PADDING*2, imageCache);
					}
					currentSelectedStat=-1;
					break;
			}
			break;
		case MAK_UP:
			switch (phase) {
				case P_CARD_DETAILS:
					if (userImage->getResource() != RES_LOADING_FLIP && userImage->getResource() != RES_TEMP && active) {
						if(card->getStats().size()>0){
							if(flip==card->getStats()[0]->getFrontOrBack()){
								currentSelectedStat--;
								if(currentSelectedStat < 0){
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
		case MAK_DOWN:
			switch (phase) {
				case P_CARD_DETAILS:
					if (userImage->getResource() != RES_LOADING_FLIP && userImage->getResource() != RES_TEMP && active) {
						if(card->getStats().size()>0){
							if(flip==card->getStats()[0]->getFrontOrBack()){
								if(currentSelectedStat < card->getStats().size()-1){
									currentSelectedStat++;
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
			switch (phase) {
				case P_LOADING:
					previous->show();
					break;
				case P_LFM:
					MAUtil::Environment::getEnvironment().removeTimer(this);
					previous->show();
					break;
				/*case P_CARD_DETAILS:
					resetHeights();
					drawCardListScreen(cardIndex, yOffset);
					break;*/
				default:
					if (next != NULL) {
						delete next;
						next = NULL;
					}
					feed->setGameId(gameId.c_str());
					next = new OptionsScreen(feed, OptionsScreen::ST_GAME_OPTIONS, this);
					next->show();
					break;
			}
			break;
		case MAK_FIRE:
			switch (phase) {
				case P_CARD_DETAILS:
					if (flipOrSelect) {
						flip = !flip;
						int height = listBox->getHeight();
						if (userImage->getResource() != RES_LOADING_FLIP && userImage->getResource() != RES_TEMP) {
							maDestroyObject(userImage->getResource());
						}
						userImage->setResource(RES_LOADING_FLIP);
						userImage->update();
						userImage->requestRepaint();
						maUpdateScreen();
						if (flip) {
							Util::retrieveBackFlip(userImage, card, height-PADDING*2, imageCache);
						}
						else {
							Util::retrieveFrontFlip(userImage, card, height-PADDING*2, imageCache);
						}
						flipOrSelect=0;
						currentSelectedStat=-1;
					} else if (active) {
						if (userImage->getResource() != RES_LOADING_FLIP && userImage->getResource() != RES_TEMP) {
							if(currentSelectedStat>-1){
								if(flip==card->getStats()[currentSelectedStat]->getFrontOrBack()){
									userImage->refreshWidget();
									userImage->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),
											card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(),
											card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(),
											card->getStats()[currentSelectedStat]->getColorBlue(), MobImage::LANDSCAPE);

									selectStat(currentSelectedStat);
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
				int urlLength, res;
				char *url = NULL;
				switch (phase) {
					case P_CARD_DETAILS:
						if(currentSelectedStat>-1){
							selectStat(currentSelectedStat);
						}
						break;
					case P_RESULTS:
						origMenu->show();
						break;
				}
				urlLength = 0;
				res = 0;
				if (url != NULL) {
					delete url;
				}
			}
			break;

	}
}

void GamePlayScreen::runTimerEvent() {
	lprintfln("runTimerEvent currentSelectedStat: %d", currentSelectedStat);
	lprintfln("runTimerEvent 1");
	if (phase == P_LFM) {
		lprintfln("runTimerEvent 1.1");
		drawLFMScreen();
		ticks = ticks>3?1:ticks+1;
		lfmTicks++;
	}
	lprintfln("runTimerEvent 2");
	if ((!active && phase == P_CARD_DETAILS) || (!checking && lfmTicks%12 == 0)) {
		lprintfln("runTimerEvent 2.1");
		checking = true;
		lprintfln("checking");
		//work out how long the url will be, the 19 is for the & and = symbals, as well as hard coded vars
		int urlLength = strlen("http://dev.mytcg.net/_phone/?continuegame=1") + 19 + strlen("gameid") + gameId.length() + strlen("lastmove") + lastMove.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
		char *url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s&%s=%s&%s=%s&height=%d&width=%d", "http://dev.mytcg.net/_phone/?continuegame=1",
				"gameid", gameId.c_str(), "lastmove", lastMove.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
		lprintfln(url);
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
		delete [] url;
		return;
	}
	lprintfln("runTimerEvent 3");
	if (phase == P_LFM) {
		lprintfln("runTimerEvent 3.1");
		return;
	}
	lprintfln("runTimerEvent 4");
	ticks++;
	if (oppImage != NULL && userImage != NULL && currentSelectedStat >= 0) {
		lprintfln("runTimerEvent 4.1");
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
			listBox->requestRepaint();
			selected = false;
		}
	}
	lprintfln("runTimerEvent 5");
	if (phase == P_OPPMOVE && ticks > 6) {
		lprintfln("runTimerEvent 5.1");
		MAUtil::Environment::getEnvironment().removeTimer(this);
		ticks = 0;
		//work out how long the url will be, the 17 is for the & and = symbals, as well as hard coded vars
		int urlLength = strlen("http://dev.mytcg.net/_phone/?loadgame=1") + 17 + strlen("gameid") + gameId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
		char *url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s&%s=%s&height=%d&width=%d", "http://dev.mytcg.net/_phone/?loadgame=1", "gameid",
			gameId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
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
		delete [] url;
	}
}

void GamePlayScreen::resetHeights() {
	mainLayout->getChildren()[0]->getChildren()[0]->setHeight(storeHeight);
	listBox->setHeight(scrHeight-(mainLayout->getChildren()[1]->getHeight()+storeHeight + 20));
}

void GamePlayScreen::selectStat(int selected) {
	lprintfln("selectStat currentSelectedStat: %d", currentSelectedStat);
	char *url = NULL;
	int urlLength = 0;
	int res = 0;
	//currentSelectedStat = -1;
	listBox->setEnabled(true);

	int height = listBox->getHeight();
	Util::retrieveBackFlip(oppImage, oppCard, height-PADDING*2, imageCache);

	//notice->setCaption("Checking outcome...");

	//work out how long the url will be, the 19 is for the & and = symbals, as well as the hard coded params
	urlLength = strlen("http://dev.mytcg.net/_phone/?selectstat=1") + 19 + strlen("gameid") + gameId.length() +
			strlen("statid") + card->getStats()[selected]->getCardStatId().length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
	url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s&%s=%s&%s=%s&height=%d&width=%d", "http://dev.mytcg.net/_phone/?selectstat=1", "gameid", gameId.c_str(),
			"statid", card->getStats()[selected]->getCardStatId().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
	lprintfln(url);
	//clearListBox();

	/*if(mHttp.isOpen()){
		mHttp.close();
	}*/

	selected = false;
	lprintfln("addTimer 1");
	MAUtil::Environment::getEnvironment().addTimer(this, 500, 6);

	//clearCardStats();

	mHttp = HttpConnection(this);
	res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		hasConnection = false;
		notice->setCaption("Connection error.");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		mHttp.finish();
	}

	delete url;
}

void GamePlayScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	error_msg = "";
	if (result == 200) {
		clearCardStats();

		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();

		notice->setCaption("Unable to connect, try again later...");
	}
}

void GamePlayScreen::connReadFinished(Connection* conn, int result) {
}

void GamePlayScreen::connRecvFinished(Connection* conn, int result) {
}

void GamePlayScreen::xcConnError(int code) {
	lprintfln("xcConnError");
	char *url;
	if (newGame) {
		lprintfln("xcConnError 1");
		if (newGame) {
			notice->setCaption("Loading game...");
		}
		newGame = false;

		//work out how long the url will be, the 17 is for the & and = symbals, as well as hard coded vars
		int urlLength = strlen("http://dev.mytcg.net/_phone/?loadgame=1") + 17 + strlen("gameid") + gameId.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
		url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s&%s=%s&height=%d&width=%d", "http://dev.mytcg.net/_phone/?loadgame=1",
				"gameid", gameId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());

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
		delete [] url;
	}
	else if (!active && phase == P_CARD_DETAILS) {
		lprintfln("xcConnError 2");
		notice->setCaption("Opponent is making choices...");
		lprintfln("addTimer 2");
		MAUtil::Environment::getEnvironment().addTimer(this, 3000, 1);
	}
	else if (phase == P_LFM) {
		lprintfln("xcConnError 3");
		checking = false;
	}
}

void GamePlayScreen::mtxEncoding(const char* ) {
}

void GamePlayScreen::mtxTagStart(const char* name, int len) {
	lprintfln("mtxTagStart: %s", name);
	parentTag = name;
}

void GamePlayScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
	lprintfln("attrName: %s", attrName);
	lprintfln("attrValue: %s", attrValue);
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
	lprintfln("mtxTagData: %s", data);
	if(!strcmp(parentTag.c_str(), "cardid")) {
		id += data;
	} else if(!strcmp(parentTag.c_str(), "description")) {
		description += data;
	} else if(!strcmp(parentTag.c_str(), "gameplayercard_id")) {
		gamePlayerCardId += data;
	} else if(!strcmp(parentTag.c_str(), "thumburl")) {
		thumburl += data;
	} else if(!strcmp(parentTag.c_str(), "fronturl")) {
		fronturl += data;
	} else if(!strcmp(parentTag.c_str(), "frontflipurl")) {
		frontflipurl += data;
	} else if(!strcmp(parentTag.c_str(), "backurl")) {
		backurl += data;
	} else if(!strcmp(parentTag.c_str(), "backflipurl")) {
		backflipurl += data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), "gameid")) {
		gameId += data;
	} else if(!strcmp(parentTag.c_str(), "stat_type")) {
		statType += data;
	} else if(!strcmp(parentTag.c_str(), "stat_description")) {
		statDescription += data;
	} else if(!strcmp(parentTag.c_str(), "cardstat_id")) {
		cardStatId += data;
	} else if(!strcmp(parentTag.c_str(), "categorystat_id")) {
		categoryStatId += data;
	} else if(!strcmp(parentTag.c_str(), "card_name")) {
		cardName += data;
	} else if(!strcmp(parentTag.c_str(), "explanation")) {
		explanation += data;
	} else if(!strcmp(parentTag.c_str(), "outcome")) {
		outcome += data;
	} else if(!strcmp(parentTag.c_str(), "message")) {
		message += data;
	} else if(!strcmp(parentTag.c_str(), "usercards")) {
		userCards = data;
	} else if(!strcmp(parentTag.c_str(), "oppcards")) {
		oppCards = data;
	} else if(!strcmp(parentTag.c_str(), "lastmove")) {
		lastMove = Util::base64_encode(reinterpret_cast<const unsigned char*>(data),strlen(data));
	} else if(!strcmp(parentTag.c_str(), "active")) {
		active = (strcmp(data, "1")==0);
	} else if(!strcmp(parentTag.c_str(), "gcurl")) {
		gcCard->setBack(data);
		lprintfln("gcurl: %s", data);
	} else if(!strcmp(parentTag.c_str(), "gcurlflip")) {
		gcCard->setBackFlip(data);
		lprintfln("gcurlflip: %s", data);
	} else if (!strcmp(parentTag.c_str(), "phase")) {
		listBox->setEnabled(true);
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
	}
}

void GamePlayScreen::mtxTagEnd(const char* name, int len) {
	lprintfln("mtxTagEnd: %s", name);
	if (!strcmp(name, "usercard")) {
		if (card == NULL) {
			//delete card;
			card = new Card();
		}

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
		if (oppCard == NULL) {
			//delete card;
			oppCard = new Card();
		}

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
			busy = false;
			switch (phase) {
				case P_CARD_DETAILS:
					drawCardSelectStatScreen();
					break;
				case P_RESULTS:
					drawResultsScreen();
					break;
				case P_OPPMOVE:
					notice->setCaption("");
					int height = listBox->getHeight();
					Util::retrieveBackFlip(userImage, card, height, imageCache);
					Util::retrieveBackFlip(oppImage, oppCard, height, imageCache);
					for (int i = 0; i < oppCard->getStats().size(); i++) {
						if (strcmp(oppCard->getStatAt(i)->getCategoryStatId().c_str(), categoryStatId.c_str()) == 0) {
							currentSelectedStat = i;
							break;
						}
					}
					selected = false;
					lprintfln("addTimer 3");
					MAUtil::Environment::getEnvironment().addTimer(this, 500, -1);
					break;
				case P_LFM:
					ticks = 0;
					lprintfln("addTimer 4");
					MAUtil::Environment::getEnvironment().addTimer(this, 250, -1);
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

void GamePlayScreen::mtxParseError() {
}

void GamePlayScreen::mtxEmptyTagEnd() {
}

void GamePlayScreen::mtxTagStartEnd() {
}
