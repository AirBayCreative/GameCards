#ifndef _SEARCHSCREEN_H_
#define _SEARCHSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>
#include <MAUI/ListBox.h>
#include <MAUI/Layout.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/Widgets/MobEditBox.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class MobKeyboard;
class MobEditBox;

class SearchScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	SearchScreen(Feed *feed, Screen *previous);
	~SearchScreen();
	void keyPressEvent(int keyCode);
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
	Layout *mainLayout;
	KineticListBox *listBox;
	Label *label, *notice;
	MobEditBox *editBoxSearch;
	Vector<Widget*> tempWidgets;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag,conCatenation,value,value1,value2,convertAsterisk,underscore;
	String username,credits,encrypt,error_msg,email,handle, touch, response;
	bool list, left, right, mid, error;
	int moved;

	Feed *feed;

	Screen *next, *prev;
	bool isBusy, changed;

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
	void cleanup();
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

#endif	//_SEARCHSCREEN_H_
