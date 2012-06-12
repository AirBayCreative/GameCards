#include "NewDeckScreen.h"
#include "DeckListScreen.h"
#include "EditDeckScreen.h"
#include "../utils/Util.h"
#include "../UI/Button.h"

NewDeckScreen::NewDeckScreen(MainScreen *previous, Feed *feed) : mHttp(this) {
	lprintfln("NewDeckScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	this->feed = feed;
	kinListBox = NULL;
	mainLayout= NULL;
	currentSelectedKey = NULL;
	currentKeyPosition = -1;

	deckName = "";
	errorString = "";
	parentTag = "";
	createResult = "";
	categoryName = "";
	categoryId = "";
	chosenCategory = "";
	deckId = "";

	editBoxName = NULL;
	album = NULL;
	next = NULL;

	busy = false;
	empty = false;

	phase = P_CATEGORY;

	mainLayout = Util::createMainLayout("", "Back", true);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	kinListBox = (KineticListBox*)mainLayout->getChildren()[0]->getChildren()[2];

	this->setMain(mainLayout);

	notice->setCaption("Checking your card categories...");

	mHttp = HttpConnection(this);

	int urlLength = URLSIZE + strlen("?playablecategories=1");
	char *url = new char[urlLength+1];
	memset(url,'\0',urlLength+1);
	sprintf(url, "%s?playablecategories=1", URL);
	lprintfln("%s", url);

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
	this->setMain(mainLayout);

	if (url != NULL) {
		delete url;
		url = NULL;
	}
}

NewDeckScreen::~NewDeckScreen() {
	lprintfln("~NewDeckScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	if (next != NULL) {
		delete next;
		next = NULL;
	}

	delete mainLayout;
	mainLayout = NULL;

	for (int i = 0; i < albums.size(); i++) {
		delete albums[i];
		albums[i] = NULL;
	}
	albums.clear();

	deckName = "";
	errorString = "";
	parentTag = "";
	createResult = "";
	categoryName = "";
	categoryId = "";
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
		} else if (list) {
			if (phase == P_CATEGORY) {
				keyPressEvent(MAK_FIRE);
			}
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
	int ind = kinListBox->getSelectedIndex();
	int max = kinListBox->getChildren().size();
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];
	switch(keyCode) {
		case MAK_SOFTRIGHT:
		case MAK_BACK:
			switch (phase) {
				case P_CATEGORY:
					if (!busy) {
						previous->show();
					}
					break;
				case P_NAME:
					phase = P_CATEGORY;
					drawSelectCategoryScreen();
					break;
			}
			break;
		case MAK_FIRE:
			if(currentSoftKeys->getChildren()[0]->isSelected()){
				keyPressEvent(MAK_SOFTLEFT);
				break;
			}else if(currentSoftKeys->getChildren()[2]->isSelected()){
				keyPressEvent(MAK_SOFTRIGHT);
				break;
			}
		case MAK_SOFTLEFT:
			switch (phase) {
				case P_RESULTS:
					((DeckListScreen*)previous)->refresh();
					break;
				case P_CATEGORY:
					if (!busy) {
						chosenCategory = albums[kinListBox->getSelectedIndex()]->getId();
						phase = P_NAME;
						drawEnterNameScreen();
					}
					break;
				case P_NAME:
					validateInput();
					if (errorString.length() > 0) {
						notice->setCaption(errorString);
					}
					else {
						notice->setCaption("Creating deck...");

						busy = true;

						String base64DeckName = Util::base64_encode(reinterpret_cast<const unsigned char*>(editBoxName->getCaption().c_str()),
															strlen(editBoxName->getCaption().c_str()));

						int urlLength = URLSIZE + strlen("?createdeck=1") + strlen("description") + strlen("category_id") + 4 +
								base64DeckName.length() + chosenCategory.length();
						char *url = new char[urlLength+1];
						memset(url,'\0',urlLength+1);
						sprintf(url, "%s?createdeck=1&description=%s&category_id=%s", URL, base64DeckName.c_str(), chosenCategory.c_str());
						lprintfln("%s", url);

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
			}
			break;
		case MAK_DOWN:
			if (ind+1 < max ) {
				kinListBox->setSelectedIndex(ind+1);
			} else if(currentSelectedKey==NULL) {
				kinListBox->getChildren()[ind]->setSelected(false);
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
		case MAK_UP:
			if(currentSelectedKey!=NULL){
				currentSelectedKey->setSelected(false);
				currentSelectedKey = NULL;
				currentKeyPosition = -1;
				kinListBox->getChildren()[kinListBox->getChildren().size()-1]->setSelected(true);
			}
			else if (ind == 0) {
				kinListBox->setSelectedIndex(max-1);
			} else {
				kinListBox->selectPreviousItem();
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

void NewDeckScreen::validateInput() {
	errorString = "";

	if (editBoxName->getText().length() == 0) {
		errorString = "Please enter a name for the deck.";
	}
}

void NewDeckScreen::selectionChanged(Widget *widget, bool selected) {
	switch (phase) {
		case P_CATEGORY:
			if(selected) {
				((Label *)widget)->setFont(Util::getDefaultSelected());
			} else {
				((Label *)widget)->setFont(Util::getDefaultFont());
			}
			break;
	}
}

void NewDeckScreen::drawSelectCategoryScreen() {
	clearListBox();
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	Util::updateSoftKeyLayout("", "Back", "", mainLayout);

	for(int i = 0; i < albums.size(); i++) {
		label = Util::createSubLabel(albums[i]->getDescription());
		label->addWidgetListener(this);
		kinListBox->add(label);
	}

	if (albums.size() == 0) {
		label = Util::createSubLabel("Empty");
		label->addWidgetListener(this);
		kinListBox->add(label);
		empty = true;
	}

	kinListBox->setSelectedIndex(0);
}

void NewDeckScreen::drawEnterNameScreen() {
	clearListBox();
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	Util::updateSoftKeyLayout("Continue", "Back", "", mainLayout);

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Deck Name", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	label = Util::createEditLabel("");
	editBoxName = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Deck Name");
	editBoxName->setDrawBackground(false);
	label->addWidgetListener(this);
	kinListBox->add(label);

	editBoxName->setSelected(true);
}

void NewDeckScreen::clearListBox() {
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

	if (phase == P_RESULTS) {
		editBoxName->disableListener();
		next->show();
	}
}

void NewDeckScreen::mtxEncoding(const char* ) {
}

void NewDeckScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void NewDeckScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void NewDeckScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "categoryid")) {
		categoryId += data;
	} else if(!strcmp(parentTag.c_str(), "categoryname")) {
		categoryName += data;
	} else if(!strcmp(parentTag.c_str(), "result")) {
		createResult += data;
	} else if(!strcmp(parentTag.c_str(), "deck_id")) {
		deckId += data;
	}
}

void NewDeckScreen::mtxTagEnd(const char* name, int len) {
	if (!strcmp(name, "category")) {
		album = new Album(categoryId, categoryName);
		albums.add(album);

		categoryId = "";
		categoryName = "";
	}
	else if (!strcmp(name, "categories")) {
		busy = false;
		notice->setCaption("");

		drawSelectCategoryScreen();
	}
	else if (!strcmp(name, "result")) {
		busy = false;
		notice->setCaption("");

		phase = P_RESULTS;

		next = new EditDeckScreen(previous, feed, deckId);
	}
}

void NewDeckScreen::mtxParseError(int) {
}

void NewDeckScreen::mtxEmptyTagEnd() {
}

void NewDeckScreen::mtxTagStartEnd() {
}
