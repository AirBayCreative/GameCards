#include <conprint.h>

#include "GameCards.h"
#include "utils/Util.h"
#include "screens/OptionsScreen.h"
#include "screens/Login.h"
#include "screens/NewMenuScreen.h"

MAUIMoblet *moblet;

MAUIMoblet::MAUIMoblet() {
	Engine& engine = Engine::getSingleton();
	engine.setDefaultFont(Util::getDefaultFont());
	/*engine.setDefaultSkin(Util::getSkinBack());*/
	MAExtent screenSize = maGetScrSize();
	scrWidth = EXTENT_X(screenSize);
	scrHeight = EXTENT_Y(screenSize);
	lprintfln("w %d h %d",scrWidth,scrHeight);
	if(scrWidth > scrHeight){
		portrait = false;
	}else{
		portrait = true;
	}
	feed = Feed();
	String data = "";
	Util::getData("fd.sav", data);
	if (data.length() <= 0) {
		data = "";
	}
	feed.setAll(data.c_str());
	Util::getData("lb.sav", data);
	if (data.length() <= 0) {
		data = "";
	}
	feed.setAlbum(data.c_str());


	maScreenSetOrientation(SCREEN_ORIENTATION_PORTRAIT);

	data = "";

	if (feed.getLoaded()) {
		next = new NewMenuScreen(&feed);
		next->show();
	} else {
		next = new OptionsScreen(&feed, OptionsScreen::ST_LOGIN_OPTIONS);
		next->show();
	}
}

MAUIMoblet::~MAUIMoblet() {}

void MAUIMoblet::keyPressEvent(int keyCode) {}

void MAUIMoblet::keyReleaseEvent(int keyCode) {}

void MAUIMoblet::closeEvent() {}

extern "C" int MAMain() {
	MAUIMoblet::run(new MAUIMoblet());
	return 0;
}
