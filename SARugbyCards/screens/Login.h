#ifndef _LOGIN_H_
#define _LOGIN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>
#include <MAUI/ListBox.h>
#include <MAUI/Layout.h>

#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/Native/NativeEditBox.h"
#include "../UI/KineticListBox.h"
#include "../UI/MenuScreen/MenuScreen.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class Login : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener, MenuListener {
public:
	Login(MainScreen *previous, Feed *feed, int screen);
	~Login();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
	void menuOptionSelected(int index);
	enum screens {S_LOGIN, S_REGISTER};
private:
	Widget* currentSelectedKey;

	Label *genderLabel;

	NativeEditBox *editBoxEmail, *editBoxPass, *editBoxName, *editBoxSurname, *editBoxAge;

	MenuScreen *genderMenu;

	HttpConnection mHttp;

	String parentTag,conCatenation,value,value1,value2,convertAsterisk,underscore;

	String username,credits,encrypt,error_msg,email,handle,touch,result,freebie,notedate,premium;
	bool list, left, right, mid, error;
	int screen, moved, currentKeyPosition;

	bool isBusy, changed;

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
	void cleanup();
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

	void drawLoginScreen();
	void drawRegisterScreen();
};

#endif	//_LOGIN_H_
