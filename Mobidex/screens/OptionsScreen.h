#ifndef _OPTIONSSCREEN_H_
#define _OPTIONSSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../utils/Card.h"
#include "../utils/XmlConnection.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class OptionsScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	OptionsScreen(Feed *feed, int screenType, Screen *previous = NULL, Card *card = NULL, String number = "");
	~OptionsScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
	enum screenTypes {ST_CARD_OPTIONS,
		ST_NEW_CARD, ST_NUMBER_OPTIONS, ST_LOGIN_OPTIONS};
private:
	Feed *feed;
	Layout *layout;
	KineticListBox* listBox;
	Label *lbl, *notice;
	Screen *menu;
	Screen *previous;
	Card *card;
	bool list, left, right, connError, busy;
	int index, screenType;
	String error_msg, number;

	HttpConnection mHttp;
	XmlConnection xmlConn;

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
	void mtxTagEnd(const char*, int);
	void mtxParseError(/*int offSet*/);
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();
};

#endif
