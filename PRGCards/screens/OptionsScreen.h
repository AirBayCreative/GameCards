#ifndef _OPTIONSSCREEN_H_
#define _OPTIONSSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../utils/Card.h"

using namespace MAUI;
using namespace MAUtil;

class OptionsScreen : public Screen, WidgetListener {
public:
	OptionsScreen(Feed *feed, int screenType);
	~OptionsScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
	enum screenTypes {ST_LOGIN_OPTIONS};
private:
	Feed *feed;
	Layout *layout;
	ListBox* listBox;
	Label *lbl, *notice;
	Screen *menu;
	bool list, left, right;
	int index, screenType;
};

#endif
