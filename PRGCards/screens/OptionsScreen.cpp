#include "OptionsScreen.h"
#include "Login.h"
#include "../utils/Util.h"

OptionsScreen::OptionsScreen(Feed *feed, int screenType): feed(feed), screenType(screenType) {

	menu = new Screen();

	layout = createMainLayout(exit, select);

	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];

	switch(screenType) {
		case ST_LOGIN_OPTIONS:
			lbl = createSubLabel(login);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			lbl = createSubLabel(reg);
			lbl->addWidgetListener(this);
			listBox->add(lbl);
			break;
	}

	listBox->setSelectedIndex(0);

	this->setMain(layout);
}

OptionsScreen::~OptionsScreen() {
	delete layout;
	delete menu;
}

#if defined(MA_PROF_SUPPORT_STYLUS)
void OptionsScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void OptionsScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void OptionsScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void OptionsScreen::locateItem(MAPoint2d point)
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
        	((ListBox *)this->getMain()->getChildren()[0]->getChildren()[2])->setSelectedIndex(i);
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
#endif
void OptionsScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlueBold);
	} else {
		((Label *)widget)->setFont(gFontBlackBold);
	}
}

void OptionsScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			index = listBox->getSelectedIndex();
			switch(screenType) {
				case ST_LOGIN_OPTIONS:
					if(index == 0) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new Login(feed, Login::S_LOGIN);
						menu->show();
					}
					else if(index == 1) {
						if (menu != NULL) {
							delete menu;
						}
						menu = new Login(feed, Login::S_REGISTER);
						menu->show();
					}
					break;
			}
			break;
		case MAK_SOFTLEFT:
			switch(screenType) {
				case ST_LOGIN_OPTIONS:
					maExit(0);
					break;
			}
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
	}
}
