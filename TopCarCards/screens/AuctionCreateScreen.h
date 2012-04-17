#ifndef _AUCTIONCREATESCREEN_H_
#define _AUCTIONCREATESCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../utils/Card.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"
#include "../UI/Native/NativeEditBox.h"

using namespace MAUI;
using namespace MAUtil;

class AuctionCreateScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	AuctionCreateScreen(Screen *previous, Feed *feed, Card *card);
	~AuctionCreateScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:
	Screen *previous;
	Layout *mainLayout;
	Label *label, *notice;
	KineticListBox *listBox;
	ImageCache *mImageCache;
	MobImage *tempImage;
	/*Native*/EditBox *editBoxOpening, *editBoxBuyNow, *editBoxDays;

	bool list, left, right, busy;

	int moved, screenMode;

	Card *card;
	Feed *feed;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	void validateInput();

	void drawDataInputScreen();
	void drawCreatedScreen();
	void drawInvalidInputScreen();
	void drawConfirmScreen();

	String openingText, buyNowText, daysText, errorString, parentTag, createResult, cardText;

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

	void clearListBox();

	enum screenType {ST_DATA, ST_CREATED, ST_INVALID, ST_CONFIRM };
};

#endif	//_AUCTIONCREATESCREEN_H_
