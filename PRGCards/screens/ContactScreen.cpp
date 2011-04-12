#include <mastdlib.h>

#include "ContactScreen.h"
#include "../utils/Util.h"
#include "AlbumLoadScreen.h"

ContactScreen::ContactScreen(Screen *previous, Feed *feed) : previous(previous), feed(feed) {

	mainLayout = createMainLayout(back, select, "" , true);

	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setCaption("Looking up Contact info");

	found = false;

	lbl = createSubLabel("Empty");
	lbl->addWidgetListener(this);
	listBox->add(lbl);

	//listBox->setSelectedIndex(0);

	pim = PIM::PIM();
	pim.addListener(this);
	pim.getContacts();

	this->setMain(mainLayout);
}

ContactScreen::~ContactScreen() {
	delete mainLayout;
	mainLayout = NULL;
}

void ContactScreen::contactReceived(Contact& c) {
	if (!found) {listBox->clear();found=true;}
	for (int i = 0; i < c.numbers.size(); i++) {
		sprintf(msg, "%S : %S", c.name.c_str(), c.numbers[i].c_str());
		char* num;
		numbers.add(c.numbers[i]);
		lprintfln(msg);
		lbl = createSubLabel(msg);
		lbl->addWidgetListener(this);
		listBox->add(lbl);
	}
	//listBox->setSelectedIndex(0);
	notice->setCaption("");

}

void ContactScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlueBold);
	} else {
		((Label *)widget)->setFont(gFontBlackBold);
	}
}
#if defined(MA_PROF_SUPPORT_STYLUS)
void ContactScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void ContactScreen::pointerMoveEvent(MAPoint2d point)
{
	locateItem(point);
}

void ContactScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void ContactScreen::locateItem(MAPoint2d point)
{
	list = false;
	left = false;
	right = false;
	mid = false;

    Point p;
    p.set(point.x, point.y);
    for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
    {
        if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
        {
        	list = true;
            return;
        }
    }
    for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
			if (i == 0) {
				left = true;
			} else if (i == 1) {
				mid = true;
			} else if (i == 2) {
				right = true;
			}
			return;
		}
	}
}
#endif
void ContactScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void ContactScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void ContactScreen::keyPressEvent(int keyCode) {
	int index = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			lprintfln("softright");
			index = listBox->getSelectedIndex();
			lprintfln("index");
			num = numbers[index].c_str();
			lprintfln(msg);
			previous->show();
			lprintfln("done");
			break;
		case MAK_SOFTLEFT:
			previous->show();
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
	}
}
