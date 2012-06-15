#ifndef _NEWVERSIONSCREEN_H_
#define _NEWVERSIONSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>
#include "MainScreen.h"

#include "../utils/Feed.h"

using namespace MAUI;
using namespace MAUtil;

class NewVersionScreen : public MainScreen, WidgetListener {
public:
	NewVersionScreen(MainScreen *previous, String url, Feed *feed);
	~NewVersionScreen();
	void clearListBox();
	void keyPressEvent(int keyCode);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:

	String downloadUrl;
	bool list, left, right;
};

#endif
