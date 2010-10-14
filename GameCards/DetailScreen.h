#ifndef _DETAILSCREEN_H_
#define _DETAILSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>

#include "XmlConnection.h"
#include "Feed.h"
#include "UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class DetailScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	DetailScreen(Screen *previous, Feed *feed, int screenType);
	~DetailScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);


private:
	Screen *previous;
	EditBox *editBox;
	Layout *mainLayout;
	Label *label;
	KineticListBox *listBox;
	bool list, left, right;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String username, credits, encrypt, error_msg, parentTag, handle, email;
	int i,j, moved;

	Feed *feed;

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

#endif	//_DETAILSCREEN_H_
