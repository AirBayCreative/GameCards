#ifndef _TRADEFRIENDDETAILSCREEN_H_
#define _TRADEFRIENDDETAILSCREEN_H_

#include <ma.h>
#include "MAUI.h"
#include "Feed.h"
#include "Header.h"
#include "UI/Widgets/MobEditBox.h"

using namespace MAUI;
using namespace MAUtil;

class TradeFriendDetailScreen : public Screen, WidgetListener {
public:
	TradeFriendDetailScreen(Screen *previous, Feed *feed, Card card, String method);
	~TradeFriendDetailScreen();
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
	Label *lbl, *lblMethod, *errorLabel;
	MobEditBox *contactEditBox;
	Screen *menu;
	String filename;
	Screen *previous;
	Card card;
	bool list, left, right;
	String method;
};

#endif
