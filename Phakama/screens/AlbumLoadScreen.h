#ifndef _ALBUMLOADSCREEN_H_
#define _ALBUMLOADSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/KineticListBox.h"
#include "../utils/Card.h"

using namespace MAUI;
using namespace MAUtil;

class AlbumLoadScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	AlbumLoadScreen(Screen *previous, Feed *feed, int screenType = ST_ALBUMS, Albums *album = NULL, Card *card = NULL, String CategoryId = "");
	~AlbumLoadScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	int getCount();
	void Add(const char* id, const char* name);
	String *Retrieve(int id);
	void drawList();

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	void refresh();

	void setDeckId(String deckId);

	enum screenTypes {ST_ALBUMS};
private:

	Screen *previous;
	Screen *next;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	Vector<String> path;
	String parentTag;
	String temp,temp1,error_msg,hasCards,updated,categoryId,deckId;
	int size, i, moved, screenType;
	bool list, left, right, mid, empt, hasConnection;

	Layout *mainLayout;
	KineticListBox *listBox;
	Label *notice, *label;

	Feed *feed;
	Albums *album;
	Card *card;

	void loadDemo();
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

	void clearListBox();
	void loadCategory();
};

#endif	//_ALBUMLOADSCREEN_H_*/
