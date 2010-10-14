#ifndef _TRADECONFIRMATIONSCREEN_H_
#define _TRADECONFIRMATIONSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "Feed.h"
#include "XmlConnection.h"
#include "Card.h"

using namespace MAUI;
using namespace MAUtil;

class TradeConfirmationScreen : public Screen, WidgetListener, private HttpConnectionListener, private XCListener, Mtx::XmlListener {
public:
	TradeConfirmationScreen(Screen *previous, Feed *feed, Card *card, String message, String phoneNum);
	~TradeConfirmationScreen();
	void keyPressEvent(int keyCode);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
private:
	Feed *feed;
	Layout *layout;
	ListBox* listBox;
	Label *lbl;
	Screen *menu;
	Screen *previous;
	Card *card;
	bool list, left, right, sending;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag,notice, phoneNum;
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
