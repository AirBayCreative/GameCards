#include "ShopDetailsScreen.h"
#include "ShopPurchaseScreen.h"
#include "BidOrBuyScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"
#include "../UI/Widgets/MobImage.h"
#include <mastdlib.h>
#include "../utils/Convert.h"

ShopDetailsScreen::ShopDetailsScreen(Screen *previous, Feed *feed, int screenType, bool free, Product *product, Auction *auction) : previous(previous), feed(feed), screenType(screenType), product(product), auction(auction) {

	if (screenType == ST_AUCTION)
	{
		mainLayout = createMainLayout(back, buy_now, bid, true);
	}
	else if (free)
		mainLayout = createMainLayout(back, confirm, "", true);
	else
		mainLayout = createMainLayout(back, purchase, "", true);

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	next = NULL;
	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), /*74*/scrHeight/2, listBox, 2, 1);
	feedlayout->setSkin(gSkinBack);
	feedlayout->setDrawBackground(true);
	feedlayout->addWidgetListener(this);

	mImageCache = new ImageCache();
	tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

	nameDesc = "";
	fullDesc = "";

	switch (screenType) {
		case ST_PRODUCT:
			retrieveProductThumb(tempImage, product, mImageCache);

			nameDesc = product->getName();
			fullDesc = product->getDetailsString();
			break;
		case ST_AUCTION:
			retrieveThumb(tempImage, auction->getCard(), mImageCache);

			nameDesc = auction->getCard()->getText();
			fullDesc = auction->getCard()->getFullDesc();

			break;
	}

	label = new Label(0,0, scrWidth-86, /*74*/scrHeight/2, feedlayout, fullDesc/*nameDesc*/, 0, gFontBlack);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setAutoSizeY();
	label->setMultiLine(true);

	/*label = new Label(0,0, scrWidth-PADDING*2, scrHeight - 24, NULL, "", 0, gFontBlack);
	label->setMultiLine(true);
	label->setAutoSizeY(true);
	listBox->add(label);*/

	if (screenType == ST_AUCTION)
	{
		label = new Label(0,0, scrWidth-PADDING*2, scrHeight - 24, NULL, place_bid, 0, gFontBlack);
		label->setMultiLine(true);
		label->setAutoSizeY(true);
		listBox->add(label);

		MAUtil::Environment::getEnvironment().addTimer(this, 1000, -1);
		//requestRepaint();

		label = createEditLabel("");
		editBidBox = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2,64,MA_TB_TYPE_NUMERIC, label, "", L"Bid:");
		int num;
		if (!strcmp(auction->getPrice().c_str(), "")) {
			num = Convert::toInt(auction->getOpeningBid().c_str());
			num+=10;
			editBidBox->setText(Convert::toString(num));
		} else {
			num = Convert::toInt(auction->getPrice().c_str());
			num+=10;
			editBidBox->setText(Convert::toString(num));
		}
		editBidBox->setDrawBackground(false);
		editBidBox->setSelected(true);
		label->setSelected(true);
		label->addWidgetListener(this);
		listBox->add(label);
	}

	this->setMain(mainLayout);

	moved = 0;

	freebie = free;
}

void ShopDetailsScreen::runTimerEvent() {
	editBidBox->setText(getTime().c_str());
	//requestRepaint();
}

String ShopDetailsScreen::getTime() {
	String all = auction->getEndDate();
	String year = "";
	String month = "";
	String day = "";

	struct tm * cmp_p = new tm;

	int indexof = all.find("-");
	if (indexof > -1) {
		year = all.substr(0,indexof++).c_str();
		all=all.substr(indexof);
	}
	indexof = all.find("-");
	if (indexof > -1) {
		month = all.substr(0,indexof++).c_str();
		all=all.substr(indexof);
		day = all;
	}
	cmp_p->tm_hour = 23;
	cmp_p->tm_min = 59;
	cmp_p->tm_sec = 59;
	cmp_p->tm_year = Convert::toInt(year)-1900;
	cmp_p->tm_mon = Convert::toInt(month)-1;
	cmp_p->tm_mday = Convert::toInt(day);
	time_t test = mktime(cmp_p);
	time_t timeleft = test - maTime();
	if (timeleft < 0) {
		//should be set to zero, for now gonna use negative inferred value for testing
		timeleft = timeleft*-1;
	}
	split_time(timeleft, cmp_p);

	char buffer[36];
	snprintf(buffer, 128, "D %d, H %d, M %d, S %d", cmp_p->tm_mday, cmp_p->tm_hour, cmp_p->tm_min, cmp_p->tm_sec);
	return buffer;
}

ShopDetailsScreen::~ShopDetailsScreen() {
	delete mainLayout;
	if(mImageCache != NULL){
		delete mImageCache;
	}
	nameDesc = "";
	fullDesc = "";
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
        	//list = true;
        }
    }
    for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
			if (i == 0) {
				left = true;
				moved=0;
			} else if (i == 1) {
				list = true;
				moved = 0;
			} else if (i == 2) {
				right = true;
				moved=0;
			}
			return;
		}
	}
}
#endif

void ShopDetailsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}

void ShopDetailsScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
			switch (screenType) {
				case ST_AUCTION:
					next = new BidOrBuyScreen(this, feed, auction, 1, editBidBox->getCaption());
					next->show();
					break;
			}
			break;
		case MAK_SOFTRIGHT:
			if (next != NULL) {
				delete next;
			}
			switch (screenType) {
				case ST_AUCTION:
					next = new BidOrBuyScreen(this, feed, auction, 2);
					break;
				case ST_PRODUCT:
					next = new ShopPurchaseScreen(this, feed, product, freebie);
					break;
			}
			next->show();
			break;
		case MAK_BACK:
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
