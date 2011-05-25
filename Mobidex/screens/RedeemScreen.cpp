#include <mastdlib.h>

#include "RedeemScreen.h"
#include "../utils/Util.h"
#include "AlbumLoadScreen.h"

RedeemScreen::RedeemScreen(Feed *feed, Screen *previous) : mHttp(this), feed(feed), prev(previous) {
	moved = 0;
	isBusy = false;
	next = NULL;

	result = "";
	error_msg = "";
	parentTag = "";

	mainLayout = createMainLayout(back, redeem, "", true);

	mainLayout->setDrawBackground(true);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	setPadding(listBox);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setMultiLine(true);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, redeemCodelbl, 0, gFontWhite);
	listBox->add(label);

	label = createEditLabel("");
	editBoxRedeem = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "",L"Search term:");
	editBoxRedeem->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	if (feed->getUnsuccessful() != success) {
		label->setCaption(feed->getUnsuccessful());
	}
	this->setMain(mainLayout);
	listBox->setSelectedIndex(1);
}

RedeemScreen::~RedeemScreen() {
	delete mainLayout;
	if (next != NULL) {
		delete next;
	}
	result = "";
	error_msg = "";
	parentTag = "";
}

void RedeemScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}
#if defined(MA_PROF_SUPPORT_STYLUS)
void RedeemScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void RedeemScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void RedeemScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (mid) {
			keyPressEvent(MAK_FIRE);
		}
	}
	else {
		moved = 0;
	}
}

void RedeemScreen::locateItem(MAPoint2d point)
{
	left = false;
	right = false;
	mid = false;

    Point p;
    p.set(point.x, point.y);
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
void RedeemScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void RedeemScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void RedeemScreen::redeemCode() {
	int urlLength = REDEEM.length() + editBoxRedeem->getCaption().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s%s", REDEEM.c_str(), editBoxRedeem->getCaption().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption(no_connect);
	} else {
		notice->setCaption("Redeeming...");
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;
}

void RedeemScreen::keyPressEvent(int keyCode) {
	error = false;
	int index = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			if (!isBusy) {
				isBusy = true;
				redeemCode();
			}
			break;
		case MAK_BACK:
		case MAK_SOFTLEFT:
			((AlbumLoadScreen*)prev)->refresh();
			editBoxRedeem->setSelected(false);
			editBoxRedeem->disableListener();
			prev->show();
			break;
		case MAK_UP:
			break;
		case MAK_DOWN:
			break;
		case MAK_LEFT:
			break;
	}
}

void RedeemScreen::httpFinished(MAUtil::HttpConnection* http, int res) {
	error_msg = "";
	result = "";
	if (res == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption("");
		isBusy = false;
	}
}

void RedeemScreen::connReadFinished(Connection* conn, int result) {
}

void RedeemScreen::xcConnError(int code) {
}

void RedeemScreen::mtxEncoding(const char* ) {
}

void RedeemScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void RedeemScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void RedeemScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), xml_result)) {
		result += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	}
}

void RedeemScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_result)) {
		notice->setCaption(result);
		isBusy = false;
	} else if(!strcmp(name, xml_error)) {
		notice->setCaption(error_msg.c_str());
	} else {
		notice->setCaption("");
	}
}

void RedeemScreen::mtxParseError() {
}

void RedeemScreen::mtxEmptyTagEnd() {
}

void RedeemScreen::mtxTagStartEnd() {
}
