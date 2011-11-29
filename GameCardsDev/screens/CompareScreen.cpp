#include <conprint.h>

#include "AlbumViewScreen.h"
#include "CompareScreen.h"
#include "OptionsScreen.h"
#include "../utils/Util.h"

CompareScreen::CompareScreen(Screen *previous, MAHandle img, Feed *feed, bool flip, Card *card, Card *compare) :mHttp(this), previous(previous), img(img), flip(flip), card(card), feed(feed), compare(compare) {
	lprintfln("CompareScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	busy = false;
	next = NULL;
	currentSelectedStat = -1;
	flipOrSelect = 0;
	imageCache = new ImageCache();

	if (card != NULL) {
		mainLayout = Util::createImageLayout("", "Back", "Flip");
		listBox = (ListBox*) mainLayout->getChildren()[0];
		height = listBox->getHeight();
	}else{
		mainLayout = Util::createImageLayout("Back");
		listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[1];
		height = listBox->getHeight()-70;
	}
	imge = new MobImage(0, 0, scrWidth-PADDING*2, height/2, listBox, false, false, Util::loadImageFromResource(img));
	cmpge = new MobImage(0, 0, scrWidth-PADDING*2, height/2, listBox, false, false, Util::loadImageFromResource(img));
	this->setMain(mainLayout);
	if (card != NULL && compare != NULL) {
		if (flip) {
			Util::retrieveBackFlip(imge, card, height-PADDING*2, imageCache);
			Util::retrieveBackFlip(cmpge, compare, height-PADDING*2, imageCache);
		} else {
			Util::retrieveFrontFlip(imge, card, height-PADDING*2, imageCache);
			Util::retrieveFrontFlip(cmpge, compare, height-PADDING*2, imageCache);
		}
	}
	else {
		imageCache = NULL;
	}
}
void CompareScreen::pointerPressEvent(MAPoint2d point)
{
	pointPressed = point;
    locateItem(point);
}

void CompareScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void CompareScreen::pointerReleaseEvent(MAPoint2d point)
{
	pointReleased = point;
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
		return;
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
		return;
	}
	if (card != NULL) {
		if (list) {
			if(Util::absoluteValue(pointPressed.x-pointReleased.x) >imge->getWidth()/100*15||Util::absoluteValue(pointPressed.x-pointReleased.x) > 45){
				flipOrSelect = 1;
			} else {
				flipOrSelect = 0;
				currentSelectedStat = -1;
				for(int i = 0;i<card->getStats().size();i++){
					if(flip==card->getStats()[i]->getFrontOrBack()){
						if(imge->statContains(card->getStats()[i]->getLeft(),card->getStats()[i]->getTop(),card->getStats()[i]->getWidth(),card->getStats()[i]->getHeight(),point.x, point.y, MobImage::LANDSCAPE)){
							currentSelectedStat = i;
							break;
						}
					}
				}
			}
			keyPressEvent(MAK_FIRE);
		}
	}
}

void CompareScreen::locateItem(MAPoint2d point)
{
	list = false;
	left = false;
	right = false;

	Point p;
	p.set(point.x, point.y);
	if (card == NULL) {
		for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
		{
			if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
			{
				if (i == 0) {
					left = true;
				} else if (i == 1) {
					list = true;
				} else if (i == 2) {
					right = true;
				}
				return;
			}
		}
	} else {
		for(int i = 0; i < (this->getMain()->getChildren()).size(); i++)
		{
			if(this->getMain()->getChildren()[i]->contains(p))
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
				} else if (i == 1) {
					list = true;
				} else if (i == 2) {
					right = true;
				}
				return;
			}
		}
	}
}
CompareScreen::~CompareScreen() {
	lprintfln("~CompareScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	if (imge->getResource() != NULL) {
		maDestroyObject(imge->getResource());
	}
	clearListBox();
	listBox->clear();
	delete mainLayout;
	mainLayout = NULL;
	img = -1;
	if (next != NULL) {
		delete next;
		feed->remHttp();
		next = NULL;
	}
	if (imageCache != NULL) {
		delete imageCache;
		imageCache = NULL;
	}
}

void CompareScreen::clearListBox() {
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

void CompareScreen::keyPressEvent(int keyCode) {
	switch (keyCode) {
		case MAK_UP:
		case MAK_DOWN:
		case MAK_FIRE:
			Util::updateSoftKeyLayout("", "Back", "Flip", mainLayout);
			imge->refreshWidget();
			imge->statAdded = false;
			currentSelectedStat = -1;

			flip=!flip;
			if (imge->getResource() != NULL) {
				maDestroyObject(imge->getResource());
			}
			if (cmpge->getResource() != NULL) {
				maDestroyObject(cmpge->getResource());
			}
			imge->setResource(Util::loadImageFromResource(RES_LOADING_FLIP1));
			imge->update();
			imge->requestRepaint();

			cmpge->setResource(Util::loadImageFromResource(RES_LOADING_FLIP1));
			cmpge->update();
			cmpge->requestRepaint();

			maUpdateScreen();
			if (flip) {
				Util::retrieveBackFlip(imge, card, height-PADDING*2, imageCache);
				Util::retrieveBackFlip(cmpge, compare, height-PADDING*2, imageCache);
			} else {
				Util::retrieveFrontFlip(imge, card, height-PADDING*2, imageCache);
				Util::retrieveFrontFlip(cmpge, compare, height-PADDING*2, imageCache);
			}
			currentSelectedStat = -1;
			break;
		case MAK_RIGHT:
			break;
		case MAK_LEFT:
			break;
		case MAK_SOFTLEFT:
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			previous->show();
			break;
	}
}

void CompareScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		feed->remHttp();
	}
}

void CompareScreen::connReadFinished(Connection* conn, int result) {}

void CompareScreen::xcConnError(int code) {
	feed->remHttp();
	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
}

void CompareScreen::mtxEncoding(const char* ) {
}

void CompareScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void CompareScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void CompareScreen::mtxTagData(const char* data, int len) {
}

void CompareScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "result")) {
		((AlbumViewScreen *)previous)->refresh();
	}
}

void CompareScreen::mtxParseError(int) {
}

void CompareScreen::mtxEmptyTagEnd() {
}

void CompareScreen::mtxTagStartEnd() {
}
