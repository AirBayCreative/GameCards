#ifndef _ALBUMLOADSCREEN_H_
#define _ALBUMLOADSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class AlbumLoadScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	AlbumLoadScreen(Screen *previous, Feed *feed, int screenType = ST_ALBUMS);
	~AlbumLoadScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	int getCount();
	void Add(const char* id, const char* name);
	String *Retrieve(int id);
	void AlbumLoadScreen::drawList();
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
	void refresh();

	enum screenTypes {ST_ALBUMS, ST_PLAY, ST_GAMES};
private:

	Screen *previous;
	Screen *next;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag;
	String temp,temp1,error_msg;
	int size, i, moved, screenType;
	bool list, left, right, empt;

	Layout *mainLayout;
	KineticListBox *listBox;
	Label *notice, *label;
	Label **labelList;

	Feed *feed;
	Albums *album;

	void loadDemo();
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

	void clearLabelPointers();
};

#endif	//_ALBUMLOADSCREEN_H_*/
