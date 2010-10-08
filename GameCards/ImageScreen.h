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
	ImageScreen(Screen *previous, MAHandle image, MAHandle back, bool flip, Card *card, bool full, ImageCache *mImageCache);
	~ImageScreen();
	void keyPressEvent(int keyCode);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

private:
	Screen *previous;
	MAHandle img, bimg;
	Card *card;
	Image *imge;
	Layout *mainLayout;
	ListBox *listBox;
	bool flip, full;
	bool left, right, list;
	ImageCache *mImageCache;
};

#endif	//_IMAGESCREEN_H_
