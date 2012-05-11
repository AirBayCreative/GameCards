#ifndef _DECKLISTSCREEN_H_
#define _DECKLISTSCREEN_H_

#include <ma.h>
#include <MAUI/ListBox.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Screen.h>

#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../utils/Album.h"
#include "../UI/KineticListBox.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class DeckListScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	DeckListScreen(MainScreen *previous, Feed *feed, int screenType = 0, String categoryId = 0);
	~DeckListScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	enum screenTypes {ST_EDIT=0, ST_SELECT};
	void refresh();
private:
	Vector<Album*> albums;
	Album *album;
	Widget* currentSelectedKey;

	bool list, left, right, selecting;

	HttpConnection mHttp;

	String parentTag, categoryId;
	String deckId, description;
	int moved, screenType, currentKeyPosition;

	void clearListBox();
	void clearAlbums();
	void drawList();

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
