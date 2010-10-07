#ifndef _TRADEFRIENDMETHODSCREEN_H_
#define _TRADEFRIENDMETHODSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "Feed.h"
#include "Card.h"

using namespace MAUI;
using namespace MAUtil;

class TradeFriendMethodScreen : public Screen, WidgetListener {
public:
	TradeFriendMethodScreen(Screen *previous, Feed *feed, Card card);
	~TradeFriendMethodScreen();
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
