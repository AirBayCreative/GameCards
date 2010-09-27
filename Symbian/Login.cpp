#include "Header.h"
#include <mastdlib.h>


Login::Login(Feed *feed) : mHttp(this), feed(feed) {
	mainLayout = createMainLayout(exit, login);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[2];

	errorLabel = new Label(0,0, scrWidth, scrHeight/8, NULL, blank, 0, gFontWhite);
	errorLabel->setSkin(gSkinBack);

	int val = 48;

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlbl, 0, gFontWhite);
	label->setSkin(gSkinBack);

	labelLogin = createEditLabel(blank, val);
	editBoxLogin = new EditBox(0, 6, labelLogin->getWidth()-PADDING*2, val-PADDING*2, labelLogin, blank, 0, gFontBlack, true, false);
	editBoxLogin->setDrawBackground(false);
	labelLogin->addWidgetListener(this);

	listBox->add(label);
	listBox->add(labelLogin);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, passlbl, 0, gFontWhite);
	label->setSkin(gSkinBack);

	labelPass = createEditLabel(blank, val);
	editBoxPass = new EditBox(0, 6, labelPass->getWidth()-PADDING*2, val-PADDING*2, labelPass, blank, 0, gFontBlack, true, false);
	editBoxPass->setDrawBackground(false);
	editBoxPass->setPasswordMode(true);
	labelPass->addWidgetListener(this);

	listBox->add(label);
	listBox->add(labelPass);
	listBox->add(errorLabel);

	editBoxLogin->setText(blank);
	editBoxPass->setText(blank);

	listBox->setSelectedIndex(1);

	if (feed->getUnsuccessful() != success) {
		errorLabel->setCaption(feed->getUnsuccessful());
	}

	this->setMain(mainLayout);
}

Login::~Login() {
}

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
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void Login::locateItem(MAPoint2d point)
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
		case MAK_SOFTRIGHT:
			errorLabel->setCaption(loggingin);
			if (editBoxLogin->getText()==blank) {
			}
			editBoxPass->setPasswordMode(false);
			if (editBoxLogin->getText()!=blank & editBoxPass->getText()!=blank) {

				editBoxPass->setPasswordMode(false);
				conCatenation = editBoxPass->getText().c_str();
				editBoxPass->setText(convertAsterisk.c_str());
				editBoxPass->setPasswordMode(true);
				ret = blank;
				value = base64(reinterpret_cast<const unsigned char*>(conCatenation.c_str()),conCatenation.length());
				feed->setEncrypt(value.c_str());
				feed->setUsername(editBoxLogin->getText().c_str());
				feed->setUnsuccessful(truesz);
				int res = mHttp.create(USER.c_str(), HTTP_GET);
				mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
				mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
				if(res < 0) {
					errorLabel->setCaption(no_connect);
					errorLabel->setMultiLine(true);
				} else {
					mHttp.finish();
				}
				conCatenation = blank;
				value = blank;
			} else {
				maVibrate(1000);
				errorLabel->setCaption(no_user);
				errorLabel->setMultiLine(true);
			}
			editBoxPass->setPasswordMode(true);
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
		errorLabel->setCaption(no_connect);
	}
}

void Login::connReadFinished(Connection* conn, int result) {}

void Login::xcConnError(int code) {

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

void Login::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_status)) {
		feed->setCredits(credits.c_str());
		feed->setHandle(handle.c_str());
		feed->setEmail(email.c_str());
		feed->setUnsuccessful(success);
		username,error_msg= blank;
		saveData(FEED, feed->getAll().c_str());
		feed->setAlbum(getData(ALBUM));
		menu = new MenuScreen(feed);
		menu->show();
	} else if(!strcmp(name, xml_error)) {
		error = true;
		//errorLabel->setCaption(error_msg.c_str());
		feed->setUnsuccessful(error_msg.c_str());
		menu = new Login(feed);
		menu->show();
	} else {
		if (!error) {
			errorLabel->setCaption(blank);
		}
	}
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
	lprintfln("5");
	return ret;
}
