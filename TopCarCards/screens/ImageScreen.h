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

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	enum screenTypes {ST_NORMAL, ST_NEW_CARD, ST_DECK};

	bool isAuction;
private:
	void clearListBox();
	Screen *previous, *next;
	MAHandle img;
	MAPoint2d pointPressed, pointReleased;
	Card *card;
	Feed *feed;
	MobImage *imge;
	ImageCache *imageCacheFront;
	ImageCache *imageCacheBack;
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
	void mtxParseError(int);
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();
};

#endif	//_IMAGESCREEN_H_
