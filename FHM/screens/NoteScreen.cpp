#include <mastdlib.h>

#include "NoteScreen.h"
#include "../utils/Util.h"
#include "../UI/Button.h"

NoteScreen::NoteScreen(MainScreen *previous, Feed *feed, Card *card, int screenType, String detail) : mHttp(this),
card(card), screenType(screenType), detail(detail) {
	lprintfln("NoteScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	this->feed = feed;
	moved = 0;
	list = false;
	left = false;
	right = false;
	isBusy = false;

	parentTag = "";
	note = "";
	encodedNote = "";
	origionalNote = "";
	currentSelectedKey = NULL;
	currentKeyPosition = -1;

	switch (screenType) {
		case ST_CARD_NOTE:
			mainLayout = Util::createMainLayout("Save", "Back", "", true);
			break;
		case ST_SMS:
			mainLayout = Util::createMainLayout("Send", "Back", "", true);
		break;
	}

	kinListBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];

	Layout *feedlayout;
	String cardText = "";
	switch (screenType) {
		case ST_CARD_NOTE:
			mImageCache = new ImageCache();


			cardText += card->getText();
			cardText += " (";
			cardText += card->getQuantity();
			cardText += ")\n";
			cardText += card->getRarity();
			cardText += "\nRating: ";
			cardText += card->getRanking();
			//cardText += "\nRarity: ";

			feedlayout = new Layout(0, 0, kinListBox->getWidth()-(PADDING*2), 74, kinListBox, 3, 1);
			feedlayout->setSkin(Util::getSkinAlbum());
			feedlayout->setDrawBackground(false);
			feedlayout->addWidgetListener(this);

			if (strcmp(card->getQuantity().c_str(), "0") != 0) {
				//if the user has one or more of the card, the image must be downloaded
				tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_LOADINGTHUMB));
				tempImage->setHasNote(card->getNote().length()>0);
				Util::retrieveThumb(tempImage, card, mImageCache);
			}
			else {
				//we use the blank image for cards they dont have yet
				tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_MISSINGTHUMB));
			}

			label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, Util::getDefaultFont());
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setAutoSizeY();
			label->setDrawBackground(false);
			label->setAutoSizeX();
			label->setMultiLine();
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Note", 0, Util::getDefaultFont());
			label->setDrawBackground(false);
			kinListBox->add(label);
			break;
		case ST_SMS:
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "SMS", 0, Util::getDefaultFont());
			label->setDrawBackground(false);
			kinListBox->add(label);
		break;
	}
	int height = 48;
	if((kinListBox->getHeight()-(feedlayout->getHeight()+48)) > 48){
		height = (kinListBox->getHeight()-(feedlayout->getHeight()+48));
	}
	label =  new Label(0,0, scrWidth-(PADDING*2), height, NULL, "", 0, Util::getDefaultFont());
	label->setSkin(Util::getSkinEditBox());
	Util::setPadding(label);

	editBoxNote = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2,140, MA_TB_TYPE_ANY, label, "",L"Note");
	editBoxNote->setDrawBackground(false);
	editBoxNote->setMaxLength(140);
	editBoxNote->setMultiLine(true);

	switch (screenType) {
		case ST_CARD_NOTE:
			editBoxNote->setCaption(Util::base64_decode(card->getNote()));
			break;
	}

	label->addWidgetListener(this);
	kinListBox->add(label);

	this->setMain(mainLayout);

	label->setSelected(true);
	kinListBox->setSelectedIndex(1);
}

NoteScreen::~NoteScreen() {
	lprintfln("~NoteScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	clearListBox();
	kinListBox->clear();
	delete mainLayout;
	mainLayout = NULL;

	parentTag = "";
	note = "";
	origionalNote = "";
	encodedNote = "";
	cardText = "";

	if(mImageCache!=NULL) {
		delete mImageCache;
		mImageCache = NULL;
	}
}
void NoteScreen::clearListBox() {
	Vector<Widget*> tempWidgets;
	for (int i = 0; i < kinListBox->getChildren().size(); i++) {
		tempWidgets.add(kinListBox->getChildren()[i]);
	}
	kinListBox->clear();
	kinListBox->getChildren().clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
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

		if (list) {
			//keyboard->attachWidget(editBoxNote);
			//keyboard->show();
			//editBoxNote->activate(this);
		}
	}
	else {
		moved = 0;
	}
}

