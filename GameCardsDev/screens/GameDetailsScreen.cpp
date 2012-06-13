#include <conprint.h>
#include <madmath.h>
#include <MAUI/Image.h>

#include "GameDetailsScreen.h"
#include "../utils/Util.h"
#include "../UI/Button.h"

void GameDetailsScreen::clearListBox() {
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
GameDetailsScreen::GameDetailsScreen(Feed *feed, int screenType)
		:mHttp(this), gameId(feed->getGameId()), screenType(screenType) {
	lprintfln("GameDetailsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->feed = feed;
	mainLayout = Util::createMainLayout("Continue", "", true);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	kinListBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];

	this->setMain(mainLayout);
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
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
			urlLength = 54 + URLSIZE + gameId.length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?viewgamedetails=1&gameid=%s", URL, gameId.c_str());
			lprintfln("%s", url);
			break;
		case ST_GAME_LOG:
			notice->setCaption("Loading game logs...");

			//work out how long the url will be, the 2 is for the & and = symbals, as well as hard coded vars
			urlLength = 50 + URLSIZE + gameId.length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?viewgamelog=1&gameid=%s", URL, gameId.c_str());
			lprintfln("%s", url);
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
		feed->addHttp();
		mHttp.finish();

	}

	urlLength = 0;
	if (url != NULL) {
		delete [] url;
		url = NULL;
	}
}

GameDetailsScreen::~GameDetailsScreen() {
	lprintfln("~GameDetailsScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	delete mainLayout;
	mainLayout = NULL;

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
		label = new Label(0, 0, kinListBox->getWidth()-(PADDING*2), 80, NULL,
				"", 0, Util::getDefaultFont());
		label->setCaption((logs[i]->getDate() + ": " + logs[i]->getDescription()).c_str());
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setSkin(Util::getSkinListNoArrows());
		label->setMultiLine(true);
		label->setPaddingBottom(5);
		label->setPaddingLeft(PADDING);
		label->addWidgetListener(this);
		kinListBox->add(label);
	}
	if (logs.size() >= 1) {
		kinListBox->setSelectedIndex(0);
	} else {
		label = Util::createSubLabel("Empty");
		label->addWidgetListener(this);
		kinListBox->add(label);
	}
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
	int ind = kinListBox->getSelectedIndex();
	int max = kinListBox->getChildren().size();
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];
	switch(keyCode) {
		case MAK_FIRE:
			if(currentSoftKeys->getChildren()[0]->isSelected()){
				keyPressEvent(MAK_SOFTLEFT);
			}else if(currentSoftKeys->getChildren()[2]->isSelected()){
				keyPressEvent(MAK_SOFTRIGHT);
			}
			break;
		case MAK_SOFTRIGHT:
		case MAK_BACK:
			break;
		case MAK_SOFTLEFT:
			orig->show();
			break;
		case MAK_UP:
			if(currentSelectedKey!=NULL){
				currentSelectedKey->setSelected(false);
				currentSelectedKey = NULL;
				currentKeyPosition = -1;
				kinListBox->getChildren()[kinListBox->getChildren().size()-1]->setSelected(true);
			}
			else {
				kinListBox->selectPreviousItem();
			}
			break;
		case MAK_DOWN:
			if (ind+1 < kinListBox->getChildren().size()) {
				kinListBox->setSelectedIndex(ind+1);
			} else {
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

void GameDetailsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget)->setFont(Util::getDefaultFont());
	}
}

void GameDetailsScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		feed->remHttp();
		notice->setCaption("Unable to connect, try again later...");
	}
}

void GameDetailsScreen::connReadFinished(Connection* conn, int result) {}

void GameDetailsScreen::xcConnError(int code) {
	feed->remHttp();
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
		toPlay = data;
	} else if(!strcmp(parentTag.c_str(), "playerdeck")) {
		playerDeck = data;
	} else if(!strcmp(parentTag.c_str(), "opponentdeck")) {
		opponentDeck = data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg = data;
	} else if(!strcmp(parentTag.c_str(), "date")) {
		date = data;
	} else if(!strcmp(parentTag.c_str(), "description")) {
		description += data;
	}
}

void GameDetailsScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "gamedetails")) {
		label = new Label(0, 0, 0, 0, NULL);
		label->setAutoSizeX(true);
		label->setAutoSizeY(true);
		label->setMultiLine(true);
		label->setFont(Util::getDefaultFont());

		display = "To play: " + toPlay;
		display += "\n\nRemaining Cards:\nYou: "+playerDeck+"\nOpponent: "+opponentDeck;

		label->setCaption(display);
		notice->setCaption("");
		kinListBox->add(label);
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

void GameDetailsScreen::mtxParseError(int) {
}

void GameDetailsScreen::mtxEmptyTagEnd() {
}

void GameDetailsScreen::mtxTagStartEnd() {
}
