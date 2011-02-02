#include <conprint.h>

#include "GamePlayScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"
#include "ImageScreen.h"
#include "TradeOptionsScreen.h"

//in the case of a new game, identifier is the categoryId. For an existing game, it is the gameId.
GamePlayScreen::GamePlayScreen(Screen *previous, Feed *feed, bool newGame, String identifier) : mHttp(this),
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
	userScore = "";
	opponentScore = "";
	explanation = "";
	outcome = "";

	feedLayouts = NULL;
	next = NULL;

	busy = false;

	mImageCache = new ImageCache();

	if (feed->getTouchEnabled()) {
		mainLayout = createMainLayout(back, "", "", true);
	} else {
		mainLayout = createMainLayout(back, "", "", true);
	}
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setDrawBackground(true);

	listBox->setHeight(listBox->getHeight() - 20);

	phase = P_LOADING;

	char *url;
	if (newGame) {
		categoryId = identifier;

		notice->setCaption(initialising_game);

		//work out how long the url will be, the 2 is for the & and = symbals
		int urlLength = NEWGAME.length() + 2 + strlen(category_id) + categoryId.length();
		url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s&%s=%s", NEWGAME.c_str(), category_id, categoryId.c_str());
	}
	else {
		gameId = identifier;

		notice->setCaption(loading_game);

		//work out how long the url will be, the 17 is for the & and = symbals, as well as hard coded vars
		int urlLength = LOADGAME.length() + 17 + strlen(game_id) + gameId.length() + intlen(scrHeight) + intlen(scrWidth);
		url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s&%s=%s&heigth=%d&width=%d", LOADGAME.c_str(), game_id, gameId.c_str(), scrHeight, scrWidth);
	}

	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		hasConnection = false;
		notice->setCaption("Connection error.");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;
	this->setMain(mainLayout);

	moved=0;

	orig = this;
}

void GamePlayScreen::clearListBox() {
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

void GamePlayScreen::drawCardList() {
	Layout *feedlayout;
	index.clear();
	for(StringCardMap::Iterator itr = cards.begin(); itr != cards.end(); itr++) {
		index.add(itr->second->getGamePlayerCardId());
		cardText = itr->second->getText();

		feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 2, 1);
		feedlayout->setSkin(gSkinAlbum);
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		tempImage = new Image(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

		retrieveThumb(tempImage, itr->second, mImageCache);

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, gFontWhite);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setMultiLine(true);
	}
	if (listBox->getChildren().size() > 0) {
		listBox->setSelectedIndex(0);
	}
}

void GamePlayScreen::drawStatList() {
	for(int i = 0; i < cardStats.size(); i++) {
		label = createSubLabel(cardStats[i]->getStatType() + " : " + cardStats[i]->getStatDescription());
		label->setPaddingBottom(5);
		label->addWidgetListener(this);
		listBox->add(label);
	}

	if (cardStats.size() >= 1) {
		listBox->setSelectedIndex(0);
	} else {
		label = createSubLabel(empty);
		label->addWidgetListener(this);
		listBox->add(label);
	}
}

void GamePlayScreen::drawCardListScreen() {
	phase = P_SELECT_CARD;

	clearListBox();

	updateSoftKeyLayout(options, select, details, mainLayout);

	notice->setCaption(select_card);

	drawCardList();
}

void GamePlayScreen::drawStatListScreen() {
	phase = P_SELECT_STAT;

	clearListBox();

	updateSoftKeyLayout(options, select, "", mainLayout);

	String display = "Card chosen: " + cardName + "\n";
	display.append(select_stat, strlen(select_stat));

	notice->setCaption(display);

	drawStatList();
}

void GamePlayScreen::drawResultsScreen() {
	clearListBox();

	updateSoftKeyLayout("", continuelbl, "", mainLayout);

	notice->setCaption("");
	Label *lbl = new Label(0, 0, scrWidth-(PADDING*2), 0, NULL);
	lbl->setAutoSizeY(true);
	lbl->setMultiLine(true);

	String display = "";
	if (phase == P_FINISHED) {
		lbl->setCaption("Final score");
		display += "Scores\nYou: "+userScore+"\nOpponent: "+opponentScore;
		display += "\nResult: " + outcome;
	}
	else {
		lbl->setCaption("Turn results");

		display = explanation;
		display += "\n\nScores\nYou: "+userScore+"\nOpponent: "+opponentScore;
	}
	listBox->add(lbl);

	lbl = new Label(0, 0, scrWidth-(PADDING*2), 0, NULL);
	lbl->setAutoSizeY(true);
	lbl->setMultiLine(true);
	lbl->setCaption(display);
	listBox->add(lbl);

	userScore = "";
	opponentScore = "";
	explanation = "";
}

void GamePlayScreen::pointerPressEvent(MAPoint2d point) {
    locateItem(point);
}

void GamePlayScreen::pointerMoveEvent(MAPoint2d point) {
    locateItem(point);
    moved++;
}

void GamePlayScreen::pointerReleaseEvent(MAPoint2d point) {
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
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
	for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
		{
			list = true;
		}
	}
	for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
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
	delete mainLayout;

	delete next;
	delete mImageCache;

	delete [] feedLayouts;

	clearCardMap();
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
}

