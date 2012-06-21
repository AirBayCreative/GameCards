#include "DetailScreen.h"
#include "OptionsScreen.h"
#include "ShopProductsScreen.h"
#include "NewMenuScreen.h"
#include <mastdlib.h>
#include "../utils/Util.h"
#include "../utils/Stat.h"
#include "../UI/CheckBox.h"
#include "TradeFriendDetailScreen.h"
#include "../UI/Button.h"

DetailScreen::DetailScreen(MainScreen *previous, Feed *feed, int screenType, Card *card, String category, String categoryname) : mHttp(this),
		screenType(screenType), card(card) {
	lprintfln("DetailScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	this->feed = feed;
	mainLayout = Util::createMainLayout(screenType==CARD?"":screenType==BALANCE?"Buy":screenType==PROFILE?"Save":screenType==FRIENDS?"Add Friend":"", "Back", screenType==BALANCE?"""":"", true);
	kinListBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	next=NULL;
	answers=NULL;
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	count = 0;
	isBusy=true;
	desc = "";
	date = "";
	id = "";
	cred = "0";
	prem = "0";
	switch (screenType) {
		case PROFILE:
			/*Screen Header*/
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_LABEL_HEIGHT, NULL, "Profile", 0, Util::getDefaultFont());
			label->setHorizontalAlignment(Label::HA_CENTER);
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setSkin(Util::getSkinListNoArrows());
			label->setMultiLine(true);
			kinListBox->add(label);
			break;
		case BALANCE:
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_DETAIL_HEADER_HEIGHT, NULL, "Select Buy to get more credits.", 0, Util::getDefaultSelected());
			label->setAutoSizeY();
			label->setMultiLine(true);
			label->setDrawBackground(false);
			kinListBox->add(label);
			/*Screen Header*/

			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_LABEL_HEIGHT, NULL, "Premium Credits", 0, Util::getDefaultFont());
			label->setHorizontalAlignment(Label::HA_CENTER);
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setSkin(Util::getSkinListNoArrows());
			label->setMultiLine(true);
			kinListBox->add(label);

			premiumLabel = Util::createEditLabel(feed->getPremium());
			premiumLabel->setVerticalAlignment(Label::VA_CENTER);
			kinListBox->add(premiumLabel);

			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_LABEL_HEIGHT, NULL, "Last Transactions:", 0, Util::getDefaultFont());
			label->setHorizontalAlignment(Label::HA_CENTER);
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setSkin(Util::getSkinListNoArrows());
			kinListBox->add(label);
			break;
		case CARD:
			for (int i = 0; i < card->getStats().size(); i++) {
				label = Util::createSubLabel(card->getStats()[i]->getDesc() + " : " + card->getStats()[i]->getDisplay());
				label->setPaddingBottom(5);
				label->addWidgetListener(this);
				kinListBox->add(label);
			}
			if (card->getStats().size() == 0) {
				label = Util::createSubLabel("Empty");
				label->setPaddingBottom(5);
				label->addWidgetListener(this);
				kinListBox->add(label);
			}
			break;
		case RANKING:
		case FRIEND:
			/*Screen Header*/
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_LABEL_HEIGHT, NULL, categoryname.c_str(), 0, Util::getDefaultFont());
			label->setHorizontalAlignment(Label::HA_CENTER);
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setSkin(Util::getSkinListNoArrows());
			label->setMultiLine(true);
			kinListBox->add(label);
			break;
		case NOTIFICATIONS:
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_LABEL_HEIGHT, NULL, "Notifications", 0, Util::getDefaultFont());
			label->setHorizontalAlignment(Label::HA_CENTER);
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setSkin(Util::getSkinListNoArrows());
			label->setMultiLine(true);
			kinListBox->add(label);
			break;
		case FRIENDS:
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_LABEL_HEIGHT, NULL, "Friends", 0, Util::getDefaultFont());
			label->setHorizontalAlignment(Label::HA_CENTER);
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setSkin(Util::getSkinListNoArrows());
			label->setMultiLine(true);
			kinListBox->add(label);
			break;
		case CONTACTS:
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_LABEL_HEIGHT, NULL, "Contacts", 0, Util::getDefaultFont());
			label->setHorizontalAlignment(Label::HA_CENTER);
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setSkin(Util::getSkinListNoArrows());
			label->setMultiLine(true);
			kinListBox->add(label);

			PIM *pim = new PIM();
			pim->addListener(this);
			pim->getContacts();
			delete pim;
			pim = NULL;

			break;
	}

	if (screenType == PROFILE) {

		int urlLength = 100 + URLSIZE;
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?profiledetails=1", URL);
		lprintfln("%s", url);
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
		delete [] url;
		url = NULL;
	} else if (screenType == BALANCE) {
		int urlLength = 100 + URLSIZE;
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?creditlog=1", URL);
		lprintfln("%s", url);
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
		delete [] url;
		url = NULL;
	} else if (screenType == RANKING) {
			int urlLength = 100 + URLSIZE;
			char *url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?leaderboard=%s", URL, category.c_str());
			lprintfln("%s", url);
			int res = mHttp.create(url, HTTP_GET);

			if(res < 0) {

			} else {
				label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
				label->setCaption("Checking for latest rankings...");

				mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
				mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
				feed->addHttp();
				mHttp.finish();

			}
			delete [] url;
			url = NULL;
	} else if (screenType == FRIEND) {
		int urlLength = 100 + URLSIZE;
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?leaderboard=%s&friends=1", URL, category.c_str());
		lprintfln("%s", url);
		int res = mHttp.create(url, HTTP_GET);

		if(res < 0) {

		} else {
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("Checking for latest rankings...");

			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();

		}
		delete [] url;
		url = NULL;
	} else if (screenType == NOTIFICATIONS) {
		int urlLength = 100 + URLSIZE;
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?notifications=1", URL);
		lprintfln("%s", url);
		int res = mHttp.create(url, HTTP_GET);

		if(res < 0) {

		} else {
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("Updating notifications...");
			label->setDrawBackground(false);

			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();

		}
		delete [] url;
		url = NULL;
	} else if (screenType == FRIENDS) {
		int urlLength = 100 + URLSIZE;
		char *url = new char[urlLength+1];
		memset(url,'\0',urlLength+1);
		sprintf(url, "%s?friends=1", URL);
		lprintfln("%s", url);
		int res = mHttp.create(url, HTTP_GET);

		if(res < 0) {

		} else {
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("Getting friends list...");

			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();
		}
		delete [] url;
		url = NULL;
	}

	this->setMain(mainLayout);

	moved = 0;
}

void DetailScreen::contactReceived(Contact& contact) {
	label = new Label(0, 0, kinListBox->getWidth()-(PADDING*2), DEFAULT_DETAILS_ITEM_HEIGHT, NULL,
			"", 0, Util::getDefaultFont());

	char *buffer = new char[128];
	sprintf(buffer, "%S", contact.name.c_str());

	label->setCaption(buffer);
	label = Util::createSubLabel(buffer);
	label->setPaddingBottom(5);
	label->addWidgetListener(this);
	kinListBox->add(label);

	kinListBox->setSelectedIndex(0);
	delete buffer;
	buffer = NULL;

	//contacts.add(contact);
}

void DetailScreen::clearListBox() {
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

DetailScreen::~DetailScreen() {
	lprintfln("~DetailScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	clearListBox();
	kinListBox->clear();
	delete mainLayout;
	mainLayout = NULL;
	if(next!=NULL){
		delete next;
		feed->remHttp();
		next = NULL;
	}
	encrypt = "";
	error_msg = "";
	parentTag = "";

	for (int i = 0; i < answers.size(); i++) {
		if (answers[i] != NULL) {
			delete answers[i];
			answers[i] = NULL;
		}
	}
	answers.clear();

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
	else if (screenType == PROFILE){
		if(selected) {
			widget->getChildren()[0]->setSelected(true);
		} else {
			widget->getChildren()[0]->setSelected(false);
		}
	} else if ((screenType == BALANCE)||(screenType == FRIENDS)||(screenType == NOTIFICATIONS)) {
		if(selected) {
			((Label *)widget)->setFont(Util::getDefaultSelected());
		} else {
			((Label *)widget)->setFont(Util::getDefaultFont());
		}
	}
}

void DetailScreen::show() {
	kinListBox->getChildren()[kinListBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void DetailScreen::hide() {
    kinListBox->getChildren()[kinListBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void DetailScreen::keyPressEvent(int keyCode) {
	int ind = kinListBox->getSelectedIndex();
	int max = kinListBox->getChildren().size();
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];
	switch(keyCode) {
		case MAK_FIRE:
			if(currentSoftKeys->getChildren()[0]->isSelected()){
				keyPressEvent(MAK_SOFTLEFT);
			}else if(currentSoftKeys->getChildren()[2]->isSelected()){
				keyPressEvent(MAK_SOFTRIGHT);
			}else if(screenType == FRIENDS){
				keyPressEvent(MAK_SOFTLEFT);
			}
			break;
		case MAK_SOFTLEFT:
			switch (screenType) {
				case CARD:
					int index = kinListBox->getSelectedIndex();
					if(card->getStats()[index]!=NULL){
						Stat *stat = card->getStats()[index];
						if (strcmp(stat->getDesc().c_str(), "Mobile No") == 0) {
							if (next != NULL) {
								delete next;
								feed->remHttp();
								next = NULL;
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
				case PROFILE:
					if (!isBusy) {
						isBusy = true;
						saveProfileData();
					}
					break;
				case BALANCE:
					maPlatformRequest("http://buy.mytcg.net/");
					//next->show();
					break;
				case FRIENDS:
					if (next != NULL) {
						delete next;
						next = NULL;
					}
					next = new TradeFriendDetailScreen(this, feed, NULL);
					next->show();
					break;
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			if(screenType == NOTIFICATIONS){
				((NewMenuScreen *)previous)->refresh();
			}
			previous->show();
			break;
		case MAK_UP:
			if(currentSelectedKey!=NULL){
				currentSelectedKey->setSelected(false);
				currentSelectedKey = NULL;
				currentKeyPosition = -1;
				kinListBox->getChildren()[kinListBox->getChildren().size()-1]->setSelected(true);
			} else if ((screenType == PROFILE)||(screenType == RANKING)||(screenType == FRIEND)) {
				if (ind == 0) {
					kinListBox->setSelectedIndex(max-1);
				} else {
					kinListBox->selectPreviousItem();
					kinListBox->selectPreviousItem();
				}
			} else {
				if (ind == 0) {
					kinListBox->setSelectedIndex(max-1);
				} else {
					kinListBox->selectPreviousItem();
				}
			}
			break;
		case MAK_DOWN:
			if (ind == max-1 && currentSelectedKey==NULL) {
				kinListBox->getChildren()[ind]->setSelected(false);
				for(int i = 0; i < currentSoftKeys->getChildren().size();i++){
					if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
						currentKeyPosition=i;
						currentSelectedKey= currentSoftKeys->getChildren()[i];
						currentSelectedKey->setSelected(true);
						break;
					}
				}
			} else if ((ind == 0)&&(screenType != CARD)) {
				if ((screenType == FRIENDS)||(screenType == NOTIFICATIONS)) {
					kinListBox->setSelectedIndex(1);
				} else if ((screenType == RANKING)||(screenType == FRIEND)) {
					kinListBox->setSelectedIndex(2);
				} else {
					kinListBox->setSelectedIndex(3);
				}
			} else {
				kinListBox->selectNextItem();
				if ((screenType == PROFILE)||(screenType == RANKING)||(screenType == FRIEND)) {
					kinListBox->selectNextItem();
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

void DetailScreen::saveProfileData() {
	label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
	credits = 0;
	count = 0;
	bool saving = false;
	for (int i = 0; i < answers.size(); i++) {
		if(answers[i]->getAnswer() != answers[i]->getEditBoxPointer()->getCaption()){
			saving = true;
			int urlLength = 100+URLSIZE + answers[i]->getAnswerId().length()+answers[i]->getEditBoxPointer()->getCaption().length()+answers[i]->getCreditValue().length();
			char *url = new char[urlLength+1];
			memset(url,'\0',urlLength+1);
			sprintf(url, "%s?saveprofiledetail=1&answer_id=%s&answer=%s&answered=%i&creditvalue=%s", URL, URLencode(answers[i]->getAnswerId()).c_str(),URLencode(answers[i]->getEditBoxPointer()->getCaption()).c_str(),answers[i]->getAnswered(),URLencode(answers[i]->getCreditValue()).c_str());
			lprintfln("%s", url);
			mHttp = HttpConnection(this);
			int res = mHttp.create(url, HTTP_GET);
			if(res < 0) {
				label->setCaption("Unable to connect, try again later...");
			} else {
				label->setCaption("Saving...");
				mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
				mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
				feed->addHttp();
				mHttp.finish();

			}
			delete [] url;
			url = NULL;
			if(answers[i]->getAnswered()==0 && answers[i]->getEditBoxPointer()->getCaption().size()>0){
				credits = credits + atoi(answers[i]->getCreditValue().c_str());
				count++;
				answers[i]->setAnswered(1);
				answers[i]->getCheckBoxPointer()->flip();
			}
			answers[i]->setAnswer(answers[i]->getEditBoxPointer()->getCaption().c_str());
		}
	}
	if (saving) {
		label->setCaption("Saving.");
	} else {
		label->setCaption("No changes detected.");
	}



	isBusy = false;
}

void DetailScreen::saveLocalData() {

}

void DetailScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		feed->remHttp();
		if (screenType == BALANCE) {
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_LABEL_HEIGHT, NULL, "No transactions.", 0, Util::getDefaultFont());
			label->setPaddingLeft(20);
			label->setPaddingRight(20);
			label->addWidgetListener(this);
			label->setHorizontalAlignment(Label::HA_CENTER);
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setSkin(Util::getSkinListNoArrows());
			label->setMultiLine(true);
			kinListBox->add(label);
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("");
			kinListBox->setSelectedIndex(4);
		} else if (screenType == PROFILE) {
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("Unable to connect, try again later...");
		} else {
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("");
		}
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
	if(!strcmp(parentTag.c_str(), "answer_id")) {
		answerid = data;
	} else if(!strcmp(parentTag.c_str(), "detail_id")) {
		//credits = data;
	} else if(!strcmp(parentTag.c_str(), "creditvalue")) {
		creditvalue = data;
	} else if(!strcmp(parentTag.c_str(), "credits")) {
		cred = data;
	} else if(!strcmp(parentTag.c_str(), "premium")) {
		prem = data;
	} else if(!strcmp(parentTag.c_str(), "desc")) {
		desc += data;
	} else if(!strcmp(parentTag.c_str(), "answer")) {
		answer = data;
	} else if(!strcmp(parentTag.c_str(), "answered")) {
		answered = Convert::toInt(data);
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg = data;
	} else if(!strcmp(parentTag.c_str(), "id")) {
		id += data;
	} else if(!strcmp(parentTag.c_str(), "date")) {
		date += data;
	} else if(!strcmp(parentTag.c_str(), "value")) {
		value = data;
	} else if(!strcmp(parentTag.c_str(), "val")) {
		val = data;
	} else if(!strcmp(parentTag.c_str(), "usr")) {
		usr = data;
	}
}

void DetailScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "profiledetails")) {
		label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
		label->setCaption("");
		isBusy = false;
	} else if(!strcmp(name, "premium")) {
		feed->setCredits(cred.c_str());
		feed->setPremium(prem.c_str());
		Util::saveData("fd.sav", feed->getAll().c_str());
		premiumLabel->setCaption(prem.c_str());
		cred = "0";
		prem = "0";
	} else if(!strcmp(name, "transactions")) {
		if (count == 0) {
			label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_LABEL_HEIGHT, NULL, "No transactions yet.", 0, Util::getDefaultFont());
			label->setPaddingLeft(20);
			label->setPaddingRight(20);
			label->addWidgetListener(this);
			label->setHorizontalAlignment(Label::HA_CENTER);
			label->setVerticalAlignment(Label::VA_CENTER);
			label->setSkin(Util::getSkinListNoArrows());
			label->setMultiLine(true);
			kinListBox->add(label);
		}
		kinListBox->setSelectedIndex(3);
		label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
		label->setCaption("");
	} else if(!strcmp(name, "transaction")) {
		count++;

		label = new Label(0, 0, kinListBox->getWidth()-(PADDING*2), DEFAULT_DETAILS_ITEM_HEIGHT, NULL,
				"", 0, Util::getDefaultFont());
		label->setCaption(date + ": " + desc);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setSkin(Util::getSkinListNoArrows());
		label->setMultiLine(true);
		label->setPaddingBottom(5);
		label->setPaddingLeft(PADDING);
		label->addWidgetListener(this);
		kinListBox->add(label);
		desc = "";
		date = "";
	} else if(!strcmp(name, "detail")) {
		label = new Label(0,0, scrWidth-((PADDING*2)), DEFAULT_SMALL_LABEL_HEIGHT, NULL, desc, 0, Util::getDefaultFont());
		label->setDrawBackground(false);
		kinListBox->add(label);

		Layout *feedlayout = new Layout(0, 0, scrWidth, DEFAULT_LABEL_HEIGHT, kinListBox, 3, 1);
		feedlayout->setDrawBackground(false);
		feedlayout->addWidgetListener(this);

		label = new Label(0,0, scrWidth-(PADDING+40), DEFAULT_LABEL_HEIGHT, NULL, "", 0, Util::getDefaultFont());
		label->setSkin(Util::getSkinEditBox());
		Util::setPadding(label);
		editBoxUsername = new NativeEditBox(0, 0, label->getWidth()-(PADDING*2), label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, answer, L"Answer");
		editBoxUsername->setDrawBackground(false);
		label->addWidgetListener(this);
		feedlayout->add(label);

		CheckBox *test = new CheckBox(scrWidth - 40, 0, 36, 46, feedlayout);
		test->setDrawBackground(false);
		if (answered) {
			test->flip();
		}
		test->setPaddingTop(10);

		ans = new Answer();
		ans->setAnswerId(answerid.c_str());
		ans->setAnswer(answer.c_str());
		ans->setAnswered(answered);
		ans->setCreditValue(creditvalue.c_str());
		ans->setDesc(desc.c_str());
		ans->setEditBoxPointer(editBoxUsername);
		ans->setCheckBoxPointer(test);
		answers.add(ans);



		ans=NULL;
		answerid = "";
		desc = "";
		answered = 0;
		answer = "";
		creditvalue = "";

		kinListBox->setSelectedIndex(1);

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
			kinListBox->add(label);

			kinListBox->setSelectedIndex(0);
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("");
		} else {
			kinListBox->setSelectedIndex(1);
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("");
		}
	} else if(!strcmp(name, "note")) {
		count++;

		label = new Label(0, 0, kinListBox->getWidth()-(PADDING*2), DEFAULT_DETAILS_ITEM_HEIGHT, NULL,
				"", 0, Util::getDefaultFont());
		label->setCaption(date + ": " + desc);
		//label->setVerticalAlignment(Label::VA_CENTER);
		label->setSkin(Util::getSkinListNoArrows());
		label->setMultiLine(true);
		label->setPaddingBottom(PADDING);
		label->setPaddingLeft(PADDING);
		label->addWidgetListener(this);
		kinListBox->add(label);
		desc = "";
		date = "";
		id = "";
	} else if(!strcmp(name, "leader")) {

		count++;
		label->setCaption("");
		label = new Label(0,0, scrWidth-((PADDING*2)), DEFAULT_SMALL_LABEL_HEIGHT, NULL, usr, 0, Util::getDefaultFont());
		label->setDrawBackground(false);
		kinListBox->add(label);

		label = Util::createEditLabel("");
		editBoxUsername = new NativeEditBox(0, 0, label->getWidth()-(PADDING*2), label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, val, L"");
		editBoxUsername->setDrawBackground(false);
		//label->addWidgetListener(this);

		kinListBox->add(label);

		usr="";
		val="";

		kinListBox->setSelectedIndex(0);
	} else if(!strcmp(name, "leaderboard")) {
		if (count == 0) {
			label->setCaption("");
			label = new Label(0,0, scrWidth-((PADDING*2)), DEFAULT_SMALL_LABEL_HEIGHT, NULL, "No users found.", 0, Util::getDefaultFont());
			label->setDrawBackground(false);
			kinListBox->add(label);

			usr="";
			val="";
		}
	} else if(!strcmp(name, "friend")) {

		count++;
		label = new Label(0, 0, kinListBox->getWidth()-(PADDING*2), DEFAULT_DETAILS_ITEM_HEIGHT, NULL,
				"", 0, Util::getDefaultFont());
		label->setCaption(usr+"\n"+val+"\n"+desc);
		label->setVerticalAlignment(Label::VA_CENTER);
		label->setSkin(Util::getSkinListNoArrows());
		label->setMultiLine(true);
		label->setPaddingBottom(5);
		label->setPaddingLeft(PADDING);
		label->addWidgetListener(this);
		kinListBox->add(label);

		usr="";
		val="";
		desc="";
	} else if(!strcmp(name, "friends")) {
		if (count == 0) {
			label->setCaption("");
			label = new Label(0,0, scrWidth-((PADDING*2)), DEFAULT_SMALL_LABEL_HEIGHT, NULL, "No friends found.", 0, Util::getDefaultFont());
			label->setDrawBackground(false);
			kinListBox->add(label);

			usr="";
			val="";

			kinListBox->setSelectedIndex(0);
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("");
		} else {
			kinListBox->setSelectedIndex(1);
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("");
		}
	} else {
		if (screenType == PROFILE) {
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];

			if (label != NULL) {
				label->setCaption("Profile details updated.");
			}
		} else if (screenType == BALANCE) {
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
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
			premiumLabel->setCaption(feed->getPremium());
			break;
	}
}
