#include <conprint.h>
#include <madmath.h>
#include <MAUI/Image.h>

#include "DeckListScreen.h"
#include "ImageScreen.h"
#include "../utils/Util.h"

DeckListScreen::DeckListScreen(MainScreen *previous, Feed *feed, Card *card):mHttp(this) {
	this->previous = previous;
	this->feed = feed;
	this->card = card;
	this->phase = SP_LIST;
	lprintfln("DeckListScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	layout = Util::createMainLayout("", "Back", true);
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];
	listBox = (KineticListBox*)layout->getChildren()[0]->getChildren()[2];

	this->setMain(layout);

	deckId = "";
	description = "";
	result = "";
	moved = 0;

	album = NULL;

	next = NULL;

	selecting = true;

	notice->setCaption("Loading Albums...");
	listBox->setHeight(listBox->getHeight() - notice->getHeight());

	int urlLength = 0;
	char *url = NULL;
	//work out how long the url will be, the 2 is for the & and = symbals, as well as hard coded vars
	urlLength = strlen("?getalldecks=1") + URLSIZE;
	url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?getalldecks=1", URL_PHONE.c_str());
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
	delete layout;
	layout = NULL;

	parentTag= "";
	description = "";
	deckId = "";
	result = "";

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
	notice->setCaption("Please select an album");

	for(int i = 0; i < albums.size(); i++) {
		label = Util::createSubLabel(albums[i]->getDescription());
		label->addWidgetListener(this);
		listBox->add(label);
	}
	if (albums.size() >= 1) {
		emp = false;
		listBox->setSelectedIndex(0);
	} else {
		emp = true;
		listBox->add(Util::createSubLabel("Empty"));
		listBox->setSelectedIndex(0);
	}

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
			switch (phase) {
				case SP_LIST:
				case SP_ADDING:
					previous->show();
					break;
			}
			break;
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			if (!emp) {
				switch (phase) {
					case SP_LIST:
						if (!selecting) {
							selecting = true;
							//add the card to the album
							if(mHttp.isOpen()){
								mHttp.close();
							}
							mHttp = HttpConnection(this);
							int urlLength = 18+URLSIZE + card->getId().length() + albums[ind]->getId().length();
							char* url = new char[urlLength];
							memset(url,'\0',urlLength);
							sprintf(url, "%s?addtodeck=%s&deckid=%s", URL_PHONE.c_str(), card->getId().c_str(), albums[ind]->getId().c_str());
							int res = mHttp.create(url, HTTP_GET);
							if(res < 0) {
								notice->setCaption("Connection error");
								selecting = false;
							} else {
								notice->setCaption("Adding...");
								mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
								mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
								feed->addHttp();
								mHttp.finish();

								clearListBox();
							}
							delete url;
						}
						break;
					case SP_FINISHED:
						//return to the card list
						origAlbum->show();
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
	} else if(!strcmp(parentTag.c_str(), "result")) {
		result += data;
	}
}

void DeckListScreen::menuOptionSelected(int index) {
	this->show();
	previous->pop();
}


void DeckListScreen::mtxTagEnd(const char* name, int len) {
	if (!strcmp(name, "deck")) {
		album = new Album(deckId, description);
		albums.add(album);

		deckId = "";
		description = "";
	}
	else if (!strcmp(name, "decks")) {
		drawList();
	}
	else if (!strcmp(name, "result")) {
		phase = SP_FINISHED;

		MenuScreen *confirmation = new MenuScreen(RES_BLANK,result.c_str());
		confirmation->setMenuWidth(120);
		confirmation->setMarginX(5);
		confirmation->setMarginY(5);
		confirmation->setDock(MenuScreen::MD_CENTER);
		confirmation->setListener(this);
		confirmation->setMenuFontSel(Util::getDefaultFont());
		confirmation->setMenuFontUnsel(Util::getDefaultFont());
		confirmation->setMenuSkin(Util::getSkinDropDownItem());
		confirmation->addItem("Ok");
		confirmation->show();

		//notice->setCaption(result);
		//Util::updateSoftKeyLayout("Continue", "", "", layout);
	}
}

void DeckListScreen::mtxParseError(int) {
}

void DeckListScreen::mtxEmptyTagEnd() {
}

void DeckListScreen::mtxTagStartEnd() {
}
