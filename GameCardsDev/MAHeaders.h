#define RES_IMAGE 1
#define RES_SELECTED_EDITBOX 2
#define RES_UNSELECTED_EDITBOX 3
#define RES_UNSELECTED_BUTTON 4
#define RES_TEXT_BOX 5
#define RES_BACKGROUND 6
#define RES_SELECTED_LIST 7
#define RES_UNSELECTED_LIST 8
#define RES_SELECTED_ALBUM 9
#define RES_UNSELECTED_ALBUM 10
#define RESP_DATA 11
#define RESP_IMAGE 12
#define RES_TEMPTHUMB 13
#define RES_TEMP 14
#define RES_LOADINGTHUMB 15
#define RES_MISSINGTHUMB 16
#define RES_CHANGE_STAR 17
#define RES_EMPTY_FLIP 18
#define RES_BOX_SELECTED 19
#define RES_BOX_UNSELECTED 20
#define RES_LOADING1 21
#define RES_LOADING2 22
#define RES_LOADING3 23
#define RES_LOADING4 24
#define RES_LOADING5 25
#define RES_LOADING6 26
#define RES_LOADING7 27
#define RES_LOADING8 28
#define RES_LOADING9 29
#define RES_LOADING10 30
#define RES_LOADING11 31
#define RES_LOADING12 32
#define RES_LOADING13 33
#define RES_LOADING14 34
#define RES_LOADING15 35
#define RES_LOADING16 36
#define RES_LOADING17 37
#define RES_LOADING18 38
#define RES_LOADING_FLIP1 39
#define RES_LOADING_FLIP2 40
#define RES_LOADING_FLIP3 41
#define RES_LOADING_FLIP4 42
#define RES_LOADING_FLIP5 43
#define RES_LOADING_FLIP6 44
#define RES_LOADING_FLIP7 45
#define RES_LOADING_FLIP8 46
#define RES_LOADING_FLIP9 47
#define RES_LOADING_FLIP10 48
#define RES_LOADING_FLIP11 49
#define RES_LOADING_FLIP12 50
#define RES_LOADING_FLIP13 51
#define RES_LOADING_FLIP14 52
#define RES_LOADING_FLIP15 53
#define RES_LOADING_FLIP16 54
#define RES_LOADING_FLIP17 55
#define RES_LOADING_FLIP18 56

/* Custom Variables per App */

#define RES_FONT_BLUE 57
#define RES_FONT_BLACK 58

#define URL "http://dev.mytcg.net/_phone/"
#define URLSIZE 35

//we also need to define the x and y coordinates at which to split the images up
#define EDITBOX_X_LEFT 16
#define EDITBOX_X_RIGHT 32
#define EDITBOX_Y_TOP 22
#define EDITBOX_Y_BOTTOM 26

#define BUTTON_X_LEFT 23
#define BUTTON_X_RIGHT 24
#define BUTTON_Y_TOP 23
#define BUTTON_Y_BOTTOM 24

#define BACKGROUND_X_LEFT 39
#define BACKGROUND_X_RIGHT 429
#define BACKGROUND_Y_TOP 39
#define BACKGROUND_Y_BOTTOM 429

#define LIST_X_LEFT 19
#define LIST_X_RIGHT 77
#define LIST_Y_TOP 16
#define LIST_Y_BOTTOM 32

#define LISTNOARROWS_X_LEFT 16
#define LISTNOARROWS_X_RIGHT 77
#define LISTNOARROWS_Y_TOP 16
#define LISTNOARROWS_Y_BOTTOM 32

#define ALBUM_X_LEFT 4
#define ALBUM_X_RIGHT 77
#define ALBUM_Y_TOP 12
#define ALBUM_Y_BOTTOM 16

#define TEXT_X_LEFT 16
#define TEXT_X_RIGHT 32
#define TEXT_Y_TOP 16
#define TEXT_Y_BOTTOM 32

//the default heights and widths for various widgets
#define DEFAULT_LABEL_HEIGHT 48
#define ALBUM_ITEM_HEIGHT 74
#define THUMBNAIL_HEIGHT 64
#define MIN_SOFTKEY_BAR_HEIGHT 42
#define DEFAULT_SMALL_LABEL_HEIGHT 24
#define DEFAULT_DETAIL_HEADER_HEIGHT 36
#define DEFAULT_DETAILS_ITEM_HEIGHT 80
#define PADDING 5

//renumber the menu options if one is removed
//numbers must always run sequential for index
#define OP_ALBUMS 0
#define OP_PLAY 1
#define OP_DECKS 2
#define OP_SHOP 3
#define OP_AUCTIONS 4
#define OP_NOTIFICATIONS 5
#define OP_CREDITS 6
#define OP_PROFILE 7
#define OP_RANKINGS 8
#define OP_FRIENDRANKS 9
#define OP_FRIENDS 10
#define OP_INVITEFRIENDS 11
#define OP_REDEEM 12
#define OP_LOGOUT 13

#include <MAUtil/String.h>

using namespace MAUtil;

#ifndef _MAHeaders_H_
#define _MAHeaders_H_

static String FILE_PREFIX = "dev_";

#endif
