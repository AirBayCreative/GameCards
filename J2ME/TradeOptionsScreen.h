#ifndef _TRADEOPTIONSSCREEN_H_
#define _TRADEOPTIONSSCREEN_H_

#include <ma.h>
#include "MAUI.h"
#include "Feed.h"
#include "TradeFriendMethodScreen.h"

using namespace MAUI;
using namespace MAUtil;

class TradeOptionsScreen : public Screen, WidgetListener {
public:
	TradeOptionsScreen(Screen *previous, Feed *feed, Card card);
	~TradeOptionsScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
private:
	Feed *feed;
	Layout *layout;
	ListBox* listBox;
	Label *lbl;
	Screen *menu;
	String filename;
	Screen *previous;
	Card card;
	bool list, left, right;

	int index;
};

#endif
