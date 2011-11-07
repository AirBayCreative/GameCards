#include <conprint.h>
#include <mastdlib.h>

#include "AlbumViewScreen.h"
#include "AlbumLoadScreen.h"
#include "../utils/Util.h"
#include "ImageScreen.h"
#include "OptionsScreen.h"
#include "ShopDetailsScreen.h"

AlbumViewScreen::AlbumViewScreen(Screen *previous, Feed *feed, String category, int albumType, Card *card, String deckId) : mHttp(this),
filename(category+"-lst.sav"), category(category), previous(previous), feed(feed),
cardExists(cards.end()), albumType(albumType), card(card), deckId(deckId) {
	busy = true;
	emp = true;

	lprintfln("AlbumViewScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());

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

	next = NULL;

	mainLayout = Util::createMainLayout("", "Back" , "", true);

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setCaption("Checking for new cards...");

	mImageCache = new ImageCache();
	if (albumType == AT_BUY) {
		loadImages("");
		notice->setCaption("Purchasing...");
		int urlLength = 65 + URLSIZE + category.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?buyproduct=%s&height=%d&width=%d&freebie=%d", URL,
				category.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), 0);
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
	} else if (albumType == AT_PRODUCT) {
			loadImages("");
			notice->setCaption("Fetching list...");
			int urlLength = 65 + URLSIZE + category.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			char *url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?cardsinbooster=%s&height=%d&width=%d", URL,
					category.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
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
	} else if (albumType == AT_FREE) {
		albumType = AT_BUY;
		loadImages("");
		notice->setCaption("Receiving...");
		int urlLength = 65 + URLSIZE + category.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?buyproduct=%s&height=%d&width=%d&freebie=%d", URL,
				category.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), 1);
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
	} else {
		loadFile();
		//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
		int urlLength = 75 + URLSIZE + category.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(scrWidth) + feed->getSeconds().length();
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?cardsincategory=%s&seconds=%s&height=%d&width=%d&jpg=1", URL, category.c_str(), feed->getSeconds().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
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
	}
	this->setMain(mainLayout);
	moved=0;
	origAlbum = this;
}

void AlbumViewScreen::refresh() {
	if ((albumType == AT_NORMAL)||(albumType == AT_NEW_CARDS)) {
		notice->setCaption("Checking for new cards...");
		busy = true;
		//loadFile();
		//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
		int urlLength = 75 + URLSIZE + category.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(scrWidth) + feed->getSeconds().length();
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?cardsincategory=%s&seconds=%s&height=%d&width=%d&jpg=1", URL, category.c_str(), feed->getSeconds().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
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
	}
	show();
}

void AlbumViewScreen::loadFile() {
	char *file = new char[filename.length()+1];
	memset(file,'\0',filename.length()+1);
	sprintf(file, "%s", filename.c_str());

	String filecards = "";
	Util::getData(file, filecards);

	loadImages(filecards.c_str());
	filecards = "";
	delete file;
}

void AlbumViewScreen::loadImages(const char *text) {
	String all = text;
	int indexof = 0;
	String tmp = "";
	while ((indexof = all.find("#")) > -1) {
		tmp = all.substr(0,indexof++);

		newCard = new Card();
		newCard->setAll(tmp.c_str());

		StringCardMap::Iterator itr = cards.find(newCard->getId());
		if (itr != cards.end()) {
			delete itr->second;
			cards.erase(newCard->getId());
		}
		cards.insert(newCard->getId(), newCard);
		all = ""+all.substr(indexof);
		/*delete newCard; Can't delete, also deleted the reference in cards*/
		newCard = NULL;
	}
	drawList();
	tmp = "", all = "";
}

void AlbumViewScreen::pointerPressEvent(MAPoint2d point) {
    locateItem(point);
}

void AlbumViewScreen::pointerMoveEvent(MAPoint2d point) {
    locateItem(point);
    moved++;
}

