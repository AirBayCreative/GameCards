#include "Header.h"
#include <mastdlib.h>

ProfileScreen::ProfileScreen(Screen *previous, Feed *feed) : mHttp(this), previous(previous), feed(feed) {
	mainLayout = createMainLayout(back, blank);
	listBox = (ListBox*) layout->getChildren()[0]->getChildren()[2];
	label = (Label *) layout->getChildren()[0]->getChildren()[1];

	label->setCaption(checking_info);

	//USERNAME
	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlbl, 0, gFontWhite);
	lbl->setSkin(gSkinBack);

	labelContain = createLabel(blank);

	editBox = new EditBox(0, 6, labelContain->getWidth()-PADDING*2, labelContain->getHeight()-PADDING*2, labelContain, feed->getUsername(), 0, gFontWhite, true, false, 45);
	editBox->setDrawBackground(false);
	editBox->setEnabled(false);
	labelContain->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(labelContain);

	//EMAIL
	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, emaillbl, 0, gFontWhite);
	lbl->setSkin(gSkinBack);
	labelContain = createLabel(blank);

	editBox = new EditBox(0, 6, labelContain->getWidth()-PADDING*2, labelContain->getHeight()-PADDING*2, labelContain, feed->getEmail(), 0, gFontWhite, true, false, 45);
	editBox->setDrawBackground(false);
	labelContain->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(labelContain);

	//HANDLE
	lbl = new Label(0,0, scrWidth-PADDING*2, 24, NULL, handlelbl, 0, gFontWhite);
	lbl->setSkin(gSkinBack);
	labelContain = createLabel(blank);

	editBox = new EditBox(0, 6, labelContain->getWidth()-PADDING*2, labelContain->getHeight()-PADDING*2, labelContain, feed->getHandle(), 0, gFontWhite, true, false, 45);
	editBox->setDrawBackground(false);
	labelContain->addWidgetListener(this);

	listBox->add(lbl);
	listBox->add(labelContain);

	int res = mHttp.create(USER.c_str(), HTTP_GET);
	mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
	mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());

	if(res < 0) {

	} else {
		mHttp.finish();
	}
	this->setMain(mainLayout);
}

ProfileScreen::~ProfileScreen() {
}

void ProfileScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void ProfileScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void ProfileScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void ProfileScreen::locateItem(MAPoint2d point)
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

void ProfileScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}

void ProfileScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void ProfileScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void ProfileScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
		case MAK_SOFTLEFT:
			previous->show();
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			listBox->selectNextItem();
			break;
		case MAK_LEFT:
			break;
	}
}

void ProfileScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		label->setCaption(blank);
	}
}

void ProfileScreen::connReadFinished(Connection* conn, int result) {}

void ProfileScreen::xcConnError(int code) {
	if (code == -6) {
		return;
	} else {
	}
}

void ProfileScreen::mtxEncoding(const char* ) {}

void ProfileScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void ProfileScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void ProfileScreen::mtxTagData(const char* data, int len) {
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

void ProfileScreen::mtxTagEnd(const char* name, int len) {
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

void ProfileScreen::mtxParseError() {
}

void ProfileScreen::mtxEmptyTagEnd() {
}

void ProfileScreen::mtxTagStartEnd() {
}
