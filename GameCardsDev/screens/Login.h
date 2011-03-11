#ifndef _LOGIN_H_
#define _LOGIN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>
#include <MAUI/ListBox.h>
#include <MAUI/Layout.h>
#include <maprofile.h>

#include "../utils/Feed.h"
#include "../utils/XmlConnection.h"
#include "../UI/Widgets/MobEditBox.h"
#include "../UI/KineticListBox.h"
#if defined(MA_PROF_SUPPORT_STYLUS)
#include "../UI/MobKeyboard.h"
#endif

using namespace MAUI;
using namespace MAUtil;

class MobKeyboard;
class MobEditBox;

class Login : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	Login(Feed *feed);
	~Login();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
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
	MobEditBox *editBoxLogin, *editBoxPass, *editBoxEmail;
	Vector<Widget*> tempWidgets;
#if defined(MA_PROF_SUPPORT_STYLUS)
	MobKeyboard *keyboard;
#endif

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag,conCatenation,ret,value,value1,value2,convertAsterisk,underscore;
	String username,credits,encrypt,error_msg,email,handle, touch, response;
	bool list, left, right, mid, error, kbShown;
	int j, screen, moved;

	Feed *feed;

	Screen *next;
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
	void mtxParseError();
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();

	void clearListBox();

	void drawLoginScreen();
	void drawRegisterScreen();

	enum screens {S_LOGIN, S_REGISTER};

	String base64(unsigned char const* bytes_to_encode, unsigned int in_len);
};

#endif	//_LOGIN_H_
