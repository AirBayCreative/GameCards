#ifndef _NEWVERSIONSCREEN_H_
#define _NEWVERSIONSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>
#include <maprofile.h>

#include "../utils/Feed.h"

using namespace MAUI;
using namespace MAUtil;

class NewVersionScreen : public Screen, WidgetListener {
public:
	NewVersionScreen(Screen *previous, String url, Feed *feed);
	~NewVersionScreen();
	void clearListBox();
	void keyPressEvent(int keyCode);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:
	Screen *previous;

	String downloadUrl;

	Layout *layout;
	ListBox *listBox;
	Label *lbl;
	Feed *feed;
	Screen *menu;
	bool list, left, right;
};

#endif
