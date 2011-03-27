#ifndef _SHOPPURCHASESCREEN_H_
#define _SHOPPURCHASESCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>
#include <maprofile.h>

#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../utils/Product.h"
#include "../utils/Card.h"
#include "../UI/KineticListBox.h"
#include "../UI/Widgets/MobImage.h"

using namespace MAUI;
using namespace MAUtil;

class ShopPurchaseScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	ShopPurchaseScreen(Screen *previous, Feed *feed, Product *product);
	~ShopPurchaseScreen();
	void keyPressEvent(int keyCode);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
private:
	Feed *feed;
	Layout *layout;
	KineticListBox* kinListBox;
	Label *lbl, *notice;
	Screen *previous;
	MobImage *imge;

	Product *product;
	Card *card;

	bool list, left, right, canPurchase, purchased, flip;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag;
	String temp,temp1,error_msg;
	String id, description, quality, urlfront, urlback;
	int height, moved;

	void drawPostPurchaseScreen();

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

#endif
