#ifndef _PROFILESCREEN_H_
#define _PROFILESCREEN_H_

#include "MAUI.h"
#include "Header.h"

using namespace MAUI;
using namespace MAUtil;

class ProfileScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	ProfileScreen(Screen *previous, Feed *feed);
	~ProfileScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);


private:
	//Layout *layout;
	Screen *previous;
	//ListBox *listBox;
	EditBox *editBox;
	Label *labelContain, *lbl/*,*label,*userNotice*/;
	bool list, left, right;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String username, credits, encrypt, error_msg, parentTag, handle, email;
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

#endif	//_PROFILESCREEN_H_
