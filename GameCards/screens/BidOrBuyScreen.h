#ifndef _BIDORBUYSCREEN_H_
#define _BIDORBUYSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../utils/Auction.h"
#include "../UI/Widgets/MobEditBox.h"
#include "../UI/MobKeyboard.h"

using namespace MAUI;
using namespace MAUtil;

class BidOrBuyScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	BidOrBuyScreen(Screen *previous, Feed *feed, Auction *auction);
	~BidOrBuyScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
private:
	Feed *feed;
	Layout *layout;
	ListBox* listBox;
	Label *notice, *lbl, *editBoxLabel;
	Screen *previous;
	Auction *auction;
	bool list, left, right, canPurchase, busy;
	String parentTag, result;
	int screenPhase;

	MobEditBox *bidEditBox;
	MobKeyboard *keyboard;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	enum screenPhases {SP_CHOOSE_ACTION, SP_PLACE_BID, SP_BUY_NOW, SP_POST_SUBMIT};

	String validateBid();

	void drawChoosePhase();
	void drawBuyNowPhase();
	void drawPostSubmitPhase(String message);
	void drawPlaceBidPhase();

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
