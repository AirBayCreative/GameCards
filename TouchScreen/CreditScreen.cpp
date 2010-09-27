#include "Header.h"
#include <mastdlib.h>

CreditScreen::CreditScreen(Screen *previous, Feed *feed) : mHttp(this), previous(previous), feed(feed) {
	layout = createMainLayout(back, blank);
	listBox = (ListBox*) layout->getChildren()[0]->getChildren()[2];
	userNotice = (Label *) layout->getChildren()[0]->getChildren()[1];

	userNotice->setCaption(checking_info);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, avail_credits, 0, gFontWhite);
	label->setSkin(gSkinBack);

	labelContain = createLabel(blank);

	editBox = new EditBox(0, 6, labelContain->getWidth()-PADDING*2, labelContain->getHeight()-PADDING*2, labelContain, feed->getCredits(), 0, gFontWhite, true, false, 45);
	editBox->setDrawBackground(false);
	editBox->setEnabled(false);
	labelContain->addWidgetListener(this);

	listBox->add(label);
	listBox->add(labelContain);

	int res = mHttp.create(USER.c_str(), HTTP_GET);
	mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
	mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());

	if(res < 0) {

	} else {
		mHttp.finish();
	}
	this->setMain(layout);
}

void CreditScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void CreditScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void CreditScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void CreditScreen::locateItem(MAPoint2d point)
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

CreditScreen::~CreditScreen() {
}

void CreditScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}

void CreditScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void CreditScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void CreditScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
		case MAK_SOFTLEFT:
			previous->show();
			break;
	}
}

void CreditScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		userNotice->setCaption(blank);
	}
}

void CreditScreen::connReadFinished(Connection* conn, int result) {}

void CreditScreen::xcConnError(int code) {
	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
}

void CreditScreen::mtxEncoding(const char* ) {}

void CreditScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void CreditScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void CreditScreen::mtxTagData(const char* data, int len) {
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

void CreditScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_status)) {
		userNotice->setCaption(blank);
		feed->setCredits(credits.c_str());
		feed->setHandle(handle.c_str());
		feed->setEmail(email.c_str());
		feed->setUnsuccessful(success);
		username,error_msg= blank;
		saveData(FEED, feed->getAll().c_str());
	} else if(!strcmp(name, xml_error)) {
		userNotice->setCaption(error_msg.c_str());
	} else {
		userNotice->setCaption(blank);
	}
}

void CreditScreen::mtxParseError() {
}

void CreditScreen::mtxEmptyTagEnd() {
}

void CreditScreen::mtxTagStartEnd() {
}
