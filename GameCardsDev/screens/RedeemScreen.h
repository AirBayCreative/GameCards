#ifndef _REDEEMSCREEN_H_
#define _REDEEMSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/ListBox.h>
#include <MAUI/Layout.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../utils/Card.h"
#include "../UI/Native/NativeEditBox.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class RedeemScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	RedeemScreen(Feed *feed, Screen *previous);
	~RedeemScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void clearListBox();
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
	NativeEditBox *editBoxRedeem;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String error_msg, result, parentTag;
	bool left, right, mid, error;
	int moved;

	Feed *feed;

	Screen *next, *prev;
	bool isBusy;

	void redeemCode();

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
	void cleanup();
	void xcConnError(int code);
	void mtxEncoding(const char*);
	void mtxTagStart(const char*, int);
	void mtxTagAttr(const char*, const char*);
	void mtxTagData(const char*, int);
	void mtxTagEnd(const char*, int);
	void mtxParseError(int);
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();
};

#endif	//_REDEEMSCREEN_H_
