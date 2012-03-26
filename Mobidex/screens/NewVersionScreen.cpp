#include <conprint.h>

#include "../utils/Util.h"
#include "NewVersionScreen.h"

NewVersionScreen::NewVersionScreen(MainScreen *previous, String url, Feed *feed) {
	this->previous = previous;
	this->downloadUrl = url;
	this->feed = feed;
	lprintfln("NewVersionScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	layout = Util::createMainLayout("Download", "Back");

	listBox = (KineticListBox*)layout->getChildren()[0]->getChildren()[2];

	label = new Label(0,0, scrWidth-PADDING*2, 100, NULL, "There is a new version of the Game Cards app available, please download it before continuing.",
			0, Util::getDefaultFont());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setSkin(Util::getSkinBack());
	label->setMultiLine(true);
	listBox->add(label);

	this->setMain(layout);
}

NewVersionScreen::~NewVersionScreen() {
	delete layout;
}
void NewVersionScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void NewVersionScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void NewVersionScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void NewVersionScreen::locateItem(MAPoint2d point)
{
	if (feed->setTouch("true")) {
		Util::saveData("fd.sav", feed->getAll().c_str());
	}
	list = false;
	left = false;
	right = false;

    Point p;
    p.set(point.x, point.y);
    for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
    {
        if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
        {
        	list = true;
        }
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
void NewVersionScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			maPlatformRequest(downloadUrl.c_str());
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			previous->show();
			break;
		case MAK_DOWN:
			break;
		case MAK_UP:
			break;
	}
}
