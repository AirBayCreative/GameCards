#include "ImageScreen.h"
#include "Util.h"


ImageScreen::ImageScreen(Screen *previous, MAHandle img, bool flip, Card *card) : previous(previous), img(img), flip(flip), card(card) {
	mainLayout = createImageLayout(back);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[1];
	height = listBox->getHeight()-70;
	if (card != NULL) {
		mainLayout = createImageLayout(back, "", flipit);
		listBox = (ListBox*) mainLayout->getChildren()[0];
		height = listBox->getHeight();
	}
	imge = new Image(0, 0, scrWidth-PADDING*2, height, listBox, false, false, img);

	this->setMain(mainLayout);

	mImageCache = new ImageCache();

	if (card != NULL) {
		if (flip) {
			retrieveBack(imge, card, height-PADDING*2, mImageCache);
		} else {
			retrieveFront(imge, card, height-PADDING*2, mImageCache);
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
	if (imge->getResource() != RES_LOADING) {
		maDestroyObject(imge->getResource());
	}
	this->getMain()->getChildren().clear();
	delete listBox;
	delete mainLayout;
	delete image;
	delete softKeys;
	img = -1;
	delete mImageCache;
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
				imge->setResource(RES_LOADING);
				imge->update();
				imge->requestRepaint();
				maUpdateScreen();
				if (flip) {
					retrieveBack(imge, card, height-PADDING*2, mImageCache);
				} else {
					retrieveFront(imge, card, height-PADDING*2, mImageCache);
				}
			} else {
				previous->show();
			}
			break;
	}
}

