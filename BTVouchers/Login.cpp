#include <mastdlib.h>
#include <MAUtil/mauuid.h>

#include "Login.h"
#include "Util.h"
#include "AlbumLoadScreen.h"
#include "common.h"

static const MABtAddr sAddress = { { 0x00,0x18,0xC5,0x3F,0x74,0x7E } };
static const MAUUID sUuid = SERVER_MAUUID_DECL;

Login::Login(Feed *feed) : feed(feed), mConn(this) {
	mIsBusy = false;
	mainLayout = createMainLayout(exit, login);

	mainLayout->setDrawBackground(TRUE);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[2];

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlbl, 0, gFontWhite);
	listBox->add(label);

	label = createEditLabel("");
	editBoxLogin = new EditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, "", 0, gFontBlue, true, false);
	editBoxLogin->setInputMode(EditBox::IM_NUMBERS);
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
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

/********
 *
 * START BLUETOOTH
 *
 *******/

void Login::connect(MABtAddr address, MAUUID service)
{
    mConn.connect(address, service);
}

void Login::btNewDevice(const BtDevice &dev) {
	char mBuffer[255];
	sprintf(mBuffer, "Found new device %s", dev.name.c_str());
	label->setCaption(mBuffer);
	if(!strcmp(dev.name.c_str(), "MOBI-MYTCG")) {
		label->setCaption("Identified possible server");
		mDevices.add(dev);
	}
}

void Login::btDeviceDiscoveryFinished(int state) {
	mIsBusy = false;
	mDeviceIndex = 0;
	if (mDevices.size() > 0) {
		mDevice = &mDevices[mDeviceIndex++];
		connect(mDevice->address, sUuid);
	} else {
		label->setCaption("No server connections founds");
	}
}

/********
 *
 * END BLUETOOTH
 *
 *******/

void Login::keyPressEvent(int keyCode) {
	error = false;
	int index = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_FIRE:
			break;
		case MAK_SOFTRIGHT:
			editBoxLogin->setText("0722627309");

			if (!mIsBusy) {
				mIsBusy = true;
				mDiscoverer = new BluetoothDiscoverer();
				char mBuffer[255];
				sprintf(mBuffer, "Starting Device Discovery [%d]", mDiscoverer->startDeviceDiscovery(this, true));
				label->setCaption(mBuffer);
			}
			break;
		case MAK_SOFTLEFT:
			maExit(0);
			break;
		case MAK_UP:
		case MAK_DOWN:
			listBox->setSelectedIndex(1);
			break;
		case MAK_LEFT:
			break;
	}
}

void Login::connectFinished(MAUtil::Connection* http, int result) {
	if ((result == 200)||(result == 1)) {
		mConn.write(editBoxLogin->getText().c_str(), editBoxLogin->getText().size());
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this, label);
	} else if (result == 20) {
		if (mDevices.size() > mDeviceIndex) {
			mDevice = &mDevices[mDeviceIndex++];
			connect(mDevice->address, sUuid);
		}
	} else {
		//mHttp.close();
		label->setCaption(no_connect);
		mIsBusy = false;
	}
}

void Login::connWriteFinished(MAUtil::Connection* conn, int result) {}

void Login::connReadFinished(Connection* conn, int result) {}

void Login::xcConnError(int code) {
	mIsBusy = false;
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

	} else if(!strcmp(parentTag.c_str(), xml_email)) {

	} else if(!strcmp(parentTag.c_str(), xml_handle)) {

	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg = data;
	}
}

void Login::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_status)) {
		feed->setUnsuccessful(success);
		feed->setTouch(touch.c_str());
		username,error_msg= "";
		saveData(FEED, feed->getAll().c_str());
		feed->setAlbum(getData(ALBUM));
		next = new AlbumLoadScreen(feed);
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

