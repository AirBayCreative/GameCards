#include <conprint.h>

#include "AlbumLoadScreen.h"
#include "AlbumViewScreen.h"
#include "../utils/Util.h"
#include "../utils/Albums.h"
#include "GamePlayScreen.h"
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

	switch(screenType) {
		case ST_ALBUMS:
		case ST_COMPARE:
			notice->setCaption(checking_albums);
			album->setAll(this->feed->getAlbum()->getAll().c_str());
			drawList();
			urlLength = ALBUMS.length() + strlen(seconds) + feed->getSeconds().length() + 2;
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&%s=%s", ALBUMS.c_str(), seconds, feed->getSeconds().c_str());
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_PLAY:
			notice->setCaption(checking_albums);

			drawList();
			//work out how long the url will be, the 2 is for the & and = symbols
			int urlLength = PLAYABLE_CATEGORIES.length() + strlen(xml_username) + feed->getUsername().length() + 2;
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&%s=%s", PLAYABLE_CATEGORIES.c_str(), xml_username, feed->getUsername().c_str());
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_GAMES:
			break;
	}
	if(res < 0) {
		hasConnection = false;
		notice->setCaption("");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	this->setMain(mainLayout);

	if (url != NULL) {
		delete url;
	}
}

AlbumLoadScreen::AlbumLoadScreen(Screen *previous, Feed *feed, int screenType, Albums *a, bool auction, Card *card) : mHttp(this),
		previous(previous), feed(feed), screenType(screenType), isAuction(auction), card(card) {
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
	mainLayout = createMainLayout("", back, true);

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	album = new Albums();
	switch(screenType) {
		case ST_ALBUMS:
		case ST_COMPARE:
			notice->setCaption(checking_albums);
			album->setAll(this->feed->getAlbum()->getAll().c_str());
			drawList();
			urlLength = ALBUMS.length() + strlen(seconds) + feed->getSeconds().length() + 2;
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&%s=%s", ALBUMS.c_str(), seconds, feed->getSeconds().c_str());
			res = mHttp.create(url, HTTP_GET);
			break;
		case ST_PLAY:
			notice->setCaption(checking_albums);

			drawList();
			//work out how long the url will be, the 2 is for the & and = symbols
			int urlLength = PLAYABLE_CATEGORIES.length() + strlen(xml_username) + feed->getUsername().length() + 2;
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&%s=%s", PLAYABLE_CATEGORIES.c_str(), xml_username, feed->getUsername().c_str());
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
				notice->setCaption(checking_games);
				drawList();
				res = mHttp.create(LISTGAMES.c_str(), HTTP_GET);
			}

			break;
	}
	if(res < 0) {
		hasConnection = false;
		notice->setCaption("");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	this->setMain(mainLayout);

	if (url != NULL) {
		delete url;
	}

	//orig = this;
}

AlbumLoadScreen::~AlbumLoadScreen() {
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
		delete album;
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
	if (feed->setTouch(truesz) && screenType == ST_ALBUMS) {
		saveData(FEED, feed->getAll().c_str());
	}

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
			//((KineticListBox *)this->getMain()->getChildren()[0]->getChildren()[2])->setSelectedIndex(i);
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

	int ind = listBox->getSelectedIndex();
	Vector<String> display = album->getNames();
	String albumname = "";
	size = 0;
	for(Vector<String>::iterator itr = display.begin(); itr != display.end(); itr++) {
		albumname = itr->c_str();
		label = createSubLabel(itr->c_str());
		label->setPaddingBottom(5);
		label->addWidgetListener(this);
		listBox->add(label);

		size++;
	}
	if (album->size() >= 1) {
		if (ind < album->size()) {
			listBox->setSelectedIndex(ind);
		} else {
			listBox->setSelectedIndex(0);
		}
	} else {
		empt = true;
		label = createSubLabel(empty);
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
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontBlack);
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
							if (strcmp(val->getId().c_str(), album_newcards) == 0) {
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
						next = new GamePlayScreen(this, feed, true, val->getId());
						next->show();
						break;
					case ST_GAMES:
						next = new GamePlayScreen(this, feed, false, val->getId());
						next->show();
						break;
				}
			}
			break;
	}
}

