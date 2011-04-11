#ifndef _TRADEFRIENDDETAILSCREEN_H_
#define _TRADEFRIENDDETAILSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "../utils/Feed.h"
#include "../UI/Widgets/MobEditBox.h"
#include "../UI/MobKeyboard.h"
#include "../utils/Card.h"
//#include "UI/Native/NativeEditBox.h"

using namespace MAUI;
using namespace MAUtil;

class MobKeyboard;

class TradeFriendDetailScreen : public Screen, WidgetListener {
public:
	TradeFriendDetailScreen(Screen *previous, Feed *feed, Card *card, String method);
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
	//NativeEditBox *contactEditBox;
	Screen *menu;
	Screen *previous;
	Card *card;
	bool list, left, right;
	String method;
	MobEditBox *contactEditBox;
	MobKeyboard *keyboard;
};

#endif
