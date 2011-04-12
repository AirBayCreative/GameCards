#include <mastdlib.h>

#include "ShareScreen.h"
#include "../utils/Util.h"
#include "AlbumLoadScreen.h"

ShareScreen::ShareScreen(Screen *previous, Feed *feed) : mHttp(this), previous(previous), feed(feed) {
	moved = 0;
	isBusy = false;
	kbShown = false;
	hasPim = false;
	next = NULL;
	value = "";

//check the platform, and if it supports pim
#if defined(MA_PROF_STRING_PLATFORM)
	String platform = MA_PROF_STRING_PLATFORM;
	if (strcmp(platform.c_str(), "s60v5") == 0 ||
			strcmp(platform.c_str(), "s60v3") == 0 ||
			strcmp(platform.c_str(), "JavaME") == 0) {
		hasPim = true;
	}
	platform = "";
#endif

#if defined(MA_PROF_SUPPORT_STYLUS)
	defaultKBPos = (int)floor((double)scrHeight - ((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER));
	keyboard = new MobKeyboard(0, defaultKBPos,
		scrWidth, (int)floor((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER));
#endif

	mainLayout = createMainLayout(back, share, hasPim?contact:"", true);
	mainLayout->setDrawBackground(TRUE);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	setPadding(listBox);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	moved = 0;
#if defined(MA_PROF_SUPPORT_STYLUS)
	keyboard->deAttachEditBox();
	keyboard->hide();
#endif
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, cellLbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	editBoxCell = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "",
			0, gFontBlack, true, false, 100, MobEditBox::IM_NUMBERS);
	editBoxCell->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, messagelbl, 0, gFontBlack);
	listBox->add(label);

	int height = listBox->getHeight() - (96 + PADDING * 4);

	label = createEditLabel("", height < 160 ? 160 : height);
	editBoxMessage = new MobEditBox(0, 12, label->getWidth()-PADDING*2,
			label->getHeight()-PADDING*2, label, message_start,
			0, gFontBlack, true, false, 140, MobEditBox::IM_STANDARD);
	editBoxMessage->setDrawBackground(false);
	editBoxMessage->setMultiLine(true);
	editBoxMessage->moveCursorToEnd();
	label->addWidgetListener(this);
	listBox->add(label);

	listBox->setSelectedIndex(1);

	this->setMain(mainLayout);
}

ShareScreen::~ShareScreen() {
	if(next!=NULL){
			delete next;
	}
	delete mainLayout;
	mainLayout = NULL;
#if defined(MA_PROF_SUPPORT_STYLUS)
	delete keyboard;
#endif
}

void ShareScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}
#if defined(MA_PROF_SUPPORT_STYLUS)
void ShareScreen::pointerPressEvent(MAPoint2d point)
{
	kbShown = keyboard->isShown();
	if (!kbShown) {
		listBox->setEnabled(true);
	}
    locateItem(point);
}

void ShareScreen::pointerMoveEvent(MAPoint2d point)
{
	moved++;
	locateItem(point);
}

void ShareScreen::pointerReleaseEvent(MAPoint2d point)
{
	kbShown = keyboard->isShown();
	if (!kbShown) {
		listBox->setEnabled(true);
	}

	if (moved <= 8) {
		if (!kbShown && right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (!kbShown && left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (!kbShown && mid) {
			keyPressEvent(MAK_FIRE);
		}

		int yClick = point.y;
		int keyboardY = keyboard->getPosition().y;

		int index = listBox->getSelectedIndex();
		if (list && (index %2 == 1)) {
			keyboard->attachWidget(listBox->getChildren()[index]->getChildren()[0]);
			keyboard->show();
		}
		else if (keyboard->isShown() && (yClick < keyboardY || yClick > keyboardY + (scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER))) {
			keyboard->deAttachEditBox();
			keyboard->hide();
		}
	}
	else {
		moved = 0;
	}

	if (keyboard->isShown()) {
		listBox->setEnabled(false);
	}
	else {
		listBox->setEnabled(true);
	}
	kbShown = false;
}

void ShareScreen::locateItem(MAPoint2d point)
{
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
        	if (moved <= 1 && ((keyboard->isShown() &&!keyboard->contains(point.x, point.y)) ||
        			!keyboard->isShown())) listBox->setSelectedIndex(i);
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

void ShareScreen::show() {
	if (next != NULL) {
		char msg[1024];
		sprintf(msg, "%S", next->getNum().c_str());
		editBoxCell->setText(msg);
	}
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void ShareScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void ShareScreen::keyPressEvent(int keyCode) {
	error = false;
	int index = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_FIRE:
			if (hasPim) {
				if (next != NULL) {
					delete next;
					next = NULL;
				}
				next = new ContactScreen(this, feed);
				next->show();
			}
			break;
		case MAK_SOFTRIGHT:
			if (!isBusy) {
				if (editBoxCell->getText().length() > 0) {
					isBusy = true;
					notice->setCaption(checking_user);
					char *url = NULL;
					//work out how long the url will be, the 10 is for the & and = symbols
					int urlLength = TRADE.length() + editBoxCell->getText().length();
					url = new char[urlLength];
					memset(url,'\0',urlLength);
					sprintf(url, "%s%s", TRADE.c_str(), editBoxCell->getText().c_str());
					if(mHttp.isOpen()){
						mHttp.close();
					}
					mHttp = HttpConnection(this);
					lprintfln(url);
					int res = mHttp.create(url, HTTP_GET);
					if(res < 0) {
						notice->setCaption(no_connect);
					} else {
						mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
						mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
						mHttp.finish();
					}
					delete url;
				} else {
					maVibrate(1000);
					notice->setCaption(enter_cell);
				}
			}
			break;
		case MAK_SOFTLEFT:
			previous->show();
			break;
		case MAK_UP:
			if (index-2 > 0) {
				listBox->setSelectedIndex(index-2);
			}
			else {
				listBox->setYOffset(0);
				listBox->requestRepaint();
			}
			break;
		case MAK_DOWN:
			if (index+2 < listBox->getChildren().size()) {
				listBox->setSelectedIndex(index+2);
			}
			break;
		case MAK_LEFT:
			break;
	}
}

void ShareScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	value = "";
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption(no_connect);
		isBusy = false;
	}
}

void ShareScreen::connReadFinished(Connection* conn, int result) {}

void ShareScreen::xcConnError(int code) {
	isBusy = false;
}

void ShareScreen::mtxEncoding(const char* ) {
}

void ShareScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void ShareScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void ShareScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), xml_result)) {
		value += data;
	}
}

void ShareScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_result)) {
		notice->setCaption("");
		if(!strcmp(value.c_str(), "0")) {
			int sent = maSendTextSMS(editBoxCell->getText().c_str(), editBoxMessage->getText().c_str());
			if (sent < 0) {
				notice->setCaption("Failed to send sms.");
			}
		}
		else {
			notice->setCaption(value);
		}
	}
}

void ShareScreen::mtxParseError() {
}

void ShareScreen::mtxEmptyTagEnd() {
}

void ShareScreen::mtxTagStartEnd() {
}
