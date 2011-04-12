#ifndef _SHARESCREEN_H_
#define _SHARESCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>
#include <MAUI/ListBox.h>
#include <MAUI/Layout.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../screens/ContactScreen.h"
#include "../utils/XmlConnection.h"
#include "../UI/Widgets/MobEditBox.h"
#include "../UI/KineticListBox.h"
#if defined(MA_PROF_SUPPORT_STYLUS)
#include "../UI/MobKeyboard.h"
#endif

using namespace MAUI;
using namespace MAUtil;

class MobKeyboard;
class MobEditBox;

class ShareScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	ShareScreen(Screen *previous, Feed *feed);
	~ShareScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void ShareScreen::pop(String num);
	void hide();
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
private:
	Layout *mainLayout;
	KineticListBox *listBox;
	Label *label, *notice;
	MobEditBox *editBoxCell, *editBoxMessage;
#if defined(MA_PROF_SUPPORT_STYLUS)
	MobKeyboard *keyboard;
#endif
	ContactScreen *next;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag,value;
	bool list, left, right, mid, error, kbShown;
	int moved, defaultKBPos;

	Feed *feed;

	Screen *previous;
	bool isBusy;

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
	void xcConnError(int code);
	void mtxEncoding(const char*);
	void mtxTagStart(const char*, int);
	void mtxTagAttr(const char*, const char*);
	void mtxTagData(const char*, int);
	void mtxTagEnd(const char*, int);
	void mtxParseError();
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();
};

#endif	//_SHARESCREEN_H_
