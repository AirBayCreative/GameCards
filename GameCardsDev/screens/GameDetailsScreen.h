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
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class GameDetailsScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	GameDetailsScreen(Feed *feed);
	~GameDetailsScreen();
	void keyPressEvent(int keyCode);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
private:
	Feed *feed;
	Layout *layout;
	KineticListBox* kinListBox;
	Label *lbl, *notice;

	bool list, left, right;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag, gameId;
	String playerDeck, opponentDeck, error_msg, toPlay, display;
	int moved;

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
	void xcConnError(int code);
	void mtxEncoding(const char*);
	void mtxTagStart(const char*, int);
	void mtxTagAttr(const char*, const char*);
	void mtxTagData(const char*, int);
	void mtxTagEnd(const char*, int);
	void mtxParseError(int offSet);
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();
};

#endif
