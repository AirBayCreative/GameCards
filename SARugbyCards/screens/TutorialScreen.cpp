#include <conprint.h>

#include "TutorialScreen.h"
#include "../utils/Util.h"

TutorialScreen::TutorialScreen(MainScreen *previous, tutItem *items, int itemCount) :tutItems(items), itemCount(itemCount) {
	lprintfln("TutorialScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	index = 0;

	mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	mainLayout->setSkin(Util::getSkinBack());
	mainLayout->setDrawBackground(true);

	Widget *softKeys = Util::createSoftKeyBar(Util::getSoftKeyBarHeight(), "", "", "");

	Layout *subLayout = new Layout(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, 3, 1);
	subLayout->setPaddingLeft(PADDING);
	subLayout->setPaddingRight(PADDING);
	subLayout->setDrawBackground(false);

	leftArrow = new Image(0, 0, BIG_ARROW_WIDTH, subLayout->getHeight(), subLayout, false, false, RES_UNSELECT_ICON);
	leftArrow->setDrawBackground(false);

	imge = new TransitionImage(0, 0, scrWidth - (BIG_ARROW_WIDTH * 2) - (PADDING*2), subLayout->getHeight(), subLayout, false, false, NULL);
	imge->setDrawBackground(false);
	imge->setResource(tutItems[0].image);

	rightArrow = new Image(0, 0, BIG_ARROW_WIDTH, subLayout->getHeight(), subLayout, false, false, RES_BIG_RIGHT_ARROW);
	rightArrow->setDrawBackground(false);

	mainLayout->add(softKeys);

	this->setMain(mainLayout);
}

TutorialScreen::~TutorialScreen() {
	lprintfln("~TutorialScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	delete mainLayout;
	mainLayout = NULL;

	previous = NULL;
	imge = NULL;
	leftArrow = NULL;
	rightArrow = NULL;
	itemCount = 0, index = 0;

	tutItems = NULL;
}

void TutorialScreen::locateItem(MAPoint2d point) {
	panLeft = false;
	panRight = false;
	left = false;
	right = false;

	Point p;
	p.set(point.x, point.y);

	if (leftArrow->contains(p)) {
		panLeft = true;
		return;
	}
	else if (rightArrow->contains(p)) {
		panRight = true;
		return;
	}

	for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
			if (i == 0) {
				left = true;
			} else if (i == 2) {
				right = true;
			}
			return;
		}
	}
}

void TutorialScreen::pointerPressEvent(MAPoint2d point) {
	pointPressed = point;
    locateItem(point);
}

void TutorialScreen::pointerMoveEvent(MAPoint2d point) {
    locateItem(point);
}

void TutorialScreen::pointerReleaseEvent(MAPoint2d point) {
	pointReleased = point;
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	}
	else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	}
	else if (panLeft) {
		keyPressEvent(MAK_LEFT);
	}
	else if (panRight) {
		keyPressEvent(MAK_RIGHT);
	}
}

void TutorialScreen::keyPressEvent(int keyCode) {
	switch (keyCode) {
		case MAK_LEFT:
			scrollImage(-1);
			break;
		case MAK_RIGHT:
			scrollImage(1);
			break;
		case MAK_SOFTLEFT:
			if (index == itemCount-1) {
				origMenu->show();
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			//previous->show();
			break;
	}
}

void TutorialScreen::scrollImage(int move) {
	if ((move != 0) && ((move < 0 && index > 0) || (move > 0 && index < (itemCount-1)))) {
		if (move > 0) {
			imge->setTransition(TT_PUSH, -1, 0);
		}
		else {
			imge->setTransition(TT_PUSH, 1, 0);
		}
		index = ((index+move)<0)?0:((index+move)>=itemCount)?itemCount-1:(index+move);
		imge->setResource(tutItems[index].image);

		if (index == 0) {
			leftArrow->setResource(RES_UNSELECT_ICON);
		}
		else {
			leftArrow->setResource(RES_BIG_LEFT_ARROW);
		}

		if (index == itemCount-1) {
			rightArrow->setResource(RES_UNSELECT_ICON);
			Util::updateSoftKeyLayout("Continue", "", "", mainLayout);
		}
		else {
			rightArrow->setResource(RES_BIG_RIGHT_ARROW);
			Util::updateSoftKeyLayout("", "", "", mainLayout);
		}
	}
}
