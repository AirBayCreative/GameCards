#ifndef _DETAILSCREEN_H_
#define _DETAILSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>

#include "../utils/Util.h"
#include "../utils/Card.h"
#include "../utils/Answer.h"
#include "../utils/Friend.h"
#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../UI/KineticListBox.h"
#include "../UI/Native/NativeEditBox.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class DetailScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener, ContactListener {
public:
	DetailScreen(MainScreen *previous, Feed *feed, int screenType, Card *card=NULL, String category="", String categoryname="");
	~DetailScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void clearListBox();

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	void contactReceived(Contact& contact);
	enum screenType {PROFILE, BALANCE, CARD, RANKING, FRIEND, NOTIFICATIONS, CONTACTS, FRIENDS};
private:
	NativeEditBox *editBox, *editBoxUsername, *editBoxEmail, *editBoxHandle, *editBoxID;
	Label *balanceLabel,*premiumLabel;
	Widget* currentSelectedKey;
	bool list, left, right;

	Vector<Contact *> contacts;

	HttpConnection mHttp;

	String encrypt,error_msg,parentTag,desc,answer,answerid,creditvalue,id,date,value,cred,prem,usr,val,friendid;
	Answer *ans;
	Friend *frien;
	Vector<Answer*> answers;
	Vector<Friend*> friends;
	int i,j,moved,screenType,answered,count,credits, currentKeyPosition;

	Card *card;

	bool isBusy;

	void saveProfileData();
	void saveLocalData();
	void refreshData();

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

#endif	//_DETAILSCREEN_H_
