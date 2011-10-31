#define RES_IMAGE 1
#define RES_FONT_BLUE 2
#define RES_FONT_BLACK 3
#define RES_FONT_WHITE 4
#define RES_SELECTED_EDITBOX 5
#define RES_UNSELECTED_EDITBOX 6
#define RES_UNSELECTED_BUTTON 7
#define RES_TEXT_BOX 8
#define RES_BACKGROUND 9
#define RES_SELECTED_LIST 10
#define RES_UNSELECTED_LIST 11
#define RES_SELECTED_ALBUM 12
#define RES_UNSELECTED_ALBUM 13
#define RESP_DATA 14
#define RESP_IMAGE 15
#define RES_TEMPTHUMB 16
#define RES_TEMP 17
#define RES_LOADINGTHUMB 18
#define RES_MISSINGTHUMB 19
#define RES_NOTE 20
#define RES_SELECTED_BUTTON 21
#define RES_LOADING1 22
#define RES_LOADING2 23
#define RES_LOADING3 24
#define RES_LOADING4 25
#define RES_LOADING5 26
#define RES_LOADING6 27
#define RES_LOADING7 28
#define RES_LOADING8 29
#define RES_LOADING9 30
#define RES_LOADING10 31
#define RES_LOADING11 32
#define RES_LOADING12 33
#define RES_LOADING13 34
#define RES_LOADING14 35
#define RES_LOADING15 36
#define RES_LOADING16 37
#define RES_LOADING17 38
#define RES_LOADING18 39

#define URL "http://dex.mytcg.net/_phone/"
#define URLSIZE 28
#define JPG "jpg=1"

//we also need to define the x and y coordinates at which to split the images up
#define EDITBOX_X_LEFT 16
#define EDITBOX_X_RIGHT 32
#define EDITBOX_Y_TOP 22
#define EDITBOX_Y_BOTTOM 26

#define BUTTON_X_LEFT 23
#define BUTTON_X_RIGHT 24
#define BUTTON_Y_TOP 23
#define BUTTON_Y_BOTTOM 24

#define BACKGROUND_X_LEFT 10
#define BACKGROUND_X_RIGHT 70
#define BACKGROUND_Y_TOP 10
#define BACKGROUND_Y_BOTTOM 70

#define LIST_X_LEFT 19
#define LIST_X_RIGHT 29
#define LIST_Y_TOP 16
#define LIST_Y_BOTTOM 32

#define LISTNOARROWS_X_LEFT 19
#define LISTNOARROWS_X_RIGHT 29
#define LISTNOARROWS_Y_TOP 16
#define LISTNOARROWS_Y_BOTTOM 32

#define ALBUM_X_LEFT 4
#define ALBUM_X_RIGHT 49
#define ALBUM_Y_TOP 4
#define ALBUM_Y_BOTTOM 68

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

#include <MAUtil/String.h>

using namespace MAUtil;

#ifndef _MAHeaders_H_
#define _MAHeaders_H_

static String FILE_PREFIX = "dex_";

#endif
