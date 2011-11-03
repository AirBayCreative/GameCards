#include <mastdlib.h>

#include "Login.h"
#include "../utils/Util.h"
#include "AlbumLoadScreen.h"

Login::Login(Feed *feed, Screen *previous, int screen) : mHttp(this), feed(feed), prev(previous), screen(screen) {
	lprintfln("Login::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	moved = 0;
	isBusy = false;

	response = "";

	mainLayout = Util::createMainLayout("", "", "", true);

	mainLayout->setDrawBackground(TRUE);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	//Util::setPadding(listBox);
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

	if (feed->getUnsuccessful() != "Success") {
		label->setCaption(feed->getUnsuccessful());
	}
	touch = "false";
	this->setMain(mainLayout);
}

Login::~Login() {
	clearListBox();
	listBox->clear();
	delete mainLayout;
	error_msg = "";
	parentTag="";
	conCatenation="";
	value="";
	value1="";
	value2="";
	convertAsterisk="";
	underscore="";
	username="";
	credits="";
	encrypt="";
	error_msg="";
	email="";
	handle="";
	touch="";
}

void Login::drawLoginScreen() {
	//listBox->setYOffset(0);
	moved = 0;
	screen = S_LOGIN;
	clearListBox();

	if ((strcmp(feed->getRegistered().c_str(), "1") == 0)) {
		Util::updateSoftKeyLayout("Log In", "Exit", "", mainLayout);
	} else {
		Util::updateSoftKeyLayout("Log In", "Back", "", mainLayout);
	}
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Username:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxLogin = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Username:");
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Password:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
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

	Util::updateSoftKeyLayout("Register", "Back", "", mainLayout);
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Username:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxLogin = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Username:");
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Password:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxPass = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Password:");
	editBoxPass->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Full Name:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxFullname = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Full Name:");
	editBoxFullname->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Cell Number", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxCell = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"Cell Number:");
#if defined(MA_PROF_SUPPORT_STYLUS)

#else
	editBoxCell->setInputMode(NativeEditBox::IM_NUMBERS);
#endif
	editBoxCell->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Email:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxEmail = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Email:");
	editBoxEmail->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "", 0, Util::getDefaultFont());
	listBox->add(label);
	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "", 0, Util::getDefaultFont());
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
	touch = "true";
	/*if (feed->setTouch(touch.c_str())) {
		saveData(FEED, feed->getAll().c_str());
	}*/
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
            //return;
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
							int res = mHttp.create(url, HTTP_GET);

							if(res < 0) {
								notice->setCaption("Unable to connect, try again later...");
							} else {
								mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
								mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
								feed->addHttp();
								mHttp.finish();
							}
							conCatenation = "";
							value = "";
						} else {
							notice->setCaption("Ensure that you have entered your username and password.");
						}
						break;
					case S_REGISTER:
						notice->setCaption("");
						if (editBoxLogin->getText().length() < 6) {
							notice->setCaption("Your username needs to be at least 6 characters long");
						}
						else if (editBoxPass->getText().length() < 6) {
							notice->setCaption("Your password needs to be at least 6 characters long");
						}
						else if (editBoxFullname->getText().length() < 1) {
							notice->setCaption("Please enter your name");
						}
						else if (editBoxCell->getText().length() < 10) {
							notice->setCaption("Your cell needs to be at least 10 numbers long");
						}
						else if (editBoxEmail->getText().length() < 1) {
							notice->setCaption("You need to enter an email address");
						}
						else {
							response = "";
							isBusy = true;
							notice->setCaption("Attempting to register user...");

							String encodedName = Util::base64_encode(reinterpret_cast<const unsigned char*>(editBoxFullname->getText().c_str()),
									editBoxFullname->getText().length());

							char *url = NULL;
							//work out how long the url will be, the 10 is for the & and = symbols
							int urlLength = 0;
							urlLength = 100 + urlLength + encodedName.length()
									+ editBoxLogin->getText().length() + editBoxCell->getText().length()
									+ editBoxPass->getText().length() + editBoxEmail->getText().length() + 10;
							url = new char[urlLength];
							memset(url,'\0',urlLength);
							sprintf(url, "%s?registeruser=1&name=%s&username=%s&cell=%s&password=%s&email=%s", URL, encodedName.c_str(),
									editBoxLogin->getText().c_str(), editBoxCell->getText().c_str(),
									editBoxPass->getText().c_str(), editBoxEmail->getText().c_str());
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
							encodedName = "";
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
				prev->show();
			}
			break;
		case MAK_UP:
			if (index == 3) {
				listBox->setSelectedIndex(0);
				listBox->setSelectedIndex(1);
			} else if (index-2 > 0) {
				listBox->setSelectedIndex(index-2);
			} else {
				listBox->setSelectedIndex(listBox->getChildren().size()-1);
				listBox->setSelectedIndex(listBox->getChildren().size()-3);
			}
			break;
		case MAK_DOWN:
			if (index+2 < listBox->getChildren().size()) {
				listBox->setSelectedIndex(index+2);
			} else {
				listBox->setSelectedIndex(0);
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
		notice->setCaption("Unable to connect, try again later...");
		isBusy = false;
		feed->remHttp();
	}
}

