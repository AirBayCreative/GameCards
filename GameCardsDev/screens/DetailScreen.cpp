#include "DetailScreen.h"
#include "../utils/Util.h"

DetailScreen::DetailScreen(Screen *previous, Feed *feed, int screenType) : mHttp(this), previous(previous), feed(feed), screenType(screenType) {
	mainLayout = createMainLayout(back, "", true);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];

	switch (screenType) {
		case PROFILE:
			//USERNAME
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlbl, 0, gFontBlack);
			listBox->add(label);

			label = createLabel(feed->getUsername());
			label->setVerticalAlignment(Label::VA_CENTER);
			//editBox = new EditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, feed->getUsername(), 0, gFontBlack, true, false, 45);
			//editBox->setDrawBackground(false);
			//label->addWidgetListener(this);
			listBox->add(label);

			//EMAIL
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, emaillbl, 0, gFontBlack);
			listBox->add(label);

			label = createLabel(feed->getEmail());
			label->setVerticalAlignment(Label::VA_CENTER);
			//editBox = new EditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, feed->getEmail(), 0, gFontBlack, true, false, 45);
			//editBox->setDrawBackground(false);
			//label->addWidgetListener(this);
			listBox->add(label);
			break;
		case BALANCE:
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, avail_credits, 0, gFontBlack);
			listBox->add(label);

			balanceLabel = createLabel(feed->getCredits());
			balanceLabel->setVerticalAlignment(Label::VA_CENTER);
			//editBox = new EditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, feed->getCredits(), 0, gFontBlack, true, false, 45);
			//editBox->setDrawBackground(false);
			//label->addWidgetListener(this);
			listBox->add(balanceLabel);
			break;
	}


	int res = mHttp.create(USER.c_str(), HTTP_GET);

	if(res < 0) {

	} else {
		label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
		label->setCaption(checking_info);

		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}

	this->setMain(mainLayout);

	moved = 0;
}

DetailScreen::~DetailScreen() {
	mainLayout->getChildren().clear();
	//listBox->getChildren().clear();
	//delete listBox;
	delete mainLayout;
	/*if (image != NULL) {
		delete image;
		image = NULL;
	}
	if (softKeys != NULL) {
		softKeys->getChildren().clear();
		delete softKeys;
		softKeys = NULL;
	}*/
	username = "";
	credits = "";
	encrypt = "";
	error_msg = "";
	parentTag = "";
	email = "";
}

void DetailScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void DetailScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void DetailScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		}
	}
	moved = 0;
}

void DetailScreen::locateItem(MAPoint2d point)
{
	if (feed->setTouch(truesz)) {
		saveData(FEED, feed->getAll().c_str());
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

void DetailScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}

void DetailScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void DetailScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void DetailScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
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

void DetailScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		label->setCaption("");
	}
}

void DetailScreen::connReadFinished(Connection* conn, int result) {}

void DetailScreen::xcConnError(int code) {
}

void DetailScreen::mtxEncoding(const char* ) {}

void DetailScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void DetailScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void DetailScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), xml_username)) {
		username += data;
	} else if(!strcmp(parentTag.c_str(), xml_credits)) {
		credits += data;
	} else if(!strcmp(parentTag.c_str(), xml_email)) {
		email += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	}
}

void DetailScreen::mtxTagEnd(const char* name, int len) {
	//TODO not currently updating screen components. Only on screen recreate.
	if(!strcmp(name, xml_status)) {
		label->setCaption("");
		feed->setCredits(credits.c_str());
		feed->setEmail(email.c_str());
		feed->setUnsuccessful(success);
		username,error_msg= "";
		saveData(FEED, feed->getAll().c_str());

		refreshData();
	} else if(!strcmp(name, xml_error)) {
		if (label != NULL) {
			label->setCaption(error_msg.c_str());
		}
	} else {
		if (label != NULL) {
			label->setCaption("");
		}
	}
}

void DetailScreen::mtxParseError() {
}

void DetailScreen::mtxEmptyTagEnd() {
}

void DetailScreen::mtxTagStartEnd() {
}

void DetailScreen::refreshData() {
	switch (screenType) {
		case PROFILE:
			break;
		case BALANCE:
			balanceLabel->setCaption(feed->getCredits());
			break;
	}
}
