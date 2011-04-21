#include <conprint.h>

#include "AlbumViewScreen.h"
#include "ImageScreen.h"
#include "OptionsScreen.h"
#include "../utils/Util.h"

ImageScreen::ImageScreen(Screen *previous, MAHandle img, Feed *feed, bool flip, Card *card, int screenType, bool hasConnection,
		bool canAuction) :mHttp(this), previous(previous), img(img), flip(flip), card(card), screenType(screenType), feed(feed), hasConnection(hasConnection), canAuction(canAuction) {
	//TODO add touch
	busy = false;
	next = NULL;
	imageCache = new ImageCache();

	if (card != NULL) {
		if (screenType == ST_NEW_CARD) {
			mainLayout =  createImageLayout(rejectlbl, acceptlbl, "");
		}
		else {
#if defined(MA_PROF_SUPPORT_STYLUS)
			mainLayout =  createImageLayout(back, (hasConnection&&canAuction)?options:"", "");
#else
			mainLayout = createImageLayout(back, (hasConnection&&canAuction)?options:"", flipit);
#endif
		}
		listBox = (ListBox*) mainLayout->getChildren()[0];
		listBox->setPaddingTop(0);
		height = listBox->getHeight();
	}else{
		mainLayout = createImageLayout(back);
		listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[1];
		height = listBox->getHeight()-70;
	}
	imge = new MobImage(0, 0, scrWidth-PADDING*2, height, listBox, false, false, img);
	this->setMain(mainLayout);
	if (card != NULL) {
		if (flip) {
			retrieveBack(imge, card, height-PADDING*2, imageCache);
		} else {
			retrieveFront(imge, card, height-PADDING*2, imageCache);
		}
	}
	else {
		imageCache = NULL;
	}
}
#if defined(MA_PROF_SUPPORT_STYLUS)
void ImageScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void ImageScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void ImageScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
		return;
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
		return;
	}
	if (card != NULL) {
		if (list) {
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
#endif
ImageScreen::~ImageScreen() {
	/*if (card != NULL) {
		if (imge->getResource() != RES_LOADING && imge->getResource() != RES_TEMP) {
			maDestroyObject(imge->getResource());
		}
	} // <-- dont delete!*/
	delete mainLayout;
	img = -1;
	if (next != NULL) {
		delete next;
		next = NULL;
	}
	if (imageCache != NULL) {
		delete imageCache;
	}
}

void ImageScreen::keyPressEvent(int keyCode) {
	switch (keyCode) {
		case MAK_SOFTRIGHT:
			if (screenType == ST_NEW_CARD) {
				busy = true;
				acceptCard();
			}
			else {
				if (card != NULL && hasConnection && canAuction) {
					if (next != NULL) {
						delete next;
					}
					next = new OptionsScreen(feed,
							OptionsScreen::ST_CARD_OPTIONS, this, card);
					next->show();
				}
			}
			break;
		case MAK_SOFTLEFT:
			if (screenType == ST_NEW_CARD) {
				busy = true;
				rejectCard();
			}
			else {
				previous->show();
			}
			break;
		case MAK_FIRE:
			if (card != NULL) {
				flip=!flip;
				if (imge->getResource() != RES_LOADING && imge->getResource() != RES_TEMP) {
					maDestroyObject(imge->getResource());
				}
				imge->setResource(RES_LOADING);
				imge->update();
				imge->requestRepaint();
				maUpdateScreen();
				if (flip) {
					retrieveBack(imge, card, height-PADDING*2, imageCache);
				} else {
					retrieveFront(imge, card, height-PADDING*2, imageCache);
				}
			} else {
				previous->show();
			}
			break;
	}
}

void ImageScreen::acceptCard() {
	//work out how long the url will be
	int urlLength = ACCEPTCARD.length() + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s%s", ACCEPTCARD.c_str(), card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;
}

void ImageScreen::rejectCard() {
	//work out how long the url will be
	int urlLength = REJECTCARD.length() + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s%s", REJECTCARD.c_str(), card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
	} else {
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
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
	}
}

void ImageScreen::connReadFinished(Connection* conn, int result) {}

void ImageScreen::xcConnError(int code) {
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
	if(!strcmp(name, xml_result)) {
		((AlbumViewScreen *)previous)->refresh();
	}
}

void ImageScreen::mtxParseError() {
}

void ImageScreen::mtxEmptyTagEnd() {
}

void ImageScreen::mtxTagStartEnd() {
}