void Login::connReadFinished(Connection* conn, int result) {}

void Login::xcConnError(int code) {
	feed->remHttp();
	isBusy = false;
}

void Login::mtxEncoding(const char* ) {
}

void Login::mtxTagStart(const char* name, int len) {
	parentTag = name;
	if (!strcmp(name, "usercategories")) {
		album = new Albums();
	}
}

void Login::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void Login::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "username")) {
		username = data;
	} else if(!strcmp(parentTag.c_str(), "credits")) {
		credits = data;
	} else if(!strcmp(parentTag.c_str(), "email")) {
		email = data;
	} else if(!strcmp(parentTag.c_str(), "name")) {
		handle = data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg = data;
	} else if (!strcmp(parentTag.c_str(), "result")) {
		response += data;
	} else if (!strcmp(parentTag.c_str(), "usercategories")) {
		album->clearAll();
	} else if(!strcmp(parentTag.c_str(), "albumname")) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), "albumid")) {
		temp += data;
	} else if (!strcmp(parentTag.c_str(), "hascards")) {
		hasCards += data;
	} else if (!strcmp(parentTag.c_str(), "updated")) {
		updated += data;
	}
}

void Login::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "status")) {
		feed->setCredits(credits.c_str());
		feed->setHandle(handle.c_str());
		feed->setEmail(email.c_str());
		feed->setUnsuccessful("Success");
		feed->setTouch(touch.c_str());
		feed->setRegistered("1");
		int seconds = maLocalTime();
		int secondsLength = Util::intlen(seconds);
		char *secString = new char[secondsLength];
		memset(secString,'\0',secondsLength);
		sprintf(secString, "%d", "seconds");
		feed->setSeconds(secString);
		delete secString;
		username,error_msg= "";
		Util::saveData("fd.sav", feed->getAll().c_str());
		String albums = "";
		Util::getData("lb.sav", albums);
		feed->setAlbum(albums.c_str());
		albums = "";
		/*if (next != NULL) {
			delete next;
		}*/
		next = new AlbumLoadScreen(feed);
		next->show();
	} else if(!strcmp(name, "error")) {
		error = true;
		feed->setUnsuccessful(error_msg.c_str());
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, "result")) {
		isBusy = false;
		notice->setCaption(response);
	} else if(!strcmp(name, "album")) {
		album->addAlbum(temp.c_str(), temp1, (hasCards=="true"), (updated=="1"));
		temp1 = "";
		temp = "";
		hasCards = "";
		updated = "";
	} else if (!strcmp(name, "usercategories")) {
		this->feed->getAlbum()->setAll(album->getAll().c_str());
		Util::saveData("lb.sav", album->getAll().c_str());

		feed->setEncrypt(Util::base64_encode(reinterpret_cast<const unsigned char*>(editBoxPass->getText().c_str()), editBoxPass->getText().length()).c_str());
		feed->setUsername(editBoxLogin->getText().c_str());
		feed->setCredits("0");
		feed->setHandle("");
		feed->setEmail(editBoxEmail->getText().c_str());
		feed->setUnsuccessful("Success");
		feed->setTouch("");
		int seconds = maLocalTime();
		int secondsLength = Util::intlen(seconds);
		char *secString = new char[secondsLength];
		memset(secString,'\0',secondsLength);
		sprintf(secString, "%d", seconds);
		feed->setSeconds(secString);
		delete secString;
		username,error_msg= "";
		Util::saveData("fd.sav", feed->getAll().c_str());

		/*if (next != NULL) {
			delete next;
		}*/
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

void Login::mtxParseError(int) {
}

void Login::mtxEmptyTagEnd() {
}

void Login::mtxTagStartEnd() {
}
