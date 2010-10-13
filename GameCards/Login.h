#ifndef _LOGIN_H_
#define _LOGIN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>
#include <MAUI/ListBox.h>
#include <MAUI/Layout.h>

#include "Feed.h"
#include "XmlConnection.h"
#include "UI/MobKeyboard.h"
#include "UI/Widgets/MobEditBox.h"

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
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:
	Screen *previous;
	Layout *mainLayout;
	ListBox *listBox;
	Label *label;
	MobEditBox *editBoxLogin;
	//MobEditBox *editBoxPass;
	MobKeyboard *keyboard;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag,conCatenation,ret,value,value1,value2,convertAsterisk,underscore;
	String username,credits,encrypt,error_msg,email,handle, touch;
	bool list, left, right, error;
	int j;

	Feed *feed;

	Screen *next;
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
	void mtxParseError();
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();

	String base64(unsigned char const* bytes_to_encode, unsigned int in_len);
};

#endif	//_LOGIN_H_
