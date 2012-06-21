#include <conprint.h>

#include "../utils/Util.h"
#include "NewVersionScreen.h"

NewVersionScreen::NewVersionScreen(MainScreen *previous, String url, Feed *feed) : downloadUrl(url) {
	mainLayout = Util::createMainLayout("Later", "Download");
	this->previous = previous;
	this->feed = feed;
	kinListBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];

	String msg = "There is a new version of the app, want to see all the sexy new features? Then download at " + url;
	label = new Label(0,0, scrWidth-PADDING*2, 100, NULL, msg.c_str(), 0, Util::getDefaultFont());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setMultiLine(true);
	label->setDrawBackground(false);
	kinListBox->add(label);

	this->setMain(mainLayout);
}

NewVersionScreen::~NewVersionScreen() {
	clearListBox();
	kinListBox->clear();
	delete mainLayout;
	mainLayout = NULL;
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
	for (int i = 0; i < kinListBox->getChildren().size(); i++) {
		tempWidgets.add(kinListBox->getChildren()[i]);
	}
	kinListBox->clear();
	kinListBox->getChildren().clear();

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
