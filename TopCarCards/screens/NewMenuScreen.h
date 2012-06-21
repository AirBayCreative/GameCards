#ifndef _NEWMENUSCREEN_H_
#define _NEWMENUSCREEN_H_

#include <MAUI/Screen.h>

#include "../UI/Widgets/GCMenu.h"
#include "MainScreen.h"

class NewMenuScreen : public MainScreen, public WidgetListener, public HttpConnectionListener, public XCListener, public Mtx::XmlListener {
public:
	NewMenuScreen(Feed *feed);
	~NewMenuScreen();

	void keyPressEvent(int keyCode);
	void refresh();

	void selectionChanged(Widget *widget, bool selected);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	HttpConnection mHttp;
	bool list, left, right;

	int screenType;
private:
	void clearListBox();

	void show();
	void hide();

	GCMenu *menu;
	String parentTag, notedate;
	int c, versionChecked, first, moved;
	bool shown;

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
