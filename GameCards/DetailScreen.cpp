#include "Header.h"
#include <mastdlib.h>

DetailScreen::DetailScreen(Screen *previous, Feed *feed, int screenType) : mHttp(this), previous(previous), feed(feed) {
	mainLayout = createMainLayout(back, blank);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[2];

	switch (screenType) {
		case 0:
			//USERNAME
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlbl, 0, gFontWhite);
			listBox->add(label);

			label = createLabel(blank);
			editBox = new EditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, feed->getUsername(), 0, gFontWhite, true, false, 45);
			editBox->setDrawBackground(false);
			label->addWidgetListener(this);
			listBox->add(label);

			//EMAIL
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, emaillbl, 0, gFontWhite);
			listBox->add(label);

			label = createLabel(blank);
			editBox = new EditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, feed->getEmail(), 0, gFontWhite, true, false, 45);
			editBox->setDrawBackground(false);
			label->addWidgetListener(this);
			listBox->add(label);

			//HANDLE
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, handlelbl, 0, gFontWhite);
			listBox->add(label);

			label = createLabel(blank);
			editBox = new EditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, feed->getHandle(), 0, gFontWhite, true, false, 45);
			editBox->setDrawBackground(false);
			label->addWidgetListener(this);
			listBox->add(label);
			break;
		case 1:
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, avail_credits, 0, gFontWhite);
			listBox->add(label);

			label = createLabel(blank);
			editBox = new EditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, feed->getCredits(), 0, gFontWhite, true, false, 45);
			editBox->setDrawBackground(false);
			editBox->setEnabled(false);
			label->addWidgetListener(this);
			listBox->add(label);
			break;
	}


	int res = mHttp.create(USER.c_str(), HTTP_GET);
	mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
	mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());

	if(res < 0) {

	} else {
		mHttp.finish();
	}

	label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
	label->setCaption(checking_info);
	this->setMain(mainLayout);
}

DetailScreen::~DetailScreen() {
}

void DetailScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void DetailScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void DetailScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
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
		label->setCaption(blank);
	}
}

void DetailScreen::connReadFinished(Connection* conn, int result) {}

void DetailScreen::xcConnError(int code) {
	if (code == -6) {
		return;
	} else {
	}
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
	} else if(!strcmp(parentTag.c_str(), xml_handle)) {
		handle += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	}
}

void DetailScreen::mtxTagEnd(const char* name, int len) {
	//TODO not currently updating screen components. Only on screen recreate.
	if(!strcmp(name, xml_status)) {
		label->setCaption(blank);
		feed->setCredits(credits.c_str());
		feed->setHandle(handle.c_str());
		feed->setEmail(email.c_str());
		feed->setUnsuccessful(success);
		username,error_msg= blank;
		saveData(FEED, feed->getAll().c_str());
	} else if(!strcmp(name, xml_error)) {
		label->setCaption(error_msg.c_str());
	} else {
		label->setCaption(blank);
	}
}

void DetailScreen::mtxParseError() {
}

void DetailScreen::mtxEmptyTagEnd() {
}

void DetailScreen::mtxTagStartEnd() {
}