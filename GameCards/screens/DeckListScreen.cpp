#include <conprint.h>
#include <madmath.h>
#include <MAUI/Image.h>

#include "NewDeckScreen.h"
#include "EditDeckScreen.h"
#include "DeckListScreen.h"
#include "OptionsScreen.h"
#include "../utils/Util.h"

DeckListScreen::DeckListScreen(MainScreen *previous, Feed *feed, int screenType, String categoryId)
		:mHttp(this), screenType(screenType), categoryId(categoryId) {
	lprintfln("DeckListScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	this->feed = feed;
	mainLayout = Util::createMainLayout("", "Back", true);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	listBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];

	this->setMain(mainLayout);

	deckId = "";
	description = "";
	moved = 0;

	album = NULL;

	next = NULL;

	selecting = true;

	notice->setCaption("Loading decks...");

	int urlLength = 0;
	char *url = NULL;

	switch (screenType) {
		case ST_EDIT:
			//work out how long the url will be, the 2 is for the & and = symbals, as well as hard coded vars
			urlLength = strlen("?getalldecks=1") + URLSIZE;
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?getalldecks=1", URL);
			break;
		case ST_SELECT:
			//work out how long the url will be, the 2 is for the & and = symbals, as well as hard coded vars
			urlLength = strlen("?getcategorydecks=1&category_id=") + categoryId.length() + URLSIZE;
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?getcategorydecks=1&category_id=%s", URL, categoryId.c_str());
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

DeckListScreen::~DeckListScreen() {
	lprintfln("~DeckListScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	delete mainLayout;
	mainLayout = NULL;

	parentTag= "";
	description = "";
	deckId = "";
	categoryId = "";

	if (next != NULL) {
		delete next;
		feed->remHttp();
		next = NULL;
	}

	for (int i = 0; i < albums.size(); i++) {
		delete albums[i];
		albums[i] = NULL;
	}
	albums.clear();
}

void DeckListScreen::refresh() {
	show();
	clearListBox();
	clearAlbums();

	selecting = true;

	notice->setCaption("Loading decks...");

	//work out how long the url will be, the 2 is for the & and = symbals, as well as hard coded vars
	int urlLength = strlen("?getalldecks=1") + URLSIZE;
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?getalldecks=1", URL);

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

void DeckListScreen::clearAlbums() {
	for (int i = 0; i < albums.size(); i++) {
		delete albums[i];
		albums = NULL;
	}

	albums.clear();
}

void DeckListScreen::clearListBox() {
	Vector<Widget*> tempWidgets;
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

void DeckListScreen::drawList() {
	if (screenType == ST_EDIT) {
		label = Util::createSubLabel("New Deck");
		label->addWidgetListener(this);
		listBox->add(label);
	}
	for(int i = 0; i < albums.size(); i++) {
		label = Util::createSubLabel(albums[i]->getDescription());
		label->addWidgetListener(this);
		listBox->add(label);
	}
	listBox->setSelectedIndex(0);

	selecting = false;
}

void DeckListScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void DeckListScreen::pointerMoveEvent(MAPoint2d point)
{
	moved++;
    locateItem(point);
}

void DeckListScreen::pointerReleaseEvent(MAPoint2d point)
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

void DeckListScreen::locateItem(MAPoint2d point)
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

void DeckListScreen::keyPressEvent(int keyCode) {
	int ind = listBox->getSelectedIndex();
	int max = listBox->getChildren().size();
	switch(keyCode) {
		case MAK_SOFTRIGHT:
		case MAK_BACK:
			previous->show();
			break;
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			if (!selecting) {
				switch (screenType) {
					case ST_EDIT:
						if (listBox->getSelectedIndex() == 0) {
							if (next != NULL) {
								delete next;
								feed->remHttp();
								next = NULL;
							}
							next = new NewDeckScreen(this, feed);
							next->show();
						}
						else {
							if (next != NULL) {
								delete next;
								feed->remHttp();
								 next = NULL;
							}
							next = new EditDeckScreen(this, feed, albums[listBox->getSelectedIndex()-1]->getId());
							next->show();
						}
						break;
					case ST_SELECT:
						next = new OptionsScreen(feed, OptionsScreen::ST_NEW_GAME_OPTIONS, this, NULL,
							categoryId, albums[listBox->getSelectedIndex()]->getId());
						next->show();
						break;
				}
			}
			break;
		case MAK_DOWN:
		if (ind == max-1) {
			listBox->setSelectedIndex(0);
		} else {
			listBox->selectNextItem();
		}
		break;
	case MAK_UP:
		if (ind == 0) {
			listBox->setSelectedIndex(max-1);
		} else {
			listBox->selectPreviousItem();
		}
		break;
	}
}

void DeckListScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget)->setFont(Util::getDefaultFont());
	}
}

void DeckListScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		feed->remHttp();
		notice->setCaption("Unable to connect, try again later...");
	}
}

void DeckListScreen::connReadFinished(Connection* conn, int result) {}

void DeckListScreen::xcConnError(int code) {
	feed->remHttp();
}

void DeckListScreen::mtxEncoding(const char* ) {
}

void DeckListScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void DeckListScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void DeckListScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "deck_id")) {
		deckId += data;
	} else if(!strcmp(parentTag.c_str(), "desc")) {
		description += data;
	}
}

void DeckListScreen::mtxTagEnd(const char* name, int len) {
	if (!strcmp(name, "deck")) {
		album = new Album(deckId, description);
		albums.add(album);

		deckId = "";
		description = "";
	}
	else if (!strcmp(name, "decks")) {
		if (albums.size() <= 1 && screenType == ST_SELECT) {
			if (albums.size() == 0) {
				next = new OptionsScreen(feed, OptionsScreen::ST_NEW_GAME_OPTIONS, previous, NULL, categoryId, "-1");
				next->show();
			}
			else {
				next = new OptionsScreen(feed, OptionsScreen::ST_NEW_GAME_OPTIONS, previous, NULL, categoryId, albums[0]->getId());
				next->show();
			}
		}
		else {
			drawList();
		}
		notice->setCaption("");
	}
}

void DeckListScreen::mtxParseError(int) {
}

void DeckListScreen::mtxEmptyTagEnd() {
}

void DeckListScreen::mtxTagStartEnd() {
}
