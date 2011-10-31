#ifndef _TRADEFRIENDDETAILSCREEN_H_
#define _TRADEFRIENDDETAILSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../UI/Native/NativeEditBox.h"
#include "../utils/Card.h"
#include "../utils/XmlConnection.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class TradeFriendDetailScreen : public Screen, WidgetListener, private HttpConnectionListener, private XCListener, Mtx::XmlListener {
public:
	TradeFriendDetailScreen(Screen *previous, Feed *feed, Card *card);
	~TradeFriendDetailScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
private:
	enum screenPhase {SP_METHOD, SP_DETAIL, SP_CONFIRM, SP_COMPLETE};
	int phase;

	Vector<Widget*> tempWidgets;

	Feed *feed;
	Layout *layout;
	KineticListBox* listBox;
	Label *lbl, *lblMethod, *notice;

	Screen *menu;
	Screen *previous;
	Card *card;
	bool left, right, sending, list, fresh;
	String method, methodLabel, friendDetail, friendNote, parentTag;
	String temp, temp1, error_msg, result;
	NativeEditBox *contactEditBox, *editBoxNote;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	void drawMethodScreen();
	void drawDetailScreen();
	void drawConfirmScreen();
	void drawCompleteScreen();

	void clearListBox();

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
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

#endif
