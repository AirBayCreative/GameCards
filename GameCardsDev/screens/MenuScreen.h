#ifndef _MENUSCREEN_H_
#define _MENUSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../UI/KineticListBox.h"
#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"

using namespace MAUI;
using namespace MAUtil;

class MenuScreen : public Screen, WidgetListener, private HttpConnectionListener, private XCListener, Mtx::XmlListener {
public:
	MenuScreen(Feed *feed);
	~MenuScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
private:
	HttpConnection mHttp;
	XmlConnection xmlConn;

	Layout *mainLayout;
	KineticListBox *listBox;
	Label *label;
	Feed *feed;
	Screen *menu;
	int c;
	bool list, left, right;
	int moved;

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

#endif
