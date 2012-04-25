#ifndef _ALBUMVIEWSCREEN_H_
#define _ALBUMVIEWSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>
#include <maprofile.h>
#include <MAUI/ListBox.h>

#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../utils/Card.h"
#include "../utils/Stat.h"
#include "../utils/ImageCache.h"
#include "../UI/Widgets/MobImage.h"

using namespace MAUI;
using namespace MAUtil;

class AlbumViewScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	AlbumViewScreen(Screen *previous, Feed *feed, String category, int albumType=AT_NORMAL, bool bAction=false, Card *card = NULL, String deckId = "");
	~AlbumViewScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();
	int getCount();
	void Add(const char* id, const char* name);
	String *Retrieve(int id);
	void drawList();

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	void loadFile();
	void loadImages(const char *text);

	typedef Map<String, Card*> StringCardMap;

	void refresh();

	void setDeckId(String deckId);

	int albumType;

	enum albumTypes {AT_NORMAL, AT_NEW_CARDS, AT_COMPARE, AT_BUY, AT_AUCTION, AT_PRODUCT};
private:
	Screen *next, *previous;
	Label *notice, *label;
	ListBox *listBox;
	ListBox *midListBox;
	Layout *mainLayout;

	HttpConnection mHttp;
	XmlConnection xmlConn;
	ImageCache *mImageCache;

	String parentTag, statDesc, statIVal, statDisplay, note, category, deckId;
	String id,description,quantity, thumburl, fronturl, frontflipurl, backurl, backflipurl, filename,error_msg, rate, rarity, ranking, value, updated;
	int statTop, statLeft, statWidth, statHeight, statFrontOrBack, statRed, statGreen, statBlue;
	int size, i, moved, listSizes, xStart;
	bool list, left, right, listLeft, listRight, emp, hasConnection, busy, isAuction;

	Feed *feed;
	Card *card, *newCard;
	StringCardMap tmp, cards;
	StringCardMap::Iterator cardExists;
	Vector<String> index;
	Vector<Card *> deleted;
	Vector<Stat*> stats;
	Stat *stat;
	Image *leftArrow, *rightArrow;
	MobImage *tempImage;

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

	void addCard(String cardId);

	int selectedList;
	Vector<ListBox *> cardLists;

	void switchList(int nextOrPrev);
};

#endif	//_ALBUMVIEWSCREEN_H_*/