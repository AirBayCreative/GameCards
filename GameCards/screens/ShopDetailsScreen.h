#ifndef _SHOPDETAILSSCREEN_H_
#define _SHOPDETAILSSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../utils/Feed.h"
#include "../utils/Product.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class ShopDetailsScreen : public Screen, WidgetListener {
public:
	ShopDetailsScreen(Screen *previous, Feed *feed, Product *product);
	~ShopDetailsScreen();
	void keyPressEvent(int keyCode);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:
	Screen *previous;
	Layout *mainLayout;
	Label *label;
	KineticListBox *listBox;
	ImageCache *mImageCache;

	bool list, left, right;

	int moved;

	Product *product;
	Feed *feed;
};

#endif	//_SHOPDETAILSSCREEN_H_
