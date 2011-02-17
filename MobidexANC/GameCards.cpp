#include "Util.h"
#include "AlbumViewScreen.h"
#include "MAHeaders.h"
#include "GameCards.h"

MAUIMoblet *moblet;

MAUIMoblet::MAUIMoblet() {
	gFontWhite = new MAUI::Font(RES_FONT_WHITE);
	gFontBlack = new MAUI::Font(RES_FONT_BLACK);
    gFontBlue = new MAUI::Font(RES_FONT_BLUE);
    gFontBlackBold = new MAUI::Font(RES_FONT_BLACK_BOLD);

	gSkinEditBox = new WidgetSkin(RES_SELECTED_EDITBOX, RES_UNSELECTED_EDITBOX, 16, 32, 16, 32, true, true);
	gSkinButton = new WidgetSkin(RES_UNSELECTED_BUTTON, RES_UNSELECTED_BUTTON, 16, 32, 16, 32, true, true);
	gSkinBack = new WidgetSkin(RES_BACKGROUND, RES_BACKGROUND, 16, 32, 16, 32, true, true);
	gSkinList = new WidgetSkin(RES_SELECTED_LIST, RES_UNSELECTED_LIST, 23, 25, 16, 32, true, true);
	gSkinAlbum = new WidgetSkin(RES_SELECTED_ALBUM, RES_UNSELECTED_ALBUM, 16, 20, 16, 32, true, true);
	Engine& engine = Engine::getSingleton();
	engine.setDefaultFont(gFontBlack);
	engine.setDefaultSkin(gSkinBack);
	MAExtent screenSize = maGetScrSize();
	scrWidth = EXTENT_X(screenSize);
	scrHeight = EXTENT_Y(screenSize);
	feed = Feed();
	feed.setAll(getData(FEED));
	feed.setAlbum(getData(ALBUM));
	next = new AlbumViewScreen(&feed);
	next->show();
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
