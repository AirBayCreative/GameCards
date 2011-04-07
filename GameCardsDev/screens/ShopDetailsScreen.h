#ifndef _SHOPDETAILSSCREEN_H_
#define _SHOPDETAILSSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../utils/Product.h"
#include "../utils/Card.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class ShopDetailsScreen : public Screen, WidgetListener {
public:
	ShopDetailsScreen(Screen *previous, Feed *feed, int screenType, Product *product = NULL, Card *card = NULL);
	~ShopDetailsScreen();
	void keyPressEvent(int keyCode);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
	enum screenTypes {ST_PRODUCT, ST_AUCTION};
private:
	Screen *next, *previous;
	Layout *mainLayout;
	Label *label;
	KineticListBox *listBox;
	ImageCache *mImageCache;
	MobImage *tempImage;

	bool list, left, right;

	int moved, screenType;

	String nameDesc, fullDesc;

	Product *product;
	Card *card;
	Feed *feed;
};

#endif	//_SHOPDETAILSSCREEN_H_
