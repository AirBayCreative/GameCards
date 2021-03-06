#ifndef _OPTIONSSCREEN_H_
#define _OPTIONSSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>
#include <IX_CALL.h>

#include "../utils/Feed.h"
#include "../utils/Card.h"
#include "../utils/XmlConnection.h"
#include "../UI/KineticListBox.h"
#include "../UI/MenuScreen/MenuScreen.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class OptionsScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener, MenuListener {
public:
	OptionsScreen(Feed *feed, int screenType, MainScreen *previous = NULL, Card *card = NULL, String number = "");
	~OptionsScreen();
	void show();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
	enum screenTypes {ST_CARD_OPTIONS,
		ST_NEW_CARD, ST_NUMBER_OPTIONS, ST_LOGIN_OPTIONS};
private:
	Card *card;
	bool list, left, right, connError, busy, accept;
	int index, screenType, moved;
	String error_msg, number;
	void acceptCard();
	void rejectCard();
	void deleteCard();

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
	void xcConnError(int code);
	void mtxEncoding(const char*);
	void mtxTagStart(const char*, int);
	void mtxTagAttr(const char*, const char*);
	void mtxTagData(const char*, int);
	HttpConnection mHttp;
	void mtxTagEnd(const char*, int);
	void mtxParseError(int);
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();

	void menuOptionSelected(int index);

	MenuScreen *confirmation;
};

#endif
