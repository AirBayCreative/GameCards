#include <conprint.h>
#include <mastdlib.h>

#include "AlbumViewScreen.h"
#include "AlbumLoadScreen.h"
#include "../utils/Util.h"
#include "ImageScreen.h"
#include "CompareScreen.h"
#include "OptionsScreen.h"
#include "AuctionCreateScreen.h"
#include "ShopDetailsScreen.h"
#include "EditDeckScreen.h"
#include "../UI/Button.h"
#include "../UI/MenuScreen/MenuScreen.h"

AlbumViewScreen::AlbumViewScreen(MainScreen *previous, Feed *feed, String category, int albumType, bool bAction, Card *card, String deckId, String friendId) : mHttp(this),
filename(category+"-lst.sav"), category(category), cardExists(cards.end()), albumType(albumType), isAuction(bAction), card(card), deckId(deckId), friendId(friendId) {
	this->previous = previous;
	this->feed = feed;
	busy = true;
	emp = true;
	adding = false;
	selectedList = 0;
	currentSelectedKey = NULL;
	currentKeyPosition = -1;

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
	selectedList = 0;
	error_msg = "";
	updated = "";
	statDisplay = "";
	note = "";
	statDesc = "";
	statIVal = "";

	next = NULL;
	if (albumType == AT_COMPARE) {
		mainLayout = Util::createMainLayout("", "Back" , "");
	} else if (albumType == AT_DECK) {
		mainLayout = Util::createMainLayout("View", "Back" , "");
	} else {
		mainLayout = Util::createMainLayout("", "Back" , "");
	}

	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setCaption("Checking for new cards...");

	this->setMain(mainLayout);

	mImageCache = new ImageCache();
	if (albumType == AT_BUY) {
		loadImages("");
		notice->setCaption("Purchasing...");
		int urlLength = 88 + URLSIZE + category.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?buyproduct=%s&height=%d&width=%d&freebie=%d&jpg=1&purchase=%s", URL,
				category.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), 0, deckId.c_str());
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
		delete url;
		url = NULL;
	} else if (albumType == AT_PRODUCT) {
			loadImages("");
			notice->setCaption("Fetching list...");
			int urlLength = 71 + URLSIZE + category.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
			char *url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?cardsinbooster=%s&height=%d&width=%d&jpg=1", URL,
					category.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
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
			delete url;
			url = NULL;
	} else if (albumType == AT_FREE) {
		albumType = AT_BUY;
		loadImages("");
		notice->setCaption("Receiving...");
		int urlLength = 65 + URLSIZE + category.length() + Util::intlen(scrHeight) + Util::intlen(scrWidth);
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?buyproduct=%s&height=%d&width=%d&freebie=%d", URL,
				category.c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), 1);
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
		delete url;
		url = NULL;
	} else if (albumType == AT_DECK) {
		//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
		int urlLength = 81 + URLSIZE + category.length() + Util::intlen(Util::getMaxImageHeight()) +
				Util::intlen(scrWidth) + feed->getSeconds().length() + deckId.length();
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?cardsincategorynotdeck=%s&seconds=%s&height=%d&width=%d&deck_id=%s&jpg=1", URL, category.c_str(),
				feed->getSeconds().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), deckId.c_str());
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
		delete url;
		url = NULL;
	} else if(albumType == AT_FRIENDS){
		//loadFile();
		//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
		int urlLength = 85 + URLSIZE + category.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(scrWidth) + feed->getSeconds().length() + friendId.length();
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?cardsincategory=%s&seconds=%s&height=%d&width=%d&jpg=1&friendid=%s", URL, category.c_str(), feed->getSeconds().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), friendId.c_str());
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
		delete url;
		url = NULL;
	}  else {
		loadFile();
		//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
		int urlLength = 75 + URLSIZE + category.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(scrWidth) + feed->getSeconds().length();
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?cardsincategory=%s&seconds=%s&height=%d&width=%d&jpg=1", URL, category.c_str(), feed->getSeconds().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
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
		delete url;
		url = NULL;
	}
	moved=0;
	if (albumType != AT_COMPARE) {
		origAlbum = this;
	}
}

