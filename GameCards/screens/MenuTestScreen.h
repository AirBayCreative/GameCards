#ifndef _MENUTESTSCREEN_H_
#define _MENUTESTSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/ListBox.h>
#include <MAUI/Image.h>
#include <MAUI/EditBox.h>

#include "../UI/MenuScreen/MenuScreen.h"
#include "../UI/Native/NativeEditBox.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;


class MenuTestScreen : public MainScreen, WidgetListener, MenuListener {
public:
	MenuTestScreen(MainScreen *previous);
	~MenuTestScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:
	void menuOptionSelected(int);

	bool list, left, right;
	Label *dropDownGender;
	NativeEditBox *editBoxLogin;
	MenuScreen *genderList;
};

#endif	//_MENUTESTSCREEN_H_
