#include <conprint.h>

#include "../utils/Util.h"
#include "NewVersionScreen.h"

NewVersionScreen::NewVersionScreen(Screen *previous, String url, Feed *feed) : previous(previous), downloadUrl(url), feed(feed) {
	layout = Util::createMainLayout("Later", "Download");

	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];

	String msg = "There is a new version of the app, want to see all the sexy new features? Then download at " + url;
	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, msg.c_str(), 0, Util::getDefaultFont());
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setMultiLine(true);
	lbl->setDrawBackground(false);
	listBox->add(lbl);

	this->setMain(layout);
}

NewVersionScreen::~NewVersionScreen() {
	clearListBox();
	listBox->clear();
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

void NewVersionScreen::clearListBox() {
	Vector<Widget*> tempWidgets;
	for (int i = 0; i < listBox->getChildren().size(); i++) {
		tempWidgets.add(listBox->getChildren()[i]);
	}
	listBox->clear();
	listBox->getChildren().clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
}

void NewVersionScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			maPlatformRequest(downloadUrl.c_str());
			break;
		case MAK_BACK:
		case MAK_SOFTLEFT:
			previous->show();
			break;
		case MAK_DOWN:
			break;
		case MAK_UP:
			break;
	}
}
