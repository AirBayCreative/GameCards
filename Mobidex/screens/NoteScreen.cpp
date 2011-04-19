#include <mastdlib.h>

#include "NoteScreen.h"
#include "../utils/Util.h"

NoteScreen::NoteScreen(Screen *previous, Feed *feed, Card *card, int screenType, String detail) : mHttp(this), previous(previous),
feed(feed), card(card), screenType(screenType), detail(detail) {
	moved = 0;
	list = false;
	left = false;
	right = false;
	isBusy = false;
	kbShown = false;

	parentTag = "";
	note = "";
	encodedNote = "";
	origionalNote = "";

	switch (screenType) {
		case ST_CARD_NOTE:
			mainLayout = createMainLayout(back, savelbl, "", true);
			break;
		case ST_SMS:
			mainLayout = createMainLayout(back, sendlbl, "", true);
		break;
	}

	listBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];
	setPadding(listBox);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	switch (screenType) {
		case ST_CARD_NOTE:
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, notelbl, 0, gFontBlack);
			listBox->add(label);
			break;
		case ST_SMS:
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, smslbl, 0, gFontBlack);
			listBox->add(label);
		break;
	}

	label =  new Label(0,0, scrWidth-(PADDING*2), (listBox->getHeight()-24-(PADDING)), NULL, "", 0, gFontBlack);
	label->setSkin(gSkinEditBox);
	setPadding(label);
	editBoxNote = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight(), label, "", 0, gFontBlack, true, true, 140);
	editBoxNote->setDrawBackground(false);

	switch (screenType) {
		case ST_CARD_NOTE:
			editBoxNote->setText(base64_decode(card->getNote()));
			break;
	}

	label->addWidgetListener(this);
	listBox->add(label);

	this->setMain(mainLayout);

	editBoxNote->setSelected(true);
	listBox->setSelectedIndex(1);

#if defined(MA_PROF_SUPPORT_STYLUS)
	keyboard = new MobKeyboard(0, (int)floor((double)scrHeight - ((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER)),
		scrWidth, (int)floor((double)scrHeight * VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER));
#endif
}

NoteScreen::~NoteScreen() {
#if defined(MA_PROF_SUPPORT_STYLUS)
	delete keyboard;
#endif
	delete mainLayout;

	parentTag = "";
	note = "";
	origionalNote = "";
	encodedNote = "";
}

#if defined(MA_PROF_SUPPORT_STYLUS)
void NoteScreen::pointerPressEvent(MAPoint2d point)
{
	kbShown = keyboard->isShown();
    locateItem(point);
}

void NoteScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void NoteScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (!kbShown && right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (!kbShown && left) {
			keyPressEvent(MAK_SOFTLEFT);
		}

		if (list) {
			keyboard->attachWidget(editBoxNote);
			keyboard->show();
		}
		else if (!kbShown) {
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

void NoteScreen::locateItem(MAPoint2d point)
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
			} else if (i == 2) {
				right = true;
			}
			return;
		}
	}
}
#endif

void NoteScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_SOFTRIGHT:
			note = editBoxNote->getCaption();
			switch (screenType) {
				case ST_CARD_NOTE:
					if (!isBusy) {
						isBusy = true;
						encodedNote = base64_encode(reinterpret_cast<const unsigned char*>(note.c_str()),note.length());
						card->setNote(encodedNote.c_str());
						//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
						int urlLength = SAVENOTE.length() + encodedNote.length() + strlen(xml_cardid) + card->getId().length() + 4;
						char *url = new char[urlLength];
						memset(url,'\0',urlLength);
						sprintf(url, "%s%s&%s=%s", SAVENOTE.c_str(), encodedNote.c_str(), xml_cardid, card->getId().c_str());
						if(mHttp.isOpen()){
							mHttp.close();
						}
						mHttp = HttpConnection(this);
						int res = mHttp.create(url, HTTP_GET);
						if(res < 0) {
							notice->setCaption("Error updating note");
						} else {
							mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
							mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
							mHttp.finish();
							notice->setCaption("Updating note...");
						}
						delete [] url;
					}
					break;
				case ST_SMS:
					if (note.length() > 0) {
						maSendTextSMS(detail.c_str(), note.c_str());
					}
				break;
			}
			break;
		case MAK_SOFTLEFT:
			previous->show();
			break;
	}
}

void NoteScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption(no_connect);
		isBusy = false;
	}
}

void NoteScreen::connReadFinished(Connection* conn, int result) {}

void NoteScreen::xcConnError(int code) {
	isBusy = false;
}

void NoteScreen::mtxEncoding(const char* ) {
}

void NoteScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void NoteScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void NoteScreen::mtxTagData(const char* data, int len) {
}

void NoteScreen::mtxTagEnd(const char* name, int len) {
	isBusy = false;
	notice->setCaption("Note Updated.");
}

void NoteScreen::mtxParseError() {
}

void NoteScreen::mtxEmptyTagEnd() {
}

void NoteScreen::mtxTagStartEnd() {
}
