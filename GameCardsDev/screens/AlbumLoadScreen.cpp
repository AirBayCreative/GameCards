#include <conprint.h>
#include <mastdlib.h>

#include "AlbumLoadScreen.h"
#include "AlbumViewScreen.h"
#include "../utils/Util.h"
#include "../utils/Albums.h"
#include "GamePlayScreen.h"
#include "OptionsScreen.h"
#include "../utils/Album.h"
#include "DeckListScreen.h"
#include "../UI/Button.h"


void AlbumLoadScreen::refresh() {
	show();
	path.clear();
	if(mHttp.isOpen()){
		mHttp.close();
	}

	int res = -1;
	char *url = NULL;
	int urlLength = 0;

	mHttp = HttpConnection(this);
	//delete album;
	if (album == NULL) {
		album = new Albums();
	} else {
		album->clearAll();
	}
	String alb = this->feed->getAlbum()->getAll();
	album->setAll(alb.c_str());
	alb = "";
	drawList();
	if(screenType == ST_LOBBY){
		notice->setCaption("Checking games...");
		urlLength = 72 + URLSIZE + categoryId.length();
		url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?getopengames=1&categoryid=%s", URL, categoryId.c_str());
		lprintfln("%s", url);
		res = mHttp.create(url, HTTP_GET);
	}else{
		notice->setCaption("Checking for new albums...");
		urlLength = 52+URLSIZE + feed->getSeconds().length();
		url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?usercategories=1&seconds=%s", URL, feed->getSeconds().c_str());
		lprintfln("%s", url);
		res = mHttp.create(url, HTTP_GET);
	}
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
	this->setMain(mainLayout);

	if (url != NULL) {
		delete url;
		url = NULL;
	}
}

AlbumLoadScreen::AlbumLoadScreen(MainScreen *previous, Feed *feed, int screenType, Albums *a, bool auction, Card *card, String categoryId) : mHttp(this),
		screenType(screenType), isAuction(auction), card(card), categoryId(categoryId) {
	this->previous = previous;
	this->feed = feed;
	lprintfln("AlbumLoadScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	size = 0;
	moved = 0;
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	int res = -1;
	char *url = NULL;
	int urlLength = 0;
	selectedList = 0;

	hasCards = "";
	temp = "";
	empt = true;
	shown = false;
	temp1 = "";
	deckId = "";
	friendId="0";
	updated = "0";

	next = NULL;
	mainLayout = Util::createMainLayout("", "Back");

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	album = new Albums();

	switch(screenType) {
		case ST_ALBUMS:
		case ST_COMPARE:
		case ST_AUCTION:
			notice->setCaption("Checking for new albums...");
			album->setAll(this->feed->getAlbum()->getAll().c_str());
			urlLength = 60 + URLSIZE + feed->getSeconds().length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?usercategories=1&seconds=%s", URL, feed->getSeconds().c_str());
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_FRIENDS:
			notice->setCaption("Checking for friend albums...");
			friendId = categoryId;
			this->categoryId = "";
			//album->setAll(this->feed->getAlbum()->getAll().c_str());
			urlLength = 70 + URLSIZE + feed->getSeconds().length() + friendId.length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?usercategories=1&seconds=%s&friendid=%s", URL, feed->getSeconds().c_str(), friendId.c_str());
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_PLAY:
			notice->setCaption("Checking for new albums...");

			//work out how long the url will be, the 2 is for the & and = symbols
			urlLength = 60 + URLSIZE + feed->getUsername().length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?playablecategories=1&username=%s", URL, feed->getUsername().c_str());
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_GAMES:
			listBox->setHeight(listBox->getHeight() - 20);

			if (a != NULL) {
				notice->setCaption("Please choose a game to continue.");
				album = a;
				drawList();
				this->setMain(mainLayout);
				orig = this;
				return;
			}
			else {
				notice->setCaption("Checking games...");
				//drawList();
				int urlLength = 60 + URLSIZE;
				url = new char[urlLength+1];
				memset(url,'\0',urlLength+1);
				sprintf(url, "%s?getusergames=1", URL);
				lprintfln("%s", url);
				res = mHttp.create(url, HTTP_GET);
			}
			break;
		case ST_LOBBY:
			listBox->setHeight(listBox->getHeight() - 20);
			notice->setCaption("Checking games...");
			Util::updateSoftKeyLayout("Host Game", "Back", "", mainLayout);
			urlLength = 72 + URLSIZE + categoryId.length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?getopengames=1&categoryid=%s", URL, categoryId.c_str());
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_DECK:
			path.add(categoryId);

			notice->setCaption("Checking for new albums...");
			//work out how long the url will be, the 4 is for the & and = symbols
			urlLength = 70 + URLSIZE + path[path.size()-1].length() + feed->getSeconds().length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?usersubcategories=1&category=%s&seconds=%s", URL, categoryId.c_str(), feed->getSeconds().c_str());
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
			break;
	}
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

	this->setMain(mainLayout);

	drawList();

	if (url != NULL) {
		delete url;
	}
}

AlbumLoadScreen::~AlbumLoadScreen() {
	lprintfln("~AlbumLoadScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
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
		next = NULL;
		feed->remHttp();
	}
	parentTag="";
	temp="";
	temp1="";
	error_msg="";
	hasCards="";
	updated="";
	friendId="";

	if (screenType == ST_PLAY || screenType == ST_ALBUMS) {
		if (album != NULL) {
			delete album;
			album = NULL;
		}
	}
}

void AlbumLoadScreen::pointerPressEvent(MAPoint2d point)
{
	xStart = point.x;
    locateItem(point);
}

void AlbumLoadScreen::pointerMoveEvent(MAPoint2d point)
{
	moved++;
    locateItem(point);
}

void AlbumLoadScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (!empt && (list || listLeft || listRight)) {
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

void AlbumLoadScreen::locateItem(MAPoint2d point)
{
	list = false;
	left = false;
	right = false;
	mid = false;
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
				moved=0;
				left = true;
			} else if (i == 1) {
				moved=0;
				mid = true;
			} else if (i == 2) {
				moved=0;
				right = true;
			}
			return;
		}
	}
}

