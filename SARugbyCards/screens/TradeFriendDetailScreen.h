#ifndef _TRADEFRIENDDETAILSCREEN_H_
#define _TRADEFRIENDDETAILSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "../utils/Util.h"
#include "../utils/Feed.h"
#include "../UI/Native/NativeEditBox.h"
#include "../utils/Card.h"
#include "../utils/XmlConnection.h"
#include "../UI/Widgets/MobImage.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class TradeFriendDetailScreen : public MainScreen, WidgetListener, private HttpConnectionListener, private XCListener, Mtx::XmlListener, MenuListener {
public:
	TradeFriendDetailScreen(MainScreen *previous, Feed *feed, Card *card);
	~TradeFriendDetailScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
	void setNum(String number);
	void menuOptionSelected(int selected);
private:
	enum screenPhase {SP_METHOD, SP_DETAIL, SP_CONFIRM, SP_COMPLETE};
	int phase, moved;

	Label *lbl, *lblMethodUserName, *lblMethodEmail, *lblMethodPhonenumber, *label2;

	Screen *menu;
	Widget* currentSelectedKey;

	Card *card;
	bool list, left, right, sending, changed, mid;
	int currentKeyPosition;
	String method, methodLabel, friendDetail, parentTag, cardText;
	String temp, temp1, error_msg, result;
	NativeEditBox *usernameEditBox, *emailEditBox, *phonenumberEditBox;

	ImageCache *mImageCache;
	MobImage *tempImage;

	HttpConnection mHttp;

	void drawMethodScreen();
	void drawConfirmScreen();
	void drawCompleteScreen();

	void clearListBox();

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

	void show();
	void hide();
};

#endif
