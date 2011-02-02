#ifndef _GAMEPLAYSCREEN_H_
#define _GAMEPLAYSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../utils/Card.h"
#include "../utils/CardStat.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class GamePlayScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	GamePlayScreen(Screen *previous, Feed *feed, bool newGame, String identifier);
	~GamePlayScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	typedef Map<String, Card*> StringCardMap;
	typedef Vector<CardStat*> CardStatVector;
	enum phases {P_SELECT_CARD = 0, P_SELECT_STAT, P_RESULTS, P_LOADING, P_FINISHED};
private:
	Screen *next, *previous;
	ImageCache *mImageCache;
	Image *tempImage;
	Label *notice, *label;
	KineticListBox *listBox;
	Layout *mainLayout;
	Layout **feedLayouts;
	Vector<Widget*> tempWidgets;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag, cardText, gameId, categoryId;
	String id, description, gamePlayerCardId, thumburl, fronturl, backurl, error_msg;
	String statType, statDescription, cardStatId, cardName;
	String userScore, opponentScore, explanation, outcome;
	int i, moved, phase;
	bool list, left, right, hasConnection, newGame, busy;

	Feed *feed;
	StringCardMap cards;
	CardStatVector cardStats;
	Vector<String> index, stats;

	void drawCardListScreen();
	void drawStatListScreen();
	void drawResultsScreen();

	void drawCardList();
	void drawStatList();

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
	void connRecvFinished(Connection*, int);
	void xcConnError(int code);
	void mtxEncoding(const char*);
	void mtxTagStart(const char*, int);
	void mtxTagAttr(const char*, const char*);
	void mtxTagData(const char*, int);
	void mtxTagEnd(const char*, int);
	void mtxParseError();
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();

	void clearCardMap();
	void clearCardStats();
	void clearListBox();
};

#endif	//_GAMEPLAYSCREEN_H_*/