void AlbumViewScreen::refresh() {
	if ((albumType == AT_NORMAL)||(albumType == AT_AUCTION)||(albumType == AT_NEW_CARDS)) {
		notice->setCaption("Checking for new cards...");
		busy = true;
		//loadFile();
		//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
		int urlLength = 75 + URLSIZE + category.length() + Util::intlen(Util::getMaxImageHeight()) + Util::intlen(scrWidth) + feed->getSeconds().length();
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?cardsincategory=%s&seconds=%s&height=%d&width=%d&jpg=1", URL, category.c_str(), feed->getSeconds().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth());
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
	file = NULL;
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
	xStart = point.x;
    locateItem(point);
}

void AlbumViewScreen::pointerMoveEvent(MAPoint2d point) {
    locateItem(point);
    moved++;
}

void AlbumViewScreen::pointerReleaseEvent(MAPoint2d point) {
	if (!emp && (list || listLeft || listRight)) {
		int xEnd = point.x;
		int distance = abs(xEnd - xStart);

		if (distance >= (scrWidth * 0.4)) {
			moved=0;
			switchList(xEnd>xStart?-1:1);
			return;
		}
	}
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		} else if (listLeft) {
			keyPressEvent(MAK_LEFT);
		} else if (listRight) {
			keyPressEvent(MAK_RIGHT);
		}
	}
	moved=0;
}

void AlbumViewScreen::locateItem(MAPoint2d point) {
	list = false;
	left = false;
	right = false;
	listLeft = false;
	listRight = false;
	Point p;
	p.set(point.x, point.y);
	if (leftArrow->contains(p)) {
		listLeft = true;
		return;
	}
	else if (rightArrow->contains(p)) {
		listRight = true;
		return;
	}
	for(int i = 0; selectedList < cardLists.size() &&
		i < (cardLists[selectedList]->getChildren()).size(); i++)
	{
		if(cardLists[selectedList]->getChildren()[i]->contains(p))
		{
			list = true;
			cardLists[selectedList]->setSelectedIndex(i);
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

	if (!emp) {
		midListBox->clear();
		for (int i = 0; i < cardLists.size(); i++) {
			tempWidgets.add(cardLists[i]);
		}
		cardLists.clear();
		for (int i = 0; i < listBox->getChildren().size(); i++) {
			tempWidgets.add(listBox->getChildren()[i]);
		}
		listBox->clear();
		listBox->getChildren().clear();
	}
	else {
		for (int i = 0; i < listBox->getChildren().size(); i++) {
			tempWidgets.add(listBox->getChildren()[i]);
		}
		listBox->clear();
		listBox->getChildren().clear();
	}

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

	//we need a layout to have arrow images on the sides of the list
	int cardsPerList = listBox->getHeight() / ALBUM_ITEM_HEIGHT; //74 is the default card display item height
	Layout *listLayout;
	//check if we need more than 1 page
	if (cardsPerList < cards.size()) {
		listLayout = new Layout(0, 0, listBox->getWidth(), listBox->getHeight(), listBox, 3, 1);
		listLayout->setDrawBackground(false);
		listLayout->setVerticalAlignment(Layout::VA_CENTER);

		leftArrow = new Image(0, 0, ARROW_WIDTH, listLayout->getHeight(), listLayout, false, false, RES_LEFT_ARROW);
		leftArrow->setDrawBackground(false);

		midListBox = new ListBox(0, 0, listLayout->getWidth() - (ARROW_WIDTH*2) - (PADDING*2), listLayout->getHeight(), listLayout, ListBox::LBO_VERTICAL);
		midListBox->setDrawBackground(false);

		rightArrow = new Image(0, 0, ARROW_WIDTH, listLayout->getHeight(), listLayout, false, false, RES_RIGHT_ARROW);
		rightArrow->setDrawBackground(false);
	} else {
		listLayout = new Layout(0, 0, listBox->getWidth(), listBox->getHeight(), listBox, 1, 1);
		listLayout->setDrawBackground(false);
		listLayout->setVerticalAlignment(Layout::VA_CENTER);

		leftArrow = new Image(0, 0, ARROW_WIDTH, listLayout->getHeight(), NULL, false, false, RES_LEFT_ARROW);
		leftArrow->setDrawBackground(false);

		midListBox = new ListBox(0, 0, listLayout->getWidth() - (PADDING*2), listLayout->getHeight(), listLayout, ListBox::LBO_VERTICAL);
		midListBox->setDrawBackground(false);

		rightArrow = new Image(0, 0, ARROW_WIDTH, listLayout->getHeight(), NULL, false, false, RES_RIGHT_ARROW);
		rightArrow->setDrawBackground(false);
	}

	int currentList = -1;
	ListBox *tempList = NULL;
	int i = 0;
	for(StringCardMap::Iterator itr = cards.begin(); itr != cards.end(); itr++) {
		//gotta make the tempList for the cards
		if (i % cardsPerList == 0) {
			tempList = new ListBox(0, 0, midListBox->getWidth(), midListBox->getHeight(), NULL);
			tempList->setDrawBackground(false);
			tempList->setOrientation(ListBox::LBO_VERTICAL);
			currentList++;
			cardLists.add(tempList);
		}

		index.add(itr->second->getId());
		String cardText = "";
		cardText += itr->second->getText();
		cardText += " (";
		cardText += itr->second->getQuantity();
		cardText += ")\n";
		cardText += itr->second->getRarity();
		cardText += "\nRating: ";
		cardText += itr->second->getRanking();

		feedlayout = new Layout(0, 0, tempList->getWidth()-(PADDING*2), ALBUM_ITEM_HEIGHT + ((midListBox->getHeight() % THUMB_HEIGHT) / cardsPerList), tempList, 3, 1);
		feedlayout->setSkin(Util::getSkinAlbum());
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);
		feedlayout->setVerticalAlignment(Layout::VA_CENTER);

		if ((strcmp(itr->second->getQuantity().c_str(), "0") != 0)||(albumType == AT_PRODUCT)) {
			//if the user has one or more of the card, the image must be downloaded
			tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_LOADINGTHUMB));
			tempImage->setHasNote(itr->second->getNote().length()>0);
			Util::retrieveThumb(tempImage, itr->second, mImageCache);
		} else {
			//we use the blank image for cards they dont have yet
			tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_MISSINGTHUMB));
		}

		label = new Label(0,0, scrWidth-86, ALBUM_ITEM_HEIGHT, feedlayout, cardText, 0, Util::getDefaultFont());
		cardText = "";

		tempImage->setDrawBackground(false);
		label->setDrawBackground(false);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setAutoSizeX();
		label->setMultiLine();

		i++;
	}

	if (cards.size() >= 1) {
		emp = false;
		int listIndex = ind / cardsPerList;
		int listItem = ind % cardsPerList;
		selectedList = listIndex;
		midListBox->add(cardLists[listIndex]);
		cardLists[listIndex]->setSelectedIndex(listItem);
		cardLists[listIndex]->getChildren()[cardLists[listIndex]->getSelectedIndex()]->setSelected(true);
	} else {
		emp = true;
		midListBox->add(Util::createSubLabel("Empty"));
		midListBox->setSelectedIndex(0);
	}
	int capLength = 6 + Util::intlen((selectedList + 1)) + Util::intlen(cardLists.size());
	char *cap = new char[capLength+1];
	memset(cap,'\0',capLength+1);
	sprintf(cap, "Page %d/%d", (selectedList + 1), cardLists.size());
	((Label*)this->getMain()->getChildren()[1]->getChildren()[1])->setCaption(cap);
}

