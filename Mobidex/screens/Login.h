#ifndef _LOGIN_H_
#define _LOGIN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>
#include <MAUI/ListBox.h>
#include <MAUI/Layout.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/Native/NativeEditBox.h"
#include "../UI/KineticListBox.h"
#include "../UI/CheckBox.h"
#include "../UI/MenuScreen/MenuScreen.h"

using namespace MAUI;
using namespace MAUtil;

struct country {
	const char *code;
	const char *country;
};

class Login : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener, MenuListener {
public:
	Login(Feed *feed, Screen *previous, int screen);
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
	Layout *mainLayout, *termsLayout;
	KineticListBox *listBox;
	Label *label, *notice, *termsLink;
	NativeEditBox *editBoxLogin, *editBoxPass, *editBoxFullname, *editBoxCell, *editBoxEmail;
	CheckBox *termsBox;
	Vector<Widget*> tempWidgets;
	MenuScreen *termsMenu;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag,conCatenation,value,value1,value2,convertAsterisk,underscore;
	String username,credits,encrypt,error_msg,email,handle, touch, response;
	String temp,temp1,hasCards,updated;

	bool list, left, right, mid, error;
	int screen, moved;

	Feed *feed;
	Albums *album;

	Screen *next, *prev;
	bool isBusy;

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

	void disableEditBoxes();

	int checkCountryCode();
};

#endif	//_LOGIN_H_
