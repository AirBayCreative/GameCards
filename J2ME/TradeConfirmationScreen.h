#ifndef _TRADECONFIRMATIONSCREEN_H_
#define _TRADECONFIRMATIONSCREEN_H_

#include <ma.h>
#include "MAUI.h"
#include "Feed.h"

using namespace MAUI;
using namespace MAUtil;

class TradeConfirmationScreen : public Screen, WidgetListener {
public:
	TradeConfirmationScreen(Screen *previous, Feed *feed, Card card, String method, String friendDetail);
	~TradeConfirmationScreen();
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
	Screen *menu;
	String method, friendDetail;
	Screen *previous;
	Card card;
	bool list, left, right;

	int index;
};

#endif
