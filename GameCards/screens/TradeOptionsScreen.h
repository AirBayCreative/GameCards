#ifndef _TRADEOPTIONSSCREEN_H_
#define _TRADEOPTIONSSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "../utils/Feed.h"
#include "../utils/Card.h"

using namespace MAUI;
using namespace MAUtil;

class TradeOptionsScreen : public Screen, WidgetListener {
public:
	TradeOptionsScreen(Screen *previous, Feed *feed, Card *card, int screenType);
	~TradeOptionsScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	enum screenTypes {ST_TRADE_OPTIONS, ST_AUCTION_OPTIONS, ST_PLAY_OPTIONS};
private:
	Feed *feed;
	Layout *layout;
	ListBox* listBox;
	Label *lbl;
	Screen *menu;
	Screen *previous;
	Card *card;
	bool list, left, right;
	int index, screenType;
};

#endif
