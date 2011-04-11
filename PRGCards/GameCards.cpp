#include <conprint.h>

#include "GameCards.h"
#include "utils/Util.h"
#include "utils/MAHeaders.h"
#include "screens/OptionsScreen.h"
#include "screens/AlbumLoadScreen.h"

MAUIMoblet *moblet;

MAUIMoblet::MAUIMoblet() {
	gFontBlack = new MAUI::Font(RES_FONT_BLACK);
    gFontBlue = new MAUI::Font(RES_FONT_BLUE);
    gFontWhite = new MAUI::Font(RES_FONT_WHITE);
    gFontBlackBold = new MAUI::Font(RES_FONT_BLACK_BOLD);
    gFontBlueBold = new MAUI::Font(RES_FONT_BLUE_BOLD);
    gFontWhiteBold = new MAUI::Font(RES_FONT_WHITE_BOLD);

    gSkinHeaderImage = new WidgetSkin(RES_IMAGE, RES_IMAGE, 3, 7, 90, 91, true, true);
	gSkinEditBox = new WidgetSkin(RES_SELECTED_EDITBOX, RES_UNSELECTED_EDITBOX, 16, 32, 22, 26, true, true);
	gSkinButton = new WidgetSkin(RES_SELECTED_BUTTON, RES_UNSELECTED_BUTTON, 16, 32, 23, 25, true, true);
	gSkinBack = new WidgetSkin(RES_BACKGROUND, RES_BACKGROUND, 1, 38, 1, 38, true, true);
	gSkinList = new WidgetSkin(RES_SELECTED_LIST, RES_UNSELECTED_LIST, 14, 21, 2, 46, true, true);
	gSkinAlbum = new WidgetSkin(RES_SELECTED_ALBUM, RES_UNSELECTED_ALBUM, 16, 32, 16, 32, true, true);
	gSkinText = new WidgetSkin(RES_TEXT_BOX, RES_TEXT_BOX, 16, 32, 16, 32, true, true);
	gSkinKeyboard = new WidgetSkin(RES_KEYBOARD_SEL, RES_KEYBOARD_UNSEL, 12, 13, 12, 13, true);
	Engine& engine = Engine::getSingleton();
	engine.setDefaultFont(gFontBlack);
	engine.setDefaultSkin(gSkinBack);
	MAExtent screenSize = maGetScrSize();
	scrWidth = EXTENT_X(screenSize);
	scrHeight = EXTENT_Y(screenSize);
	feed = Feed();
	feed.setAll(getData(FEED));
	feed.setAlbum(getData(ALBUM));
	if (feed.getLoaded()) {
		next = new AlbumLoadScreen(&feed);
		next->show();
	} else {
		next = new OptionsScreen(&feed, OptionsScreen::ST_LOGIN_OPTIONS);
		next->show();
	}
}

MAUIMoblet::~MAUIMoblet() {}

void MAUIMoblet::keyPressEvent(int keyCode) {
}

void MAUIMoblet::keyReleaseEvent(int keyCode) {
}

void MAUIMoblet::closeEvent() {
}

extern "C" int MAMain() {
	MAUIMoblet::run(new MAUIMoblet());
	return 0;
}
