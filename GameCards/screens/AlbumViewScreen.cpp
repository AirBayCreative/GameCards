#include <conprint.h>

#include "AlbumViewScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"
#include "ImageScreen.h"
#include "AuctionCreateScreen.h"
//#include "TradeOptionsScreen.h"


AlbumViewScreen::AlbumViewScreen(Screen *previous, Feed *feed, String filename) : mHttp(this), filename(filename+ALBUMEND), previous(previous), feed(feed), cardExists(cards.end()) {
	emp = true;
	listSizes = 0;
	feedLayouts = NULL;

	next = new Screen();
	error_msg = "";
	if (feed->getTouchEnabled()) {
		mainLayout = createMainLayout(back, auction, "", true);
	} else {
		mainLayout = createMainLayout(back, auction, select, true);
	}
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setCaption(checking_cards);

	mImageCache = new ImageCache();
	loadFile();

	//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
	int urlLength = CARDS.length() + filename.length() + 15 + intlen(scrHeight) + intlen(scrWidth);
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s%s&heigth=%d&width=%d", CARDS.c_str(), filename.c_str(), scrHeight, scrWidth);
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		hasConnection = false;
		notice->setCaption("");
	} else {
		hasConnection = true;
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;
	this->setMain(mainLayout);

	moved=0;
}

void AlbumViewScreen::pointerPressEvent(MAPoint2d point) {
    locateItem(point);
}

void AlbumViewScreen::loadFile() {
	loadImages(getData(filename.c_str()));
}

void AlbumViewScreen::loadImages(const char *text) {
	String all = text;
	int indexof = 0;
	int indentindexof = 0;
	String tmp;
	String id, name;
	while ((indexof = all.find(newline)) > -1) {
		tmp = all.substr(0,indexof++);
		Card *newCard = new Card();
		newCard->setAll(tmp.c_str());
		cards.insert(newCard->getId(), newCard);
		all = all.substr(indexof);
	}
	drawList();
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
	if (feed->setTouch(truesz)) {
		saveData(FEED, feed->getAll().c_str());
	}
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

void AlbumViewScreen::clearFeedLayouts() {
	if (feedLayouts != NULL && listSizes > 0) {
		for (int i = 0; i < cards.size(); i++) {
			delete feedLayouts[i];
		}
		delete [] feedLayouts;
		feedLayouts = NULL;
	}
}

void AlbumViewScreen::drawList() {
	Layout *feedlayout;
	clearFeedLayouts();
	feedLayouts = new Layout*[cards.size()];
	listSizes = 0;
	listBox->getChildren().clear();
	index.clear();
	for(StringCardMap::Iterator itr = cards.begin(); itr != cards.end(); itr++) {
		index.add(itr->second->getId());
		cardText = itr->second->getText();
		cardText += "\nQuantity: ";
		cardText += itr->second->getQuantity();

		feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 2, 1);
		feedlayout->setSkin(gSkinAlbum);
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		feedLayouts[listSizes] = feedlayout;

		tempImage = new Image(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

		listSizes++;

		retrieveThumb(tempImage, itr->second, mImageCache);

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, gFontWhite);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setMultiLine(true);
	}

	if (cards.size() >= 1) {
		emp = false;
		listBox->setSelectedIndex(0);
	} else {
		emp = true;
		listBox->add(createSubLabel(empty));
		listBox->setSelectedIndex(0);
	}
}

AlbumViewScreen::~AlbumViewScreen() {
	//mainLayout->getChildren().clear();
	//listBox->getChildren().clear();

	//delete listBox;
	delete mainLayout;

	/*if (image != NULL) {
		delete image;
		image = NULL;
	}
	if (softKeys != NULL) {
		softKeys->getChildren().clear();
		delete softKeys;
		softKeys = NULL;
	}*/
	//delete notice;
	delete next;
	delete mImageCache;
	//clearFeedLayouts();
	delete [] feedLayouts;
	saveData(filename.c_str(), getAll().c_str());
	clearCardMap();
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
}

void AlbumViewScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget->getChildren()[1])->setFont(gFontBlue);
	} else {
		((Label *)widget->getChildren()[1])->setFont(gFontWhite);
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
	switch(keyCode) {
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_SOFTLEFT:
			saveData(filename.c_str(), getAll().c_str());
			previous->show();
			break;
		case MAK_FIRE:
			if (!emp) {
				if (next != NULL) {
					delete next;
				}
				next = new ImageScreen(this, RES_LOADING, feed, false, cards.find(index[selected])->second);
				next->show();
			}
			break;
		case MAK_SOFTRIGHT:
			if (!emp && !hasConnection) {
				notice->setCaption(no_connect);
			}
			else if (!emp) {
				/*if (next != NULL) {
					delete next;
				}
				next = new TradeOptionsScreen(this, feed,
						&cards.find(index[selected])->second, TradeOptionsScreen::ST_TRADE_OPTIONS);
				next->show();*/
				if (next != NULL) {
					delete next;
				}
				next = new AuctionCreateScreen(this, feed, cards.find(index[selected])->second);
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
	}
}

void AlbumViewScreen::connReadFinished(Connection* conn, int result) {}

void AlbumViewScreen::xcConnError(int code) {

}

void AlbumViewScreen::mtxEncoding(const char* ) {
}

void AlbumViewScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void AlbumViewScreen::mtxTagAttr(const char* attrName, const char* attrValue) {

}

void AlbumViewScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), xml_cardid)) {
		id += data;
	} else if(!strcmp(parentTag.c_str(), xml_carddescription)) {
		description += data;
	} else if(!strcmp(parentTag.c_str(), xml_cardquantity)) {
		quantity += data;
	} else if(!strcmp(parentTag.c_str(), xml_thumburl)) {
		thumburl += data;
	} else if(!strcmp(parentTag.c_str(), xml_fronturl)) {
		fronturl += data;
	} else if(!strcmp(parentTag.c_str(), xml_backurl)) {
		backurl += data;
	} else if(!strcmp(parentTag.c_str(), xml_rate)) {
		rate += data;
	} else if(!strcmp(parentTag.c_str(), xml_value)) {
		value += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	}
}

void AlbumViewScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_backurl)) {
		notice->setCaption("");
		Card *newCard = new Card();
		newCard->setAll((quantity+delim+description+delim+thumburl+delim+fronturl+delim+backurl+delim+id+delim+rate+delim+value+delim).c_str());
		cardExists = cards.find(newCard->getId());
		if (cardExists != cards.end()) {
			newCard->setThumb(cardExists->second->getThumb().c_str());
			newCard->setBack(cardExists->second->getBack().c_str());
			newCard->setFront(cardExists->second->getFront().c_str());
		}
		tmp.insert(newCard->getId(),newCard);
		id = "";
		description = "";
		quantity = "";
		thumburl = "";
		fronturl = "";
		backurl = "";
		rate = "";
		value = "";
	} else if(!strcmp(name, xml_error)) {
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, xml_carddone)) {
		notice->setCaption("");
		clearCardMap();
		cards = tmp;
		drawList();
		saveData(filename.c_str(), getAll().c_str());
	} else {
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
			delete iter->second;
			iter->second = NULL;
		}
	}
	cards.clear();
}

void AlbumViewScreen::mtxParseError() {
}

void AlbumViewScreen::mtxEmptyTagEnd() {
}

void AlbumViewScreen::mtxTagStartEnd() {
}
int AlbumViewScreen::getCount() {
	return size;
}
