#ifndef _OPTIONSSCREEN_H_
#define _OPTIONSSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "../utils/Feed.h"
#include "../utils/Card.h"
#include "../utils/XmlConnection.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class OptionsScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	OptionsScreen(Feed *feed, int screenType, MainScreen *previous = NULL, Card *card = NULL, String number = "", String deckId = "");
	~OptionsScreen();
	void keyPressEvent(int keyCode);
	void show();
	void clearListBox();
	void hide();
	void selectionChanged(Widget *widget, bool selected);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	enum screenTypes {ST_TRADE_OPTIONS, ST_AUCTION_OPTIONS,
		ST_PLAY_OPTIONS, ST_GAME_OPTIONS, ST_NEW_GAME_OPTIONS, ST_CARD_OPTIONS,
		ST_NEW_CARD, ST_NUMBER_OPTIONS, ST_LOGIN_OPTIONS};
private:
	Screen *menu;
	Widget* currentSelectedKey;

	Card *card;
	bool list, left, right, connError, busy;
	int index, screenType, currentKeyPosition, moved;
	String parentTag, temp1, temp, error_msg, number, deckId;

	HttpConnection mHttp;

	void acceptCard();
	void rejectCard();
	void checkForGames();

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
};

#endif
