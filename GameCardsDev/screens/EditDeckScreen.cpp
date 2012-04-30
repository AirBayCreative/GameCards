#include <conprint.h>
#include <mastdlib.h>

#include "DeckListScreen.h"
#include "EditDeckScreen.h"
#include "AlbumLoadScreen.h"
#include "../utils/Util.h"
#include "ImageScreen.h"
#include "CompareScreen.h"
#include "OptionsScreen.h"
#include "ShopDetailsScreen.h"

EditDeckScreen::EditDeckScreen(MainScreen *previous, Feed *feed, String deckId) : mHttp(this), deckId(deckId) {
	busy = true;
	emp = true;
	this->previous = previous;
	this->feed = feed;
	deleting = false;

	next = NULL;

	lprintfln("EditDeckScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());

	id = "";
	description = "";
	quantity = "";
	thumburl = "";
	fronturl = "";
	frontflipurl = "";
	backurl = "";
	backflipurl = "";
	rate = "";
	ranking = "";
	rarity = "";
	value = "";
	error_msg = "";
	updated = "";
	statDisplay = "";
	note = "";
	statDesc = "";
	statIVal = "";
	deckCategory = "";

	mainLayout = Util::createMainLayout("", "Back" , "", true);

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	listBox->setWrapping(true);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setCaption("Getting card list...");

	mImageCache = new ImageCache();
	int urlLength = 71 + URLSIZE + strlen("deck_id") + deckId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?getcardsindeck=1&deck_id=%s&height=%d&width=%d&jpg=1", URL,
			deckId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
	lprintfln("%s", url);
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		busy = false;
		hasConnection = false;
		notice->setCaption("");
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

void EditDeckScreen::refresh() {
	clearListBox();
	clearCards();

	int urlLength = 71 + URLSIZE + strlen("deck_id") + deckId.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?getcardsindeck=1&deck_id=%s&height=%d&width=%d&jpg=1", URL,
			deckId.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
	lprintfln("%s", url);
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		busy = false;
		hasConnection = false;
		notice->setCaption("");
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

void EditDeckScreen::deleteDeck() {
	deleting = true;

	notice->setCaption("Deleting deck...");

	int urlLength = 65 + URLSIZE + strlen("deck_id") + deckId.length();
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?deletedeck=1&deck_id=%s", URL,	deckId.c_str());
	lprintfln("%s", url);
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		busy = false;
		hasConnection = false;
		notice->setCaption("");
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

void EditDeckScreen::removeCard() {
	int cardIndex = listBox->getSelectedIndex() - 1; //-1 for the "delete deck" option
	if (cards.size() < 10) {
		cardIndex -= 1; //if there are less than 10 cards, there is also the "add card" option
	}

	int urlLength = 65 + URLSIZE + strlen("deck_id") + deckId.length() + strlen("card_id") +
		cards[cardIndex]->getId().length();
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?removefromdeck=1&deck_id=%s&card_id=%s", URL,
			deckId.c_str(), cards[cardIndex]->getId().c_str());
	lprintfln("%s", url);
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		busy = false;
		hasConnection = false;
		notice->setCaption("");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();

	}
	delete [] url;
	url = NULL;

	delete cards[cardIndex];
	cards[cardIndex] = NULL;
	cards.remove(cardIndex);

	drawList();
}

void EditDeckScreen::pointerPressEvent(MAPoint2d point) {
    locateItem(point);
}

void EditDeckScreen::pointerMoveEvent(MAPoint2d point) {
    locateItem(point);
    moved++;
}

void EditDeckScreen::pointerReleaseEvent(MAPoint2d point) {
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

void EditDeckScreen::locateItem(MAPoint2d point) {
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
			} else if (i == 2) {
				right = true;
				moved=0;
			}
			return;
		}
	}
}

