#include <mastdlib.h>

#include "Login.h"
#include "../utils/Util.h"
#include "AlbumLoadScreen.h"

Login::Login(Feed *feed, Screen *previous, int screen) : mHttp(this), feed(feed), previous(previous), screen(screen) {
	moved = 0;
	changed = false;
	isBusy = false;
	kbShown = false;

	next = NULL;

	response = "";
	temp = "";
	temp1 = "";
	hasCards = "";
	updated = "";

#if defined(MA_PROF_SUPPORT_STYLUS)
	defaultKBPos = (int)floor((double)scrHeight - ((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER));
	keyboard = new MobKeyboard(0, defaultKBPos,
		scrWidth, (int)floor((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER));
#endif

	mainLayout = createMainLayout("", "", "", true);

	mainLayout->setDrawBackground(TRUE);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	setPadding(listBox);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setMultiLine(true);

	switch (screen) {
		case S_LOGIN:
			drawLoginScreen();
			break;
		case S_REGISTER:
			drawRegisterScreen();
			break;
	}
	touch = falsesz;
	this->setMain(mainLayout);
}

Login::~Login() {}

void Login::drawLoginScreen() {
	moved = 0;
	changed = true;
	screen = S_LOGIN;
#if defined(MA_PROF_SUPPORT_STYLUS)
	keyboard->deAttachEditBox();
	keyboard->hide();
#endif
	clearListBox();

	updateSoftKeyLayout(back, login, "", mainLayout);
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, cellLbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	editBoxCell = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false, 100, MobEditBox::IM_NUMBERS);
	editBoxCell->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	listBox->setSelectedIndex(1);
}

void Login::drawRegisterScreen() {
	listBox->setYOffset(0);
	moved = 0;
	changed = true;
	screen = S_REGISTER;
#if defined(MA_PROF_SUPPORT_STYLUS)
	keyboard->deAttachEditBox();
	keyboard->hide();
#endif
	clearListBox();

	updateSoftKeyLayout(back, apply, "", mainLayout);
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, namelbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	editBoxName = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false, 255, MobEditBox::IM_STANDARD);
	editBoxName->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, surnamelbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	editBoxSurname = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false, 255, MobEditBox::IM_STANDARD);
	editBoxSurname->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, cellLbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	editBoxCell = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false, 100, MobEditBox::IM_NUMBERS);
	editBoxCell->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, genderlbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	editBoxGender = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false, 36, MobEditBox::IM_STANDARD);
	editBoxGender->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, agelbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	editBoxAge = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false, 5, MobEditBox::IM_NUMBERS);
	editBoxAge->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	listBox->setSelectedIndex(1);
}

void Login::clearListBox() {
	for (int i = 0; i < listBox->getChildren().size(); i++) {
		tempWidgets.add(listBox->getChildren()[i]);
	}
	listBox->clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		tempWidgets[j]->setSelected(false);
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
}

void Login::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}
#if defined(MA_PROF_SUPPORT_STYLUS)
void Login::pointerPressEvent(MAPoint2d point)
{
	kbShown = keyboard->isShown();
	if (!kbShown) {
		listBox->setEnabled(true);
	}
    locateItem(point);
}

void Login::pointerMoveEvent(MAPoint2d point)
{
	moved++;
	locateItem(point);
}

void Login::pointerReleaseEvent(MAPoint2d point)
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
		changed = false;
	}

	if (keyboard->isShown()) {
		listBox->setEnabled(false);
	}
	else {
		listBox->setEnabled(true);
	}
	kbShown = false;
}

