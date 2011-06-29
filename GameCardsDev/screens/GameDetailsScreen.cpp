#include <conprint.h>
#include <madmath.h>
#include <MAUI/Image.h>

#include "GameDetailsScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"

GameDetailsScreen::GameDetailsScreen(Feed *feed, int screenType)
		:mHttp(this), feed(feed), gameId(feed->getGameId()), screenType(screenType) {

	layout = Util::createMainLayout("Continue", "", true);
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];
	kinListBox = (KineticListBox*)layout->getChildren()[0]->getChildren()[2];

	this->setMain(layout);

	playerDeck = "";
	opponentDeck = "";
	error_msg = "";
	toPlay = "";
	display="";
	date = "";
	description = "";
	moved = 0;

	log = NULL;

	char *url = NULL;
	int urlLength;
	switch (screenType) {
		case ST_GAME_DETAILS:
			notice->setCaption("Loading game details...");

			//work out how long the url will be, the 2 is for the & and = symbals, as well as hard coded vars
			urlLength = strlen("http://dev.mytcg.net/_phone/?viewgamedetails=1") + 2 + strlen("gameid") + gameId.length();
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&%s=%s", "http://dev.mytcg.net/_phone/?viewgamedetails=1", "gameid", gameId.c_str());
			break;
		case ST_GAME_LOG:
			notice->setCaption("Loading game logs...");

			//work out how long the url will be, the 2 is for the & and = symbals, as well as hard coded vars
			urlLength = strlen("http://dev.mytcg.net/_phone/?viewgamelog=1") + 2 + strlen("gameid") + gameId.length();
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&%s=%s", "http://dev.mytcg.net/_phone/?viewgamelog=1", "gameid", gameId.c_str());
			break;
	}

	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption("Connection error.");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		mHttp.finish();
	}

	urlLength = 0;
	if (url != NULL) {
		delete [] url;
	}
}

GameDetailsScreen::~GameDetailsScreen() {
	delete layout;

	parentTag="";
	playerDeck="";
	opponentDeck="";
	toPlay="";
	error_msg="";
	display="";
	gameId="";
}

void GameDetailsScreen::drawList() {
	for(int i = 0; i < logs.size(); i++) {
		lbl = new Label(0, 0, kinListBox->getWidth()-(PADDING*2), 80, NULL,
				"", 0, Util::getFontBlack());
		lbl->setCaption((logs[i]->getDate() + ": " + logs[i]->getDescription()).c_str());
		lbl->setVerticalAlignment(Label::VA_CENTER);
		lbl->setSkin(Util::getSkinListNoArrows());
		lbl->setMultiLine(true);
		lbl->setPaddingBottom(5);
		lbl->setPaddingLeft(PADDING);
		lbl->addWidgetListener(this);
		kinListBox->add(lbl);
	}
	if (logs.size() >= 1) {
		kinListBox->setSelectedIndex(0);
	} else {
		lbl = Util::createSubLabel("Empty");
		lbl->addWidgetListener(this);
		kinListBox->add(lbl);
	}
}

#if defined(MA_PROF_SUPPORT_STYLUS)
void GameDetailsScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void GameDetailsScreen::pointerMoveEvent(MAPoint2d point)
{
	moved++;
    locateItem(point);
}

void GameDetailsScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		}
	}
	moved= 0;
}

void GameDetailsScreen::locateItem(MAPoint2d point)
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

void GameDetailsScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
			break;
		case MAK_SOFTRIGHT:
		case MAK_BACK:
			break;
		case MAK_SOFTLEFT:
			orig->show();
			break;
		case MAK_UP:
			kinListBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			kinListBox->selectNextItem();
			break;
	}
}

void GameDetailsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(Util::getFontBlue());
	} else {
		((Label *)widget)->setFont(Util::getFontBlack());
	}
}

void GameDetailsScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
	}
}

void GameDetailsScreen::connReadFinished(Connection* conn, int result) {}

void GameDetailsScreen::xcConnError(int code) {
}

void GameDetailsScreen::mtxEncoding(const char* ) {
}

void GameDetailsScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void GameDetailsScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void GameDetailsScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "turn")) {
		toPlay += data;
	} else if(!strcmp(parentTag.c_str(), "playerdeck")) {
		playerDeck += data;
	} else if(!strcmp(parentTag.c_str(), "opponentdeck")) {
		opponentDeck += data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), "date")) {
		date += data;
	} else if(!strcmp(parentTag.c_str(), "description")) {
		description += data;
	}
}

void GameDetailsScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "gamedetails")) {
		lbl = new Label(0, 0, 0, 0, NULL);
		lbl->setAutoSizeX(true);
		lbl->setAutoSizeY(true);
		lbl->setMultiLine(true);
		lbl->setFont(Util::getFontBlack());

		display = "To play: " + toPlay;
		display += "\n\nRemaining Cards:\nYou: "+playerDeck+"\nOpponent: "+opponentDeck;

		lbl->setCaption(display);
		notice->setCaption("");
		kinListBox->add(lbl);
	}
	else if (!strcmp(name, "log")) {
		log = new Log(date.c_str(), description.c_str());
		logs.add(log);

		date = "";
		description = "";
	}
	else if (!strcmp(name, "logs")) {
		drawList();
		notice->setCaption("");
	}
}

void GameDetailsScreen::mtxParseError() {
}

void GameDetailsScreen::mtxEmptyTagEnd() {
}

void GameDetailsScreen::mtxTagStartEnd() {
}
