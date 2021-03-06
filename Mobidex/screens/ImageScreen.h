#ifndef _IMAGESCREEN_H_
#define _IMAGESCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/ListBox.h>
#include <MAUI/Image.h>

#include "../utils/Card.h"
#include "../utils/Feed.h"
#include "../MAHeaders.h"
#include "../utils/ImageCache.h"
#include "../utils/XmlConnection.h"
#include "../UI/Widgets/MobImage.h"
#include "../UI/MenuScreen/MenuScreen.h"
#include "TradeFriendDetailScreen.h"
#include "MainScreen.h"

using namespace MAUI;

/**
 *  The screen class used for demonstrating how to
 *  use MAUI::Image widgets.
 */
class ImageScreen : public MainScreen, private XCListener, Mtx::XmlListener, private HttpConnectionListener, MenuListener {
public:
	ImageScreen(MainScreen *previous, MAHandle image, Feed *feed, bool flip, Card *card, int screenType = ST_NORMAL,
			bool hasConnection = true, bool canAuction = true);
	~ImageScreen();
	void keyPressEvent(int keyCode);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
	void pop();
	enum screenTypes {ST_NORMAL, ST_NEW_CARD, ST_VIEW_CARD};
private:
	MAHandle img;
	MAPoint2d pointPressed, pointReleased;
	Card *card;
	MobImage *imge;
	ImageCache *imageCacheFront;
	ImageCache *imageCacheBack;
	int height, screenType, flipOrSelect, currentSelectedStat;
	bool flip, busy, tapped;
	bool left, right, list, hasConnection, canAuction;
	String parentTag;
	HttpConnection mHttp;

	void acceptCard();
	void rejectCard();

	void selectStat(int upOrDown); //-1 for up, 1 for down

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

	void ImageScreen::menuOptionSelected(int index);
};

#endif	//_IMAGESCREEN_H_
