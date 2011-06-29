#include "DetailScreen.h"
#include "OptionsScreen.h"
#include "ShopProductsScreen.h"
#include <mastdlib.h>
#include "../utils/Util.h"
#include "../utils/Stat.h"
#include "../UI/CheckBox.h"

DetailScreen::DetailScreen(Screen *previous, Feed *feed, int screenType, Card *card) : mHttp(this), previous(previous),
		feed(feed), screenType(screenType), card(card) {
	lprintfln("DetailScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	mainLayout = createMainLayout(screenType==CARD?select:screenType==BALANCE?purchase:screenType==PROFILE?savelbl:"", back, screenType==BALANCE?log_string:"", true);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	next=NULL;
	answers=NULL;
	isBusy=true;
	switch (screenType) {
		case PROFILE:
			//loop for each entry found in user_details. if Answered test->flip() to set checked.
			label = new Label(0,0, scrWidth-((PADDING*2)), 24, NULL, userlbl, 0, gFontBlack);
			listBox->add(label);

			Layout *feedlayout = new Layout(0, 0, scrWidth, 74, listBox, 3, 1);
			feedlayout->setDrawBackground(true);
			feedlayout->addWidgetListener(this);

			label = new Label(0,0, scrWidth-(PADDING+40), 48, NULL, "", 0, gFontBlack);
			label->setSkin(gSkinEditBox);
			setPadding(label);
			editBoxUsername = new NativeEditBox(0, 0, label->getWidth()-(PADDING*2), label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, feed->getUsername(), L"Username:");
			editBoxUsername->setDrawBackground(false);
			label->addWidgetListener(this);
			feedlayout->add(label);

			CheckBox *test = new CheckBox(scrWidth - 40, 0, 36, 46, feedlayout);
			test->setPaddingTop(10);

			break;
		case BALANCE:
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, avail_credits, 0, gFontBlack);
			listBox->add(label);

			balanceLabel = createLabel(feed->getCredits());
			balanceLabel->setVerticalAlignment(Label::VA_CENTER);
			listBox->add(balanceLabel);

			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, last_trans, 0, gFontBlack);
			listBox->add(label);
			break;
		case CARD:
			for (int i = 0; i < card->getStats().size(); i++) {
				label = createSubLabel(card->getStats()[i]->getDesc() + " : " + card->getStats()[i]->getDisplay());
				label->setPaddingBottom(5);
				label->addWidgetListener(this);
				listBox->add(label);
			}
			if (card->getStats().size() == 0) {
				label = createSubLabel(empty);
				label->setPaddingBottom(5);
				label->addWidgetListener(this);
				listBox->add(label);
			}
			break;
	}

	if (screenType == PROFILE) {
		int res = mHttp.create(PROFILEURL.c_str(), HTTP_GET);

		if(res < 0) {

		} else {
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption(checking_info);

			mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
			mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
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
	}
	//username = "";
	//credits = "";
	encrypt = "";
	error_msg = "";
	parentTag = "";
	//email = "";
	for (int i = 0; i < answers.size(); i++) {
		if (answers[i] != NULL) {
			delete answers[i];
			answers[i] = NULL;
		}
	}
	answers.clear();
}

