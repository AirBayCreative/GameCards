#include <conprint.h>

#include "GameCards.h"
#include "utils/Util.h"
#include "utils/MAHeaders.h"
#include "screens/OptionsScreen.h"
#include "screens/MenuScreen.h"

MAUIMoblet *moblet;

MAUIMoblet::MAUIMoblet() {
	Engine& engine = Engine::getSingleton();
	engine.setDefaultFont(Util::getFontBlack());
	engine.setDefaultSkin(Util::getSkinBack());
	MAExtent screenSize = maGetScrSize();
	scrWidth = EXTENT_X(screenSize);
	scrHeight = EXTENT_Y(screenSize);
	feed = Feed();
	feed.setAll(Util::getData("fd.sav"));
	feed.setAlbum(Util::getData("lb.sav"));

	if (feed.getLoaded()) {
		next = new MenuScreen(&feed);
		next->show();
	} else {
		next = new OptionsScreen(&feed, OptionsScreen::ST_LOGIN_OPTIONS);
		next->show();
	}
}

MAUIMoblet::~MAUIMoblet() {}

/*void MAUIMoblet::customEvent(const MAEvent& event)
{
	if(event.type == EVENT_TYPE_SCREEN_CHANGED)
	{
		next->getMain()->requestRepaint();
	}
}*/

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
