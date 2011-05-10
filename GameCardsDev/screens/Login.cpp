#include <mastdlib.h>

#include "Login.h"
#include "../utils/Util.h"
#include "MenuScreen.h"

Login::Login(Feed *feed, int screen) : mHttp(this), feed(feed), screen(screen) {
	moved = 0;
	changed = false;
	isBusy = false;
	//kbShown = false;

	response = "";

/*#if defined(MA_PROF_SUPPORT_STYLUS)
	keyboard = new MobKeyboard(0, (int)floor((double)scrHeight - ((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER)),
		scrWidth, (int)floor((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER));
#endif*/

	mainLayout = createMainLayout("", "", "", true);

	mainLayout->setDrawBackground(TRUE);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
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

	if (feed->getUnsuccessful() != success) {
		label->setCaption(feed->getUnsuccessful());
	}
	touch = falsesz;
	this->setMain(mainLayout);
}

Login::~Login() {}

void Login::drawLoginScreen() {
	//listBox->setYOffset(0);
	moved = 0;
	changed = true;
	screen = S_LOGIN;
/*#if defined(MA_PROF_SUPPORT_STYLUS)
	keyboard->deAttachEditBox();
	keyboard->hide();
#endif*/
	clearListBox();

	updateSoftKeyLayout(exit, login, reg, mainLayout);
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	//editBoxLogin = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false);
	//editBoxLogin = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, /*"admin"*/"andre", 0, gFontBlack, true, false);
	editBoxLogin = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, "andre", L"Username:");
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, passlbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	//editBoxPass = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false);
	//editBoxPass = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, /*"1qazxsw2"*/"aaaaaa", 0, gFontBlack, true, false);
	editBoxPass = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "aaaaaa", L"Password:");
	editBoxPass->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	listBox->setSelectedIndex(1);
}

void Login::drawRegisterScreen() {
	listBox->setYOffset(0);
	moved = 0;
	changed = true;
	screen = S_REGISTER;
/*#if defined(MA_PROF_SUPPORT_STYLUS)
	keyboard->deAttachEditBox();
	keyboard->hide();
#endif*/
	clearListBox();

	updateSoftKeyLayout(exit, apply, login, mainLayout);
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	//editBoxLogin = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false);
	editBoxLogin = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Username:");
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, passlbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	//editBoxPass = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false);
	editBoxPass = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Password:");
	editBoxPass->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, emaillbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	//editBoxEmail = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false);
	editBoxEmail = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Email:");
	editBoxEmail->setDrawBackground(false);
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
	//kbShown = keyboard->isShown();
    locateItem(point);
}

void Login::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void Login::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (/*!kbShown && */right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (/*!kbShown &&*/ left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (mid) {
			keyPressEvent(MAK_FIRE);
		}

		if (!changed) {
			int yClick = point.y;
			//int keyboardY = keyboard->getPosition().y;

			int index = listBox->getSelectedIndex();
			/*if (list && (index == 1 || index == 3 || index == 5)) {
				int dispY = (int)floor((double)scrHeight - ((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER));
				if (index == 1 && (yClick < keyboardY + (scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER) || !(keyboard->isShown()))) {
					//keyboard->attachWidget(editBoxLogin);
				}
				else if (index == 3 && (yClick < keyboardY || !(keyboard->isShown()))) {
					//keyboard->attachWidget(editBoxPass);
					if (!((scrHeight - (editBoxPass->getPosition().y + editBoxPass->getHeight())) > scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER)) {
						dispY = 70;
					}
				}
				else if (index == 5 && (yClick < keyboardY || !(keyboard->isShown()))) {
					keyboard->attachWidget(editBoxEmail);
					if (!((scrHeight - (editBoxEmail->getPosition().y + editBoxEmail->getHeight())) > scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER)) {
						dispY = 70;
					}
				}
				//keyboard->setPosition(0, dispY);
				//keyboard->show();
			}
			else if (keyboard->isShown() && (yClick < keyboardY || yClick > keyboardY + (scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER))) {
				//keyboard->deAttachEditBox();
				//keyboard->hide();

				mainLayout->draw(true);
			}*/
		}
		else {
			changed = false;
		}
	}
	else {
		moved = 0;
		changed = false;
	}

	/*if (keyboard->isShown()) {
		listBox->setEnabled(false);
	}
	else {
		listBox->setEnabled(true);
	}*/
	//kbShown = false;
}

