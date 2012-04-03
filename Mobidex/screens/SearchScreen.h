#ifndef _SEARCHSCREEN_H_
#define _SEARCHSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>
#include <MAUI/ListBox.h>
#include <MAUI/Layout.h>

#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../utils/Card.h"
#include "../UI/Native/NativeEditBox.h"
#include "../UI/KineticListBox.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class SearchScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	SearchScreen(Feed *feed, MainScreen *previous);
	~SearchScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
private:

	NativeEditBox *editBoxSearch;

	String parentTag, cardText, statDesc, statIVal, statDisplay, note, rate, value, orientation;
	String error_msg, id,description,quantity, thumburl, fronturl, backurl, updated;
	int statTop, statLeft, statWidth, statHeight, statFrontOrBack, statRed, statGreen, statBlue;
	bool left, right, mid, error, fresh;
	int moved;

	bool isBusy, isActive;

	Map<String, Card*> cards;
	Vector<Stat*> stats;
	Stat *stat;

	void doSearch();
	void clearCardMap();

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
	void cleanup();
	HttpConnection mHttp;
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

#endif	//_SEARCHSCREEN_H_
