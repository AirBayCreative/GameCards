#include <mastdlib.h>

#include "NoteScreen.h"
#include "../utils/Util.h"

NoteScreen::NoteScreen(Screen *previous, Feed *feed, Card *card, int screenType, String detail) : mHttp(this), previous(previous),
feed(feed), card(card), screenType(screenType), detail(detail) {
	lprintfln("NoteScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	moved = 0;
	left = false;
	right = false;
	isBusy = false;

	parentTag = "";
	note = "";
	encodedNote = "";
	origionalNote = "";

	switch (screenType) {
		case ST_CARD_NOTE:
			mainLayout = Util::createMainLayout("Save", "Back", true);
			break;
		case ST_SMS:
			mainLayout = Util::createMainLayout("Share", "Back", true);
		break;
	}

	listBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];
	//Util::setPadding(listBox);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	switch (screenType) {
		case ST_CARD_NOTE:
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Personal Note", 0, Util::getDefaultFont());
			listBox->add(label);
			break;
		case ST_SMS:
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "SMS", 0, Util::getDefaultFont());
			listBox->add(label);
		break;
	}

	label =  new Label(0,0, scrWidth-(PADDING*2), (listBox->getHeight()-24-(PADDING)), NULL, "", 0, Util::getDefaultFont());
	label->setSkin(Util::getSkinEditBox());
	Util::setPadding(label);
	editBoxNote = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2,140, MA_TB_TYPE_ANY, label, "",L"Note:");
	editBoxNote->setDrawBackground(false);
	editBoxNote->setMaxLength(140);
	editBoxNote->setMultiLine(true);

	switch (screenType) {
		case ST_CARD_NOTE:
			editBoxNote->setText(Util::base64_decode(card->getNote()));
			break;
	}

	label->addWidgetListener(this);
	listBox->add(label);

	this->setMain(mainLayout);

	editBoxNote->setSelected(true);
	listBox->setSelectedIndex(1);
}

NoteScreen::~NoteScreen() {
	delete mainLayout;

	parentTag = "";
	note = "";
	origionalNote = "";
	encodedNote = "";
}

void NoteScreen::pointerPressEvent(MAPoint2d point)
{
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
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		}
	}
	else {
		moved = 0;
	}
}

void NoteScreen::locateItem(MAPoint2d point)
{
	left = false;
	right = false;

    Point p;
    p.set(point.x, point.y);
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

void NoteScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}

void NoteScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_SOFTLEFT:
			note = editBoxNote->getCaption();
			switch (screenType) {
				case ST_CARD_NOTE:
					if (!isBusy) {
						isBusy = true;
						encodedNote = Util::base64_encode(reinterpret_cast<const unsigned char*>(note.c_str()),note.length());
						card->setNote(encodedNote.c_str());
						//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
						int urlLength = 46 + URLSIZE + encodedNote.length() + card->getId().length();
						char *url = new char[urlLength];
						memset(url,'\0',urlLength);
						sprintf(url, "%s?savenote=%s&cardid=%s", URL, encodedNote.c_str(), card->getId().c_str());
						if(mHttp.isOpen()){
							mHttp.close();
						}
						mHttp = HttpConnection(this);
						int res = mHttp.create(url, HTTP_GET);
						if(res < 0) {
							notice->setCaption("Error updating note");
						} else {
							mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
							mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
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
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			editBoxNote->setSelected(false);
			editBoxNote->disableListener();
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
		notice->setCaption("Unable to connect, try again later...");
		isBusy = false;
		feed->remHttp();
	}
}

void NoteScreen::connReadFinished(Connection* conn, int result) {}

void NoteScreen::xcConnError(int code) {
	feed->remHttp();
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

void NoteScreen::mtxParseError(int) {
}

void NoteScreen::mtxEmptyTagEnd() {
}

void NoteScreen::mtxTagStartEnd() {
}
