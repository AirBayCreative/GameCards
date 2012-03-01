#ifndef _DETAILSCREEN_H_
#define _DETAILSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>

#include "../utils/Util.h"
#include "../utils/Card.h"
#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../UI/KineticListBox.h"
#include "../UI/MenuScreen/MenuScreen.h"

using namespace MAUI;
using namespace MAUtil;

class DetailScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener, MenuListener {
public:
	DetailScreen(Screen *previous, Feed *feed, int screenType, Card *card=NULL);
	~DetailScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	enum screenType {PROFILE, BALANCE, CARD, NOTIFICATIONS};
private:
	Screen *previous, *next;
	EditBox *editBox;
	Layout *mainLayout;
	Label *label, *balanceLabel;
	KineticListBox *listBox;
	bool list, left, right;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String username, credits, encrypt, error_msg, parentTag, email, desc, id, date;
	int i,j, moved, screenType, count;

	Card *card;
	Feed *feed;

	bool isBusy;

	void refreshData();

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

	void menuOptionSelected(int index);
};

#endif	//_DETAILSCREEN_H_
