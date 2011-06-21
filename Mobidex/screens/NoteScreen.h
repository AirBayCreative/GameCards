#ifndef _NOTESCREEN_H_
#define _NOTESCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>
#include <maprofile.h>

#include "../utils/Card.h"
#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/Native/NativeEditBox.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;

class NoteScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	NoteScreen(Screen *previous, Feed *feed, Card *card, int screenType = ST_CARD_NOTE, String detail = "");
	~NoteScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif

	enum screenTypes {ST_CARD_NOTE, ST_SMS};
private:
	Layout *mainLayout;
	KineticListBox *listBox;
	Label *label, *notice;
	NativeEditBox *editBoxNote;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag, note, origionalNote, encodedNote, detail;
	bool left, right, isBusy;
	int moved, screenType;

	Screen *previous;

	Feed *feed;
	Card *card;

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

#endif	//_NOTESCREEN_H_
