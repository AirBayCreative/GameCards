#ifndef _CONTACTSCREEN_H_
#define _CONTACTSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>
#include <MAUI/ListBox.h>
#include <MAUI/Layout.h>

#include "../utils/Feed.h"
#include "../utils/Contact.h"
#include "../utils/XmlConnection.h"
#include "../UI/Native/NativeEditBox.h"
#include "../UI/KineticListBox.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class ContactScreen : public MainScreen, WidgetListener  {
public:
	ContactScreen(MainScreen *previous);
	~ContactScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:
	KineticListBox *contactListBox;
	NativeEditBox *editBoxSearch;

	bool left, right, mid, list;
	int moved, index;

	bool isBusy;

	void doSearch();
	void clearListBox();

	Vector<Contact*> contacts;
	Vector<Contact*> allContacts;
};

#endif	//_CONTACTSCREEN_H_
