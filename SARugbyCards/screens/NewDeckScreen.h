#ifndef _NEWDECKSCREEN_H_
#define _NEWDECKSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../utils/Album.h"
#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/KineticListBox.h"
#include "../UI/Native/NativeEditBox.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class NewDeckScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	NewDeckScreen(MainScreen *previous, Feed *feed);
	~NewDeckScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:
	NativeEditBox *editBoxName;
	Widget* currentSelectedKey;

	bool list, left, right, busy, empty;

	int moved, phase, currentKeyPosition;

	Album *album;
	Vector<Album*> albums;

	HttpConnection mHttp;

	void validateInput();

	void drawSelectCategoryScreen();
	void drawEnterNameScreen();

	String deckId, deckName, errorString, parentTag, createResult, categoryName, categoryId;

	String chosenCategory;

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

	enum creationPhase {P_CATEGORY, P_NAME, P_RESULTS};
};

#endif	//_NEWDECKSCREEN_H_
