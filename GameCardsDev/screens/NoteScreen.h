#ifndef _NOTESCREEN_H_
#define _NOTESCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../UI/Native/NativeEditBox.h"
#include "../utils/Card.h"
#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/KineticListBox.h"
#include "../utils/ImageCache.h"
#include "../UI/Widgets/MobImage.h"
#include "MainScreen.h"

using namespace MAUI;

class NoteScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	NoteScreen(MainScreen *previous, Feed *feed, Card *card, int screenType = ST_CARD_NOTE, String detail = "");
	~NoteScreen();
	void keyPressEvent(int keyCode);
	void clearListBox();
	void selectionChanged(Widget *widget, bool selected);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	enum screenTypes {ST_CARD_NOTE, ST_SMS};
private:
	HttpConnection mHttp;

	String parentTag, note, origionalNote, encodedNote, detail, cardText;
	bool list, left, right, isBusy;
	int moved, screenType, currentKeyPosition;

	NativeEditBox *editBoxNote;

	Widget* currentSelectedKey;

	ImageCache *mImageCache;
	MobImage *tempImage;
	Card *card;

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

#endif	//_NOTESCREEN_H_
