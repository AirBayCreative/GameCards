#include "DetailScreen.h"
#include "OptionsScreen.h"
#include "../utils/Util.h"
#include "../utils/Stat.h"

DetailScreen::DetailScreen(Screen *previous, Feed *feed, int screenType, Card *card) : mHttp(this), previous(previous),
		feed(feed), screenType(screenType), card(card) {
	lprintfln("DetailScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	mainLayout = Util::createMainLayout(screenType==CARD?"":"", "Back", true);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	next=NULL;
	isBusy=true;
	desc = "", id = "", date = "";
	count = 0;
	switch (screenType) {
		case PROFILE:
			//USERNAME
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Username:", 0, Util::getDefaultFont());
			listBox->add(label);

			label = Util::createLabel(feed->getUsername());
			label->setVerticalAlignment(Label::VA_CENTER);
			listBox->add(label);

			//EMAIL
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Email:", 0, Util::getDefaultFont());
			listBox->add(label);

			label = Util::createLabel(feed->getEmail());
			label->setVerticalAlignment(Label::VA_CENTER);
			listBox->add(label);
			break;
		case BALANCE:
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Available Credits:", 0, Util::getDefaultFont());
			listBox->add(label);

			balanceLabel = Util::createLabel(feed->getCredits());
			balanceLabel->setVerticalAlignment(Label::VA_CENTER);
			listBox->add(balanceLabel);
			break;
		case CARD:
			for (int i = 0; i < card->getStats().size(); i++) {
				/*label = createLabel(card->getStats()[i]->getDesc() + " : " + card->getStats()[i]->getDisplay());
				label->setVerticalAlignment(Label::VA_CENTER);
				setPadding(label);
				listBox->add(label);*/
				label = Util::createSubLabel(card->getStats()[i]->getDesc() + " : " + card->getStats()[i]->getDisplay());
				label->setPaddingBottom(5);
				label->addWidgetListener(this);
				listBox->add(label);
			}
			if (card->getStats().size() == 0) {
				label = Util::createSubLabel("Empty");
				label->setPaddingBottom(5);
				label->addWidgetListener(this);
				listBox->add(label);
			}
			break;
		case NOTIFICATIONS:
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_LABEL_HEIGHT, NULL, "Notifications", 0, Util::getDefaultFont());
			label->setHorizontalAlignment(Label::HA_CENTER);
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setSkin(Util::getSkinListNoArrows());
			label->setMultiLine(true);
			listBox->add(label);
			break;
	}

	if (screenType == NOTIFICATIONS) {
		int urlLength = 100 + URLSIZE;
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?notifications=1", URL);
		int res = mHttp.create(url, HTTP_GET);

		if(res < 0) {

		} else {
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("Updating notifications...");

			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();

		}
		delete [] url;
	}
	else if (screenType != CARD) {

		int urlLength = strlen("?userdetails=1") + URLSIZE;
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?userdetails=1", URL);
		int res = mHttp.create(url, HTTP_GET);

		if(res < 0) {

		} else {
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("Checking for updated info...");

			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();
		}
	}

	this->setMain(mainLayout);

	moved = 0;
}

DetailScreen::~DetailScreen() {
	delete mainLayout;
	if(next!=NULL){
		delete next;
		feed->remHttp();
	}
	username = "";
	credits = "";
	encrypt = "";
	error_msg = "";
	parentTag = "";
	email = "";
}

void DetailScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void DetailScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void DetailScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		}
	}
	moved = 0;
}

void DetailScreen::locateItem(MAPoint2d point)
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

void DetailScreen::selectionChanged(Widget *widget, bool selected) {
	if (screenType == CARD) {
		if(selected) {
			((Label *)widget)->setFont(Util::getDefaultSelected());
		} else {
			((Label *)widget)->setFont(Util::getDefaultFont());
		}
	}
	else if (screenType == NOTIFICATIONS) {
		/*if(selected) {
			((Label *)widget)->setFont(Util::getDefaultSelected());
		} else {
			((Label *)widget)->setFont(Util::getDefaultFont());
		}*/
	}
	else {
		if(selected) {
			widget->getChildren()[0]->setSelected(true);
		} else {
			widget->getChildren()[0]->setSelected(false);
		}
	}
}

void DetailScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void DetailScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void DetailScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			switch (screenType) {
				case CARD:
					int index = listBox->getSelectedIndex();
					if(card->getStats()[index]!=NULL){
						Stat *stat = card->getStats()[index];
						if (strcmp(stat->getDesc().c_str(), "Mobile No") == 0) {
							if (next != NULL) {
								feed->remHttp();
								delete next;
								next == NULL;
							}
							next = new OptionsScreen(feed, OptionsScreen::ST_NUMBER_OPTIONS, this, card, stat->getDesc());
							next->show();
						}
						else if (strcmp(stat->getDesc().c_str(), "Email") == 0) {

						}
						else if (strcmp(stat->getDesc().c_str(), "Web Address") == 0) {
							String url = stat->getDisplay();
							//maPlatformRequest will only work if the url starts with http://
							//so we need to check for it, and add it if it isnt there
							if (url.find("http://") != 0) {
								url = "http://"+url;
							}
							maPlatformRequest(url.c_str());
						}
					}
					break;
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			previous->show();
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
	}
}

void DetailScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		label->setCaption("");
		feed->remHttp();
	}
}

void DetailScreen::connReadFinished(Connection* conn, int result) {}

void DetailScreen::xcConnError(int code) {
	feed->remHttp();
}

void DetailScreen::mtxEncoding(const char* ) {}

void DetailScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void DetailScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void DetailScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "username")) {
		username += data;
	} else if(!strcmp(parentTag.c_str(), "credits")) {
		credits += data;
	} else if(!strcmp(parentTag.c_str(), "email")) {
		email += data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), "desc")) {
		desc += data;
	}  else if(!strcmp(parentTag.c_str(), "id")) {
		id += data;
	} else if(!strcmp(parentTag.c_str(), "date")) {
		date += data;
	}
}

void DetailScreen::mtxTagEnd(const char* name, int len) {
	//TODO not currently updating screen components. Only on screen recreate.
	if(!strcmp(name, "status")) {
		label->setCaption("");
		feed->setCredits(credits.c_str());
		feed->setEmail(email.c_str());
		feed->setUnsuccessful("Success");
		username,error_msg= "";
		Util::saveData("fd.sav", feed->getAll().c_str());

		refreshData();
	} else if(!strcmp(name, "error")) {
		if (label != NULL) {
			label->setCaption(error_msg.c_str());
		}
	} else if(!strcmp(name, "notifications")) {
		if (count == 0) {
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_LABEL_HEIGHT, NULL, "No notifications yet.", 0, Util::getDefaultFont());
			label->setPaddingLeft(20);
			label->setPaddingRight(20);
			label->addWidgetListener(this);
			label->setHorizontalAlignment(Label::HA_CENTER);
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setSkin(Util::getSkinListNoArrows());
			label->setMultiLine(true);
			listBox->add(label);

			listBox->setSelectedIndex(0);
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("");
		} else {
			listBox->setSelectedIndex(1);
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("");
		}
	} else if(!strcmp(name, "note")) {
		count++;

		label = new Label(0, 0, listBox->getWidth()-(PADDING*2), DEFAULT_DETAILS_ITEM_HEIGHT, NULL,
				"", 0, Util::getDefaultFont());
		label->setCaption(date + ": " + desc);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setSkin(Util::getSkinListNoArrows());
		label->setMultiLine(true);
		label->setPaddingBottom(5);
		label->setPaddingLeft(PADDING);
		label->addWidgetListener(this);
		listBox->add(label);

		desc = "";
		date = "";
		id = "";
	} else {
		if (label != NULL && screenType != NOTIFICATIONS) {
			label->setCaption("");
		}
	}
}

void DetailScreen::mtxParseError(int) {
}

void DetailScreen::mtxEmptyTagEnd() {
}

void DetailScreen::mtxTagStartEnd() {
}

void DetailScreen::refreshData() {
	switch (screenType) {
		case PROFILE:
			break;
		case BALANCE:
			balanceLabel->setCaption(feed->getCredits());
			break;
	}
}
