#ifndef _NOTESCREEN_H_
#define _NOTESCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>
#include <maprofile.h>

#include "../utils/Card.h"
#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/Widgets/MobEditBox.h"
#include "../UI/KineticListBox.h"
#if defined(MA_PROF_SUPPORT_STYLUS)
#include "../UI/MobKeyboard.h"
#endif

class NoteScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	NoteScreen(Screen *previous, Feed *feed, Card *card);
	~NoteScreen();
	void keyPressEvent(int keyCode);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
private:
	Layout *mainLayout;
	KineticListBox *listBox;
	Label *label, *notice;
	MobEditBox *editBoxNote;
#if defined(MA_PROF_SUPPORT_STYLUS)
	MobKeyboard *keyboard;
#endif

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag, note, origionalNote, encodedNote;
	bool list, left, right, isBusy, kbShown;
	int moved;

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
	void mtxParseError();
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();
};

#endif	//_NOTESCREEN_H_