void NoteScreen::locateItem(MAPoint2d point){
	list = false;
	left = false;
	right = false;

    Point p;
    p.set(point.x, point.y);
    /*for(int i = 0; i < (this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()).size(); i++)
    {
        if(this->getMain()->getChildren()[0]->getChildren()[2]->getChildren()[i]->contains(p))
        {
        	if (moved <= 1) kinListBox->setSelectedIndex(i);
        	list = true;
            return;
        }
    }*/
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
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];
	switch(keyCode) {
		case MAK_SOFTLEFT:
			note = editBoxNote->getCaption();
			switch (screenType) {
				case ST_CARD_NOTE:
					if (!isBusy) {
						isBusy = true;
						if (note.length() > 0) {
							encodedNote = Util::base64_encode(reinterpret_cast<const unsigned char*>(note.c_str()),note.length());
							card->setNote(encodedNote.c_str());
							//work out how long the url will be, the 15 is for the & and = symbals, as well as hard coded parameters
							int urlLength = 46 + URLSIZE + encodedNote.length() + card->getId().length();
							char *url = new char[urlLength+1];
							memset(url,'\0',urlLength+1);
							sprintf(url, "%s?savenote=%s&cardid=%s", URL, encodedNote.c_str(), card->getId().c_str());
							lprintfln("%s", url);
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
								feed->addHttp();
								mHttp.finish();
								notice->setCaption("Updating note...");
							}
							delete [] url;
							url = NULL;
						} else {
							notice->setCaption("Nothing to save.");
						}
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
			clearListBox();
			previous->show();
			break;
		case MAK_FIRE:
			if(currentSoftKeys->getChildren()[0]->isSelected()){
				keyPressEvent(MAK_SOFTLEFT);
			}else if(currentSoftKeys->getChildren()[2]->isSelected()){
				keyPressEvent(MAK_SOFTRIGHT);
			}
			break;
		case MAK_UP:
			if(currentSelectedKey!=NULL){
				currentSelectedKey->setSelected(false);
				currentSelectedKey = NULL;
				currentKeyPosition = -1;
				kinListBox->getChildren()[kinListBox->getChildren().size()-1]->setSelected(true);
			}
			break;
		case MAK_DOWN:
			if(currentSelectedKey==NULL){
				kinListBox->getChildren()[kinListBox->getChildren().size()-1]->setSelected(false);
				for(int i = 0; i < currentSoftKeys->getChildren().size();i++){
					if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
						currentKeyPosition=i;
						currentSelectedKey= currentSoftKeys->getChildren()[i];
						currentSelectedKey->setSelected(true);
						break;
					}
				}
			}
			break;
		case MAK_LEFT:
			if(currentSelectedKey!=NULL){
				if(currentKeyPosition > 0){
					currentKeyPosition = currentKeyPosition - 1;
					for(int i = currentKeyPosition; i >= 0;i--){
						if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
							currentSelectedKey->setSelected(false);
							currentKeyPosition=i;
							currentSelectedKey= currentSoftKeys->getChildren()[i];
							currentSelectedKey->setSelected(true);
							break;
						}
					}
				}
			}
			break;
		case MAK_RIGHT:
			if(currentSelectedKey!=NULL){
				if(currentKeyPosition+1 < currentSelectedKey->getParent()->getChildren().size()){
					currentKeyPosition = currentKeyPosition + 1;
					for(int i = currentKeyPosition; i < currentSoftKeys->getChildren().size();i++){
						if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
							currentSelectedKey->setSelected(false);
							currentKeyPosition=i;
							currentSelectedKey= currentSoftKeys->getChildren()[i];
							currentSelectedKey->setSelected(true);
							break;
						}
					}
				}
			}
			break;
	}
}

void NoteScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		feed->remHttp();
		notice->setCaption("Unable to connect, try again later...");
		isBusy = false;
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
