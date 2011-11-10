#ifndef _SHOPDETAILSSCREEN_H_
#define _SHOPDETAILSSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../utils/Product.h"
#include "../utils/Auction.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"
#include "../UI/Native/NativeEditBox.h"
#include "../utils/XmlConnection.h"
#include "../UI/Widgets/MobImage.h"

using namespace MAUI;
using namespace MAUtil;

class ShopDetailsScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	ShopDetailsScreen(Screen *previous, Feed *feed, int screenType, bool free, Product *product = NULL, Auction *auction = NULL, bool first = false);
	~ShopDetailsScreen();
	void selectionChanged(Widget *widget, bool selected);
	void keyPressEvent(int keyCode);
	String ShopDetailsScreen::getTime();
	void refresh();

	void runTimerEvent();

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	enum screenTypes {ST_PRODUCT, ST_USER};

	Auction *auction;
private:
	Screen *next, *previous;
	Layout *mainLayout;
	Label *label, *cardLabel, *notice;
	KineticListBox *listBox;
	ImageCache *mImageCache;
	MobImage *tempImage;
	NativeEditBox *editBidBox;

	bool list, left, right, free, first, busy, hasBid, buynow, confirmbuynow, expired;

	String parentTag, result, credits;
	String temp,temp1,error_msg;

	int moved, screenType;

	String nameDesc, fullDesc;

	Product *product;
	Feed *feed;

	HttpConnection mHttp;
	XmlConnection xmlConn;

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

	void postBid();
	void buyNow();

	void clearListBox();

	String validateBid();
};

#endif	//_SHOPDETAILSSCREEN_H_
