//#include "Header.h"
//#include <mastdlib.h>
#include <conprint.h>

#include "AlbumViewScreen.h"
#include "Util.h"
#include "MAHeaders.h"
#include "ImageScreen.h"
#include "TradeFriendDetailScreen.h"

AlbumViewScreen::AlbumViewScreen(Feed *feed) : mHttp(this), feed(feed), cardExists(cards.end()) {
	emp = true;
	next = new Screen();
	error_msg = "";
	quantity = "0";

	if (feed->getTouchEnabled()) {
		mainLayout = createMainLayout(exit, tradelbl, "", true);
	} else {
		mainLayout = createMainLayout(exit, tradelbl, select, true);
	}
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setCaption(checking_cards);

	mImageCache = new ImageCache();
	loadFile();

	char *url = new char[100];
	memset(url,'\0',100);
	sprintf(url, "%s&heigth=%d&width=%d", CARDS.c_str(), scrHeight, scrWidth);
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
	mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
	if(res < 0) {

	} else {
		mHttp.finish();
	}
	this->setMain(mainLayout);

	orig = this;

	moved=0;
}

void AlbumViewScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void AlbumViewScreen::loadFile() {
	loadImages(getData("1"));
}
void AlbumViewScreen::loadImages(const char *text) {
	String all = text;
	int indexof = 0;
	int indentindexof = 0;
	String tmp;
	String id, name;
	while ((indexof = all.find(newline)) > -1) {
		tmp = all.substr(0,indexof++);
		card.setAll(tmp.c_str());
		cards.insert(card.getId(), card);
		all = all.substr(indexof);
	}
	drawList();
}

void AlbumViewScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void AlbumViewScreen::pointerReleaseEvent(MAPoint2d point)
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
	moved=0;
}

void AlbumViewScreen::locateItem(MAPoint2d point)
{
	if (feed->setTouch(truesz)) {
		saveData("1", getAll().c_str());
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
			//((KineticListBox *)this->getMain()->getChildren()[0]->getChildren()[2])->setSelectedIndex(i);
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

void AlbumViewScreen::drawList() {
	emp = true;
	Layout *feedlayout;
	listBox->getChildren().clear();
	index.clear();
	Image *tempImage;
	for(Map<String, Card>::Iterator itr = cards.begin(); itr != cards.end(); itr++) {
		index.add(itr->second.getId());
		cardText = itr->second.getText();

		feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 2, 1);
		feedlayout->setSkin(gSkinAlbum);
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		tempImage = new Image(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

		Card *tmp;
		tmp = &itr->second;

		retrieveThumb(tempImage, tmp, mImageCache);

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, gFontBlackBold);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setMultiLine(true);
	}
	if (cards.size() >= 1) {
		emp = false;
		listBox->setSelectedIndex(0);
	} else {
		listBox->add(createSubLabel(empty));
		listBox->setSelectedIndex(0);
	}
	notice->setCaption("");
}

AlbumViewScreen::~AlbumViewScreen() {
	delete mainLayout;
	delete next;
	delete mImageCache;

	saveData("1", getAll().c_str());

	parentTag="";
	cardText="";
	id="";
	description="";
	quantity="";
	thumburl="";
	fronturl="";
	backurl="";
	error_msg="";
	rate="";
	value="";
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
			saveData("1", getAll().c_str());
			maExit(0);
			break;
		case MAK_FIRE:
			if (!emp && index.size() >- 1) {
				if (next != NULL) {
					delete next;
				}
				next = new ImageScreen(this, RES_LOADING, feed, false, &cards.find(index[selected])->second);
				next->show();
			}
			break;
		case MAK_SOFTRIGHT:
			if (next != NULL) {
				delete next;
			}
			next = new TradeFriendDetailScreen(this, feed);
			next->show();
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
		card.setAll((quantity+delim+description+delim+thumburl+delim+fronturl+delim+backurl+delim+id+delim+rate+delim+value+delim).c_str());
		cardExists = cards.find(card.getId());
		if (cardExists != cards.end()) {
			card.setThumb(cardExists->second.getThumb().c_str());
			card.setBack(cardExists->second.getBack().c_str());
			card.setFront(cardExists->second.getFront().c_str());
		}
		tmp.insert(card.getId(),card);
		id = "";
		description = "";
		thumburl = "";
		fronturl = "";
		backurl = "";
		rate = "";
		value = "";
	} else if(!strcmp(name, xml_error)) {
		notice->setCaption(error_msg.c_str());
	}
	if (!strcmp(name, xml_carddone)) {
		cards.clear();
		cards = tmp;
		drawList();
		saveData("1", getAll().c_str());
	} else {
		notice->setCaption("");
	}
}

String AlbumViewScreen::getAll() {
	String all;
	for(Map<String, Card>::Iterator itr = cards.begin(); itr != cards.end(); itr++) {
		all += itr->second.getAll() + "#";
	}
	return all;
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