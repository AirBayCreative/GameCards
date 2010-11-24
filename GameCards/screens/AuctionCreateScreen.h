#ifndef _AUCTIONCREATESCREEN_H_
#define _AUCTIONCREATESCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../utils/Card.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"
#include "../UI/Widgets/MobEditBox.h"
#include "../UI/MobKeyboard.h"

using namespace MAUI;
using namespace MAUtil;

class AuctionCreateScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	AuctionCreateScreen(Screen *previous, Feed *feed, Card *card);
	~AuctionCreateScreen();
	void keyPressEvent(int keyCode);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:
	Screen *previous;
	Layout *mainLayout;
	Label *label;
	KineticListBox *listBox;
	ImageCache *mImageCache;
	MobEditBox *editBoxOpening, *editBoxBuyNow, *editBoxDays;
	MobKeyboard *keyboard;

	bool list, left, right, busy;

	int moved, screenMode;

	Card *card;
	Feed *feed;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	void setSelectedEditBox();
	void setKeyboardDetails(MAPoint2d point);
	void validateInput();

	void drawDataInputScreen();
	void drawCreatedScreen();
	void drawInvalidInputScreen();

	String openingText, buyNowText, daysText, errorString, parentTag, createResult;

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

	enum screenType {ST_DATA, ST_CREATED, ST_INVALID};
};

#endif	//_AUCTIONCREATESCREEN_H_
