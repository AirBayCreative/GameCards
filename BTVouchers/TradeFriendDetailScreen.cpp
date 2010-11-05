#include "TradeFriendDetailScreen.h"
#include "TradeConfirmationScreen.h"
#include "Util.h"

TradeFriendDetailScreen::TradeFriendDetailScreen(Screen *previous, Feed *feed, Card *card) :previous(previous),
	feed(feed), card(card) {
	menu = new Screen();
	layout = createMainLayout(back, continuelbl);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];

	layout->setDrawBackground(TRUE);

	errorLabel = new Label(0,0, scrWidth, scrHeight/8, NULL, "", 0, gFontWhite);
	errorLabel->setSkin(gSkinBack);
	errorLabel->setMultiLine(true);
	String message = phoneNumlbl;
	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, message+":", 0, gFontWhite);
	lbl->setSkin(gSkinBack);

	lblMethod = createEditLabel("");
	contactEditBox = new EditBox(0, 6, lblMethod->getWidth()-PADDING*2, lblMethod->getHeight()-PADDING*2, lblMethod, "", 0, gFontBlue, true, false);
	contactEditBox->setInputMode(EditBox::IM_NUMBERS);
	contactEditBox->setDrawBackground(false);
	lblMethod->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(lblMethod);
	listBox->add(errorLabel);

	contactEditBox->setText("");

	this->setMain(layout);

	contactEditBox->setSelected(true);
}

TradeFriendDetailScreen::~TradeFriendDetailScreen() {
		layout->getChildren().clear();
		listBox->getChildren().clear();

		delete listBox;
		delete layout;
		if (image != NULL) {
			delete image;
			image = NULL;
		}
		if (softKeys != NULL) {
			softKeys->getChildren().clear();
			delete softKeys;
			softKeys = NULL;
		}
		delete lbl;
		delete lblMethod;
		delete errorLabel;
		delete menu;
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
		((Label *)widget)->setFont(gFontWhite);
	}
}

void TradeFriendDetailScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
			contactEditBox->setSelected(true);
			//listBox->setSelectedIndex(1);
			break;
		case MAK_SOFTRIGHT:
			if (contactEditBox->getText() == "") {
				String message = no_contact;
				errorLabel->setCaption(message + phoneNumlbl + ".");
			}
			else {
				errorLabel->setCaption("");
				String message = sure_you_want_to_send + card->getText() + friend_with + phoneNumlbl + " " + contactEditBox->getText() + "?";
				if (menu != NULL) {
					delete menu;
				}
				String number = contactEditBox->getText();
				number.append("&sms=Yes", 8);
				menu = new TradeConfirmationScreen(this, feed, card, message, number);
				menu->show();
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
