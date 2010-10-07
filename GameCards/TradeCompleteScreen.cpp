#include "AlbumLoadScreen.h"
#include "MenuScreen.h"
#include "TradeCompleteScreen.h"
#include "Util.h"

TradeCompleteScreen::TradeCompleteScreen(Feed *feed) :feed(feed) {
	layout = createMainLayout(blank, continuelbl);
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, card_sent_message, 0, gFontGrey);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);

	this->setMain(layout);
}

TradeCompleteScreen::~TradeCompleteScreen() {
}
void TradeCompleteScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeCompleteScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void TradeCompleteScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void TradeCompleteScreen::locateItem(MAPoint2d point)
{
	list = false;
	left = false;
	right = false;

    Point p;
    p.set(point.x, point.y);
    for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
    {
        if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p) && i > 0)
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

void TradeCompleteScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		((Label *)widget)->setFont(gFontBlue);
	} else {
		((Label *)widget)->setFont(gFontGrey);
	}
}

void TradeCompleteScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_SOFTRIGHT:
			menu = new AlbumLoadScreen(new MenuScreen(feed), feed);
			menu->show();
			break;
	}
}
