#include <mastdlib.h>

#include "Login.h"
#include "../utils/Util.h"
#include "NewMenuScreen.h"
#include "ShopCategoriesScreen.h"
#include "../UI/Button.h"

Login::Login(MainScreen *previous, Feed *feed, int screen) : mHttp(this), screen(screen) {
	lprintfln("Login::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	this->feed = feed;
	moved = 0;
	changed = false;
	isBusy = false;
	result = "";
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	mainLayout = Util::createMainLayout("", "", "", true);

	kinListBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
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
	touch = "false";
	this->setMain(mainLayout);
}

Login::~Login() {
	lprintfln("~Login::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	clearListBox();
	kinListBox->clear();
	delete mainLayout;
	mainLayout = NULL;
	error_msg = "";
	parentTag="";
	conCatenation="";
	value="";
	value1="";
	value2="";
	convertAsterisk="";
	underscore="";
	username="";
	credits="0";
	premium="0";
	encrypt="";
	error_msg="";
	email="";
	handle="";
	touch="";
	result="";
	freebie="";
	notedate="";
}

void Login::drawLoginScreen() {
	moved = 0;
	changed = true;
	screen = S_LOGIN;
	clearListBox();

	if ((strcmp(feed->getRegistered().c_str(), "1") == 0)) {
		Util::updateSoftKeyLayout("Log In", "Exit", "", mainLayout);
	} else {
		Util::updateSoftKeyLayout("Log In", "Back", "", mainLayout);
	}

	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Username", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	label = Util::createEditLabel("");
	editBoxLogin = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, "", L"Username");
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	kinListBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Password", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	label = Util::createEditLabel("");
	editBoxPass = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Password");
	editBoxPass->setDrawBackground(false);
	label->addWidgetListener(this);
	kinListBox->add(label);

	kinListBox->setSelectedIndex(1);
}

void Login::drawRegisterScreen() {
	kinListBox->setYOffset(0);
	moved = 0;
	changed = true;
	screen = S_REGISTER;
	clearListBox();

	Util::updateSoftKeyLayout("Register", "Back", "", mainLayout);
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Username", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	label = Util::createEditLabel("");
	editBoxLogin = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_URL, label, "", L"Username");
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	kinListBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Password", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	label = Util::createEditLabel("");
	editBoxPass = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_URL, label, "", L"Password");
	editBoxPass->setDrawBackground(false);
	label->addWidgetListener(this);
	kinListBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Email", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	label = Util::createEditLabel("");
	editBoxEmail = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_EMAILADDR, label, "", L"Email");
	editBoxEmail->setDrawBackground(false);
	label->addWidgetListener(this);
	kinListBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Referrer", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	label = Util::createEditLabel("");
	editBoxRefer = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_EMAILADDR, label, "", L"Referrer");
	editBoxRefer->setDrawBackground(false);
	label->addWidgetListener(this);
	kinListBox->add(label);

	kinListBox->setSelectedIndex(1);
}

void Login::clearListBox() {
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

		if (!changed) {
			/*int yClick = point.y;
			int index = kinListBox->getSelectedIndex();*/
		}
		else {
			changed = false;
		}
	}
	else {
		moved = 0;
		changed = false;
	}
}

