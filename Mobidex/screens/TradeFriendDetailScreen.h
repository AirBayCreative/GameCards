#ifndef _TRADEFRIENDDETAILSCREEN_H_
#define _TRADEFRIENDDETAILSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "../utils/Feed.h"
#include "../UI/Native/NativeEditBox.h"
#include "../utils/Card.h"
#include "../utils/XmlConnection.h"
#include "../UI/KineticListBox.h"
#include "../UI/MenuScreen/MenuScreen.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class TradeFriendDetailScreen : public MainScreen, WidgetListener, private HttpConnectionListener, private XCListener, Mtx::XmlListener, MenuListener {
public:
	TradeFriendDetailScreen(MainScreen *previous, Feed *feed, Card *card);
	~TradeFriendDetailScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	void menuOptionSelected(int index);

	void contactSelected(String number);
private:
	enum screenPhase {SP_METHOD, SP_DETAIL, SP_CONFIRM, SP_COMPLETE};
	int phase;

	Label *lblMethod;

	Card *card;
	bool left, right, center, sending, list, fresh;
	String method, methodLabel, friendDetail, friendNote, parentTag;
	String temp, temp1, error_msg, result;
	NativeEditBox *contactEditBox, *editBoxNote;

	void drawMethodScreen();
	void drawDetailScreen();
	void drawConfirmScreen();

	void clearListBox();

	HttpConnection mHttp;
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
