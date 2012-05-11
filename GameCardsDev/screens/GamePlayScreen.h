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
#include "../UI/Widgets/MobImage.h"
#include "../UI/Native/NativeEditBox.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class GamePlayScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener, public MAUtil::TimerListener {
public:
	GamePlayScreen(MainScreen *previous, Feed *feed, bool newGame, String identifier, String newGameType=0, bool againstFriend=false, String deckId="", int lobby=0, String gameid="-1"); //the newGameType should correspond to one of the ng vars in the Util.h
	~GamePlayScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void show();
	void hide();

	void runTimerEvent();

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	typedef Vector<CardStat*> CardStatVector;
	enum phases {P_CARD_DETAILS = 0, P_RESULTS, P_LOADING, P_OPPMOVE, P_LFM, P_CONFIRM, P_DECLINED, P_CLOSED, P_FRIEND};
private:
	NativeEditBox *editBoxFriend;
	ImageCache *imageCacheUser, *imageCacheOpp;
	MobImage *userImage, *oppImage;
	Layout **feedLayouts;
	Widget *widImage, *widNotice, *currentSelectedKey;

	MAUtil::HttpConnection* tempHttp;
	HttpConnection mHttp;

	String parentTag, cardText, gameId, categoryId, lastMove, deckId;
	String id, description, gamePlayerCardId, thumburl, fronturl, backurl, error_msg, frontflipurl, backflipurl;
	String statType, statDescription, cardStatId, cardName, statDesc, statIVal, message, userCards, oppCards, userName, oppName, categoryStatId;
	int statTop, statLeft, statWidth, statHeight, statFrontOrBack, statRed, statGreen, statBlue, ticks, lfmTicks;
	String explanation, outcome, creator, newGameType;
	int i, moved, phase, cardIndex, yOffset, storeHeight, flipOrSelect, currentSelectedStat, currentKeyPosition;
	bool list, left, right, hasConnection, newGame, busy, flip, active, selected, checking, selectingStat;
	MAPoint2d pointPressed, pointReleased;
	Card *card, *oppCard, *gcCard;

	Stat *newStat;
	Vector<Stat*> cardStats;
	Vector<String> index, stats;

	void drawResultsScreen();
	void drawCardSelectStatScreen();
	void drawLFMScreen();
	void drawConfirmScreen();
	void drawClosedScreen();
	void drawDeclinedScreen();
	void drawFriendNameScreen();

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
	void connRecvFinished(Connection*, int);
	void xcConnError(int code);
	void mtxEncoding(const char*);
	void mtxTagStart(const char*, int);
	void mtxTagAttr(const char*, const char*);
	void mtxTagData(const char*, int);
	void mtxTagEnd(const char*, int);
	void mtxParseError(int);
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();

	void clearCardStats();
	void clearListBox();

	void selectStat();
	void animateSelectStat();
	void drawRectangle(int x, int y, int width, int height);

	void resetHeights();
};

#endif	//_GAMEPLAYSCREEN_H_*/
