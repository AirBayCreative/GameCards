#include "ImageScreen.h"
#include "Util.h"


ImageScreen::ImageScreen(Screen *previous, MAHandle img, MAHandle bimg, bool flip, Card *card, bool full, ImageCache *mImgCache) : previous(previous), bimg(bimg), img(img), flip(flip), card(card), full(full), mImageCache(mImgCache) {
	mainLayout = createImageLayout(back);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[1];
	int height = listBox->getHeight()-70;
	/*if ((card != NULL)&&(!full)) {
		mainLayout = createImageLayout(back, zoomin, flipit);
		listBox = (ListBox*) mainLayout->getChildren()[0];
		height = listBox->getHeight();
	} else if ((card != NULL) && (full)) {
		mainLayout = createNoHeaderLayout();
		listBox = (ListBox*) mainLayout->getChildren()[0];
		height = scrHeight;
	}*/
	imge = new Image(0, 0, scrWidth-PADDING*2, height, listBox, false, false, img);


	//TESTING LEAK
	//Layout *mainLayout = new Layout(0,0,scrWidth,scrHeight,NULL,1,1);
	//Label *label = new Label(0,0,scrWidth,scrHeight,mainLayout,"test",0,gFontWhite);

	this->setMain(mainLayout);
	/*if (card != NULL) {
		if (flip) {
			retrieveBack(imge, card, height-PADDING*2, mImageCache);
		} else {
			retrieveFront(imge, card, height-PADDING*2, mImageCache);
		}
	}*/
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
	this->getMain()->getChildren().clear();
	delete listBox;
	delete mainLayout;
	delete image;
	delete softKeys;
	img = -1;
	bimg = -1;
	delete card;
	delete mImageCache;
}

void ImageScreen::keyPressEvent(int keyCode) {
	switch (keyCode) {
		/*case MAK_SOFTRIGHT:
			if (card != NULL) {
				if (!full) {
					Screen *next = new ImageScreen(this, img, bimg, flip, card, true, mImageCache);
					next->show();
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
			break;*/
		case MAK_FIRE:
			/*if (card != NULL) {
				flip=!flip;
				Screen *next = new ImageScreen(previous, bimg, img, flip, card, full, mImageCache);
				next->show();
			} else {*/
				previous->show();
			/*}
			break;*/
	}
}

