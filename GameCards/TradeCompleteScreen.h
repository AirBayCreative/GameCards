#ifndef _TRADECOMPLETESCREEN_H_
#define _TRADECOMPLETESCREEN_H_

#include <ma.h>
#include "MAUI.h"
#include "Feed.h"

using namespace MAUI;
using namespace MAUtil;

class TradeCompleteScreen : public Screen, WidgetListener {
public:
	TradeCompleteScreen(Feed *feed);
	~TradeCompleteScreen();
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
	bool list, left, right;
};

#endif