void AlbumLoadScreen::loadCategory() {
	updateSoftKeyLayout("", back, "", mainLayout);

	//the list needs to be cleared
	album->clearAll();
	clearListBox();
	//then if the category has been loaded before, we need to load from the file
	notice->setCaption(checking_albums);
	if (path.size() == 0) {
		album->setAll(this->feed->getAlbum()->getAll().c_str());
	}
	else {
		char *file = new char[path.end()->length() + 5];
		sprintf(file, "%s%s%s", "a", path[path.size()-1].c_str(), ".sav");
		album->setAll(getData(file));
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
			urlLength = ALBUMS.length() + strlen(seconds) + feed->getSeconds().length() + 2;
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&%s=%s", ALBUMS.c_str(), seconds, feed->getSeconds().c_str());
			res = mHttp.create(url, HTTP_GET);
		}
		else {
			//work out how long the url will be, the 4 is for the & and = symbols
			urlLength = SUBCATEGORIES.length() + strlen(category) + path[path.size()-1].length() + strlen(seconds) + feed->getSeconds().length() + 4;
			url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&%s=%s&%s=%s", SUBCATEGORIES.c_str(), category, path[path.size()-1].c_str(), seconds, feed->getSeconds().c_str());
			res = mHttp.create(url, HTTP_GET);
		}

		if(res < 0) {
			notice->setCaption("");
		} else {
			mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
			mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
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
	if (!strcmp(name, xml_albumdone) || !strcmp(name, categories)) {
		album->clearAll();
	}
	parentTag = name;
}

void AlbumLoadScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void AlbumLoadScreen::mtxTagData(const char* data, int len) {
	if (!strcmp(parentTag.c_str(), xml_albumdone)) {
		album->clearAll();
	} else if(!strcmp(parentTag.c_str(), xml_albumname)) {
		temp1 = data;
	} else if(!strcmp(parentTag.c_str(), xml_albumid)) {
		temp += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), category_name)) {
		temp1 = data;
	} else if(!strcmp(parentTag.c_str(), category_id)) {
		temp += data;
	} else if(!strcmp(parentTag.c_str(), xml_game_description)) {
		temp1 = data;
	} else if(!strcmp(parentTag.c_str(), xml_game_id)) {
		temp += data;
	} else if (!strcmp(parentTag.c_str(), xml_hascards)) {
		hasCards += data;
	} else if (!strcmp(parentTag.c_str(), xml_updated)) {
		updated += data;
	}
}

void AlbumLoadScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_album) || !strcmp(name, category_name) || !strcmp(name, xml_game_description)) {
		notice->setCaption("");
		album->addAlbum(temp.c_str(), temp1, (hasCards=="true"), (updated=="1"));
		temp = "";
		hasCards = "";
		updated = "";
	} else if (!strcmp(name, xml_albumdone) || !strcmp(name, categories) || !strcmp(name, xml_games)) {
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
				saveData(ALBUM, album->getAll().c_str());
			}
			else {
				char *file = new char[path.end()->length() + 5];
				sprintf(file, "%s%s%s", "a", path[path.size()-1].c_str(), ".sav");
				saveData(file, album->getAll().c_str());
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
							if (strcmp(val->getId().c_str(), album_newcards) == 0) {
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
						next = new GamePlayScreen(this, feed, true, val->getId());
						next->show();
						break;
					case ST_GAMES:
						next = new GamePlayScreen(this, feed, false, val->getId());
						next->show();
						break;
					}
				}
			}
	} else if(!strcmp(name, xml_error)) {
		notice->setCaption(error_msg.c_str());
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
