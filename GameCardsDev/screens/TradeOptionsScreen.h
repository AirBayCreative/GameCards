#ifndef _TRADEOPTIONSSCREEN_H_
#define _TRADEOPTIONSSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../utils/Card.h"
#include "../utils/XmlConnection.h"

using namespace MAUI;
using namespace MAUtil;

class TradeOptionsScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	TradeOptionsScreen(Screen *previous, Feed *feed, int screenType, Card *card = NULL);
	~TradeOptionsScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
	enum screenTypes {ST_TRADE_OPTIONS, ST_AUCTION_OPTIONS, ST_PLAY_OPTIONS, ST_GAME_OPTIONS};
private:
	Feed *feed;
	Layout *layout;
	ListBox* listBox;
	Label *lbl, *notice;
	Screen *menu;
	Screen *previous;
	Card *card;
	bool list, left, right, connError;
	int index, screenType;
	String parentTag, temp1, temp, error_msg;

	Albums *album;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	void checkForGames();

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
