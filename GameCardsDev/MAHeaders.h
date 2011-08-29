#define RES_IMAGE 1
#define RES_FONT_BLUE 2
#define RES_FONT_BLACK 3
#define RES_SELECTED_EDITBOX 4
#define RES_UNSELECTED_EDITBOX 5
#define RES_UNSELECTED_BUTTON 6
#define RES_TEXT_BOX 7
#define RES_BACKGROUND 8
#define RES_SELECTED_LIST 9
#define RES_UNSELECTED_LIST 10
#define RES_SELECTED_ALBUM 11
#define RES_UNSELECTED_ALBUM 12
#define RESP_DATA 13
#define RESP_IMAGE 14
#define RES_TEMPTHUMB 15
#define RES_TEMP 16
#define RES_LOADINGTHUMB 17
#define RES_LOADING 18
#define RES_MISSINGTHUMB 19
#define RES_CHANGE_STAR 20
#define RES_LOADING_FLIP 21
#define RES_EMPTY_FLIP 22
#define RES_BOX_SELECTED 23
#define RES_BOX_UNSELECTED 24
#define RES_LOADING2 25
#define RES_LOADING3 26
#define RES_LOADING4 27
#define RES_LOADING5 28
#define RES_LOADING6 29
#define RES_LOADING7 30
#define RES_LOADING8 31
#define RES_LOADING9 32
#define RES_LOADING10 33
#define RES_LOADING11 34
#define RES_LOADING12 35
#define RES_LOADING13 36
#define RES_LOADING14 37
#define RES_LOADING15 38
#define RES_LOADING16 39
#define RES_LOADING17 40
#define RES_LOADING18 41
#define URL "http://dev.mytcg.net/_phone/"
#define URLSIZE 28

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

#include <MAUtil/String.h>

using namespace MAUtil;

#ifndef _MAHeaders_H_
#define _MAHeaders_H_

static String FILE_PREFIX = "dev_";

#endif
