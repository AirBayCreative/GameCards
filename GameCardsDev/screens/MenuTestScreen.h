#ifndef _MENUTESTSCREEN_H_
#define _MENUTESTSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/ListBox.h>
#include <MAUI/Image.h>
#include <MAUI/EditBox.h>

#include "../UI/MenuScreen/MenuScreen.h"
#include "../UI/Native/NativeEditBox.h"

using namespace MAUI;
using namespace MAUtil;


class MenuTestScreen : public Screen, WidgetListener, MenuListener {
public:
	MenuTestScreen(Screen *previous);
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

	Layout *mainLayout;
	ListBox *listBox;
	Screen *previous;
	bool list, left, right;
	Label *dropDownGender;
	NativeEditBox *editBoxLogin;
	MenuScreen *genderList;
};

#endif	//_MENUTESTSCREEN_H_