void EditDeckScreen::clearListBox() {
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

void EditDeckScreen::drawList() {
	screenType = ST_LIST;

	Layout *feedlayout;

	int index = listBox->getSelectedIndex();
	index = index>=0?index:0;

	clearListBox();

	if (cards.size() < 10) {
		feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 48, listBox, 3, 1);
		feedlayout->setSkin(Util::getSkinList());
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		label = new Label(0, 0, 0, 0, NULL, "", 0, Util::getDefaultFont());
		feedlayout->add(label);

		//label = new Label(0,0, feedlayout->getWidth(), 48, feedlayout, "Add Card", 0, Util::getDefaultFont());
		label = Util::createSubLabel("Add Card");
		label->setDrawBackground(false);
		feedlayout->add(label);
		//label->setSkin(Util::getSkinList());
		//label->setVerticalAlignment(Label::VA_CENTER);
		//label->setHorizontalAlignment(Label::HA_CENTER);
	}

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 48, listBox, 3, 1);
	feedlayout->setSkin(Util::getSkinList());
	feedlayout->setDrawBackground(true);
	feedlayout->addWidgetListener(this);

	label = new Label(0, 0, 0, 0, NULL, "", 0, Util::getDefaultFont());
	feedlayout->add(label);

	label = Util::createSubLabel("Delete Deck");
	label->setDrawBackground(false);
	feedlayout->add(label);
	//label = new Label(0,0, feedlayout->getWidth(), 48, feedlayout, "Delete Deck", 0, Util::getDefaultFont());
	//label->setSkin(Util::getSkinList());
	//label->setVerticalAlignment(Label::VA_CENTER);
	//label->setHorizontalAlignment(Label::HA_CENTER);

	String cardText = "";
	for (int i = 0; i < cards.size(); i++) {
		String cardText = "";
		cardText += cards[i]->getText();
		cardText += " (";
		cardText += cards[i]->getQuantity();
		cardText += ")\n";
		cardText += cards[i]->getRarity();
		cardText += "\nRating: ";
		cardText += cards[i]->getRanking();

		feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 3, 1);
		feedlayout->setSkin(Util::getSkinAlbum());
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		if (strcmp(cards[i]->getQuantity().c_str(), "0") != 0) {
			//if the user has one or more of the card, the image must be downloaded
			tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_LOADINGTHUMB));
			tempImage->setHasNote(cards[i]->getNote().length()>0);
			Util::retrieveThumb(tempImage, cards[i], mImageCache);
		}
		else {
			//we use the blank image for cards they dont have yet
			tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_MISSINGTHUMB));
		}

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, Util::getDefaultFont());
		label->setDrawBackground(false);
		cardText = "";
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setAutoSizeX();
		label->setMultiLine();
	}

	if (index < cards.size()) {
		listBox->setSelectedIndex(index);
	}
	else if (index > cards.size()) {
		listBox->setSelectedIndex(index - 1);
	}
	else {
		listBox->setSelectedIndex(0);
	}
}

void EditDeckScreen::drawConfirm() {
	screenType = ST_CONFIRM_DELETE;

	clearListBox();

	label = new Label(0, 0, listBox->getWidth() - 10, 0, listBox, "Are you sure you want to delete this deck?", 0, Util::getDefaultFont());
	label->setAutoSizeY();
	label->setMultiLine(true);
	label->setDrawBackground(false);
	label->setPaddingLeft(5);
	label->setPaddingTop(5);
	label->setPaddingRight(5);

	Util::updateSoftKeyLayout("Confirm", "Back", "", mainLayout);
}

EditDeckScreen::~EditDeckScreen() {
	lprintfln("~EditDeckScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	delete mainLayout;
	mainLayout = NULL;
	if(next != NULL){
		delete next;
		feed->remHttp();
		next = NULL;
	}
	delete mImageCache;
	mImageCache = NULL;

	clearCards();

	stats.clear();
	parentTag="";
	statDesc="";
	statIVal="";
	statDisplay="";
	note="";
	deckId="";
	id="";
	description="";
	quantity="";
	thumburl="";
	fronturl="";
	frontflipurl="";
	backurl="";
	backflipurl="";
	filename="";
	error_msg="";
	rate="";
	rarity="";
	ranking="";
	value="";
	updated="";
	deckCategory="";
}

void EditDeckScreen::selectionChanged(Widget *widget, bool selected) {
	switch (screenType) {
		case ST_LIST:
			if(selected) {
				((Label *)widget->getChildren()[1])->setFont(Util::getDefaultSelected());
			} else {
				((Label *)widget->getChildren()[1])->setFont(Util::getDefaultFont());
			}

			if ((listBox->getSelectedIndex() == 1 && cards.size() < 10) ||
					(listBox->getSelectedIndex() == 0)) {
				Util::updateSoftKeyLayout("", "Back", "", mainLayout);
			}
			else {
				Util::updateSoftKeyLayout("Remove", "Back", "", mainLayout);
			}
			break;
	}
}

void EditDeckScreen::show() {
	Screen::show();
}

void EditDeckScreen::hide() {
	Screen::hide();
}

void EditDeckScreen::keyPressEvent(int keyCode) {
	String all = "";
	switch (screenType) {
		case ST_LIST:
			switch(keyCode) {
				case MAK_UP:
					listBox->selectPreviousItem();
					break;
				case MAK_DOWN:
					listBox->selectNextItem();
					break;
				case MAK_BACK:
				case MAK_SOFTRIGHT:
					previous->show();
					break;
				case MAK_FIRE:
					if (listBox->getSelectedIndex() == 0 && cards.size() < 10) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_DECK, NULL, false, NULL, deckCategory);
						((AlbumLoadScreen*)next)->setDeckId(deckId);
						next->show();
					}
					else if ((listBox->getSelectedIndex() == 0 && cards.size() == 10) ||
							(listBox->getSelectedIndex() == 1 && cards.size() < 10)) {
						drawConfirm();
					}
					break;
				case MAK_SOFTLEFT:
					if (listBox->getSelectedIndex() == 0 && cards.size() < 10) {
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new AlbumLoadScreen(this, feed, AlbumLoadScreen::ST_DECK, NULL, false, NULL, deckCategory);
						((AlbumLoadScreen*)next)->setDeckId(deckId);
						next->show();
					}
					else if ((listBox->getSelectedIndex() == 0 && cards.size() == 10) ||
							(listBox->getSelectedIndex() == 1 && cards.size() < 10)) {
						drawConfirm();
					}
					else {
						removeCard();
					}
					break;
			}
			break;
		case ST_CONFIRM_DELETE:
			switch(keyCode) {
				case MAK_BACK:
				case MAK_SOFTRIGHT:
					if (!busy) {
						busy = true;
						drawList();
					}
					break;
				case MAK_SOFTLEFT:
					if (!busy) {
						busy = true;
						deleteDeck();
					}
					break;
			}
			break;
	}
}

void EditDeckScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	error_msg = "";
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption("");
		busy = false;
		feed->remHttp();
	}
}

void EditDeckScreen::connReadFinished(Connection* conn, int result) {}

void EditDeckScreen::xcConnError(int code) {
	feed->remHttp();
}

void EditDeckScreen::mtxEncoding(const char* ) {
}

void EditDeckScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
	if (!strcmp(name, "cardsincategory")) {
		clearCards();
	}
}

void EditDeckScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
	if(!strcmp(parentTag.c_str(), "stat")) {
		if(!strcmp(attrName, "desc")) {
			statDesc = attrValue;
		}else if(!strcmp(attrName, "ival")) {
			statIVal = attrValue;
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

void EditDeckScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "cardid")) {
		id = data;
	} else if(!strcmp(parentTag.c_str(), "description")) {
		description = data;
	} else if(!strcmp(parentTag.c_str(), "quantity")) {
		quantity = data;
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
	} else if(!strcmp(parentTag.c_str(), "rate")) {
		rate = data;
	} else if(!strcmp(parentTag.c_str(), "ranking")) {
		ranking = data;
	} else if(!strcmp(parentTag.c_str(), "quality")) {
		rarity += data;
	} else if(!strcmp(parentTag.c_str(), "value")) {
		value = data;
	} else if(!strcmp(parentTag.c_str(), "result")) {
		error_msg = data;
	} else if(!strcmp(parentTag.c_str(), "updated")) {
		updated = data;
	} else if(!strcmp(parentTag.c_str(), "stat")) {
		statDisplay = data;
	} else if(!strcmp(parentTag.c_str(), "note")) {
		note = data;
	} else if(!strcmp(parentTag.c_str(), "category_id")) {
		deckCategory = data;
	}
}

void EditDeckScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "card")) {
		//notice->setCaption("");
		Card *newCard = new Card();
		newCard->setAll((quantity+","+description+","+thumburl+","+fronturl+","+backurl+","+id+","+rate+","+value+","+note+","+ranking+","+rarity+","+frontflipurl+","+backflipurl+",").c_str());
		newCard->setStats(stats);
		newCard->setUpdated(updated == "1");
		cards.add(newCard);
		id = "";
		description = "";
		quantity = "";
		thumburl = "";
		fronturl = "";
		backurl = "";
		rate = "";
		value = "";
		rarity = "";
		ranking = "";
		frontflipurl = "";
		backflipurl = "";
		updated = "";
		note = "";
		stats.clear();
		//delete newCard;
		//newCard = NULL;
	} else if(!strcmp(name, "stat")) {
		stat = new Stat();
		stat->setDesc(statDesc.c_str());
		stat->setDisplay(statDisplay.c_str());
		stat->setIVal(statIVal.c_str());
		stat->setTop(statTop);
		stat->setLeft(statLeft);
		stat->setWidth(statWidth);
		stat->setHeight(statHeight);
		stat->setFrontOrBack(statFrontOrBack);
		stat->setColorRed(statRed);
		stat->setColorGreen(statGreen);
		stat->setColorBlue(statBlue);
		stats.add(stat);

		statDesc = "";
		statDisplay = "";
		statIVal = "";
		stat = NULL;
		//delete stat;
	} else if(!strcmp(name, "result")) {
		//notice->setCaption(error_msg.c_str());
		statDesc="";
		statIVal="";
		statDisplay="";
		note="";
		id="";
		description="";
		quantity="";
		thumburl="";
		fronturl="";
		frontflipurl="";
		backurl="";
		backflipurl="";
		error_msg="";
		rate="";
		rarity="";
		ranking="";
		value="";
		updated="";

		if (deleting) {
			((DeckListScreen*)previous)->refresh();
			previous->show();
		}
	} else if (!strcmp(name, "deck")) {
		notice->setCaption("");
		drawList();
		busy = false;
		notice->setCaption("");
		statDesc="";
		statIVal="";
		statDisplay="";
		note="";
		id="";
		description="";
		quantity="";
		thumburl="";
		fronturl="";
		frontflipurl="";
		backurl="";
		backflipurl="";
		error_msg="";
		rate="";
		rarity="";
		ranking="";
		value="";
		updated="";
	}
}

void EditDeckScreen::clearCards() {
	for (int i = 0; i < cards.size(); i++) {
		delete cards[i];
		cards[i] = NULL;
	}
	cards.clear();

	for (int j = 0; j < stats.size(); j++) {
		stats[j] = NULL;
	}
	stats.clear();
}

void EditDeckScreen::mtxParseError(int) {
}

void EditDeckScreen::mtxEmptyTagEnd() {
}

void EditDeckScreen::mtxTagStartEnd() {
}
