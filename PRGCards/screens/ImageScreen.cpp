#include <conprint.h>

#include "AlbumViewScreen.h"
#include "ImageScreen.h"
#include "OptionsScreen.h"
#include "../utils/Util.h"

ImageScreen::ImageScreen(Screen *previous, MAHandle img, Feed *feed, bool flip, Card *card) :previous(previous), img(img), flip(flip), card(card), feed(feed) {
	//TODO add touch
	busy = false;
	next = NULL;
	imageCache = new ImageCache();
	mainLayout = createImageLayout(back);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[1];
	height = listBox->getHeight()-70;
	if (card != NULL) {
#if defined(MA_PROF_SUPPORT_STYLUS)
		mainLayout =  createImageLayout(back, "", "");
#else
		mainLayout = createImageLayout(back, "", flipit);
#endif
		listBox = (ListBox*) mainLayout->getChildren()[0];
		height = listBox->getHeight();
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
				imge->requestRepaint();
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
