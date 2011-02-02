#include <mastdlib.h>

#include "Login.h"
#include "../utils/Util.h"
#include "MenuScreen.h"

Login::Login(Feed *feed) : mHttp(this), feed(feed) {
	isBusy = false;
	mainLayout = createMainLayout(exit, login);

	mainLayout->setDrawBackground(TRUE);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[2];

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlbl, 0, gFontWhite);
	listBox->add(label);

	label = createEditLabel("");
	//editBoxLogin = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false);
	editBoxLogin = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, /*"admin"*/"sollie", 0, gFontBlack, true, false);
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, passlbl, 0, gFontWhite);
	listBox->add(label);

	label = createEditLabel("");
	//editBoxPass = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlack, true, false);
	editBoxPass = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, /*"1qazxsw2"*/"aaaaaa", 0, gFontBlack, true, false);
	editBoxPass->setDrawBackground(false);
	label->addWidgetListener(this);

	keyboard = new MobKeyboard(0, (int)floor((double)scrHeight - ((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER)),
			scrWidth, (int)floor((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER));
	listBox->add(label);

	label = new Label(0,0, scrWidth, scrHeight/8, NULL, "", 0, gFontWhite);
	label->setMultiLine(true);
	listBox->add(label);

	listBox->setSelectedIndex(1);

	if (feed->getUnsuccessful() != success) {
		label->setCaption(feed->getUnsuccessful());
	}
	touch = falsesz;
	this->setMain(mainLayout);
}

Login::~Login() {}

void Login::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}

void Login::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void Login::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void Login::pointerReleaseEvent(MAPoint2d point)
{
	if (!(keyboard->isShown()) && right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (!(keyboard->isShown()) && left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}

	int yClick = point.y;
	int keyboardY = keyboard->getPosition().y;

	int index = listBox->getSelectedIndex();
	if (list && (index == 1 || index == 3)) {
		int dispY = (int)floor((double)scrHeight - ((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER));
		if (index == 1 && (yClick > keyboardY + (scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER) || !(keyboard->isShown()))) {
			keyboard->attachWidget(editBoxLogin);
		}
		else if (index == 3 && (yClick < keyboardY || !(keyboard->isShown()))) {
			keyboard->attachWidget(editBoxPass);
			if (!((scrHeight - (editBoxPass->getPosition().y + editBoxPass->getHeight())) > scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER)) {
				dispY = 70;
			}
		}
		keyboard->setPosition(0, dispY);
		keyboard->show();
	}
	else if (keyboard->isShown() && (yClick < keyboardY || yClick > keyboardY + (scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER))) {
		keyboard->deAttachEditBox();
		keyboard->hide();

		mainLayout->draw(true);
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

    Point p;
    p.set(point.x, point.y);
    for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
    {
        if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
        {
        	((ListBox *)this->getMain()->getChildren()[0]->getChildren()[2])->setSelectedIndex(i);
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
			} else if (i == 2) {
				right = true;
			}
			return;
		}
	}
}

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
			break;
		case MAK_SOFTRIGHT:
			if (!isBusy) {
				isBusy = true;
				label->setCaption(loggingin);
				if (editBoxLogin->getText()!="" & editBoxPass->getText()!="") {
					conCatenation = editBoxPass->getText().c_str();
					ret = "";
					value = base64(reinterpret_cast<const unsigned char*>(conCatenation.c_str()),conCatenation.length());
					feed->setEncrypt(value.c_str());
					feed->setUsername(editBoxLogin->getText().c_str());
					feed->setUnsuccessful(truesz);
					mHttp = HttpConnection(this);
					int res = mHttp.create(USER.c_str(), HTTP_GET);

					if(res < 0) {
						label->setCaption(no_connect);
						label->setMultiLine(true);
					} else {
						mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
						mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
						mHttp.finish();
					}
					conCatenation = "";
					value = "";
				} else {
					isBusy = false;
					maVibrate(1000);
					label->setCaption(no_user);
					label->setMultiLine(true);
				}
			}
			break;
		case MAK_SOFTLEFT:
			maExit(0);
			break;
		case MAK_UP:
		case MAK_DOWN:
			if (index == 1) {
				listBox->setSelectedIndex(3);
			} else if (index == 3) {
				listBox->setSelectedIndex(1);
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
		label->setCaption(no_connect);
		isBusy = false;
	}
}

void Login::connReadFinished(Connection* conn, int result) {}

void Login::xcConnError(int code) {
	isBusy = false;
	//cleanup();
	//delete &xmlConn;
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
	}
}

void Login::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_status)) {
		feed->setCredits(credits.c_str());
		feed->setHandle(handle.c_str());
		feed->setEmail(email.c_str());
		feed->setUnsuccessful(success);
		feed->setTouch(touch.c_str());
		username,error_msg= "";
		saveData(FEED, feed->getAll().c_str());
		feed->setAlbum(getData(ALBUM));
		next = new MenuScreen(feed);
		next->show();
	} else if(!strcmp(name, xml_error)) {
		error = true;
		feed->setUnsuccessful(error_msg.c_str());
		label->setCaption(error_msg.c_str());
	} else {
		if (!error) {
			if (label != NULL) {
				label->setCaption("");
			}
		}
	}
}
void Login::cleanup() {
	//delete label;
	//delete editBoxLogin;
	//delete editBoxPass;
	delete keyboard;
	//delete listBox;
	delete mainLayout;
	//delete image;
	//delete softKeys;





	/*mainLayout->getChildren().clear();
	listBox->getChildren().clear();
	softKeys->getChildren().clear();

	delete editBoxLogin;
	delete editBoxPass;
	delete keyboard;
	delete image;
	delete softKeys;*/
	parentTag = "";
	conCatenation = "";
	ret = "";
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
	j = 0;
}

void Login::mtxParseError() {
}

void Login::mtxEmptyTagEnd() {
}

void Login::mtxTagStartEnd() {
}

String Login::base64(unsigned char const* bytes_to_encode, unsigned int in_len) {
	/* Copyright (C) 2004-2008 René Nyffenegger

	   This source code is provided 'as-is', without any express or implied
	   warranty. In no event will the author be held liable for any damages
	   arising from the use of this software.

	   Permission is granted to anyone to use this software for any purpose,
	   including commercial applications, and to alter it and redistribute it
	   freely, subject to the following restrictions:

	   1. The origin of this source code must not be misrepresented; you must not
		  claim that you wrote the original source code. If you use this source code
		  in a product, an acknowledgment in the product documentation would be
		  appreciated but is not required.

	   2. Altered source versions must be plainly marked as such, and must not be
		  misrepresented as being the original source code.

	   3. This notice may not be removed or altered from any source distribution.

	   René Nyffenegger rene.nyffenegger@adp-gmbh.ch */

	unsigned char char_array_3[3];
	unsigned char char_array_4[4];

	ret += "";
	int i = 0;
	while (in_len--) {
		char_array_3[i++] = *(bytes_to_encode++);
		if (i == 3) {
			char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
			char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
			char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
			char_array_4[3] = char_array_3[2] & 0x3f;
			for(i = 0; (i <4) ; i++) {
				ret += base64_chars[char_array_4[i]];
			}
			i = 0;
		}
	}
	if (i) {
		for(j = i; j < 3; j++)
			char_array_3[j] = '\0';
			char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
			char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
			char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
			char_array_4[3] = char_array_3[2] & 0x3f;

			for (j = 0; (j < i + 1); j++)
				ret += base64_chars[char_array_4[j]];

		while((i++ < 3))
		ret += '=';
	}
	return ret;
}
