#ifndef _LOGOUT_H_
#define _LOGOUT_H_

#include <MAUI/Screen.h>
#include <MAUI/Image.h>
#include <MAUI/ListBox.h>
#include <maprofile.h>

#include "../utils/Feed.h"

using namespace MAUI;
using namespace MAUtil;


class Logout : public Screen {
public:
	Logout(Screen *previous, Feed *feed);
	~Logout();
	void keyPressEvent(int keyCode);
	void cleanup();
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
private:
	Image *imge;
	Layout *mainLayout;
	ListBox *listBox;
	Screen *previous;
	bool list, left, right;
	Feed *feed;
};

#endif	//_LOGOUT_H_