#if defined(MA_PROF_SUPPORT_STYLUS)
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
	if (feed->setTouch(truesz)) {
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
#endif

void DetailScreen::selectionChanged(Widget *widget, bool selected) {
	if (screenType == CARD) {
		if(selected) {
			((Label *)widget)->setFont(gFontBlue);
		} else {
			((Label *)widget)->setFont(gFontBlack);
		}
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
			break;
		case MAK_SOFTLEFT:
			switch (screenType) {
				case CARD:
					int index = listBox->getSelectedIndex();
					if(card->getStats()[index]!=NULL){
						Stat *stat = card->getStats()[index];
						if (strcmp(stat->getDesc().c_str(), contact_number) == 0) {
							if (next != NULL) {
								delete next;
								next == NULL;
							}
							next = new OptionsScreen(feed, OptionsScreen::ST_NUMBER_OPTIONS, this, card, stat->getDesc());
							next->show();
						}
						else if (strcmp(stat->getDesc().c_str(), contact_email) == 0) {

						}
						else if (strcmp(stat->getDesc().c_str(), contact_website) == 0) {
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
					// TODO: need to check what fields have been updated and how many credits should be awarded.
					break;
				case BALANCE:
					next = new ShopProductsScreen(this, feed, "credits", false, false);
					next->show();
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

void DetailScreen::saveProfileData() {
	label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
	credits = 0;
	count = 0;
	for (int i = 0; i < answers.size(); i++) {
		if(answers[i]->getAnswer() != answers[i]->getEditBoxPointer()->getCaption()){
			int urlLength = SAVEPROFILE.length() + strlen(xml_answer_id)+answers[i]->getAnswerId().length()+strlen(xml_answer)+answers[i]->getEditBoxPointer()->getCaption().length()+strlen(xml_answered)+1+strlen(xml_creditvalue)+answers[i]->getCreditValue().length()+8;
			char *url = new char[urlLength];
			memset(url,'\0',urlLength);
			sprintf(url, "%s&%s=%s&%s=%s&%s=%i&%s=%s", SAVEPROFILE.c_str(),xml_answer_id, answers[i]->getAnswerId().c_str(),xml_answer,answers[i]->getEditBoxPointer()->getCaption().c_str(),xml_answered,answers[i]->getAnswered(),xml_creditvalue,answers[i]->getCreditValue().c_str());
			lprintfln("%s&%s=%s&%s=%s&%s=%i&%s=%s", SAVEPROFILE.c_str(),xml_answer_id, answers[i]->getAnswerId().c_str(),xml_answer,answers[i]->getEditBoxPointer()->getCaption().c_str(),xml_answered,answers[i]->getAnswered(),xml_creditvalue,answers[i]->getCreditValue().c_str());
			mHttp = HttpConnection(this);
			int res = mHttp.create(url, HTTP_GET);
			if(res < 0) {
				label->setCaption(no_connect);
			} else {
				label->setCaption("Saving...");
				mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
				mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
				mHttp.finish();
			}
			delete [] url;
			if(answers[i]->getAnswered()==0 && answers[i]->getEditBoxPointer()->getCaption().size()>0){
				credits = credits + atoi(answers[i]->getCreditValue().c_str());
				count++;
				answers[i]->setAnswered(1);
				answers[i]->getCheckBoxPointer()->flip();
			}
		}
	}

	label->setCaption("Saving.");

	isBusy = false;
}

void DetailScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		//label->setCaption("");
	}
}

void DetailScreen::connReadFinished(Connection* conn, int result) {}

void DetailScreen::xcConnError(int code) {
}

void DetailScreen::mtxEncoding(const char* ) {}

void DetailScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void DetailScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void DetailScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), xml_answer_id)) {
		answerid += data;
	} else if(!strcmp(parentTag.c_str(), xml_detail_id)) {
		//credits += data;
	} else if(!strcmp(parentTag.c_str(), xml_creditvalue)) {
		creditvalue += data;
	} else if(!strcmp(parentTag.c_str(), xml_desc)) {
		desc += data;
	} else if(!strcmp(parentTag.c_str(), xml_answer)) {
		answer += data;
	} else if(!strcmp(parentTag.c_str(), xml_answered)) {
		answered = Convert::toInt(data);
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	}
}

void DetailScreen::mtxTagEnd(const char* name, int len) {
	//TODO not currently updating screen components. Only on screen recreate.
	if(!strcmp(name, xml_profiledetails)) {
		//label->setCaption("");
		//feed->setCredits(credits.c_str());
		//feed->setEmail(email.c_str());
		//feed->setUnsuccessful(success);
		//username,error_msg= "";
		//saveData(FEED, feed->getAll().c_str());
		label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
		label->setCaption("");
		//refreshData();
		isBusy = false;
	} else if(!strcmp(name, xml_detail)) {


		label = new Label(0,0, scrWidth-((PADDING*2)), 24, NULL, desc, 0, gFontBlack);
		listBox->add(label);

		Layout *feedlayout = new Layout(0, 0, scrWidth, 74, listBox, 3, 1);
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		label = new Label(0,0, scrWidth-(PADDING+40), 48, NULL, "", 0, gFontBlack);
		label->setSkin(gSkinEditBox);
		setPadding(label);
		editBoxUsername = new NativeEditBox(0, 0, label->getWidth()-(PADDING*2), label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, answer, L"Username:");
		editBoxUsername->setDrawBackground(false);
		label->addWidgetListener(this);
		feedlayout->add(label);

		CheckBox *test = new CheckBox(scrWidth - 40, 0, 36, 46, feedlayout);
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
	} else if(!strcmp(name, xml_error)) {
		if (label != NULL) {
			label->setCaption(error_msg.c_str());
		}
	} else {
		label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];

		if (label != NULL) {
			if(count >0){
				char * lbl = new char[50];
				sprintf(lbl,"%i extra field(s) filled in. You got %i Credits.",count,credits);
				String lab = lbl;
				label->setCaption(lab);
			} else{
				label->setCaption("Saved.");
			}
		}
	}
}

void DetailScreen::mtxParseError() {
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
