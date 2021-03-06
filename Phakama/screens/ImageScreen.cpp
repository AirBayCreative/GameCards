#include <conprint.h>

#include "AlbumViewScreen.h"
#include "ImageScreen.h"
#include "OptionsScreen.h"
#include "../utils/Util.h"

ImageScreen::ImageScreen(Screen *previous, MAHandle img, Feed *feed, bool flip, Card *card, int screenType, bool hasConnection,
		bool canAuction) :mHttp(this), previous(previous), img(img), flip(flip), card(card), screenType(screenType), feed(feed), hasConnection(hasConnection), canAuction(canAuction) {
	lprintfln("ImageScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	busy = false;
	next = NULL;
	currentSelectedStat = -1;
	flipOrSelect = 0;
	imageCacheFront = new ImageCache();
	imageCacheBack = new ImageCache();

	if (card != NULL) {
		if (screenType == ST_NEW_CARD) {
			mainLayout =  Util::createImageLayout("Accept", "Reject", "");
		}
		else if (screenType == ST_DECK) {
			mainLayout =  Util::createImageLayout("", "Back" , "Flip");
		}
		else {
			mainLayout =  Util::createImageLayout((hasConnection&&canAuction)?"Options":"", "Back" , "Flip");
		}
		listBox = (ListBox*) mainLayout->getChildren()[0];
		listBox->setPaddingTop(0);
		height = listBox->getHeight();
	}else{
		mainLayout = Util::createImageLayout("Back");
		listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[1];
		height = listBox->getHeight()-70;
	}
	imge = new MobImage(0, 0, scrWidth-PADDING*2, height, listBox, false, false, img);
	this->setMain(mainLayout);
	if (card != NULL) {
		if (flip) {
			Util::retrieveBack(imge, card, height-PADDING*2, imageCacheBack);
			Util::retrieveFront(NULL, card, height-PADDING*2, imageCacheFront);
		} else {
			Util::retrieveFront(imge, card, height-PADDING*2, imageCacheFront);
			Util::retrieveBack(NULL, card, height-PADDING*2, imageCacheBack);
		}
	}
	else {
		imageCacheFront = NULL;
		imageCacheBack = NULL;
	}
}
void ImageScreen::pointerPressEvent(MAPoint2d point)
{
	pointPressed = point;
    locateItem(point);
}

void ImageScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void ImageScreen::pointerReleaseEvent(MAPoint2d point)
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
			}else{
				flipOrSelect = 0;
				currentSelectedStat = -1;
				for(int i = 0;i<card->getStats().size();i++){
					if(flip==card->getStats()[i]->getFrontOrBack()){
						if(imge->statContains(card->getStats()[i]->getLeft(),card->getStats()[i]->getTop(),card->getStats()[i]->getWidth(),card->getStats()[i]->getHeight(),point.x, point.y)){
							currentSelectedStat = i;
						}
					}
				}
			}
			keyPressEvent(MAK_FIRE);
		}
	}
}

void ImageScreen::locateItem(MAPoint2d point)
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

