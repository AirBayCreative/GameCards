#ifndef _CREDITSCREEN_H_
#define _CREDITSCREEN_H_

#include "MAUI.h"
#include "Header.h"

using namespace MAUI;
using namespace MAUtil;

class CreditScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	CreditScreen(Screen *previous, Feed *feed);
	~CreditScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);


private:
	Layout *layout;
	Screen *previous;
	ListBox *listBox;
	Label *userNotice, *label, *labelContain;
	EditBox *editBox;
	bool list, left, right;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String credits, error_msg, parentTag, username, email, handle;
	int i,j;

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

#endif	//_CREDITSCREEN_H_
