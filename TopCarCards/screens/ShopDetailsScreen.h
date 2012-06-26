#ifndef _SHOPDETAILSSCREEN_H_
#define _SHOPDETAILSSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../utils/Feed.h"
#include "../utils/Product.h"
#include "../utils/Auction.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"
#include "../UI/Native/NativeEditBox.h"
#include "../utils/XmlConnection.h"
#include "../UI/Widgets/MobImage.h"
#include "MainScreen.h"
#include "../UI/MenuScreen/MenuScreen.h"

using namespace MAUI;
using namespace MAUtil;

class ShopDetailsScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, HttpConnectionListener, MenuListener {
public:
	ShopDetailsScreen(MainScreen *previous, Feed *feed, int screenType, bool free, Product *product = NULL, Auction *auction = NULL, bool first = false);
	~ShopDetailsScreen();
	void selectionChanged(Widget *widget, bool selected);
	void keyPressEvent(int keyCode);
	void purchase();
	String ShopDetailsScreen::getTime();
	void refresh();

	void runTimerEvent();

	void menuOptionSelected(int index);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	enum screenTypes {ST_PRODUCT, ST_AUCTION, ST_USER};

	Auction *auction;
private:
	Widget* currentSelectedKey;
	Label *cardLabel, *creditlabel;
	ImageCache *mImageCache;
	MobImage *tempImage;
	NativeEditBox *editBidBox;
	MenuScreen *purchaseMenu;

	bool list,left,right,free,first,busy,bidOrBuy,hasBid,buynow,success,confirmbuynow,expired;

	String parentTag,result,credits,premium;
	String temp,temp1,error_msg;

	int moved, screenType, currentKeyPosition;

	String nameDesc,fullDesc;

	Product *product;

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

	void postBid();
	void buyNow();

	void drawPostBid(String success);
	void drawBuyNow();
	void drawBuyNow(bool success);

	void clearListBox();

	String validateBid();
};

#endif	//_SHOPDETAILSSCREEN_H_
