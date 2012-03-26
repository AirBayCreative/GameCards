#include "NewDeckScreen.h"
/*#include "DeckListScreen.h"*/
#include "EditDeckScreen.h"
#include "AlbumLoadScreen.h"
#include "../utils/Util.h"

NewDeckScreen::NewDeckScreen(MainScreen *previous, Feed *feed):mHttp(this) {
	this->previous = previous;
	this->feed = feed;
	lprintfln("NewDeckScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	listBox = NULL;
	layout= NULL;

	deckName = "";
	errorString = "";
	parentTag = "";
	createResult = "";
	deckId = "";

	editBoxName = NULL;
	album = NULL;
	next = NULL;

	busy = false;
	empty = false;

	layout = Util::createMainLayout("", "Back", true);
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];
	listBox = (KineticListBox*)layout->getChildren()[0]->getChildren()[2];

	drawEnterNameScreen();

	this->setMain(layout);

	mHttp = HttpConnection(this);

	this->setMain(layout);
}
void NewDeckScreen::menuOptionSelected(int index) {
	this->show();
	editBoxName->disableListener();
	((AlbumLoadScreen*)previous)->refresh();
	//editBoxNote->setSelected(true);
	//editBoxNote->enableListener();
}

NewDeckScreen::~NewDeckScreen() {
	if (next != NULL) {
		delete next;
		next = NULL;
	}

	delete layout;
	layout = NULL;

	for (int i = 0; i < albums.size(); i++) {
		delete albums[i];
		albums[i] = NULL;
	}
	albums.clear();

	deckName = "";
	errorString = "";
	parentTag = "";
	createResult = "";
	deckId = "";
}

void NewDeckScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void NewDeckScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void NewDeckScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		}
	}
	moved = 0;
}

void NewDeckScreen::locateItem(MAPoint2d point)
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
        	list = true;
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

void NewDeckScreen::keyPressEvent(int keyCode) {
	int ind = listBox->getSelectedIndex();
	int max = listBox->getChildren().size();
	switch(keyCode) {
		case MAK_SOFTRIGHT:
		case MAK_BACK:
			editBoxName->disableListener();
			((AlbumLoadScreen*)previous)->refresh();
			break;
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			validateInput();
			if (errorString.length() > 0) {
				notice->setCaption(errorString);
			}
			else {
				notice->setCaption("Creating album...");

				busy = true;

				String base64DeckName = Util::base64_encode(reinterpret_cast<const unsigned char*>(editBoxName->getCaption().c_str()),
													strlen(editBoxName->getCaption().c_str()));

				int urlLength = URLSIZE + strlen("?createdeck=1") + strlen("description") + 4 +
						base64DeckName.length();
				char *url = new char[urlLength+1];
				memset(url,'\0',urlLength+1);
				sprintf(url, "%s?createdeck=1&description=%s", URL_PHONE.c_str(), base64DeckName.c_str());

				if(mHttp.isOpen()){
					mHttp.close();
				}
				mHttp = HttpConnection(this);

				int res = mHttp.create(url, HTTP_GET);

				if(res < 0) {
					notice->setCaption("");
				} else {
					mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
					mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
					feed->addHttp();
					mHttp.finish();
				}

				if (url != NULL) {
					delete url;
					url = NULL;
				}
				base64DeckName = "";
			}
			break;
		case MAK_DOWN:
			if (ind == max-1) {
				listBox->setSelectedIndex(0);
			} else {
				listBox->selectNextItem();
			}
			break;
		case MAK_UP:
			if (ind == 0) {
				listBox->setSelectedIndex(max-1);
			} else {
				listBox->selectPreviousItem();
			}
			break;
	}
}

void NewDeckScreen::validateInput() {
	errorString = "";

	if (editBoxName->getText().length() == 0) {
		errorString = "Please enter a name for the deck.";
	}
}

void NewDeckScreen::selectionChanged(Widget *widget, bool selected) {
	/*switch (phase) {
		case P_CATEGORY:
			if(selected) {
				((Label *)widget)->setFont(Util::getDefaultSelected());
			} else {
				((Label *)widget)->setFont(Util::getDefaultFont());
			}
			break;
	}*/
}

void NewDeckScreen::drawEnterNameScreen() {
	clearListBox();
	Util::updateSoftKeyLayout("Continue", "Back", "", layout);

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Album Name", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxName = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Deck Name");
	editBoxName->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	editBoxName->setSelected(true);
}

void NewDeckScreen::clearListBox() {
	Vector<Widget*> tempWidgets;
	for (int i = 0; i < listBox->getChildren().size(); i++) {
		tempWidgets.add(listBox->getChildren()[i]);
	}
	listBox->clear();
	listBox->getChildren().clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
}

void NewDeckScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		notice->setCaption("Unable to connect, try again later...");
		busy = false;
		mHttp.close();
		feed->remHttp();
	}
}

void NewDeckScreen::connReadFinished(Connection* conn, int result) {}

void NewDeckScreen::xcConnError(int code) {
	feed->remHttp();
	busy = false;

	editBoxName->disableListener();
	//next->show();
}

void NewDeckScreen::mtxEncoding(const char* ) {
}

void NewDeckScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void NewDeckScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void NewDeckScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "result")) {
		createResult += data;
	} else if(!strcmp(parentTag.c_str(), "deck_id")) {
		deckId += data;
	}
}

void NewDeckScreen::mtxTagEnd(const char* name, int len) {
	if (!strcmp(name, "result")) {
		busy = false;
		MenuScreen *confirmation = new MenuScreen(RES_BLANK,createResult.c_str());
		confirmation->setMenuWidth(120);
		confirmation->setMarginX(5);
		confirmation->setMarginY(5);
		confirmation->setDock(MenuScreen::MD_CENTER);
		confirmation->setListener(this);
		confirmation->setMenuFontSel(Util::getDefaultFont());
		confirmation->setMenuFontUnsel(Util::getDefaultFont());
		confirmation->setMenuSkin(Util::getSkinDropDownItem());
		confirmation->addItem("Ok");
		confirmation->show();
		//delete confirmation;
		notice->setCaption("");
		createResult = "";

		//next = new EditDeckScreen(previous, feed, deckId);
	}
}

void NewDeckScreen::mtxParseError(int) {
}

void NewDeckScreen::mtxEmptyTagEnd() {
}

void NewDeckScreen::mtxTagStartEnd() {
}
