#ifndef _GAMEDETAILSSCREEN_H_
#define _GAMEDETAILSSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../utils/Log.h"
#include "../UI/KineticListBox.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class GameDetailsScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	GameDetailsScreen(Feed *feed, int screenType);
	~GameDetailsScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void clearListBox();

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	enum screenTypes {ST_GAME_DETAILS, ST_GAME_LOG};
private:
	Log *log;
	Vector<Log*> logs;

	bool list, left, right;

	HttpConnection mHttp;
	Widget* currentSelectedKey;

	String parentTag, gameId;
	String playerDeck, opponentDeck, error_msg, toPlay, display, date, description;
	int moved, screenType, currentKeyPosition;

	void drawList();

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
