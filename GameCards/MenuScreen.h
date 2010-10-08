#ifndef _MENUSCREEN_H_
#define _MENUSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "UI/KineticListBox.h"
#include "Feed.h"

using namespace MAUI;
using namespace MAUtil;

class MenuScreen : public Screen, WidgetListener {
public:
	MenuScreen(Feed *feed);
	~MenuScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
private:
	Layout *mainLayout;
	KineticListBox *listBox;
	Label *label;
	Feed *feed;
	Screen *menu;
	bool list, left, right, movedList;
};

#endif
