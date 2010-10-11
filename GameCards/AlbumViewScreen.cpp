//#include "Header.h"
//#include <mastdlib.h>
#include <conprint.h>

#include "AlbumViewScreen.h"
#include "Util.h"
#include "MAHeaders.h"
#include "ImageScreen.h"
#include "TradeOptionsScreen.h"

AlbumViewScreen::AlbumViewScreen(Screen *previous, Feed *feed, String filename) : mHttp(this), filename(filename+ALBUMEND), previous(previous), feed(feed) {
	if (feed->getTouchEnabled()) {
		mainLayout = createMainLayout(back, tradelbl, blank, true);
	} else {
		mainLayout = createMainLayout(back, tradelbl, select, true);
	}
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setCaption(checking_cards);

	mImageCache = new ImageCache();
	loadFile();

	char *url = new char[100];
	memset(url,'\0',100);
	sprintf(url, "%s%s&heigth=%d&width=%d", CARDS.c_str(), filename.c_str(), scrHeight, scrWidth);

	int res = mHttp.create(url, HTTP_GET);
	mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
	mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
	if(res < 0) {

	} else {
		mHttp.finish();
	}
	this->setMain(mainLayout);

	movedList = false;
}

void AlbumViewScreen::pointerPressEvent(MAPoint2d point)
{
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
		card.setAll(tmp.c_str());
		cards.insert(card.getId(), card);
		all = all.substr(indexof);
	}
	drawList();
}

void AlbumViewScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    movedList = true;
}

void AlbumViewScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (!movedList) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		}
	}
	movedList = false;
}

void AlbumViewScreen::locateItem(MAPoint2d point)
{
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
			} else if (i == 2) {
				right = true;
			}
			return;
		}
	}
}

void AlbumViewScreen::drawList() {
	Layout *feedlayout;
	Image *tempImage;
	listBox->getChildren().clear();
	index.clear();
	for(Map<String, Card>::Iterator itr = cards.begin(); itr != cards.end(); itr++) {
		index.add(itr->second.getId());
		cardText = itr->second.getText();
		cardText += "\nQuantity: ";
		cardText += itr->second.getQuantity();

		feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 2, 1);
		feedlayout->setSkin(gSkinAlbum);
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);


		tempImage = new Image(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

		Card *tmp;
		tmp = &itr->second;

		retrieveThumb(tempImage, tmp, mImageCache);

		label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, gFontGrey);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setAutoSizeY();
		label->setMultiLine(true);
	}
	if (cards.size() >= 1) {
		listBox->setSelectedIndex(0);
	} else {
		listBox->add(createSubLabel(empty));
		listBox->setSelectedIndex(0);
	}
}

AlbumViewScreen::~AlbumViewScreen() {
}

void AlbumViewScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget->getChildren()[1])->setFont(gFontBlue);
	} else {
		((Label *)widget->getChildren()[1])->setFont(gFontGrey);
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
			if (index.size() >- 1) {
				next = new ImageScreen(this, RES_LOADING, RES_LOADING, false, &cards.find(index[selected])->second, false, mImageCache, feed);
				next->show();
			}
			break;
		case MAK_SOFTRIGHT:
			//next = new ImageScreen(this, RES_SOON, RES_SOON, false, NULL, false, mImageCache, feed);
			next = new TradeOptionsScreen(this, feed, cards.find(index[selected])->second);
			next->show();
			break;
	}
}

void AlbumViewScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption(blank);
	}
}

void AlbumViewScreen::connReadFinished(Connection* conn, int result) {}

void AlbumViewScreen::xcConnError(int code) {
	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
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
		notice->setCaption(blank);
		card.setAll((quantity+delim+description+delim+thumburl+delim+fronturl+delim+backurl+delim+id+delim+rate+delim+value+delim).c_str());
		cards.insert(card.getId(),card);
		id = blank;
		description = blank;
		quantity = blank;
		thumburl = blank;
		fronturl = blank;
		backurl = blank;
		rate = blank;
		value = blank;
	} else if(!strcmp(name, xml_error)) {
		notice->setCaption(error_msg.c_str());
	}
	if (!strcmp(name, xml_carddone)) {
		drawList();
		saveData(filename.c_str(), getAll().c_str());
	} else {
		notice->setCaption(blank);
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