AlbumViewScreen::~AlbumViewScreen() {
	lprintfln("~AlbumViewScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	midListBox->clear();
	for (int i = 0; i < cardLists.size(); i++) {
		delete cardLists[i];
		cardLists[i] = NULL;
	}
	cardLists.clear();
	delete mainLayout;
	mainLayout = NULL;
	if(next!=NULL){
		delete next;
		feed->remHttp();
		next = NULL;
	}
	if (mImageCache != NULL) {
		delete mImageCache;
		mImageCache = NULL;
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
		if (emp){
			listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
		}
		else {
			cardLists[selectedList]->getChildren()[cardLists[selectedList]->getSelectedIndex()]->setSelected(true);
		}
	}
	Screen::show();

	int capLength = 6 + Util::intlen((selectedList + 1)) + Util::intlen(cardLists.size());
	char *cap = new char[capLength+1];
	memset(cap,'\0',capLength+1);
	sprintf(cap, "Page %d/%d", (selectedList + 1), cardLists.size());
	((Label*)this->getMain()->getChildren()[1]->getChildren()[1])->setCaption(cap);
}

void AlbumViewScreen::hide() {
	if (listBox->getChildren().size() > 0) {
		if (emp){
			listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
		}
		else {
			cardLists[selectedList]->getChildren()[cardLists[selectedList]->getSelectedIndex()]->setSelected(false);
		}
	}
	Screen::hide();
}

void AlbumViewScreen::keyPressEvent(int keyCode) {
	int selected = (cardLists[0]->getChildren().size() * selectedList) + cardLists[selectedList]->getSelectedIndex();
	String all = "";
	int max = 0;
	int currentindex = 0;
	if (emp) {
		max = midListBox->getChildren().size();
		currentindex = midListBox->getSelectedIndex();
	}
	else {
		max = cardLists[selectedList]->getChildren().size();
		currentindex = cardLists[selectedList]->getSelectedIndex();
	}
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];
	if (albumType != AT_COMPARE &&
			albumType != AT_DECK) {
		orig = this;
	}
	switch(keyCode) {
		case MAK_UP:
			if(currentSelectedKey!=NULL){
				currentSelectedKey->setSelected(false);
				currentSelectedKey = NULL;
				currentKeyPosition = -1;
				if (emp) {
					midListBox->getChildren()[max-1]->setSelected(true);
				}
				else {
					cardLists[selectedList]->getChildren()[max-1]->setSelected(true);
				}
			}
			else {
				if (emp) {
					midListBox->selectPreviousItem();
				}
				else {
					cardLists[selectedList]->selectPreviousItem();
				}
			}
			break;
		case MAK_DOWN:
			if (currentindex+1 < max) {
				if (emp) {
					midListBox->selectNextItem();
				}
				else {
					cardLists[selectedList]->selectNextItem();
				}
			} else {
				if (emp) {
					midListBox->getChildren()[currentindex]->setSelected(false);
				}
				else {
					cardLists[selectedList]->getChildren()[currentindex]->setSelected(false);
				}
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
			} else if (!emp) {
				switchList(1);
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
			} else if (!emp) {
				switchList(-1);
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			if (!busy) {
				all = getAll();
				Util::saveData(filename.c_str(), all.c_str());
				all = "";
			}
			if ((albumType == AT_BUY)||(albumType == AT_FREE)) {
				previous->refresh();
				break;
			}
			if ((albumType == AT_NEW_CARDS) || (albumType == AT_AUCTION)) {
				((AlbumLoadScreen *)previous)->refresh();
			} else {
				previous->pop();
			}
			break;
		case MAK_FIRE:
			if(currentSoftKeys->getChildren()[0]->isSelected()){
				keyPressEvent(MAK_SOFTLEFT);
				break;
			}else if(currentSoftKeys->getChildren()[2]->isSelected()){
				keyPressEvent(MAK_SOFTRIGHT);
				break;
			}
			if (albumType == AT_PRODUCT || albumType == AT_FRIENDS) {
				break;
			}
			if (!emp && !busy && strcmp(cards.find(index[selected])->second->getQuantity().c_str(), "0") != 0) {
				if (next != NULL) {
					delete next;
					feed->remHttp();
					next = NULL;
				}
				if (albumType == AT_COMPARE) {
					next = new CompareScreen(this, RES_LOADING_FLIP1, feed, false, cards.find(index[selected])->second, card);
					next->show();
				} else if (albumType == AT_AUCTION) {
					next = new AuctionCreateScreen(this, feed, cards.find(index[selected])->second);
					next->show();
				} else {
					if (albumType == AT_DECK) {
						busy = true;
						adding = true;
						notice->setCaption("Adding...");
						addCard(cards.find(index[selected])->second->getId());
					} else {
						if (albumType == AT_NEW_CARDS) {
							next = new ImageScreen(this, Util::loadImageFromResource(RES_LOADING1), feed, false, cards.find(index[selected])->second, ImageScreen::ST_NEW_CARD);
						}
						else {
							next = new ImageScreen(this, Util::loadImageFromResource(RES_LOADING1), feed, false, cards.find(index[selected])->second);
						}
						next->show();
					}
				}
			}
			break;
		case MAK_SOFTLEFT:
			if(albumType == AT_FRIENDS){
				break;
			}
			if (!emp && !hasConnection) {
				notice->setCaption("Unable to connect, try again later...");
				feed->remHttp();
			}
			else if (!emp && !busy && strcmp(cards.find(index[selected])->second->getQuantity().c_str(), "0") != 0) {
				if (next != NULL) {
					delete next;
					feed->remHttp();
					next = NULL;
				}
				if (albumType == AT_AUCTION) {
					next = new AuctionCreateScreen(this, feed, cards.find(index[selected])->second);
				}
				else if (albumType == AT_NEW_CARDS) {
					next = new OptionsScreen(feed, OptionsScreen::ST_NEW_CARD,
							this, cards.find(index[selected])->second);
				} else if (albumType == AT_DECK) {
					next = new ImageScreen(this, Util::loadImageFromResource(RES_LOADING1), feed, false, cards.find(index[selected])->second, ImageScreen::ST_DECK);
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

void AlbumViewScreen::switchList(int nextOrPrev) {
	int currentIndex = cardLists[selectedList]->getSelectedIndex();

	if ((selectedList + nextOrPrev >= 0) && (selectedList + nextOrPrev < cardLists.size())) {
		selectedList += nextOrPrev;
	}
	else if (selectedList + nextOrPrev < 0) {
		selectedList = cardLists.size() - 1;
	}
	else if (selectedList + nextOrPrev >= cardLists.size()) {
		selectedList = 0;
	}
	midListBox->clear();
	midListBox->add(cardLists[selectedList]);

	currentIndex = currentIndex>=cardLists[selectedList]->getChildren().size()?cardLists[selectedList]->getChildren().size()-1:currentIndex;

	cardLists[selectedList]->setSelectedIndex(currentIndex);
	cardLists[selectedList]->getChildren()[currentIndex]->setSelected(true);

	int capLength = 6 + Util::intlen((selectedList + 1)) + Util::intlen(cardLists.size());
	char *cap = new char[capLength+1];
	memset(cap,'\0',capLength+1);
	sprintf(cap, "Page %d/%d", (selectedList + 1), cardLists.size());
	((Label*)this->getMain()->getChildren()[1]->getChildren()[1])->setCaption(cap);

	currentIndex = 0;
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
		}else if(!strcmp(attrName, "selectable")) {
			selectable = atoi(attrValue);
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
	} else if(!strcmp(parentTag.c_str(), "premium")) {
		premium += data;
	} else if(!strcmp(parentTag.c_str(), "credits")) {
		credits += data;
	} else if(!strcmp(parentTag.c_str(), "updated")) {
		updated += data;
	} else if(!strcmp(parentTag.c_str(), "stat")) {
		statDisplay += data;
	} else if(!strcmp(parentTag.c_str(), "note")) {
		note += data;
	} else if (!strcmp(parentTag.c_str(), "playable")) {
		playable += data;
	}
}


void AlbumViewScreen::menuOptionSelected(int index) {
	previous->show();
}

void AlbumViewScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "card")) {
		if (albumType == AT_BUY) {
			feed->setCredits(credits.c_str());
			feed->setPremium(premium.c_str());
			Util::saveData("fd.sav", feed->getAll().c_str());
		}
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
		playable="";
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
		stat->setSelectable(selectable);
		stats.add(stat);
		statDesc = "";
		statDisplay = "";
		statIVal = "";

		stat = NULL;
		//delete stat;
	} else if(!strcmp(name, "result")) {
		if (albumType == AT_BUY) {
			feed->setCredits(credits.c_str());
			feed->setPremium(premium.c_str());
			Util::saveData("fd.sav", feed->getAll().c_str());
		}
		notice->setCaption(error_msg.c_str());

		if (!strcmp(error_msg.c_str(), "Insufficient funds.")) {
			MenuScreen *confirmation = new MenuScreen(RES_BLANK, "Insufficient funds. Go to Credits screen to get more.");
			confirmation->setMenuWidth(180);
			confirmation->setMarginX(5);
			confirmation->setMarginY(5);
			confirmation->setDock(MenuScreen::MD_CENTER);
			confirmation->setListener(this);
			confirmation->setMenuFontSel(Util::getFontBlack());
			confirmation->setMenuFontUnsel(Util::getFontWhite());
			confirmation->setMenuSkin(Util::getSkinDropDownItem());
			confirmation->addItem("Ok");
			confirmation->show();
		}

		statDesc = "";
		statDisplay = "";
		statIVal = "";

		note="";
		playable="";
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
		busy = false;

		if (adding) {
			((EditDeckScreen*)orig)->refresh();
			((EditDeckScreen*)orig)->show();
		}
	} else if (!strcmp(name, "cardsincategory")) {
		if (AT_BUY) {
			feed->setCredits(credits.c_str());
			feed->setPremium(premium.c_str());
			Util::saveData("fd.sav", feed->getAll().c_str());
		}
		notice->setCaption("");
		clearCardMap();
		cards = tmp;
		drawList();
		busy = false;
		if(albumType != AT_FRIENDS){
			String all = getAll();
			Util::saveData(filename.c_str(), all.c_str());
			all = "";
		}
		notice->setCaption("");
		statDesc = "";
		statDisplay = "";
		statIVal = "";

		note="";
		playable="";
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
		playable="";
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