ImageScreen::~ImageScreen() {
	lprintfln("~ImageScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	if (card != NULL) {
		if (imge->getResource() != NULL) {
			maDestroyObject(imge->getResource());
		}
	}
	clearListBox();
	//listBox->clear();
	delete mainLayout;
	if (next != NULL) {
		delete next;
		feed->remHttp();
		next = NULL;
	}
	if (imageCacheFront != NULL) {
		delete imageCacheFront;
	}
	if (imageCacheBack != NULL) {
			delete imageCacheBack;
		}
}
void ImageScreen::clearListBox() {
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

void ImageScreen::keyPressEvent(int keyCode) {
	switch (keyCode) {
		case MAK_LEFT:
		case MAK_RIGHT:
			if (screenType == ST_NEW_CARD) {
				mainLayout =  Util::createImageLayout("Accept", "Reject", "");
			}
			else if (screenType == ST_DECK) {
				mainLayout =  Util::createImageLayout("", "Back" , "Flip");
			}
			else {
				Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Options":"", "Back", "Flip", mainLayout);
			}
			imge->refreshWidget();
			imge->statAdded = false;
			currentSelectedStat = -1;

			flip=!flip;
			if (imge->getResource() != NULL) {
				maDestroyObject(imge->getResource());
			}
			imge->setResource(Util::loadImageFromResource(RES_LOADING1));
			imge->update();
			imge->requestRepaint();
			maUpdateScreen();
			if (flip) {
				Util::retrieveBack(imge, card, height-PADDING*2, imageCacheBack);
				Util::retrieveFront(NULL, card, height-PADDING*2, imageCacheFront);
			} else {
				Util::retrieveFront(imge, card, height-PADDING*2, imageCacheFront);
				Util::retrieveBack(NULL, card, height-PADDING*2, imageCacheBack);
			}
			currentSelectedStat = -1;
			break;
		case MAK_UP:
			break;
		case MAK_DOWN:
			break;
		case MAK_SOFTLEFT:
			if (screenType == ST_NEW_CARD) {
				busy = true;
				acceptCard();
			}
			else if (screenType != ST_DECK) {
				if (card != NULL && hasConnection && canAuction) {
					if (next != NULL) {
						delete next;
						feed->remHttp();
					}
					next = new OptionsScreen(feed,
							OptionsScreen::ST_CARD_OPTIONS, this, card);
					next->show();
				}
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			if (screenType == ST_NEW_CARD) {
				busy = true;
				rejectCard();
			}
			else {
				previous->show();
			}
			break;
		case MAK_FIRE:
			if (screenType != ST_NEW_CARD) {
				if (card != NULL) {
					//if((flipOrSelect)||(currentSelectedStat == -1)){
						flip=!flip;
						if (screenType != ST_DECK) {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Options":"", "Back", "Flip", mainLayout);
						}
						imge->refreshWidget();
						imge->statAdded = false;
						currentSelectedStat = -1;
						if (imge->getResource() != NULL) {
							maDestroyObject(imge->getResource());
						}
						imge->setResource(Util::loadImageFromResource(RES_LOADING1));
						imge->update();
						imge->requestRepaint();
						maUpdateScreen();

						if (flip) {
							if ((imageCacheBack != NULL)&&(imge != NULL)) {
								Util::retrieveBack(imge, card, height-PADDING*2, imageCacheBack);
								Util::retrieveFront(NULL, card, height-PADDING*2, imageCacheFront);
							}
						} else {
							if ((imageCacheFront != NULL)&&(imge != NULL)) {
								Util::retrieveFront(imge, card, height-PADDING*2, imageCacheFront);
								Util::retrieveBack(NULL, card, height-PADDING*2, imageCacheBack);
							}
						}
						flipOrSelect=0;
						currentSelectedStat = -1;
				} else {
					previous->show();
				}
			}
			break;
	}
}

void ImageScreen::acceptCard() {
	//work out how long the url will be
	int urlLength = 40 + URLSIZE + card->getId().length();
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?savecard=%s", URL, card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();

	}
	delete [] url;
}

void ImageScreen::rejectCard() {
	//work out how long the url will be
	int urlLength = 42 + URLSIZE + card->getId().length();
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?rejectcard=%s", URL, card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();

	}
	delete [] url;
}

void ImageScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		feed->remHttp();
	}
}

void ImageScreen::connReadFinished(Connection* conn, int result) {}

void ImageScreen::xcConnError(int code) {
	feed->remHttp();
	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
}

void ImageScreen::mtxEncoding(const char* ) {
}

void ImageScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void ImageScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void ImageScreen::mtxTagData(const char* data, int len) {
}

void ImageScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "result")) {
		((AlbumViewScreen *)previous)->refresh();
	}
}

void ImageScreen::mtxParseError(int) {
}

void ImageScreen::mtxEmptyTagEnd() {
}

void ImageScreen::mtxTagStartEnd() {
}
