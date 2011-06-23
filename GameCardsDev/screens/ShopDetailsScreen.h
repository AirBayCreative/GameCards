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

class ShopDetailsScreen : public Screen, WidgetListener, public MAUtil::TimerListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	ShopDetailsScreen(Screen *previous, Feed *feed, int screenType, bool free, Product *product = NULL, Auction *auction = NULL);
	~ShopDetailsScreen();
	void selectionChanged(Widget *widget, bool selected);
	void keyPressEvent(int keyCode);
	String ShopDetailsScreen::getTime();

	void runTimerEvent();

#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
	enum screenTypes {ST_PRODUCT, ST_AUCTION};
private:
	Screen *next, *previous;
	Layout *mainLayout;
	Label *label;
	KineticListBox *listBox;
	ImageCache *mImageCache;
	MobImage *tempImage;
	EditBox *editBidBox;

	bool list, left, right, freebie;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag;
	String temp,temp1,error_msg;

	int moved, screenType;

	String nameDesc, fullDesc;

	Product *product;
	Auction *auction;
	Feed *feed;

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
};

#endif	//_SHOPDETAILSSCREEN_H_
