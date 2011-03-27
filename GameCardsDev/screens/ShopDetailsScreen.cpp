#include "ShopDetailsScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"
#include "../UI/Widgets/MobImage.h"

ShopDetailsScreen::ShopDetailsScreen(Screen *previous, Feed *feed, int screenType, Product *product, Card *card) : previous(previous), feed(feed), screenType(screenType), product(product), card(card) {
	mainLayout = createMainLayout(back, "", true);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 2, 1);
	feedlayout->setSkin(gSkinBack);
	feedlayout->setDrawBackground(true);
	feedlayout->addWidgetListener(this);

	MobImage *tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

	String nameDesc = "";
	String fullDesc = "";

	switch (screenType) {
		case ST_PRODUCT:
			retrieveProductThumb(tempImage, product, mImageCache);

			nameDesc = product->getName();
			fullDesc = product->getDetailsString();
			break;
		case ST_AUCTION:
			retrieveThumb(tempImage, card, mImageCache);

			nameDesc = card->getText();
			fullDesc = card->getFullDesc();
			break;
	}

	label = new Label(0,0, scrWidth-86, 74, feedlayout, nameDesc, 0, gFontBlack);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setAutoSizeY();
	label->setMultiLine(true);

	label = new Label(0,0, scrWidth-PADDING*2, scrHeight - 24, NULL, fullDesc, 0, gFontBlack);
	label->setMultiLine(true);
	label->setAutoSizeY(true);
	listBox->add(label);

	this->setMain(mainLayout);

	moved = 0;
}

ShopDetailsScreen::~ShopDetailsScreen() {
	delete mainLayout;
}
#if defined(MA_PROF_SUPPORT_STYLUS)
void ShopDetailsScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void ShopDetailsScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void ShopDetailsScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		}
	}
	moved = 0;
}

void ShopDetailsScreen::locateItem(MAPoint2d point)
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
#endif
void ShopDetailsScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			break;
		case MAK_SOFTLEFT:
			previous->show();
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
	}
}
