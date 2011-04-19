#include <mastdlib.h>

#include "SearchScreen.h"
#include "../utils/Util.h"
#include "AlbumLoadScreen.h"

SearchScreen::SearchScreen(Feed *feed, Screen *previous) : mHttp(this), feed(feed), prev(previous) {
	moved = 0;
	isBusy = false;

	response = "";

	mainLayout = createMainLayout(back, search, "", true);

	mainLayout->setDrawBackground(TRUE);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	setPadding(listBox);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setMultiLine(true);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, searchTermlbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	editBoxSearch = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false);
	editBoxSearch->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	if (feed->getUnsuccessful() != success) {
		label->setCaption(feed->getUnsuccessful());
	}
	touch = falsesz;
	this->setMain(mainLayout);
	listBox->setSelectedIndex(1);
}

SearchScreen::~SearchScreen() {
	delete mainLayout;

	parentTag = "";
	conCatenation = "";
	value = "";
	value1 = "";
	value2 = "";
	convertAsterisk = "";
	underscore = "";
	username = "";
	credits = "";
	encrypt = "";
	error_msg = "";
	email = "";
	handle = "";
	touch = "";
}

void SearchScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}
#if defined(MA_PROF_SUPPORT_STYLUS)
void SearchScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void SearchScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void SearchScreen::pointerReleaseEvent(MAPoint2d point)
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

void SearchScreen::locateItem(MAPoint2d point)
{
	touch = truesz;
	if (feed->setTouch(touch.c_str())) {
		saveData(FEED, feed->getAll().c_str());
	}
	list = false;
	left = false;
	right = false;
	mid = false;

    Point p;
    p.set(point.x, point.y);
    for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
    {
        if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
        {
        	if (moved <= 1) listBox->setSelectedIndex(i);
        	list = true;
            return;
        }
    }
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
void SearchScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void SearchScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void SearchScreen::keyPressEvent(int keyCode) {
	error = false;
	int index = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			break;
		case MAK_SOFTLEFT:
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

void SearchScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption(no_connect);
		isBusy = false;
	}
}

void SearchScreen::connReadFinished(Connection* conn, int result) {}

void SearchScreen::xcConnError(int code) {
	isBusy = false;
}

void SearchScreen::mtxEncoding(const char* ) {
}

void SearchScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void SearchScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void SearchScreen::mtxTagData(const char* data, int len) {
}

void SearchScreen::mtxTagEnd(const char* name, int len) {
}

void SearchScreen::mtxParseError() {
}

void SearchScreen::mtxEmptyTagEnd() {
}

void SearchScreen::mtxTagStartEnd() {
}
