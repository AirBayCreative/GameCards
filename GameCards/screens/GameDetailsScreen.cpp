#include <conprint.h>
#include <madmath.h>
#include <MAUI/Image.h>

#include "GameDetailsScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"

GameDetailsScreen::GameDetailsScreen(Feed *feed)
		:mHttp(this), feed(feed), gameId(feed->getGameId()) {

	layout = createMainLayout("", continuelbl, true);
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];
	kinListBox = (KineticListBox*)layout->getChildren()[0]->getChildren()[2];

	notice->setCaption("Loading game details...");

	this->setMain(layout);

	playerScore = "";
	opponentScore = "";
	error_msg = "";
	progress = "";
	toPlay = "";
	display="";
	moved = 0;

	char *url;
	//work out how long the url will be, the 2 is for the & and = symbals, as well as hard coded vars
	int urlLength = GAMEDETAILS.length() + 2 + strlen(game_id) + gameId.length();
	url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s&%s=%s", GAMEDETAILS.c_str(), game_id, gameId.c_str());

	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption("Connection error.");
	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;
}

GameDetailsScreen::~GameDetailsScreen() {
	delete layout;

	parentTag="";
	playerScore="";
	opponentScore="";
	progress="";
	toPlay="";
	error_msg="";
	display="";
	gameId="";
}

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

void GameDetailsScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
			break;
		case MAK_SOFTRIGHT:
			orig->show();
			break;
		case MAK_SOFTLEFT:
			break;
		case MAK_UP:
			kinListBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			kinListBox->selectNextItem();
			break;
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
	if(!strcmp(parentTag.c_str(), xml_turn)) {
		toPlay += data;
	} else if(!strcmp(parentTag.c_str(), xml_player_score)) {
		playerScore += data;
	} else if(!strcmp(parentTag.c_str(), xml_opponent_score)) {
		opponentScore += data;
	} else if(!strcmp(parentTag.c_str(), xml_progress)) {
		progress += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	}
}

void GameDetailsScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_game_details)) {
		lbl = new Label(0, 0, 0, 0, NULL);
		lbl->setAutoSizeX(true);
		lbl->setAutoSizeY(true);
		lbl->setMultiLine(true);
		lbl->setFont(gFontBlack);

		display = "Progress: " + progress + "%\n";
		display += "To play: " + toPlay;
		display += "\n\nScores\nYou: "+playerScore+"\nOpponent: "+opponentScore;

		lbl->setCaption(display);
		notice->setCaption("");
		kinListBox->add(lbl);
	}
}

void GameDetailsScreen::mtxParseError() {
}

void GameDetailsScreen::mtxEmptyTagEnd() {
}

void GameDetailsScreen::mtxTagStartEnd() {
}
