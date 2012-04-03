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
#define RES_CREATECARD 39
#define RES_BLANK 40
#define RES_DROPDOWNITEM_SEL 41
#define RES_DROPDOWNITEM_UNSEL 42
#define RES_DROPDOWNBOX_SEL 43
#define RES_DROPDOWNBOX_UNSEL 44
#define RES_BOX_SELECTED 45
#define RES_BOX_UNSELECTED 46
#define RES_POPUP_HEADER 47

#define URLSIZE 28
#define JPG "jpg=1"

//we also need to define the x and y coordinates at which to split the images up
#define EDITBOX_X_LEFT 16
#define EDITBOX_X_RIGHT 32
#define EDITBOX_Y_TOP 16
#define EDITBOX_Y_BOTTOM 32

#define BUTTON_X_LEFT 23
#define BUTTON_X_RIGHT 24
#define BUTTON_Y_TOP 23
#define BUTTON_Y_BOTTOM 24

#define BACKGROUND_X_LEFT 1
#define BACKGROUND_X_RIGHT 399
#define BACKGROUND_Y_TOP 1
#define BACKGROUND_Y_BOTTOM 399

#define LIST_X_LEFT 16
#define LIST_X_RIGHT 176
#define LIST_Y_TOP 16
#define LIST_Y_BOTTOM 32

#define LISTNOARROWS_X_LEFT 10
#define LISTNOARROWS_X_RIGHT 182
#define LISTNOARROWS_Y_TOP 16
#define LISTNOARROWS_Y_BOTTOM 32

#define ALBUM_X_LEFT 16
#define ALBUM_X_RIGHT 180
#define ALBUM_Y_TOP 4
#define ALBUM_Y_BOTTOM 68

#define TEXT_X_LEFT 16
#define TEXT_X_RIGHT 32
#define TEXT_Y_TOP 16
#define TEXT_Y_BOTTOM 32

#define DROPDOWNITEM_X_LEFT 5
#define DROPDOWNITEM_X_RIGHT 33
#define DROPDOWNITEM_Y_TOP 19
#define DROPDOWNITEM_Y_BOTTOM 20

#define DROPDOWNBOX_X_LEFT 10
#define DROPDOWNBOX_X_RIGHT 225
#define DROPDOWNBOX_Y_TOP 35
#define DROPDOWNBOX_Y_BOTTOM 37

#define DROPDOWNBACK_X_LEFT 10
#define DROPDOWNBACK_X_RIGHT 40
#define DROPDOWNBACK_Y_TOP 10
#define DROPDOWNBACK_Y_BOTTOM 40

#define HEADER_X_LEFT 222
#define HEADER_X_RIGHT 250
#define HEADER_Y_TOP 67
#define HEADER_Y_BOTTOM 84

#define POPUP_HEADER_X_LEFT 10
#define POPUP_HEADER_X_RIGHT 48
#define POPUP_HEADER_Y_TOP 24
#define POPUP_HEADER_Y_BOTTOM 25

//the default heights and widths for various widgets
#define DEFAULT_LABEL_HEIGHT 48
#define ALBUM_ITEM_HEIGHT 74
#define THUMBNAIL_HEIGHT 64
#define MIN_SOFTKEY_BAR_HEIGHT 42
#define DEFAULT_SMALL_LABEL_HEIGHT 24
#define DEFAULT_DETAIL_HEADER_HEIGHT 36
#define DEFAULT_DETAILS_ITEM_HEIGHT 80
#define PADDING 5
#define DEFAULT_DROPDOWN_HEIGHT 38

#include <MAUtil/String.h>

using namespace MAUtil;

#ifndef _MAHeaders_H_
#define _MAHeaders_H_

static String FILE_PREFIX = "dex_";

static String URL_BASIC = "http://mobidex.biz/";
static String URL_PHONE = URL_BASIC+"_phone/";
static String URL_FORGOTPASSWORD = URL_BASIC+"forgotpassword/";
static String URL_TERMS = URL_BASIC+"terms/";

#endif
