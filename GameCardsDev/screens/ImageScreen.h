#ifndef _IMAGESCREEN_H_
#define _IMAGESCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/ListBox.h>
#include <MAUI/Image.h>
#include <maprofile.h>

#include "../utils/Card.h"
#include "../utils/Feed.h"
#include "../utils/MAHeaders.h"
#include "../utils/ImageCache.h"
#include "../UI/Widgets/MobImage.h"

using namespace MAUI;

/**
 *  The screen class used for demonstrating how to
 *  use MAUI::Image widgets.
 */
class ImageScreen : public Screen {
public:
	ImageScreen(Screen *previous, MAHandle image, Feed *feed, bool flip, Card *card, bool hasConnection = true, bool canAuction = true);
	~ImageScreen();
	void keyPressEvent(int keyCode);
#if defined(MA_PROF_SUPPORT_STYLUS)
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
#endif
private:
	Screen *previous, *next;
	MAHandle img;
	Card *card;
	Feed *feed;
	MobImage *imge;
	ImageCache *imageCache;
	Layout *mainLayout;
	ListBox *listBox;
	int height;
	bool flip;
	bool left, right, list, hasConnection, canAuction;
};

#endif	//_IMAGESCREEN_H_
