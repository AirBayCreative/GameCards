#ifndef _COMPARESCREEN_H_
#define _COMPARESCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/ListBox.h>
#include <MAUI/Image.h>

#include "../utils/Card.h"
#include "../utils/Feed.h"
#include "../utils/ImageCache.h"
#include "../utils/XmlConnection.h"
#include "../UI/Widgets/MobImage.h"
#include "MainScreen.h"

using namespace MAUI;

/**
 *  The screen class used for demonstrating how to
 *  use MAUI::Image widgets.
 */
class CompareScreen : public MainScreen, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	CompareScreen(MainScreen *previous, MAHandle image, Feed *feed, bool flip, Card *card, Card *compare);
	~CompareScreen();
	void keyPressEvent(int keyCode);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	void clearListBox();
private:
	MAHandle img;
	MAPoint2d pointPressed, pointReleased;
	Card *card, *compare;
	MobImage *imge, *cmpge;
	ImageCache *imageCache;
	Widget* currentSelectedKey;
	int height, flipOrSelect, currentSelectedStat, currentKeyPosition;

	bool flip, busy;
	bool left, right, list;
	String parentTag;

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

#endif	//_COMPARESCREEN_H_
