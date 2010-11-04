#ifndef _SHOPPURCHASESCREEN_H_
#define _SHOPPURCHASESCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "../utils/Feed.h"
#include "../utils/Product.h"

using namespace MAUI;
using namespace MAUtil;

class ShopPurchaseScreen : public Screen, WidgetListener {
public:
	ShopPurchaseScreen(Screen *previous, Feed *feed, Product *product);
	~ShopPurchaseScreen();
	void keyPressEvent(int keyCode);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
private:
	Feed *feed;
	Layout *layout;
	ListBox* listBox;
	Label *lbl;
	Screen *next;
	Screen *previous;
	Product *product;
	bool list, left, right, canPurchase;

	String parentTag,notice;
	String temp,temp1,error_msg;
};

#endif
