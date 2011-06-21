#ifndef _IMAGESCREEN_H_
#define _IMAGESCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/ListBox.h>
#include <MAUI/Image.h>
#include <maprofile.h>

#include "../utils/Card.h"
#include "../utils/Feed.h"
#include "../utils/MAHeaders.h"
#include "../utils/ImageCache.h"
#include "../utils/XmlConnection.h"
#include "../UI/Widgets/MobImage.h"
#include "TradeFriendDetailScreen.h"

using namespace MAUI;

/**
 *  The screen class used for demonstrating how to
 *  use MAUI::Image widgets.
 */
class ImageScreen : public Screen, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	ImageScreen(Screen *previous, MAHandle image, Feed *feed, bool flip, Card *card, int screenType = ST_NORMAL,
			bool hasConnection = true, bool canAuction = true);
	~ImageScreen();
	void keyPressEvent(int keyCode);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
	enum screenTypes {ST_NORMAL, ST_NEW_CARD};
private:
	Screen *previous, *next;
	MAHandle img;
	MAPoint2d pointPressed, pointReleased;
	Card *card;
	Feed *feed;
	MobImage *imge;
	ImageCache *imageCache;
	Layout *mainLayout;
	ListBox *listBox;
	int height, screenType, flipOrSelect, currentSelectedStat;
	bool flip, busy;
	bool left, right, list, hasConnection, canAuction;
	String parentTag;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	void acceptCard();
	void rejectCard();
	void checkForGames();

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
	void xcConnError(int code);
	void mtxEncoding(const char*);
	void mtxTagStart(const char*, int);
	void mtxTagAttr(const char*, const char*);
	void mtxTagData(const char*, int);
	void mtxTagEnd(const char*, int);
	void mtxParseError(/*int offSet*/);
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();
};

#endif	//_IMAGESCREEN_H_
