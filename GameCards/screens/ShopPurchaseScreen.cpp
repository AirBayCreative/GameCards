#include <conprint.h>
#include <madmath.h>

#include "ShopPurchaseScreen.h"
#include "../utils/Util.h"

ShopPurchaseScreen::ShopPurchaseScreen(Screen *previous, Feed *feed, Product *product)
		:previous(previous), feed(feed), product(product) {
	next = new Screen();

	//check that the user can afford the product
	if (atof(feed->getCredits().c_str()) >= atof(product->getPrice().c_str())) {
		canPurchase = true;
	}
	else {
		canPurchase = false;
	}

	String confirmLabel = "";
	if (canPurchase) {
		layout = createMainLayout(back, confirm);
		confirmLabel += sure_you_want_to_purchase + product->getName() + priceFor +
				product->getCurrency() + " " + product->getFormattedPrice() + "?";
	}
	else {
		layout = createMainLayout(back, "");
		confirmLabel += not_enough_credits;
	}
	listBox = (ListBox*)layout->getChildren()[0]->getChildren()[2];

	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, gFontGrey);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);

	this->setMain(layout);
}

ShopPurchaseScreen::~ShopPurchaseScreen() {
	layout->getChildren().clear();
	listBox->getChildren().clear();

	delete listBox;
	delete layout;
	delete image;
	if (softKeys != NULL) {
		softKeys->getChildren().clear();
		delete softKeys;
		softKeys = NULL;
	}
	parentTag="";
	notice="";
	temp="";
	temp1="";
	error_msg="";
}

void ShopPurchaseScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void ShopPurchaseScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void ShopPurchaseScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void ShopPurchaseScreen::locateItem(MAPoint2d point)
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

void ShopPurchaseScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_SOFTRIGHT:
			if (canPurchase) {

			}
			break;
		case MAK_SOFTLEFT:
			previous->show();
			break;
	}
}