void Login::locateItem(MAPoint2d point)
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
			switch (screen) {
				case S_LOGIN:
					drawRegisterScreen();
					break;
				case S_REGISTER:
					drawLoginScreen();
					break;
			}
			break;
		case MAK_SOFTRIGHT:
			if (!isBusy) {
				switch (screen) {
					case S_LOGIN:
						if (editBoxLogin->getText()!="" & editBoxPass->getText()!="") {
							isBusy = true;
							notice->setCaption(loggingin);
							conCatenation = editBoxPass->getText().c_str();
							value = base64_encode(reinterpret_cast<const unsigned char*>(conCatenation.c_str()),conCatenation.length());
							feed->setEncrypt(value.c_str());
							feed->setUsername(editBoxLogin->getText().c_str());
							feed->setUnsuccessful(truesz);
							mHttp = HttpConnection(this);
							int res = mHttp.create(USER.c_str(), HTTP_GET);

							if(res < 0) {
								notice->setCaption(no_connect);
							} else {
								mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
								mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
								mHttp.finish();
							}
							conCatenation = "";
							value = "";
						} else {
							maVibrate(1000);
							notice->setCaption(no_user);
						}
						break;
					case S_REGISTER:
						notice->setCaption("");
						if (editBoxLogin->getText().length() < 6) {
							notice->setCaption(username_too_short);
							maVibrate(1000);
						}
						else if (editBoxPass->getText().length() < 6) {
							notice->setCaption(password_too_short);
							maVibrate(1000);
						}
						else if (editBoxEmail->getText().length() == 0) {
							notice->setCaption(enter_email);
							maVibrate(1000);
						}
						else if (!validateEmailAddress(editBoxEmail->getText())) {
							notice->setCaption(valid_email);
							maVibrate(1000);
						}
						else {
							response = "";
							isBusy = true;
							notice->setCaption(registering);

							char *url = NULL;
							//work out how long the url will be, the 2 is for the & and = symbols
							int urlLength = REGISTER.length() + strlen(xml_username) + editBoxLogin->getText().length()
									+ strlen(password) + editBoxPass->getText().length() + strlen(xml_email) + editBoxEmail->getText().length() + 6;
							url = new char[urlLength];
							memset(url,'\0',urlLength);
							sprintf(url, "%s&%s=%s&%s=%s&%s=%s", REGISTER.c_str(), xml_username, editBoxLogin->getText().c_str(),
									password, editBoxPass->getText().c_str(), xml_email, editBoxEmail->getText().c_str());
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
		case MAK_BACK:
		case MAK_SOFTLEFT:
			maExit(0);
			break;
		case MAK_UP:
			if (index-2 > 0) {
				listBox->setSelectedIndex(index-2);
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
		next = new MenuScreen(feed);
		next->show();
	} else if(!strcmp(name, xml_error)) {
		error = true;
		feed->setUnsuccessful(error_msg.c_str());
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, xml_response)) {
		isBusy = false;
		notice->setCaption(response);
	} else {
		if (!error) {
			if (notice != NULL) {
				notice->setCaption("");
			}
		}
	}
}
void Login::cleanup() {
//#if defined(MA_PROF_SUPPORT_STYLUS)
//	delete keyboard;
//#endif
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

void Login::mtxParseError() {
}

void Login::mtxEmptyTagEnd() {
}

void Login::mtxTagStartEnd() {
}
