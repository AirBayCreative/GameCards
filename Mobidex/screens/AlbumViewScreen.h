#ifndef _ALBUMVIEWSCREEN_H_
#define _ALBUMVIEWSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../utils/XmlConnection.h"
#include "AlbumLoadScreen.h"
#include "../utils/Feed.h"
#include "../utils/Card.h"
#include "../utils/Stat.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"
#include "../UI/Widgets/MobImage.h"
#include "../utils/Util.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class AlbumViewScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	AlbumViewScreen(MainScreen *previous, Feed *feed, String category, int albumType=Util::AT_NORMAL, Map<String, Card*> map=NULL);
	~AlbumViewScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	int getCount();
	void Add(const char* id, const char* name);
	String *Retrieve(int id);
	void drawList();
	void setSearchString(String ss);
	void deleteDeck();

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	void loadFile();
	void loadImages(const char *text);

	typedef Map<String, Card*> StringCardMap;

	void refresh(bool pop=false);
private:
	ImageCache *mImageCache;
	MobImage *tempImage;

	String parentTag, cardText, statDesc, statIVal, statDisplay, note, category, searchString, orientation;
	String id,description,quantity, thumburl, fronturl, backurl, filename,error_msg, rate, value, updated;
	int statTop, statLeft, statWidth, statHeight, statFrontOrBack, statRed, statGreen, statBlue;
	int size, i, moved, listSizes, albumType;
	bool list, left, right, emp, hasConnection, busy, deleting, loading, pop;

	StringCardMap tmp, cards;
	StringCardMap::Iterator cardExists;
	Vector<String> index;
	Vector<Card*> deleted;
	Vector<Stat*> stats;
	Stat *stat;

	Card *newCard;
	HttpConnection mHttp;

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
	void mtxParseError(int);
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();

	//void clearFeedLayouts();
	void clearCardMap();
	void deleteCards();
	void clearListBox();
};

#endif	//_ALBUMVIEWSCREEN_H_*/
