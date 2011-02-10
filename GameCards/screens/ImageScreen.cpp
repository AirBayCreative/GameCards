#include <conprint.h>

#include "ImageScreen.h"
#include "../utils/Util.h"
#include "AuctionCreateScreen.h"
//#include "TradeOptionsScreen.h"

ImageScreen::ImageScreen(Screen *previous, MAHandle img, Feed *feed, bool flip, Card *card, bool hasConnection,
		bool canAuction) : previous(previous), img(img), flip(flip), card(card), feed(feed), hasConnection(hasConnection), canAuction(canAuction) {
	//TODO add touch
	next = NULL;
	mainLayout = createImageLayout(back);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[1];
	height = listBox->getHeight()-70;
	if (card != NULL) {
		if (feed->getTouchEnabled()) {
			mainLayout =  createImageLayout(back, (hasConnection&&canAuction)?auction:"", "");
		} else {
			mainLayout = createImageLayout(back, (hasConnection&&canAuction)?auction:"", flipit);
		}
		listBox = (ListBox*) mainLayout->getChildren()[0];
		height = listBox->getHeight();
	}
	imge = new Image(0, 0, scrWidth-PADDING*2, height, listBox, false, false, img);
	this->setMain(mainLayout);

	if (card != NULL) {
		imageCache = new ImageCache();
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

ImageScreen::~ImageScreen() {
	if (card != NULL) {
		if (imge->getResource() != RES_LOADING && imge->getResource() != RES_TEMP) {
			maDestroyObject(imge->getResource());
		}
	} // <-- dont delete!
	//this->getMain()->getChildren().clear();
	//delete listBox;
	delete mainLayout;
	/*if (image != NULL) {
		delete image;
		image = NULL;
	}
	if (softKeys != NULL) {
		delete softKeys;
		softKeys = NULL;
	}*/
	img = -1;
	if (next != NULL) {
		delete next;
		next = NULL;
	}
	if (imageCache != NULL) {
		delete imageCache;
		imageCache = NULL;
	}
}

void ImageScreen::keyPressEvent(int keyCode) {
	switch (keyCode) {
		case MAK_SOFTRIGHT:
			if (card != NULL && hasConnection && canAuction) {
				/*if (next != NULL) {
					delete next;
				}
				next = new TradeOptionsScreen(this, feed, card,
						TradeOptionsScreen::ST_TRADE_OPTIONS);
				next->show();*/
				if (next != NULL) {
					delete next;
				}
				next = new AuctionCreateScreen(this, feed, card);
				next->show();
			}
			break;
		case MAK_SOFTLEFT:
			previous->show();
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
					retrieveBack(imge, card, height-PADDING*2, new ImageCache());
				} else {
					retrieveFront(imge, card, height-PADDING*2, new ImageCache());
				}
			} else {
				previous->show();
			}
			break;
	}
}

