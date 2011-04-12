#ifndef _CONTACTSCREEN_H_
#define _CONTACTSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/ListBox.h>
#include <MAUI/Layout.h>
#include <MAUI/Label.h>
#include <maprofile.h>

#include "../utils/PIM.h"
#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class ContactScreen : public Screen, WidgetListener, ContactListener {
public:
	ContactScreen(Screen *previous, Feed *feed);
	~ContactScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void contactReceived(Contact& contact);
	WString getNum() {
		return num;
	}
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
private:
	PIM pim;
	Layout *mainLayout;
	char msg[1024];
	KineticListBox *listBox;
	Label *label, *notice, *lbl;
	bool list, left, right, mid, found;
	Vector<WString> numbers;
	WString num;

	Feed *feed;
	Screen *previous;
};

#endif	//_CONTACTSCREEN_H_
