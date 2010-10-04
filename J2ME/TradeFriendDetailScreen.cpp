#include "TradeFriendDetailScreen.h"
#include <madmath.h>

TradeFriendDetailScreen::TradeFriendDetailScreen(Screen *previous, Feed *feed, Card card, String method) :previous(previous),
	feed(feed), card(card), method(method) {
	layout = createMainLayout(back, continuelbl);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];

	errorLabel = new Label(0,0, scrWidth, scrHeight/8, NULL, blank, 0, gFontWhite);
	errorLabel->setSkin(gSkinBack);
	errorLabel->setMultiLine(true);

	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, method+":", 0, gFontWhite);
	lbl->setSkin(gSkinBack);

	lblMethod = createEditLabel(blank);
	contactEditBox = new MobEditBox(0, 6, lblMethod->getWidth()-PADDING*2, lblMethod->getHeight()-PADDING*2, lblMethod, blank, 0, gFontBlack, true, false);
	contactEditBox->setDrawBackground(false);
	lblMethod->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(lblMethod);
	listBox->add(errorLabel);

	contactEditBox->setText(blank);

	this->setMain(layout);

	contactEditBox->setSelected(true);
}

TradeFriendDetailScreen::~TradeFriendDetailScreen() {
}
void TradeFriendDetailScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeFriendDetailScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeFriendDetailScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void TradeFriendDetailScreen::locateItem(MAPoint2d point)
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


void TradeFriendDetailScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontGrey);
	}
}

void TradeFriendDetailScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
			contactEditBox->setSelected(true);
			//listBox->setSelectedIndex(1);
			break;
		case MAK_SOFTRIGHT:
			if (contactEditBox->getText() == blank) {
				errorLabel->setCaption(no_contact + method + ".");
			}
			else {
				errorLabel->setCaption(blank);

			}
			break;
		case MAK_SOFTLEFT:
			previous->show();
			break;
		case MAK_DOWN:
		case MAK_UP:
			contactEditBox->setSelected(true);
			//listBox->setSelectedIndex(1);
			break;
	}
}
