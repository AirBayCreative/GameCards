#ifndef _CREATECARD_H_
#define _CREATECARD_H_

#include <MAUI/Screen.h>
#include <MAUI/ListBox.h>
#include <MAUI/Image.h>
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;


class CreateCardScreen : public MainScreen {
public:
	CreateCardScreen(MainScreen *previous);
	~CreateCardScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:
	Image *imge;
	bool list, left, right;
};

#endif	//_CREATECARD_H_
