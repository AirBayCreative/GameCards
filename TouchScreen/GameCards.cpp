#include "Header.h"
#include <conprint.h>

MAUIMoblet *moblet;

MAUIMoblet::MAUIMoblet() {
    gFontGrey = new MAUI::Font(RES_FONT_GREY);
	gFontBlack = new MAUI::Font(RES_FONT_BLACK);
    gFontWhite = new MAUI::Font(RES_FONT_WHITE);
    gFontBlue = new MAUI::Font(RES_FONT_BLUE);

	gSkinEditBox = new WidgetSkin(RES_SELECTED_EDITBOX, RES_UNSELECTED_EDITBOX, 16, 32, 16, 32, true, true);
	gSkinButton = new WidgetSkin(RES_SELECTED_BUTTON, RES_UNSELECTED_BUTTON, 16, 32, 16, 32, true, true);
	gSkinBack = new WidgetSkin(RES_BACKGROUND, RES_BACKGROUND, 16, 32, 16, 32, true, true);
	gSkinList = new WidgetSkin(RES_SELECTED_LIST, RES_UNSELECTED_LIST, 16, 32, 16, 32, true, true);
	gSkinAlbum = new WidgetSkin(RES_SELECTED_ALBUM, RES_UNSELECTED_ALBUM, 16, 32, 16, 32, true, true);
	gSkinText = new WidgetSkin(RES_TEXT_BOX, RES_TEXT_BOX, 16, 32, 16, 32, true, true);

	Engine& engine = Engine::getSingleton();
	engine.setDefaultFont(gFontWhite);
	MAExtent screenSize = maGetScrSize();
	scrWidth = EXTENT_X(screenSize);
	scrHeight = EXTENT_Y(screenSize);
//test git
	feed = Feed();
	feed.setAll(getData(FEED));
	feed.setAlbum(getData(ALBUM));
	if (feed.getLoaded()) {
		login = new MenuScreen(&feed);
		login->show();
	} else {
		login = new Login(&feed);
		login->show();
	}
}

MAUIMoblet::~MAUIMoblet() {
}

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
