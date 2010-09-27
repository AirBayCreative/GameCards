#ifndef _LOGIN_H_
#define _LOGIN_H_

#include "MAUI.h"
#include "Header.h"

using namespace MAUI;
using namespace MAUtil;

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
	Screen *menu;
	ListBox *listBox;
	Layout *mainLayout;
	Label *labelLogin,*labelPass,*errorLabel,*label;
	EditBox *editBoxLogin,*editBoxPass;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag,conCatenation,ret,value,value1,value2,convertAsterisk,underscore;
	String username,credits,encrypt,error_msg,email,handle;
	bool list, left, right, error;
	int j;

	Feed *feed;

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

	String base64(unsigned char const* bytes_to_encode, unsigned int in_len);
};

#endif	//_LOGIN_H_