void AlbumLoadScreen::drawList() {
	clearListBox();
	empt = false;
	listBox->clear();
	int ind = listBox->getSelectedIndex();
	int itemsPerList = listBox->getHeight() / ITEM_HEIGHT;
	Vector<String> display = album->getNames();
	Layout *listLayout;
	//check if we need more than 1 page
	if (itemsPerList < display.size()) {
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
	String albumname = "";
	size = 0;
	for(Vector<String>::iterator itr = display.begin(); itr != display.end(); itr++) {
		albumname = itr->c_str();
		if (i % itemsPerList == 0) {
			tempList = new ListBox(0, 0, midListBox->getWidth(), midListBox->getHeight(), NULL);
			tempList->setOrientation(ListBox::LBO_VERTICAL);
			tempList->setDrawBackground(false);
			currentList++;
			cardLists.add(tempList);
		}

		if (!((screenType==ST_AUCTION)&&!strcmp(albumname.c_str(), "New Cards"))) {
			label = Util::createSubLabel(albumname, midListBox->getWidth(), DEFAULT_LABEL_HEIGHT);
			label->setPaddingBottom(5);
			label->addWidgetListener(this);
			tempList->add(label);

			size++;
		}
		albumname = "";

		i++;
	}
	albumname="";
	display.clear();
	if (album->size() >= 1) {
		int listIndex = ind / itemsPerList;
		int listItem = ind % itemsPerList;
		selectedList = listIndex;
		midListBox->add(cardLists[listIndex]);
		cardLists[listIndex]->setSelectedIndex(listItem);
		cardLists[listIndex]->getChildren()[cardLists[listIndex]->getSelectedIndex()]->setSelected(true);
		/*if (ind < album->size()) {
			listBox->setSelectedIndex(ind);
		} else {
			listBox->setSelectedIndex(0);
		}*/
	} else {
		empt = true;
		midListBox->add(Util::createSubLabel("Empty"));
		midListBox->setSelectedIndex(0);
		size++;
	}
	int capLength = 6 + Util::intlen((selectedList + 1)) + Util::intlen(cardLists.size());
	char *cap = new char[capLength+1];
	memset(cap,'\0',capLength+1);
	sprintf(cap, "Page %d/%d", (selectedList + 1), cardLists.size());

	if (shown) {
		((Label*)this->getMain()->getChildren()[1]->getChildren()[1])->setCaption(cap);
	}
}

void AlbumLoadScreen::clearListBox() {
	Vector<Widget*> tempWidgets;

	if (!empt) {
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

void AlbumLoadScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget)->setFont(Util::getDefaultFont());
	}
}

