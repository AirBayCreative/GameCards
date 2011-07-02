#include <conprint.h>

#include "AlbumLoadScreen.h"
#include "AlbumViewScreen.h"
#include "../utils/Util.h"
#include "../utils/Albums.h"
#include "GamePlayScreen.h"
#include "OptionsScreen.h"
#include "../utils/Album.h"

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
	delete album;
	album = new Albums();

	notice->setCaption("Checking for new albums...");
	String alb = this->feed->getAlbum()->getAll();
	album->setAll(alb.c_str());
	alb = "";
	drawList();
	urlLength = 52 + feed->getSeconds().length();
	url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "http://dev.mytcg.net/_phone/?usercategories=1&seconds=%s", feed->getSeconds().c_str());
	res = mHttp.create(url, HTTP_GET);

	if(res < 0) {
		hasConnection = false;
		notice->setCaption("");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		mHttp.finish();
	}
	this->setMain(mainLayout);

	if (url != NULL) {
		delete url;
	}
}

AlbumLoadScreen::AlbumLoadScreen(Screen *previous, Feed *feed, int screenType, Albums *a, bool auction, Card *card) : mHttp(this),
		previous(previous), feed(feed), screenType(screenType), isAuction(auction), card(card) {
	lprintfln("AlbumLoadScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	size = 0;
	moved = 0;
	int res = -1;
	char *url = NULL;
	int urlLength = 0;

	hasCards = "";
	temp = "";
	temp1 = "";
	updated = "0";

	next = NULL;
	mainLayout = Util::createMainLayout("", "Back", true);

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	album = new Albums();

	switch(screenType) {
		case ST_ALBUMS:
		case ST_COMPARE:
		case ST_AUCTION:
			notice->setCaption("Checking for new albums...");

			album->setAll(this->feed->getAlbum()->getAll().c_str());
			urlLength = 60 + feed->getSeconds().length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "http://dev.mytcg.net/_phone/?usercategories=1&seconds=%s", feed->getSeconds().c_str());
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_PLAY:
			notice->setCaption("Checking for new albums...");

			//work out how long the url will be, the 2 is for the & and = symbols
			int urlLength = 60 + feed->getUsername().length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "http://dev.mytcg.net/_phone/?playablecategories=1&username=%s", feed->getUsername().c_str());
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
				drawList();
				res = mHttp.create("http://dev.mytcg.net/_phone/?getusergames=1", HTTP_GET);
			}

			break;
	}
	if(res < 0) {
		hasConnection = false;
		notice->setCaption("");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		mHttp.finish();
	}
	drawList();


	this->setMain(mainLayout);

	if (url != NULL) {
		delete url;
	}
}

AlbumLoadScreen::~AlbumLoadScreen() {
	clearListBox();
	listBox->clear();
	delete mainLayout;
	if(next!=NULL){
		delete next;
	}
	parentTag="";
	temp="";
	temp1="";
	error_msg="";
	hasCards="";
	updated="";

	if (screenType == ST_PLAY || screenType == ST_ALBUMS) {
		if (album != NULL) {
			delete album;
		}
		album = NULL;
	}
}

#if defined(MA_PROF_SUPPORT_STYLUS)

void AlbumLoadScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void AlbumLoadScreen::pointerMoveEvent(MAPoint2d point)
{
	moved++;
    locateItem(point);
}

void AlbumLoadScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		} else if (mid) {
			keyPressEvent(MAK_FIRE);
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

#endif

void AlbumLoadScreen::drawList() {
	empt = false;
	clearListBox();
	listBox->clear();
	int ind = listBox->getSelectedIndex();
	Vector<String> display = album->getNames();
	String albumname = "";
	size = 0;
	for(Vector<String>::iterator itr = display.begin(); itr != display.end(); itr++) {
		albumname = itr->c_str();
		label = Util::createSubLabel(itr->c_str());
		label->setPaddingBottom(5);
		label->addWidgetListener(this);
		listBox->add(label);

		size++;
	}
	display.clear();
	if (album->size() >= 1) {
		if (ind < album->size()) {
			listBox->setSelectedIndex(ind);
		} else {
			listBox->setSelectedIndex(0);
		}
	} else {
		empt = true;
		label = Util::createSubLabel("Empty");
		label->addWidgetListener(this);
		listBox->add(label);
		size++;
	}
}

void AlbumLoadScreen::clearListBox() {
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

void AlbumLoadScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(Util::getDefaultSelected());
	} else {
		((Label *)widget)->setFont(Util::getDefaultFont());
	}
}

void AlbumLoadScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void AlbumLoadScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void AlbumLoadScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			if (path.size() > 0) {
				path.remove(path.size()-1);
				loadCategory();
			}
			else {
				previous->show();
			}
			break;
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			if (!empt) {
				Album* val = (album->getAlbum(((Label *)listBox->getChildren()[listBox->getSelectedIndex()])->getCaption()));
				if (next != NULL) {
					delete next;
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
						next = new OptionsScreen(feed, OptionsScreen::ST_NEW_GAME_OPTIONS, this, NULL, val->getId());
						next->show();
						/*next = new GamePlayScreen(this, feed, true, val->getId());
						next->show();*/
						break;
					case ST_GAMES:
						next = new GamePlayScreen(this, feed, false, val->getId());
						next->show();
						break;
				}
				//delete val;
			}
			break;
	}
}

void AlbumLoadScreen::loadCategory() {
	Util::updateSoftKeyLayout("", "Back", "", mainLayout);
	//the list needs to be cleared
	album->clearAll();
	clearListBox();
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
			urlLength = 60 + feed->getSeconds().length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "http://dev.mytcg.net/_phone/?usercategories=1&seconds=%s", feed->getSeconds().c_str());
			res = mHttp.create(url, HTTP_GET);
		}
		else {
			//work out how long the url will be, the 4 is for the & and = symbols
			urlLength = 70 + path[path.size()-1].length() + feed->getSeconds().length();
			url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "http://dev.mytcg.net/_phone/?usersubcategories=1&category=%s&seconds=%s", path[path.size()-1].c_str(), feed->getSeconds().c_str());
			res = mHttp.create(url, HTTP_GET);
		}

		if(res < 0) {
			notice->setCaption("");
		} else {
			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
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
		notice->setCaption("Unable to connect, try again later...");
	}
}

void AlbumLoadScreen::connReadFinished(Connection* conn, int result) {}

void AlbumLoadScreen::xcConnError(int code) {
	if (code == -6) {
		return;
	} else {
		//TODO handle error
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
		temp1 = data;
	} else if(!strcmp(parentTag.c_str(), "albumid")) {
		temp = data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg = data;
	} else if(!strcmp(parentTag.c_str(), "categoryname")) {
		temp1 = data;
	} else if(!strcmp(parentTag.c_str(), "categoryid")) {
		temp = data;
	} else if(!strcmp(parentTag.c_str(), "gamedescription")) {
		temp1 = data;
	} else if(!strcmp(parentTag.c_str(), "gameid")) {
		temp = data;
	} else if (!strcmp(parentTag.c_str(), "hascards")) {
		hasCards = data;
	} else if (!strcmp(parentTag.c_str(), "updated")) {
		updated = data;
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
			default:
				notice->setCaption("");
				break;
		}
		if (screenType == ST_ALBUMS) {
			if (path.size() == 0) {
				this->feed->getAlbum()->setAll(album->getAll().c_str());
				Util::saveData("lb.sav", album->getAll().c_str());
			}
			else {
				char *file = new char[path[path.size()-1].length() + 6];
				memset(file, 0, path.end()->length() + 6);
				sprintf(file, "a%s.sav", path[path.size()-1].c_str());
				Util::saveData(file, album->getAll().c_str());
				delete file;
			}
		}
		drawList();
		if (album->size() == 1) {
			Album* val = album->getAlbum(temp1);
			if (val != NULL) {
				if (next != NULL) {
					delete next;
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
						next = new OptionsScreen(feed, OptionsScreen::ST_NEW_GAME_OPTIONS, this, NULL, val->getId());
						next->show();
						/*next = new GamePlayScreen(this, feed, true, val->getId());
						next->show();*/
						break;
					case ST_GAMES:
						next = new GamePlayScreen(this, feed, false, val->getId());
						next->show();
						break;
					}
				}
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

void AlbumLoadScreen::mtxParseError() {}

void AlbumLoadScreen::mtxEmptyTagEnd() {
}

void AlbumLoadScreen::mtxTagStartEnd() {
}
int AlbumLoadScreen::getCount() {
	return size;
}
