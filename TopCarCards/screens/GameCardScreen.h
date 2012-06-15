#ifndef _GAMECARDSCREEN_H_
#define _GAMECARDSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "../utils/XmlConnection.h"
#include "../utils/ImageCache.h"
#include "../utils/Feed.h"
#include "../utils/Product.h"
#include "../utils/Card.h"
#include "../UI/KineticListBox.h"
#include "../UI/Widgets/MobImage.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class GameCardScreen : public MainScreen, public HttpConnectionListener, public XCListener, public Mtx::XmlListener {
public:
	GameCardScreen(MainScreen *previous, Feed *feed, int screenType = -1);
	~GameCardScreen();
	void clearListBox();
	void keyPressEvent(int keyCode);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	HttpConnection mHttp;

	bool list, left, right;
	int moved;

	String parentTag;
	int screenType;

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