void AlbumViewScreen::pointerReleaseEvent(MAPoint2d point) {
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

void AlbumViewScreen::locateItem(MAPoint2d point) {
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

void AlbumViewScreen::clearListBox() {
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

void AlbumViewScreen::drawList() {
	Layout *feedlayout;
	int ind = listBox->getSelectedIndex();
	if (ind < 0) {
		ind = 0;
	}
	clearListBox();
	index.clear();
	String cardText = "";
	for(StringCardMap::Iterator itr = cards.begin(); itr != cards.end(); itr++) {

		index.add(itr->second->getId());
		String cardText = "";
		cardText += itr->second->getText();
		cardText += " (";
		cardText += itr->second->getQuantity();
		cardText += ")\n";
		cardText += itr->second->getRarity();
		cardText += "\nRating: ";
		cardText += itr->second->getRanking();

		feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 3, 1);
		feedlayout->setSkin(Util::getSkinAlbum());
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		if ((strcmp(itr->second->getQuantity().c_str(), "0") != 0)||(albumType == AT_PRODUCT)) {
			//if the user has one or more of the card, the image must be downloaded
			tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_LOADINGTHUMB));
			tempImage->setHasNote(itr->second->getNote().length()>0);
			Util::retrieveThumb(tempImage, itr->second, mImageCache);
		} else {
			//we use the blank image for cards they dont have yet
			tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_MISSINGTHUMB));
		}

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, Util::getDefaultFont());
		cardText = "";
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setAutoSizeX();
		label->setMultiLine();
	}

	if (cards.size() >= 1) {
		emp = false;
		if (ind < cards.size()) {
			listBox->setSelectedIndex(ind);
		} else {
			listBox->setSelectedIndex(0);
		}
	} else {
		emp = true;
		listBox->add(Util::createSubLabel("Empty"));
		listBox->setSelectedIndex(0);
	}
}

AlbumViewScreen::~AlbumViewScreen() {
	lprintfln("~AlbumViewScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	delete mainLayout;
	if(next!=NULL){
		delete next;
		feed->remHttp();
	}
	if (mImageCache != NULL) {
		delete mImageCache;
	}
	if (!busy) {
		String all = getAll();
		Util::saveData(filename.c_str(), all.c_str());
		all="";
	}

	/*if (tempImage != NULL) {
		if (tempImage->getResource() != NULL) {
			//maDestroyObject(tempImage->getResource());
		}
		delete tempImage;
	}*/
	clearCardMap();
	deleteCards();

	cards = NULL;
	deleted = NULL;

	index.clear();
	stats.clear();
	parentTag="";
	statDesc="";
	statIVal="";
	statDisplay="";
	note="";
	category="";
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
}

void AlbumViewScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget->getChildren()[1])->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget->getChildren()[1])->setFont(Util::getDefaultFont());
	}
}

void AlbumViewScreen::show() {
	if (listBox->getChildren().size() > 0) {
		listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	}
	Screen::show();
}

void AlbumViewScreen::hide() {
	if (listBox->getChildren().size() > 0) {
		listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	}
	Screen::hide();
}

void AlbumViewScreen::keyPressEvent(int keyCode) {
	int selected = listBox->getSelectedIndex();
	String all = "";

	orig = this;

	switch(keyCode) {
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			if (!busy) {
				all = getAll();
				Util::saveData(filename.c_str(), all.c_str());
				all = "";
			}
			if ((albumType == AT_BUY)||(albumType == AT_FREE)) {
				origMenu->show();
				break;
			}
			if ((albumType == AT_NEW_CARDS)) {
				((AlbumLoadScreen *)previous)->refresh();
			} else {
				previous->show();
			}
			break;
		case MAK_FIRE:
			if (albumType == AT_PRODUCT) {
				break;
			}
			if (!emp && !busy && strcmp(cards.find(index[selected])->second->getQuantity().c_str(), "0") != 0) {
				if (next != NULL) {
					delete next;
					feed->remHttp();
				}
				if (albumType == AT_NEW_CARDS) {
					next = new ImageScreen(this, Util::loadImageFromResource(RES_LOADING1), feed, false, cards.find(index[selected])->second, ImageScreen::ST_NEW_CARD);
				}
				else {
					next = new ImageScreen(this, Util::loadImageFromResource(RES_LOADING1), feed, false, cards.find(index[selected])->second);
				}
				next->show();
			}
			break;
		case MAK_SOFTLEFT:
			if (!emp && !hasConnection) {
				notice->setCaption("Unable to connect, try again later...");
				feed->remHttp();
			}
			else if (!emp && !busy && strcmp(cards.find(index[selected])->second->getQuantity().c_str(), "0") != 0) {
				if (next != NULL) {
					delete next;
					feed->remHttp();
				}
				if (albumType == AT_NEW_CARDS) {
					next = new OptionsScreen(feed, OptionsScreen::ST_NEW_CARD,
							this, cards.find(index[selected])->second);
				}
				else {
					next = new OptionsScreen(feed, OptionsScreen::ST_CARD_OPTIONS,
							this, cards.find(index[selected])->second);
				}
				next->show();
			}
			break;
	}
}

void AlbumViewScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
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

void AlbumViewScreen::connReadFinished(Connection* conn, int result) {}

void AlbumViewScreen::xcConnError(int code) {
	feed->remHttp();
}

void AlbumViewScreen::mtxEncoding(const char* ) {
}

void AlbumViewScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
	if (!strcmp(name, "cardsincategory")) {
		tmp.clear();
		clearCardMap();
	}
}

void AlbumViewScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
	if(!strcmp(parentTag.c_str(), "stat")) {
		if(!strcmp(attrName, "desc")) {
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

void AlbumViewScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "cardid")) {
		id += data;
	} else if(!strcmp(parentTag.c_str(), "description")) {
		description += data;
	} else if(!strcmp(parentTag.c_str(), "quantity")) {
		quantity += data;
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
	} else if(!strcmp(parentTag.c_str(), "rate")) {
		rate += data;
	} else if(!strcmp(parentTag.c_str(), "ranking")) {
		ranking += data;
	} else if(!strcmp(parentTag.c_str(), "quality")) {
		rarity += data;
	} else if(!strcmp(parentTag.c_str(), "value")) {
		value += data;
	} else if(!strcmp(parentTag.c_str(), "result")) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), "updated")) {
		updated += data;
	} else if(!strcmp(parentTag.c_str(), "stat")) {
		statDisplay += data;
	} else if(!strcmp(parentTag.c_str(), "note")) {
		note += data;
	}
}

void AlbumViewScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "card")) {
		Card *newCard = new Card();
		newCard->setAll((quantity+","+description+","+thumburl+","+fronturl+","+backurl+","+id+","+rate+","+value+","+note+","+ranking+","+rarity+","+frontflipurl+","+backflipurl+",").c_str());
		newCard->setStats(stats);
		cardExists = cards.find(newCard->getId());
		if (cardExists != cards.end()) {
			newCard->setThumb(cardExists->second->getThumb().c_str());
			newCard->setBack(cardExists->second->getBack().c_str());
			newCard->setFront(cardExists->second->getFront().c_str());
			newCard->setBackFlip(cardExists->second->getBackFlip().c_str());
			newCard->setFrontFlip(cardExists->second->getFrontFlip().c_str());
		}
		newCard->setUpdated(updated == "1");
		if (albumType == AT_FREE) {
			feed->setFreebie("1");
			String feedall = feed->getAll();
			Util::saveData("fd.sav", feedall.c_str());
			feedall = "";
		}
		tmp.insert(newCard->getId(),newCard);

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
		error_msg="";

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
		notice->setCaption(error_msg.c_str());
		statDesc = "";
		statDisplay = "";
		statIVal = "";

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
		error_msg="";
	} else if (!strcmp(name, "cardsincategory")) {
		notice->setCaption("");
		clearCardMap();
		cards = tmp;
		drawList();
		busy = false;
		String all = getAll();
		Util::saveData(filename.c_str(), all.c_str());
		all = "";
		notice->setCaption("");
		statDesc = "";
		statDisplay = "";
		statIVal = "";

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
		error_msg="";
	} else if (!strcmp(name, "cards")) {
		clearCardMap();
		cards = tmp;
		drawList();
		notice->setCaption("");
		busy = false;
		statDesc = "";
		statDisplay = "";
		statIVal = "";

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
		error_msg="";
	} else {
		//notice->setCaption("");
	}
}

String AlbumViewScreen::getAll() {
	String all = "";
	for(StringCardMap::Iterator itr = cards.begin(); itr != cards.end(); itr++) {
		String tmp = itr->second->getAll();
		all += tmp + "#";
		tmp = "";
	}
	return all;
}

void AlbumViewScreen::clearCardMap() {
	for (StringCardMap::Iterator iter = cards.begin(); iter != cards.end(); iter++) {
		if (iter->second != NULL) {
			deleted.add(iter->second);
			//delete iter->second;
			iter->second = NULL;
		}
	}
	cards.clear();
	//tmp.clear();
}

void AlbumViewScreen::deleteCards() {
	for (int i = 0; i < deleted.size(); i++) {
		if (deleted[i] != NULL) {
			delete deleted[i];
			deleted[i] = NULL;
		}
	}
	deleted.clear();

	for (StringCardMap::Iterator iter = cards.begin(); iter != cards.end(); iter++) {
		if (iter->second != NULL) {
			delete iter->second;
			iter->second = NULL;
		}
	}
	cards.clear();
	tmp.clear();
}

void AlbumViewScreen::mtxParseError(int) {
}

void AlbumViewScreen::mtxEmptyTagEnd() {
}

void AlbumViewScreen::mtxTagStartEnd() {
}

int AlbumViewScreen::getCount() {
	return size;
}

void AlbumViewScreen::setDeckId(String d) {
	deckId = d;
}

void AlbumViewScreen::addCard(String cardId) {
	int urlLength = 65 + URLSIZE + strlen("deck_id") + deckId.length() + strlen("card_id") +
		cardId.length();
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?addtodeck=1&deck_id=%s&card_id=%s", URL,
			deckId.c_str(), cardId.c_str());
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
}