void AlbumLoadScreen::show() {
	shown = true;
	if (listBox->getChildren().size() > 0) {
		if (empt){
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

void AlbumLoadScreen::hide() {
	shown = false;
	if (listBox->getChildren().size() > 0) {
		if (empt){
			listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
		}
		else {
			cardLists[selectedList]->getChildren()[cardLists[selectedList]->getSelectedIndex()]->setSelected(false);
		}
	}
	Screen::hide();
}

void AlbumLoadScreen::keyPressEvent(int keyCode) {
	int selected = (cardLists[0]->getChildren().size() * selectedList) + cardLists[selectedList]->getSelectedIndex();
	int max = 0;
	int index = 0;
	if (empt) {
		max = midListBox->getChildren().size();
		index = midListBox->getSelectedIndex();
	}
	else {
		max = cardLists[selectedList]->getChildren().size();
		index = cardLists[selectedList]->getSelectedIndex();
	}
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];
	switch(keyCode) {
		case MAK_UP:
			if(currentSelectedKey!=NULL){
				currentSelectedKey->setSelected(false);
				currentSelectedKey = NULL;
				currentKeyPosition = -1;
				if (empt) {
					midListBox->getChildren()[max-1]->setSelected(true);
				}
				else {
					cardLists[selectedList]->getChildren()[max-1]->setSelected(true);
				}
			}
			else {
				if (empt) {
					midListBox->selectPreviousItem();
				}
				else {
					cardLists[selectedList]->selectPreviousItem();
				}
			}

			break;
		case MAK_DOWN:
			if (index+1 < max) {
				if (empt) {
					midListBox->selectNextItem();
				}
				else {
					cardLists[selectedList]->selectNextItem();
				}
			} else {
				if (empt) {
					midListBox->getChildren()[index]->setSelected(false);
				}
				else {
					cardLists[selectedList]->getChildren()[index]->setSelected(false);
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
			} else if (!empt) {
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
			} else if (!empt) {
				switchList(-1);
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			switch(screenType) {
				case ST_DECK:
					if (path.size() > 1) {
						path.remove(path.size()-1);
						loadCategory();
					}
					else {
						previous->show();
					}
					break;
				default:
					if (path.size() > 0) {
						path.remove(path.size()-1);
						loadCategory();
					}
					else {
						previous->show();
					}
					break;
			}
			break;
			case MAK_SOFTLEFT:
				switch(screenType){
					case ST_LOBBY:
						if (next != NULL) {
							delete next;
							feed->remHttp();
							next = NULL;
						}
						next = new GamePlayScreen(this, feed, true, categoryId, "2", false, deckId, 1, "-1");
						next->show();
						break;
				}
		case MAK_FIRE:
			if(currentSoftKeys->getChildren()[0]->isSelected()){
				keyPressEvent(MAK_SOFTLEFT);
			}else if(currentSoftKeys->getChildren()[2]->isSelected()){
				keyPressEvent(MAK_SOFTRIGHT);
			}else if (!empt) {
				Album* val = (album->getAlbum(((Label *)cardLists[selectedList]->getChildren()[cardLists[selectedList]->getSelectedIndex()])->getCaption()));
				if (next != NULL) {
					delete next;
					feed->remHttp();
					next = NULL;
				}
				switch (screenType) {
					case ST_ALBUMS:
						if (val->getHasCards()) {
							if (strcmp(val->getId().c_str(), "-3") == 0) {
								next = new AlbumViewScreen(this, feed, val->getId(), AlbumViewScreen::AT_NEW_CARDS, isAuction);
								next->show();
							}
							else {
								next = new AlbumViewScreen(this, feed, val->getId(), AlbumViewScreen::AT_NORMAL, isAuction);
								next->show();
							}
						}
						else {
							//if a category has no cards, it means it has sub categories.
							//it is added to the path so we can back track
							path.add(val->getId());
							//then it must be loaded
							loadCategory();
						}
						break;
					case ST_AUCTION:
						if (val->getHasCards()) {
							next = new AlbumViewScreen(this, feed, val->getId(), AlbumViewScreen::AT_AUCTION, isAuction);
							next->show();
						}
						else {
							//if a category has no cards, it means it has sub categories.
							//it is added to the path so we can back track
							path.add(val->getId());
							//then it must be loaded
							loadCategory();
						}
						break;
					case ST_FRIENDS:
						if (val->getHasCards()) {
							next = new AlbumViewScreen(this, feed, val->getId(), AlbumViewScreen::AT_FRIENDS, isAuction, NULL,"",friendId);
							next->show();
						}
						else {
							//if a category has no cards, it means it has sub categories.
							//it is added to the path so we can back track
							path.add(val->getId());
							//then it must be loaded
							loadCategory();
						}
					break;
					case ST_COMPARE:
						if (val->getHasCards()) {
							next = new AlbumViewScreen(this, feed, val->getId(), AlbumViewScreen::AT_COMPARE, isAuction, card);
							next->show();
						}
						else {
							//if a category has no cards, it means it has sub categories.
							//it is added to the path so we can back track
							path.add(val->getId());
							//then it must be loaded
							loadCategory();
						}
						break;
					case ST_PLAY:
						next = new DeckListScreen(this, feed, DeckListScreen::ST_SELECT, val->getId());
						next->show();
						break;
					case ST_GAMES:
						next = new GamePlayScreen(this, feed, false, val->getId());
						next->show();
						break;
					case ST_LOBBY:
						next = new GamePlayScreen(this, feed, true, categoryId, "2", false, deckId, 2, val->getId());
						next->show();
						break;
					case ST_DECK:
						if (val->getHasCards()) {
							next = new AlbumViewScreen(this, feed, val->getId(), AlbumViewScreen::AT_DECK, isAuction, card, deckId);
							next->show();
						}
						else {
							//if a category has no cards, it means it has sub categories.
							//it is added to the path so we can back track
							path.add(val->getId());
							//then it must be loaded
							loadCategory();
						}
						break;
				}
				//delete val;
			}
			break;
	}
}

void AlbumLoadScreen::switchList(int nextOrPrev) {
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

void AlbumLoadScreen::loadCategory() {
	Util::updateSoftKeyLayout("", "Back", "", mainLayout);
	//the list needs to be cleared
	album->clearAll();
	listBox->clear();
	//then if the category has been loaded before, we need to load from the file
	notice->setCaption("Checking for new albums...");
	if (path.size() == 0) {
		album->setAll(this->feed->getAlbum()->getAll().c_str());
	}
	else {
		char *file = new char[path[path.size()-1].length() + 6];
		memset(file, 0, path[path.size()-1].length() + 6);
		sprintf(file, "a%s.sav", path[path.size()-1].c_str());
		String filecards = "";
		Util::getData(file, filecards);
		album->setAll(filecards.c_str());
		filecards = "";
		delete file;
		file = NULL;
	}
	drawList();
	//then request up to date info, if there is a connection available
	if (hasConnection) {
		int res;
		int urlLength;
		char *url = NULL;
		if(mHttp.isOpen()){
			mHttp.close();
		}
		mHttp = HttpConnection(this);
		if (path.size() == 0) {
			//if path is empty, the list is at the top level
			//work out how long the url will be, the 2 is for the & and = symbols
			urlLength = 70 + URLSIZE + feed->getSeconds().length() + friendId.length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?usercategories=1&seconds=%s&friendid=%s", URL, feed->getSeconds().c_str(),friendId.c_str());
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
		}
		else {
			//work out how long the url will be, the 4 is for the & and = symbols
			urlLength = 80 + URLSIZE + path[path.size()-1].length() + feed->getSeconds().length() + friendId.length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?usersubcategories=1&category=%s&seconds=%s&friendid=%s", URL, path[path.size()-1].c_str(), feed->getSeconds().c_str(),friendId.c_str());
			lprintfln("%s", url);
			res = mHttp.create(url, HTTP_GET);
		}

		if(res < 0) {
			notice->setCaption("");
		} else {
			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();

		}

		if (url != NULL) {
			delete url;
			url = NULL;
		}
	}
}

void AlbumLoadScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption("");
		feed->remHttp();
	}
}

void AlbumLoadScreen::connReadFinished(Connection* conn, int result) {}

void AlbumLoadScreen::xcConnError(int code) {
	feed->remHttp();
	if (code == -6) {
		return;
	} else {

	}
}

void AlbumLoadScreen::mtxEncoding(const char* ) {
}

void AlbumLoadScreen::mtxTagStart(const char* name, int len) {
	if (!strcmp(name, "usercategories") || !strcmp(name, "categories")) {
		album->clearAll();
	}
	parentTag = name;
}

void AlbumLoadScreen::mtxTagAttr(const char* attrName, const char* attrValue) {

}

void AlbumLoadScreen::mtxTagData(const char* data, int len) {
	if (!strcmp(parentTag.c_str(), "usercategories")) {
		//album->clearAll();
	} else if(!strcmp(parentTag.c_str(), "albumname")) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), "albumid")) {
		temp += data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), "categoryname")) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), "categoryid")) {
		temp += data;
	} else if(!strcmp(parentTag.c_str(), "gamedescription")) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), "gameid")) {
		temp += data;
	} else if (!strcmp(parentTag.c_str(), "hascards")) {
		hasCards += data;
	} else if (!strcmp(parentTag.c_str(), "updated")) {
		updated += data;
	}
}

void AlbumLoadScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "album") || !strcmp(name, "categoryname") || !strcmp(name, "gamedescription")) {
		notice->setCaption("");
		album->addAlbum(temp.c_str(), temp1.c_str(), (hasCards=="true"), (updated=="1"));
		temp = "";
		hasCards = "";
		updated = "";
		temp1 = "";
	} else if (!strcmp(name, "usercategories") || !strcmp(name, "categories") || !strcmp(name, "games")) {
		switch (screenType) {
			case ST_PLAY:
				notice->setCaption("Choose game cards.");
				break;
			case ST_GAMES:
				notice->setCaption("Please choose a game to continue.");
				break;
			case ST_LOBBY:
				notice->setCaption("Please choose a game to play.");
				break;
			default:
				notice->setCaption("");
				break;
		}
		if (screenType == ST_ALBUMS) {
			String al = album->getAll();
			if (path.size() == 0) {
				this->feed->getAlbum()->setAll(al.c_str());
				Util::saveData("lb.sav", al.c_str());
			}
			else {
				char *file = new char[path[path.size()-1].length() + 6];
				memset(file, 0, path.end()->length() + 6);
				sprintf(file, "a%s.sav", path[path.size()-1].c_str());
				Util::saveData(file, al.c_str());
				delete file;
				file = NULL;
			}
			al = "";
		}
		drawList();
		if ((album->size() == 1)&&(screenType != ST_ALBUMS)) {
			Vector<String> display = album->getNames();
			Album* val = album->getAlbum(display.begin()->c_str());
			if (val != NULL) {
				if (next != NULL) {
					delete next;
					feed->remHttp();
					next = NULL;
				}
				switch (screenType) {
					case ST_ALBUMS:
						if (val->getHasCards()) {
							if (strcmp(val->getId().c_str(), "-3") == 0) {
								next = new AlbumViewScreen(this, feed, val->getId(), AlbumViewScreen::AT_NEW_CARDS, isAuction);
								next->show();
							}
							else {
								next = new AlbumViewScreen(this, feed, val->getId(), AlbumViewScreen::AT_NORMAL, isAuction);
								next->show();
							}
						}
						else {
							//if a category has no cards, it means it has sub categories.
							//it is added to the path so we can back track
							path.add(val->getId());
							//then it must be loaded
							loadCategory();
						}
						break;
					case ST_COMPARE:
						if (val->getHasCards()) {
							next = new AlbumViewScreen(this, feed, val->getId(), AlbumViewScreen::AT_COMPARE, isAuction, card);
							next->show();
						}
						else {
							//if a category has no cards, it means it has sub categories.
							//it is added to the path so we can back track
							path.add(val->getId());
							//then it must be loaded
							loadCategory();
						}
						break;
					case ST_PLAY:
						next = new DeckListScreen(this, feed, DeckListScreen::ST_SELECT, val->getId());
						next->show();
						break;
					case ST_GAMES:
						next = new GamePlayScreen(this, feed, false, val->getId());
						next->show();
						break;
					}
				}
				display.clear();
			}
		temp = "";
		hasCards = "";
		updated = "";
		temp1 = "";
		error_msg = "";
	} else if(!strcmp(name, "error")) {
		notice->setCaption(error_msg.c_str());
		temp = "";
		hasCards = "";
		updated = "";
		temp1 = "";
		error_msg = "";
	} else {
		notice->setCaption("");
	}
}

void AlbumLoadScreen::mtxParseError(int) {}

void AlbumLoadScreen::mtxEmptyTagEnd() {
}

void AlbumLoadScreen::mtxTagStartEnd() {
}

int AlbumLoadScreen::getCount() {
	return size;
}

void AlbumLoadScreen::setDeckId(String d) {
	deckId = d;
}
