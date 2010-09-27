#include "Header.h"
#include <MAUI/Image.h>
#include "Util.h"
#include "MAHeaders.h"
#include "maapi.h"
#include <conprint.h>


ImageScreen::ImageScreen(Screen *previous, MAHandle img, MAHandle bimg, bool flip, Card *card, bool full, ImageCache *mImgCache) : previous(previous), bimg(bimg), img(img), flip(flip), card(card), full(full), mImageCache(mImgCache) {
	mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 3);
	setPadding(mainLayout);
	mainLayout->setSkin(gSkinBack);

	Widget *softKeys;
	softKeys = createSoftKeyBar(48, back, blank);

	Image *head = new Image(0, 0, scrWidth,  scrHeight/6, NULL, false, false, RES_IMAGE);
	head->setSkin(gSkinBack);

	int height = scrHeight-(head->getHeight()+softKeys->getHeight());
	if (!full) {
		if (card != NULL) {
			height = scrHeight-(softKeys->getHeight());
		} else {
			mainLayout->add(head);
		}
	} else {
		height = scrHeight-10;
	}
	imge = new Image(0, 0, scrWidth-PADDING*2, height, mainLayout, false, false, resize(img, height-PADDING*2));
	imge->setSkin(gSkinBack);
	//mainLayout->add(imge);
	if (!full) {
		mainLayout->add(softKeys);
	}
	this->setMain(mainLayout);

	if (card != NULL) {
		if (flip) {
			retrieveBack(imge, card, height, mImageCache);
		} else {
			retrieveFront(imge, card, height, mImageCache);
		}
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
		for(int i = 0; i < (this->getMain()->getChildren()[2]->getChildren()).size(); i++)
		{
			if(this->getMain()->getChildren()[2]->getChildren()[i]->contains(p))
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

}

void ImageScreen::keyPressEvent(int keyCode) {
	switch (keyCode) {
		/*case MAK_SOFTRIGHT:
			if (card != NULL) {
				if (!full) {
					(new ImageScreen(this, img, bimg, flip, card, true, mImageCache))->show();
				}
			}
			break;*/
		case MAK_SOFTLEFT:
			if (!flip) {
				MAHandle tmp = img;
				img = bimg;
				bimg = tmp;
			}
			previous->show();
			break;
		case MAK_FIRE:
			if (card != NULL) {
				flip=!flip;
				(new ImageScreen(previous, bimg, img, flip, card, full, mImageCache))->show();
			} else {
				previous->show();
			}
			break;
	}
}
