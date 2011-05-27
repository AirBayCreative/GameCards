#include <mastdlib.h>

#include "Login.h"
#include "../utils/Util.h"
#include "AlbumLoadScreen.h"

Login::Login(Feed *feed, Screen *previous, int screen) : mHttp(this), feed(feed), prev(previous), screen(screen) {
	moved = 0;
	isBusy = false;

	response = "";

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
	screen = S_LOGIN;
	clearListBox();

	updateSoftKeyLayout(back, login, "", mainLayout);
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlbl, 0, gFontWhite);
	listBox->add(label);

	label = createEditLabel("");
	editBoxLogin = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Username:");
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, passlbl, 0, gFontWhite);
	listBox->add(label);

	label = createEditLabel("");
	editBoxPass = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Password:");
	editBoxPass->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	listBox->setSelectedIndex(1);
}

void Login::drawRegisterScreen() {
	listBox->setYOffset(0);
	moved = 0;
	screen = S_REGISTER;
	clearListBox();

	updateSoftKeyLayout(back, reg, "", mainLayout);
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlbl, 0, gFontWhite);
	listBox->add(label);

	label = createEditLabel("");
	editBoxLogin = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Username:");
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, passlbl, 0, gFontWhite);
	listBox->add(label);

	label = createEditLabel("");
	editBoxPass = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Password:");
	editBoxPass->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, fullNamelbl, 0, gFontWhite);
	listBox->add(label);

	label = createEditLabel("");
	editBoxFullname = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Full Name:");
	editBoxFullname->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, cellNumberlbl, 0, gFontWhite);
	listBox->add(label);

	label = createEditLabel("");
	editBoxCell = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Cell Number:");
	editBoxCell->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, emaillbl, 0, gFontWhite);
	listBox->add(label);

	label = createEditLabel("");
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
						else if (editBoxFullname->getText().length() < 1) {
							notice->setCaption(enter_name);
							maVibrate(1000);
						}
						else if (editBoxCell->getText().length() < 10) {
							notice->setCaption(cell_too_short);
							maVibrate(1000);
						}
						else if (editBoxEmail->getText().length() < 1) {
							notice->setCaption(enter_email);
							maVibrate(1000);
						}
						else {
							response = "";
							isBusy = true;
							notice->setCaption(registering);

							String encodedName = base64_encode(reinterpret_cast<const unsigned char*>(editBoxFullname->getText().c_str()),
									editBoxFullname->getText().length());
							char *url = NULL;
							//work out how long the url will be, the 10 is for the & and = symbols
							int urlLength = REGISTER.length() + strlen(reg_name) + encodedName.length()
									+ strlen(reg_username) + editBoxLogin->getText().length() + strlen(reg_cell) + editBoxCell->getText().length()
									+ strlen(password) + editBoxPass->getText().length() + strlen(reg_email) + editBoxEmail->getText().length() + 10;
							url = new char[urlLength];
							memset(url,'\0',urlLength);
							sprintf(url, "%s&%s=%s&%s=%s&%s=%s&%s=%s&%s=%s", REGISTER.c_str(), reg_name, encodedName.c_str(),
									reg_username, editBoxLogin->getText().c_str(), reg_cell, editBoxCell->getText().c_str(),
									password, editBoxPass->getText().c_str(), reg_email, editBoxEmail->getText().c_str());
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
							encodedName = "";
						}
						break;
				}
			}
			break;
		case MAK_BACK:
		case MAK_SOFTLEFT:
			prev->show();
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
	} else if (!strcmp(parentTag.c_str(), xml_result)) {
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
	} else if (!strcmp(name, xml_result)) {
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

		feed->setEncrypt(base64_encode(reinterpret_cast<const unsigned char*>(editBoxPass->getText().c_str()), editBoxPass->getText().length()).c_str());
		feed->setUsername(editBoxLogin->getText().c_str());
		feed->setCredits("0");
		feed->setHandle("");
		feed->setEmail(editBoxEmail->getText().c_str());
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
