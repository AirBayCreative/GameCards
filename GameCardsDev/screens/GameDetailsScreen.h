#ifndef _GAMEDETAILSSCREEN_H_
#define _GAMEDETAILSSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>
#include <maprofile.h>

#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../utils/Log.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class GameDetailsScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	GameDetailsScreen(Feed *feed, int screenType);
	~GameDetailsScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
	enum screenTypes {ST_GAME_DETAILS, ST_GAME_LOG};
private:
	Feed *feed;
	Layout *layout;
	KineticListBox* kinListBox;
	Label *lbl, *notice;
	Log *log;
	Vector<Log*> logs;

	bool list, left, right;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag, gameId;
	String playerDeck, opponentDeck, error_msg, toPlay, display, date, description;
	int moved, screenType;

	void drawList();

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
