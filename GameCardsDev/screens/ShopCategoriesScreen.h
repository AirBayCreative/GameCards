#ifndef _SHOPCATEGORIESSCREEN_H_
#define _SHOPCATEGORIESSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class ShopCategoriesScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	ShopCategoriesScreen(Screen *previous, Feed *feed, int screenType);
	~ShopCategoriesScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void drawList();
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
	void refresh();

	enum screenTypes {ST_AUCTIONS, ST_SHOP, ST_FREEBIE};
private:

	Screen *previous;
	Screen *next;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag;
	String temp,temp1,error_msg;
	int i, moved, screenType;
	bool list, left, right, empt;

	Layout *mainLayout;
	KineticListBox *listBox;
	Label *notice, *label;

	Feed *feed;
	HashMap<String,String> categories;
	Vector<String> category;

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

#endif	//_ALBUMLOADSCREEN_H_*/
