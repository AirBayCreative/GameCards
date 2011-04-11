#ifndef _ALBUMVIEWSCREEN_H_
#define _ALBUMVIEWSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>
#include <maprofile.h>

#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../utils/Card.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"
#include "../UI/Widgets/MobImage.h"

using namespace MAUI;
using namespace MAUtil;

class AlbumViewScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	AlbumViewScreen(Screen *previous, Feed *feed, String category);
	~AlbumViewScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	int getCount();
	void Add(const char* id, const char* name);
	String *Retrieve(int id);
	void drawList();

	#if defined(MA_PROF_SUPPORT_STYLUS)
		void pointerPressEvent(MAPoint2d point);
		void pointerMoveEvent(MAPoint2d point);
		void pointerReleaseEvent(MAPoint2d point);
		void locateItem(MAPoint2d point);
	#endif

	void loadFile();
	void loadImages(const char *text);

	//typedef Map<String, Card*> StringCardMap;

	void refresh();
private:
	Screen *next, *previous;
	ImageCache *mImageCache;
	MobImage *tempImage;
	Label *notice, *label;
	KineticListBox *listBox;
	Layout *mainLayout;
	Layout **feedLayouts;
	Vector<Widget*> tempWidgets;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag, category;
	String id,description,quantity, thumburl, fronturl, backurl, filename,error_msg, rate, value, updated, note;
	int size, i, moved, listSizes, albumType;
	bool list, left, right, emp, hasConnection, busy;

	Feed *feed;
	Vector<Card*> tmp, cards;
	Map<String, Card*> cardMap;
	Map<String, Card*>::Iterator cardExists;

	String getAll();
	void loadDemo();
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

	//void clearFeedLayouts();
	void clearCardList();
	void clearListBox();
};

#endif	//_ALBUMVIEWSCREEN_H_*/
