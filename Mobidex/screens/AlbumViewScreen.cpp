#include <conprint.h>
#include <mastdlib.h>

#include "AlbumViewScreen.h"
#include "../utils/Util.h"
#include "../MAHeaders.h"
#include "ImageScreen.h"
#include "OptionsScreen.h"
#include "TradeFriendDetailScreen.h"

AlbumViewScreen::AlbumViewScreen(MainScreen *previous, Feed *feed, String category, int albumType, Map<String, Card*> map) :
filename(category+"-lst.sav"), category(category),cardExists(cards.end()), albumType(albumType), mHttp(this) {
	this->previous = previous;
	this->feed = feed;
	lprintfln("AlbumViewScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	busy = true;
	emp = true;
	next = NULL;
	pop = false;
	error_msg = "";
	id = "";
	deleting = false;
	loading = true;
	description = "";
	quantity = "";
	thumburl = "";
	fronturl = "";
	backurl = "";
	rate = "";
	value = "";
	updated = "";
	note = "";
	searchString = "";
	orientation = "";

	layout = Util::createMainLayout("", "Back", "", true);
	listBox = (KineticListBox*) layout->getChildren()[0]->getChildren()[2];
	listBox->setPaddingRight(PADDING);
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];

	mImageCache = new ImageCache();
	switch (albumType) {
		case Util::AT_SEARCH:
			notice->setCaption("Searching...");
			cards = map;
			drawList();
			//notice->setCaption("");
			busy = false;
			break;
		default:
			notice->setCaption("Checking for new cards...");
			loadFile();
			//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
			int urlLength = 75 + URLSIZE + category.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(scrWidth) + feed->getSeconds().length();
			char *url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s?cardsincategory=%s&seconds=%s&height=%d&width=%d&%s", URL_PHONE.c_str(), category.c_str(), feed->getSeconds().c_str(),
					Util::getMaxImageHeight(), Util::getMaxImageWidth(), JPG);
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
			break;
	}

	this->setMain(layout);
	moved=0;
	origAlbum = this;
}

void AlbumViewScreen::refresh(bool pop) {
	lprintfln("AlbumViewScreen::refresh()");
	this->pop = pop;
	int urlLength = 0;
	char *url = NULL;
	switch (albumType) {
		case Util::AT_SEARCH:
			notice->setCaption("Searching...");
			urlLength = 81 + URLSIZE + searchString.length() + feed->getSeconds().length()
				+ Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s?search=%s&seconds=%s&height=%d&width=%d&%s", URL_PHONE.c_str(), searchString.c_str(),
				feed->getSeconds().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), JPG);
			break;
		default:
			tmp.clear();
			notice->setCaption("Checking for new cards...");
			//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
			urlLength = 75 + URLSIZE + category.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(scrWidth) + feed->getSeconds().length();
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s?cardsincategory=%s&seconds=%s&height=%d&width=%d&%s", URL_PHONE.c_str(),
					category.c_str(), feed->getSeconds().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), JPG);
			break;
	}
	loading = true;
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
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
	/*if (feed->setTouch("true")) {
		saveData(FEED, feed->getAll().c_str());
	}*/
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
	//listBox->clear();
	clearListBox();
	index.clear();
	if (albumType == Util::AT_SEARCH) {
		char* text = new char[40];
		memset(text,'\0',40);
		sprintf(text, "(%d) Mobidex cards matched.", cards.size());
		notice->setCaption(text);
	}
	for(StringCardMap::Iterator itr = cards.begin(); itr != cards.end(); itr++) {

		index.add(itr->second->getId());
		cardText = (itr->second->getUpdated()?"*":"")+itr->second->getText();
		Vector<Stat *> stats = itr->second->getStats();
		for (int i = 0; i < stats.size(); i++) {
			if ((stats[i]->getDesc() == "Company Name")||(stats[i]->getDesc() == "Mobile No")) {
				cardText += "\n";
				cardText += stats[i]->getDisplay();
			}
		}
		stats.clear();
		//cardText += itr->second->get;
		//cardText += itr->second->getQuantity();

		feedlayout = new Layout(0, 0, listBox->getWidth(), 74, listBox, 3, 1);
		feedlayout->setSkin(Util::getSkinAlbum());
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);
		feedlayout->setPaddingTop(2);

		tempImage = new MobImage(0, 0, 68, 64, feedlayout, false, false, Util::loadImageFromResource(RES_LOADINGTHUMB));
		tempImage->setHasNote(itr->second->getNote().length()>0);
		Util::retrieveThumb(tempImage, itr->second, mImageCache);

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, Util::getDefaultFont());
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setAutoSizeX(true);
		label->setMultiLine(true);
		label->setDrawBackground(false);
	}

	if (cards.size() >= 1) {
		emp = false;
		listBox->setSelectedIndex(0);
	} else if (loading) {
		emp = true;
		listBox->add(Util::createSubLabel("Empty"));
		listBox->setSelectedIndex(0);
	} else if (!loading) {
		emp = true;
		listBox->add(Util::createSubLabel("Remove Album"));
		listBox->setSelectedIndex(0);
	}

	if (cards.size() < 1) {
		if (pop) {
			keyPressEvent(MAK_SOFTRIGHT);
		}
	}
}

