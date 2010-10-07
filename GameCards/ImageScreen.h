#ifndef _IMAGESCREEN_H_
#define _IMAGESCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/ListBox.h>
#include <MAUI/Image.h>

#include "ImageCache.h"
#include "Card.h"
#include "Feed.h"

using namespace MAUI;

/**
 *  The screen class used for demonstrating how to
 *  use MAUI::Image widgets.
 */
class ImageScreen : public Screen {
public:
	ImageScreen(Screen *previous, MAHandle image, MAHandle back, bool flip, Card *card, bool full, ImageCache *mImageCache, Feed *feed);
	~ImageScreen();
	void keyPressEvent(int keyCode);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:
	Screen *previous;
	Screen *next;
	MAHandle img, bimg, image;
	Card *card;
	bool flip, full;
	Layout *mainLayout;
	ListBox *listBox;
	Image *imge;
	bool left, right, list;
	ImageCache *mImageCache;
	Feed *feed;
};

#endif	//_IMAGESCREEN_H_
