#ifndef _TUTORIALSCREEN_H_
#define _TUTORIALSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Image.h>
#include "../utils/Card.h"
#include "../utils/Feed.h"
#include "../MAHeaders.h"
#include "../utils/ImageCache.h"
#include "../utils/XmlConnection.h"
#include "../UI/Widgets/TransitionImage.h"
#include "MainScreen.h"

using namespace MAUI;

struct tutItem {
	MAHandle image;
	String description;
	int key;
};

class TutorialScreen : public MainScreen {
public:
	TutorialScreen(MainScreen *previous, tutItem *items, int itemCount);
	~TutorialScreen();
	void keyPressEvent(int keyCode);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);
private:
	void clearListBox();
	MAPoint2d pointPressed, pointReleased;
	TransitionImage *imge;
	Image *leftArrow, *rightArrow;
	bool left, right, panLeft, panRight;
	int itemCount, index;

	tutItem *tutItems;

	void scrollImage(int move = 1); //1 will move 1 image to the right, -1 will move 1 to the left
};

#endif	//_TUTORIALSCREEN_H_