void Login::locateItem(MAPoint2d point)
{
	touch = truesz;
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
void Login::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void Login::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void Login::keyPressEvent(int keyCode) {
	error = false;
	int index = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			if (!isBusy) {
				switch (screen) {
					case S_LOGIN:
						if (editBoxCell->getText()!="") {
							isBusy = true;
							notice->setCaption(loggingin);
							feed->setEncrypt("aaaaaa");
							feed->setUsername(editBoxCell->getText().c_str());
							feed->setUnsuccessful(truesz);
							if(mHttp.isOpen()){
								mHttp.close();
							}
							mHttp = HttpConnection(this);
							int res = mHttp.create(USER.c_str(), HTTP_GET);

							if(res < 0) {
								notice->setCaption(no_connect);
							} else {
								mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
								mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
								mHttp.finish();
							}
							value = "";
						} else {
							maVibrate(1000);
							notice->setCaption(no_user);
						}
						break;
					case S_REGISTER:
						notice->setCaption("");
						if (editBoxCell->getText().length() < 10) {
							notice->setCaption(cell_too_short);
							maVibrate(1000);
						}
						else if (editBoxName->getText().length() < 1) {
							notice->setCaption(enter_name);
							maVibrate(1000);
						}
						else if (editBoxSurname->getText().length() < 1) {
							notice->setCaption(enter_surname);
							maVibrate(1000);
						}
						else if (editBoxGender->getText().length() < 1) {
							notice->setCaption(enter_gender);
							maVibrate(1000);
						}
						else if (editBoxAge->getText().length() < 1) {
							notice->setCaption(enter_age);
							maVibrate(1000);
						}
						else {
							response = "";
							isBusy = true;
							notice->setCaption(registering);

							char *url = NULL;
							//work out how long the url will be, the 10 is for the & and = symbols
							int urlLength = REGISTER.length() + strlen(name) + editBoxName->getText().length()
									+ strlen(surname) + editBoxSurname->getText().length() + strlen(cell) + editBoxCell->getText().length()
									+ strlen(gender) + editBoxGender->getText().length() + strlen(age) + editBoxAge->getText().length() + 10;
							url = new char[urlLength];
							memset(url,'\0',urlLength);
							sprintf(url, "%s&%s=%s&%s=%s&%s=%s&%s=%s&%s=%s", REGISTER.c_str(), name, editBoxName->getText().c_str(),
									surname, editBoxSurname->getText().c_str(), cell, editBoxCell->getText().c_str(),
									gender, editBoxGender->getText().c_str(), age, editBoxAge->getText().c_str());
							mHttp = HttpConnection(this);
							int res = mHttp.create(url, HTTP_GET);
							if(res < 0) {
								notice->setCaption(no_connect);
							} else {
								mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
								mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
								mHttp.finish();
							}
							delete url;
						}
						break;
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

void Login::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption(no_connect);
		isBusy = false;
	}
}

void Login::connReadFinished(Connection* conn, int result) {}

void Login::xcConnError(int code) {
	isBusy = false;
}

void Login::mtxEncoding(const char* ) {
}

void Login::mtxTagStart(const char* name, int len) {
	parentTag = name;
	if (!strcmp(name, xml_albumdone)) {
		album = new Albums();
	}
}

void Login::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void Login::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), xml_username)) {
		username = data;
	} else if(!strcmp(parentTag.c_str(), xml_credits)) {
		credits = data;
	} else if(!strcmp(parentTag.c_str(), xml_email)) {
		email = data;
	} else if(!strcmp(parentTag.c_str(), xml_handle)) {
		handle = data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg = data;
	} else if (!strcmp(parentTag.c_str(), xml_response)) {
		response += data;
	} else if (!strcmp(parentTag.c_str(), xml_albumdone)) {
		album->clearAll();
	} else if(!strcmp(parentTag.c_str(), xml_albumname)) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), xml_albumid)) {
		temp += data;
	} else if (!strcmp(parentTag.c_str(), xml_hascards)) {
		hasCards += data;
	} else if (!strcmp(parentTag.c_str(), xml_updated)) {
		updated += data;
	}
}

void Login::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_status)) {
		feed->setCredits(credits.c_str());
		feed->setHandle(handle.c_str());
		feed->setEmail(email.c_str());
		feed->setUnsuccessful(success);
		feed->setTouch(touch.c_str());
		int seconds = maLocalTime();
		int secondsLength = intlen(seconds);
		char *secString = new char[secondsLength];
		memset(secString,'\0',secondsLength);
		sprintf(secString, "%d", seconds);
		feed->setSeconds(secString);
		delete secString;
		username,error_msg= "";
		saveData(FEED, feed->getAll().c_str());
		feed->setAlbum(getData(ALBUM));
		if (next != NULL) {
			delete next;
		}
		next = new AlbumLoadScreen(feed);
		next->show();
	} else if(!strcmp(name, xml_error)) {
		error = true;
		feed->setUnsuccessful(error_msg.c_str());
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, xml_response)) {
		isBusy = false;
		notice->setCaption(response);
	} else if(!strcmp(name, xml_album)) {
		album->addAlbum(temp.c_str(), temp1, (hasCards=="true"), (updated=="1"));
		temp1 = "";
		temp = "";
		hasCards = "";
		updated = "";
	} else if (!strcmp(name, xml_albumdone)) {
		this->feed->getAlbum()->setAll(album->getAll().c_str());
		saveData(ALBUM, album->getAll().c_str());

		feed->setEncrypt("aaaaaa");
		feed->setUsername(editBoxCell->getText().c_str());
		feed->setCredits("0");
		feed->setHandle("");
		feed->setEmail("");
		feed->setUnsuccessful(success);
		feed->setTouch("");
		int seconds = maLocalTime();
		int secondsLength = intlen(seconds);
		char *secString = new char[secondsLength];
		memset(secString,'\0',secondsLength);
		sprintf(secString, "%d", seconds);
		feed->setSeconds(secString);
		delete secString;
		username,error_msg= "";
		saveData(FEED, feed->getAll().c_str());

		if (next != NULL) {
			delete next;
		}
		next = new AlbumLoadScreen(feed, album);
		next->show();
	} else {
		if (!error) {
			if (notice != NULL) {
				notice->setCaption("");
			}
		}
	}
}
void Login::cleanup() {
#if defined(MA_PROF_SUPPORT_STYLUS)
	delete keyboard;
#endif
	delete mainLayout;

	parentTag = "";
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

void Login::mtxParseError() {
}

void Login::mtxEmptyTagEnd() {
}

void Login::mtxTagStartEnd() {
}