void Login::locateItem(MAPoint2d point)
{
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
        	if (moved <= 1) kinListBox->setSelectedIndex(i);
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
void Login::show() {
	kinListBox->getChildren()[kinListBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void Login::hide() {
    kinListBox->getChildren()[kinListBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void Login::keyPressEvent(int keyCode) {
	error = false;
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];
	int index = kinListBox->getSelectedIndex();

	switch(keyCode) {
		case MAK_FIRE:
			if(currentSoftKeys->getChildren()[0]->isSelected()){
				keyPressEvent(MAK_SOFTLEFT);
			}else if(currentSoftKeys->getChildren()[2]->isSelected()){
				keyPressEvent(MAK_SOFTRIGHT);
			}
			break;
		case MAK_SOFTLEFT:
			if (!isBusy) {
				switch (screen) {
					case S_LOGIN:
						if (editBoxLogin->getText()!="" & editBoxPass->getText()!="") {
							isBusy = true;
							notice->setCaption("Please wait, logging in...");
							conCatenation = editBoxPass->getText().c_str();
							value = Util::base64_encode(reinterpret_cast<const unsigned char*>(conCatenation.c_str()),conCatenation.length());
							feed->setEncrypt(value.c_str());
							feed->setUsername(editBoxLogin->getText().c_str());
							feed->setUnsuccessful("true");
							mHttp = HttpConnection(this);
							int urlLength = 71 + URLSIZE;
							char *url = new char[urlLength+1];
							memset(url,'\0',urlLength+1);
							sprintf(url, "%s?userdetails=1", URL);
							lprintfln("%s", url);
							int res = mHttp.create(url, HTTP_GET);

							if(res < 0) {
								notice->setCaption("Unable to connect, try again later...");
							} else {
								mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
								mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
								feed->addHttp();
								mHttp.finish();
							}
							delete url;
							url = NULL;
							conCatenation = "";
							value = "";
						} else {
							maVibrate(1000);
							notice->setCaption("Ensure that you have entered your username and password.");
						}
						break;
					case S_REGISTER:
						notice->setCaption("");
						if ((strcmp(feed->getRegistered().c_str(), "1") == 0)) {
							notice->setCaption("Already registered for an account with this device.");
							maVibrate(1000);
						} else if (editBoxLogin->getText().length() < 6) {
							notice->setCaption("Your username needs to be at least 6 characters long");
							maVibrate(1000);
						}
						else if (editBoxPass->getText().length() < 6) {
							notice->setCaption("Your password needs to be at least 6 characters long");
							maVibrate(1000);
						}
						else if (editBoxEmail->getText().length() == 0) {
							notice->setCaption("You need to enter an email address");
							maVibrate(1000);
						}
						else if (!Util::validateEmailAddress(editBoxEmail->getText())) {
							notice->setCaption("Please enter a valid email address");
							maVibrate(1000);
						}
						else if (!Util::validateNoWhiteSpaces(editBoxLogin->getText())) {
							notice->setCaption("Please enter a username without spaces.");
							maVibrate(1000);
						}
						else if (!Util::validateNoWhiteSpaces(editBoxPass->getText())) {
							notice->setCaption("Please enter a password without spaces.");
							maVibrate(1000);
						}
						else if (!Util::validateNoWhiteSpaces(editBoxEmail->getText())) {
							notice->setCaption("Please enter a email address without spaces.");
							maVibrate(1000);
						}
						else if (!Util::validateNoWhiteSpaces(editBoxRefer->getText())) {
							notice->setCaption("Please enter a referer name.");
							maVibrate(1000);
						}
						else {
							result = "";
							isBusy = true;
							notice->setCaption("Attempting to register user...");


							conCatenation = editBoxPass->getText().c_str();
							value = Util::base64_encode(reinterpret_cast<const unsigned char*>(conCatenation.c_str()),conCatenation.length());
							feed->setEncrypt(value.c_str());
							feed->setUsername(editBoxLogin->getText().c_str());
							feed->setUnsuccessful("true");
							char *url = NULL;
							//work out how long the url will be, the 2 is for the & and = symbols
							int urlLength = 89 + URLSIZE + editBoxLogin->getText().length() + editBoxPass->getText().length() + editBoxEmail->getText().length() + editBoxRefer->getText().length();
							url = new char[urlLength+1];
							memset(url,'\0',urlLength+1);
							sprintf(url, "%s?registeruser=1&username=%s&password=%s&email=%s&referer=%s", URL, editBoxLogin->getText().c_str(),
									editBoxPass->getText().c_str(), editBoxEmail->getText().c_str(), editBoxRefer->getText().c_str());
							lprintfln("%s", url);
							mHttp = HttpConnection(this);
							int res = mHttp.create(url, HTTP_GET);
							if(res < 0) {
								notice->setCaption("Unable to connect, try again later...");
							} else {
								mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
								mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
								feed->addHttp();
								mHttp.finish();
							}
							delete url;
							url = NULL;
						}
						break;
				}
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			if ((strcmp(feed->getRegistered().c_str(), "1") == 0)) {
				maExit(1);
			} else {
				previous->show();
			}

			break;
		case MAK_UP:
			if(currentSelectedKey!=NULL){
				currentSelectedKey->setSelected(false);
				currentSelectedKey = NULL;
				currentKeyPosition = -1;
				kinListBox->getChildren()[kinListBox->getChildren().size()-1]->setSelected(true);
			}
			else if (index-2 > 0) {
				kinListBox->setSelectedIndex(index-2);
			}
			break;
		case MAK_DOWN:
			if (index+2 < kinListBox->getChildren().size()) {
				kinListBox->setSelectedIndex(index+2);
			} else if(currentSelectedKey==NULL){
				kinListBox->getChildren()[index]->setSelected(false);
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

void Login::httpFinished(MAUtil::HttpConnection* http, int result) {
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

void Login::connReadFinished(Connection* conn, int result) {}

void Login::xcConnError(int code) {
	feed->remHttp();
}

void Login::mtxEncoding(const char* ) {
}

void Login::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void Login::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void Login::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "username")) {
		username = data;
	} else if(!strcmp(parentTag.c_str(), "credits")) {
		credits = data;
	} else if(!strcmp(parentTag.c_str(), "premium")) {
		premium = data;
	} else if(!strcmp(parentTag.c_str(), "email")) {
		email = data;
	} else if(!strcmp(parentTag.c_str(), "name")) {
		handle = data;
	} else if(!strcmp(parentTag.c_str(), "freebie")) {
		freebie = data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg = data;
	} else if (!strcmp(parentTag.c_str(), "result")) {
		result = data;
	} else if(!strcmp(parentTag.c_str(), "freebie")) {
		freebie = data;
	}
}

void Login::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "status")) {
		feed->setCredits(credits.c_str());
		feed->setPremium(premium.c_str());
		feed->setHandle(handle.c_str());
		feed->setEmail(email.c_str());
		feed->setUnsuccessful("Success");
		feed->setTouch(touch.c_str());
		feed->setFreebie(freebie.c_str());
		feed->setRegistered("1");
		int seconds = maLocalTime();
		int secondsLength = Util::intlen(seconds);
		char *secString = new char[secondsLength+1];
		memset(secString,'\0',secondsLength+1);
		sprintf(secString, "%d", seconds);
		feed->setSeconds(secString);
		delete secString;
		secString = NULL;
		username = "";
		error_msg= "";
		Util::saveData("fd.sav", feed->getAll().c_str());
		String albums = "";
		Util::getData("lb.sav", albums);
		feed->setAlbum(albums.c_str());
		albums = "";

		// Check result
		if (strcmp("0", freebie.c_str()) == 0) {
			origMenu = new NewMenuScreen(feed);
			next = new ShopCategoriesScreen(this, feed, ShopCategoriesScreen::ST_FREEBIE);
		} else {
			next = new NewMenuScreen(feed);
		}
		next->show();
	} else if(!strcmp(name, "error")) {
		error = true;
		feed->setUnsuccessful(error_msg.c_str());
		notice->setCaption(error_msg.c_str());
		error_msg="";
	} else if (!strcmp(name, "result")) {
		isBusy = false;
		error = true;
		notice->setCaption(result.c_str());
		result="";
	} else {
		if (!error) {
			if (notice != NULL) {
				notice->setCaption("");
			}
		}
	}
}
void Login::cleanup() {
	clearListBox();
	kinListBox->clear();
	delete mainLayout;
	mainLayout = NULL;

	parentTag = "";
	conCatenation = "";
	value = "";
	value1 = "";
	value2 = "";
	convertAsterisk = "";
	underscore = "";
	username = "";
	credits = "0";
	premium = "0";
	encrypt = "";
	error_msg = "";
	email = "";
	handle = "";
	touch = "";
}

void Login::mtxParseError(int) {
}

void Login::mtxEmptyTagEnd() {
}

void Login::mtxTagStartEnd() {
}
