#ifndef _TRADEFRIENDDETAILSCREEN_H_
#define _TRADEFRIENDDETAILSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "Feed.h"
#include "UI/Widgets/MobEditBox.h"
#include "UI/MobKeyboard.h"
#include "XmlConnection.h"
#include "Card.h"

using namespace MAUI;
using namespace MAUtil;

class MobKeyboard;

class TradeFriendDetailScreen : public Screen, WidgetListener, private HttpConnectionListener, private XCListener, Mtx::XmlListener {
public:
	TradeFriendDetailScreen(Screen *previous, Feed *feed);
	~TradeFriendDetailScreen();
	void keyPressEvent(int keyCode);
	//void selectionChanged(Widget *widget, bool selected);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
private:
	Feed *feed;
	Layout *layout;
	ListBox* listBox;
	Label *lbl, *lblMethod, *errorLabel;
	MobEditBox *contactEditBox;
	Screen *menu;
	Screen *previous;
	bool list, left, right, busy;
	MobKeyboard *keyboard;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag,notice;
	String temp,temp1,error_msg;

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