void GamePlayScreen::selectionChanged(Widget *widget, bool selected) {
	if (phase == P_SELECT_CARD) {
		if(selected) {
			((Label *)widget->getChildren()[1])->setFont(gFontBlue);
		} else {
			((Label *)widget->getChildren()[1])->setFont(gFontWhite);
		}
	}
	else if (phase == P_SELECT_STAT) {
		if(selected) {
			((Label *)widget)->setFont(gFontBlue);
		} else {
			((Label *)widget)->setFont(gFontGrey);
		}
	}
}

void GamePlayScreen::show() {
	if (phase == P_SELECT_CARD || phase == P_SELECT_STAT) {
		listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	}
	Screen::show();

	if (next != NULL) {
		delete next;
		next = NULL;
	}
}

void GamePlayScreen::hide() {
	if (phase == P_SELECT_CARD || phase == P_SELECT_STAT) {
		listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	}
	Screen::hide();
}

void GamePlayScreen::keyPressEvent(int keyCode) {
	int selected = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_UP:
			switch (phase) {
				case P_SELECT_CARD:
					listBox->selectPreviousItem();
					break;
				case P_SELECT_STAT:
					listBox->selectPreviousItem();
					break;
			}
			break;
		case MAK_DOWN:
			switch (phase) {
				case P_SELECT_CARD:
					listBox->selectNextItem();
					break;
				case P_SELECT_STAT:
					listBox->selectNextItem();
					break;
			}
			break;
		case MAK_SOFTLEFT:
			switch (phase) {
				case P_LOADING:
					previous->show();
					break;
				default:
					if (next != NULL) {
						delete next;
						next = NULL;
					}
					feed->setGameId(gameId.c_str());
					next = new TradeOptionsScreen(this, feed, TradeOptionsScreen::ST_GAME_OPTIONS);
					next->show();
					break;
			}
			break;
		case MAK_FIRE:
			switch (phase) {
				case P_SELECT_CARD:
					if (next != NULL) {
						delete next;
					}
					next = new ImageScreen(this, RES_LOADING, feed, false, cards.find(index[selected])->second, true, false);
					next->show();
					break;
			}
			break;
		case MAK_SOFTRIGHT:
			char *url = NULL;
			int urlLength = 0;
			int res = 0;
			switch (phase) {
				case P_SELECT_CARD:
					phase = P_SELECT_STAT;

					notice->setCaption("Loading stats...");

					cardName = "";

					//work out how long the url will be, the 4 is for the & and = symbals
					urlLength = SELECTCARD.length() + 4 + strlen(game_id) + gameId.length() +
							strlen(game_player_card_id) + index[selected].length();
					url = new char[urlLength];
					memset(url,'\0',urlLength);
					sprintf(url, "%s&%s=%s&%s=%s", SELECTCARD.c_str(), game_id, gameId.c_str(), game_player_card_id, index[selected].c_str());

					clearCardStats();
					clearListBox();

					mHttp = HttpConnection(this);
					res = mHttp.create(url, HTTP_GET);
					if(res < 0) {
						hasConnection = false;
						notice->setCaption("Connection error.");
					} else {
						hasConnection = true;
						mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
						mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
						mHttp.finish();
					}
					break;
				case P_SELECT_STAT:
					phase = P_RESULTS;

					notice->setCaption("Checking outcome...");

					//work out how long the url will be, the 4 is for the & and = symbals
					urlLength = SELECTSTAT.length() + 4 + strlen(game_id) + gameId.length() +
							strlen(stat_id) + cardStats[selected]->getCardStatId().length();
					url = new char[urlLength];
					memset(url,'\0',urlLength);
					sprintf(url, "%s&%s=%s&%s=%s", SELECTSTAT.c_str(), game_id, gameId.c_str(), stat_id, cardStats[selected]->getCardStatId().c_str());

					clearCardStats();
					clearListBox();

					mHttp = HttpConnection(this);
					res = mHttp.create(url, HTTP_GET);
					if(res < 0) {
						hasConnection = false;
						notice->setCaption("Connection error.");
					} else {
						hasConnection = true;
						mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
						mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
						mHttp.finish();
					}
					break;
				case P_RESULTS:
					notice->setCaption("Loading remaining cards...");

					//work out how long the url will be, the 17 is for the & and = symbals, as well as hard coded vars
					urlLength = LOADGAME.length() + 17 + strlen(game_id) + gameId.length() + intlen(scrHeight) + intlen(scrWidth);
					url = new char[urlLength];
					memset(url,'\0',urlLength);
					sprintf(url, "%s&%s=%s&heigth=%d&width=%d", LOADGAME.c_str(), game_id, gameId.c_str(), scrHeight, scrWidth);

					clearCardMap();
					clearListBox();

					mHttp = HttpConnection(this);
					res = mHttp.create(url, HTTP_GET);
					if(res < 0) {
						hasConnection = false;
						notice->setCaption("Connection error.");
					} else {
						hasConnection = true;
						mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
						mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
						mHttp.finish();
					}
					break;
				case P_FINISHED:
					origMenu->show();
					break;
			}
			if (url != NULL) {
				delete url;
			}
			break;
	}
}

void GamePlayScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	error_msg = "";
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption("");
	}
}

void GamePlayScreen::connReadFinished(Connection* conn, int result) {
}

void GamePlayScreen::connRecvFinished(Connection* conn, int result) {
}

void GamePlayScreen::xcConnError(int code) {
	if (newGame) {
		newGame = false;

		notice->setCaption(loading_game);

		//work out how long the url will be, the 17 is for the & and = symbals, as well as hard coded vars
		int urlLength = LOADGAME.length() + 17 + strlen(game_id) + gameId.length() + intlen(scrHeight) + intlen(scrWidth);
		char *url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s&%s=%s&heigth=%d&width=%d", LOADGAME.c_str(), game_id, gameId.c_str(), scrHeight, scrWidth);

		mHttp = HttpConnection(this);
		int res = mHttp.create(url, HTTP_GET);
		if(res < 0) {
			hasConnection = false;
			notice->setCaption("Connection error.");
		} else {
			hasConnection = true;
			mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
			mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
			mHttp.finish();
		}
		delete [] url;
	}
}

void GamePlayScreen::mtxEncoding(const char* ) {
}

void GamePlayScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void GamePlayScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void GamePlayScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), xml_cardid)) {
		id += data;
	} else if(!strcmp(parentTag.c_str(), xml_carddescription)) {
		description += data;
	} else if(!strcmp(parentTag.c_str(), xml_gameplayercard_id)) {
		gamePlayerCardId += data;
	} else if(!strcmp(parentTag.c_str(), xml_thumburl)) {
		thumburl += data;
	} else if(!strcmp(parentTag.c_str(), xml_fronturl)) {
		fronturl += data;
	} else if(!strcmp(parentTag.c_str(), xml_backurl)) {
		backurl += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), xml_game_id)) {
		gameId += data;
	} else if(!strcmp(parentTag.c_str(), xml_stat_type)) {
		statType += data;
	} else if(!strcmp(parentTag.c_str(), xml_stat_description)) {
		statDescription += data;
	} else if(!strcmp(parentTag.c_str(), xml_cardstat_id)) {
		cardStatId += data;
	} else if(!strcmp(parentTag.c_str(), xml_card_name)) {
		cardName += data;
	} else if(!strcmp(parentTag.c_str(), xml_player_score)) {
		userScore += data;
	} else if(!strcmp(parentTag.c_str(), xml_opponent_score)) {
		opponentScore += data;
	} else if(!strcmp(parentTag.c_str(), xml_explanation)) {
		explanation += data;
	} else if(!strcmp(parentTag.c_str(), xml_outcome)) {
		outcome += data;
	} else if (!strcmp(parentTag.c_str(), xml_phase)) {
		if (!strcmp(data, phase_card)) {
			phase = P_SELECT_CARD;
		}
		else if (!strcmp(data, phase_stat)) {
			phase = P_SELECT_STAT;
		}
		else if (!strcmp(data, phase_result)) {
			phase = P_RESULTS;
		}
		else if (!strcmp(data, phase_finished)) {
			phase = P_FINISHED;
		}
	}
}

void GamePlayScreen::mtxTagEnd(const char* name, int len) {
	if (!strcmp(name, xml_backurl)) {
		Card *newCard = new Card();
		newCard->setText(description.c_str());
		newCard->setThumb(thumburl.c_str());
		newCard->setFront(fronturl.c_str());
		newCard->setBack(backurl.c_str());
		newCard->setId(id.c_str());
		newCard->setGamePlayerCardId(gamePlayerCardId.c_str());
		cards.insert(newCard->getGamePlayerCardId(),newCard);
		id = "";
		description = "";
		thumburl = "";
		fronturl = "";
		backurl = "";
		gamePlayerCardId = "";
	} else if (!strcmp(name, xml_cardstat_id)) {
		CardStat *newStat = new CardStat(cardStatId.c_str(),
				statDescription.c_str(), statType.c_str());
		cardStatId = "";
		statDescription = "";
		statType = "";

		cardStats.add(newStat);
	} else if (!strcmp(name, xml_error)) {
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, xml_game) || !strcmp(name, xml_cardstats) || !strcmp(name, xml_results)) {
		if (!newGame) {
			switch (phase) {
				case P_SELECT_CARD:
					drawCardListScreen();
					break;
				case P_SELECT_STAT:
					drawStatListScreen();
					break;
				case P_RESULTS:
					drawResultsScreen();
					break;
				case P_FINISHED:
					drawResultsScreen();
					break;
			}
		}
	} else {
		notice->setCaption("");
	}
}

void GamePlayScreen::clearCardMap() {
	for (StringCardMap::Iterator iter = cards.begin(); iter != cards.end(); iter++) {
		if (iter->second != NULL) {
			delete iter->second;
			iter->second = NULL;
		}
	}
	cards.clear();
}

void GamePlayScreen::clearCardStats() {
	for (int i = 0; i < cardStats.size(); i++) {
		if (cardStats[i] != NULL) {
			delete cardStats[i];
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
