#ifndef _DETAILSCREEN_H_
#define _DETAILSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/EditBox.h>
#include <maprofile.h>

#include "../utils/Util.h"
#include "../utils/Card.h"
#include "../utils/Answer.h"
#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../UI/KineticListBox.h"
#include "../UI/Native/NativeEditBox.h"

using namespace MAUI;
using namespace MAUtil;

class DetailScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener, ContactListener {
public:
	DetailScreen(Screen *previous, Feed *feed, int screenType, Card *card=NULL, String category="", String categoryname="");
	~DetailScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	void clearListBox();
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif

	void contactReceived(Contact& contact);
	enum screenType {PROFILE, BALANCE, CARD, RANKING, FRIEND, NOTIFICATIONS, CONTACTS, FRIENDS};
private:
	Screen *previous, *next;
	NativeEditBox *editBox, *editBoxUsername, *editBoxEmail, *editBoxHandle, *editBoxID;
	Layout *mainLayout;
	Label *label, *balanceLabel;
	KineticListBox *listBox;
	bool list, left, right;

	Vector<Contact *> contacts;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String encrypt, error_msg, parentTag, desc, answer, answerid, creditvalue, id, date, value, cred, usr, val;
	Answer *ans;
	Vector<Answer*> answers;
	int i,j, moved, screenType, answered, count, credits;

	Card *card;
	Feed *feed;

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
	void mtxParseError();
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();
};

#endif	//_DETAILSCREEN_H_
