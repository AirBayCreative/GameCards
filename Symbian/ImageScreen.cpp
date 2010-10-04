#include "Header.h"
#include <conprint.h>


ImageScreen::ImageScreen(Screen *previous, MAHandle img, MAHandle bimg, bool flip, Card *card, bool full, ImageCache *mImgCache) : previous(previous), bimg(bimg), img(img), flip(flip), card(card), full(full), mImageCache(mImgCache) {
	mainLayout = createImageLayout(back, blank, blank);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[1];
	if ((card != NULL)&&(!full)) {
		mainLayout = createImageLayout(back, zoomin, flipit);
		listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[1];
	} else if (full) {
		mainLayout = createNoHeaderLayout();
		listBox = (ListBox*) mainLayout->getChildren()[0];
	}

	int height = listBox->getHeight()-70;
	lprintfln("height %d", listBox->getHeight());
	if (full) {
		height = scrHeight;
	}
	imge = new Image(0, 0, scrWidth-PADDING*2, height, listBox, false, false, resize(img, height-PADDING*2));

	this->setMain(mainLayout);
	if (card != NULL) {
		if (flip) {
			retrieveBack(imge, card, height-PADDING*2, mImageCache);
		} else {
			retrieveFront(imge, card, height-PADDING*2, mImageCache);
		}
	}
}

/*ImageScreen::~ImageScreen() {
	delete previous;
	maDestroyObject(img);
	maDestroyObject(bimg);
	maDestroyObject(image);
	delete mainLayout;
	delete listBox;
	delete imge;
	delete mImageCache;
}*/

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
    for(int i = 0; i < (this->getMain()->getChildren()).size(); i++)
    {
        if(this->getMain()->getChildren()[i]->contains(p))
        {
        	list = true;
        }
    }
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
}

ImageScreen::~ImageScreen() {

}

void ImageScreen::keyPressEvent(int keyCode) {
	switch (keyCode) {
		case MAK_SOFTRIGHT:
			if (card != NULL) {
				if (!full) {
					(new ImageScreen(this, img, bimg, flip, card, true, mImageCache))->show();
				}
			}
			break;
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
