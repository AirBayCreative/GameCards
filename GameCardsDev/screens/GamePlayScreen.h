#ifndef _GAMEPLAYSCREEN_H_
#define _GAMEPLAYSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>
#include <maprofile.h>

#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../utils/Card.h"
#include "../utils/CardStat.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"
#include "../UI/Widgets/MobImage.h"

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
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
	typedef Vector<CardStat*> CardStatVector;
	enum phases {P_SELECT_STAT = 0, P_RESULTS, P_LOADING, P_FINISHED, P_CARD_DETAILS, P_WAITING};
private:
	Screen *next, *previous;
	ImageCache *imageCache;
	MobImage *tempImage;
	Label *notice, *label;
	KineticListBox *listBox;
	Layout *mainLayout;
	Layout **feedLayouts;
	Vector<Widget*> tempWidgets;
	Widget *widImage, *widNotice;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag, cardText, gameId, categoryId;
	String id, description, gamePlayerCardId, thumburl, fronturl, backurl, error_msg;
	String statType, statDescription, cardStatId, cardName, statDesc, statIVal, message;
	int statTop, statLeft, statWidth, statHeight, statFrontOrBack, statRed, statGreen, statBlue;
	String userScore, opponentScore, explanation, outcome;
	int i, moved, phase, cardIndex, yOffset, storeHeight, flipOrSelect, currentSelectedStat;;
	bool list, left, right, hasConnection, newGame, busy, flip, loadingGame;
	MAPoint2d pointPressed, pointReleased;
	Card *card;

	Stat *newStat;
	Feed *feed;
	Vector<Stat*> cardStats;
	Vector<String> index, stats;

	void drawStatListScreen();
	void drawResultsScreen();
	void drawCardDetailsScreen();
	void drawCardSelectStatScreen();
	void drawWaitingScreen();

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

	void clearCardStats();
	void clearListBox();

	void selectStat(int selected);

	void resetHeights();
};

#endif	//_GAMEPLAYSCREEN_H_*/
