#include "CreateCardScreen.h"
#include "../utils/Util.h"

using namespace MAUtil;

CreateCardScreen::CreateCardScreen(MainScreen *previous) {
	this->previous = previous;
	lprintfln("CreateCardScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	layout = Util::createMainLayout("", "Back", "");

	listBox = (KineticListBox*) layout->getChildren()[0]->getChildren()[2];

	imge = new Image(0, 0, scrWidth-PADDING*2, listBox->getHeight(), listBox, false, false, Util::loadImageFromResource(RES_CREATECARD));

	this->setMain(layout);
}

CreateCardScreen::~CreateCardScreen() {
	delete layout;

	layout = NULL;
	listBox = NULL;
	imge = NULL;
}

void CreateCardScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void CreateCardScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void CreateCardScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void CreateCardScreen::locateItem(MAPoint2d point)
{
	list = false;
	left = false;
	right = false;

    Point p;
    p.set(point.x, point.y);
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

void CreateCardScreen::selectionChanged(Widget *widget, bool selected) {

}

void CreateCardScreen::show() {
	Screen::show();
}

void CreateCardScreen::hide() {
	Screen::hide();
}

void CreateCardScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			// Go back to menu screen
			previous->show();
			break;
	}
}