void AlbumViewScreen::deleteDeck() {
	deleting = true;

	notice->setCaption("Deleting deck...");

	int urlLength = 65 + URLSIZE + strlen("deck_id") + category.length();
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?deletedeck=1&deck_id=%s", URL_PHONE.c_str(),	category.c_str());
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

	Albums *album = feed->getAlbum();
	album->removeAlbum(category.c_str());
	feed->getAlbum()->setAll(album->getAll().c_str());
	feed->setAlbum(album->getAll().c_str());
	Util::saveData("lb.sav", album->getAll().c_str());

	delete [] url;
	url = NULL;
}

AlbumViewScreen::~AlbumViewScreen() {
	delete layout;
	if(next!=NULL){
		feed->remHttp();
		delete next;
	}
	delete mImageCache;
	if (albumType != Util::AT_SEARCH) {
		String all = getAll();
		Util::saveData(filename.c_str(), all.c_str());
		all="";
	}
	clearCardMap();
	deleteCards();

	cards = NULL;
	deleted = NULL;

	tmp.clear();
	parentTag="";
	cardText="";
	id="";
	description="";
	quantity="";
	thumburl="";
	fronturl="";
	backurl="";
	filename="";
	error_msg="";
	rate="";
	value="";
	updated="";
	note="";
	category="";
	searchString="";
	orientation="";
}

void AlbumViewScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget->getChildren()[1])->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget->getChildren()[1])->setFont(Util::getDefaultFont());
	}
}

void AlbumViewScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void AlbumViewScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void AlbumViewScreen::keyPressEvent(int keyCode) {
	int selected = listBox->getSelectedIndex();
	String all = "";
	switch(keyCode) {
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			if (albumType != Util::AT_SEARCH) {
				all = getAll();
				Util::saveData(filename.c_str(), all.c_str());
				all = "";
				previous->refresh(false);
			} else if (albumType == Util::AT_SEARCH) {
				previous->show();
			}

			//previous->show();
			break;
		case MAK_FIRE:
			if (!emp && !busy && strcmp(cards.find(index[selected])->second->getQuantity().c_str(), "0") != 0) {
				if (next != NULL) {
					feed->remHttp();
					delete next;
				}
				if (albumType == Util::AT_NEW_CARDS) {
					next = new ImageScreen(this, Util::loadImageFromResource(RES_LOADING1), feed, false, cards.find(index[selected])->second, ImageScreen::ST_NEW_CARD);
				} else if (albumType == Util::AT_SHARE){
					next = new TradeFriendDetailScreen(this, feed, cards.find(index[selected])->second);
				} else {
					next = new ImageScreen(this, Util::loadImageFromResource(RES_LOADING1), feed, false, cards.find(index[selected])->second);
				}
				next->show();
			} else if (!loading) {
				deleteDeck();
			}
			break;
		case MAK_SOFTLEFT:
			if (!emp && !hasConnection) {
				feed->remHttp();
				notice->setCaption("Unable to connect, try again later...");
			}
			else if (!emp && !busy && strcmp(cards.find(index[selected])->second->getQuantity().c_str(), "0") != 0) {
				if (next != NULL) {
					feed->remHttp();
					delete next;
				}
				if (albumType == Util::AT_NEW_CARDS) {
					next = new OptionsScreen(feed, OptionsScreen::ST_NEW_CARD,
							this, cards.find(index[selected])->second);
				}
				else if (albumType == Util::AT_SHARE) {
					next = new TradeFriendDetailScreen(this, feed, cards.find(index[selected])->second);
				}
				else
				{
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
		loading = false;
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
			statFrontOrBack = atoi(attrValue)-1;
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
	} else if(!strcmp(parentTag.c_str(), "backurl")) {
		backurl += data;
	} else if(!strcmp(parentTag.c_str(), "rate")) {
		rate += data;
	} else if(!strcmp(parentTag.c_str(), "value")) {
		value += data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), "updated")) {
		updated += data;
	} else if(!strcmp(parentTag.c_str(), "stat")) {
		statDisplay += data;
	} else if(!strcmp(parentTag.c_str(), "note")) {
		note += data;
	} else if(!strcmp(parentTag.c_str(), "cardorientation")) {
		orientation += data;
	}
}

void AlbumViewScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "card")) {
		notice->setCaption("");
		Card *newCard = new Card();
		newCard->setAll((quantity+","+description+","+thumburl+","+fronturl+","+backurl+","+id+","+rate+","+value+","+note+","+orientation+",").c_str());
		newCard->setStats(stats);
		cardExists = cards.find(newCard->getId());
		if (category == "-3") { //-3 is ALBUM_UPDATES
			MAHandle store = maOpenStore((FILE_PREFIX+newCard->getId()+".sav").c_str(), -1);
			if(store != STERR_NONEXISTENT) {
				maCloseStore(store,1);
			}
		}
		if (category == "-3") {
			MAHandle store = maOpenStore((FILE_PREFIX+newCard->getId()+"f.sav").c_str(), -1);
			if(store != STERR_NONEXISTENT) {
				maCloseStore(store,1);
			}
		}
		if (category == "-3") {
			MAHandle store = maOpenStore((FILE_PREFIX+newCard->getId()+"b.sav").c_str(), -1);
			if(store != STERR_NONEXISTENT) {
				maCloseStore(store,1);
			}
		}
		newCard->setUpdated(updated == "1");
		tmp.insert(newCard->getId(),newCard);
		id = "";
		description = "";
		quantity = "";
		thumburl = "";
		fronturl = "";
		backurl = "";
		rate = "";
		value = "";
		updated = "";
		note = "";
		orientation = "";
		stats.clear();
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
		stat = NULL;
		statDesc = "";
		statDisplay = "";
		statIVal = "";
	} else if(!strcmp(name, "error")) {
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, "cardsincategory")) {
		notice->setCaption("");
		clearCardMap();
		cards = tmp;
		loading = false;
		drawList();
		busy = false;
		String all = getAll();
		Util::saveData(filename.c_str(), all.c_str());
		all = "";
	} else {
		if (deleting) {
			((AlbumLoadScreen*)previous)->refresh();
			previous->show();
		}
		notice->setCaption("");
	}
}

String AlbumViewScreen::getAll() {
	String all;
	for(StringCardMap::Iterator itr = cards.begin(); itr != cards.end(); itr++) {
		all += itr->second->getAll() + "#";
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

void AlbumViewScreen::setSearchString(String ss) {
	searchString = ss;
}
