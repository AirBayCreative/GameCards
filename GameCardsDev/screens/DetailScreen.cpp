#include "DetailScreen.h"
#include "OptionsScreen.h"
#include "ShopProductsScreen.h"
#include "../utils/Util.h"
#include "../utils/Stat.h"

DetailScreen::DetailScreen(Screen *previous, Feed *feed, int screenType, Card *card) : mHttp(this), previous(previous),
		feed(feed), screenType(screenType), card(card) {
	mainLayout = createMainLayout(back, screenType==CARD?select:screenType==BALANCE?purchase:screenType==PROFILE?savelbl:"", screenType==BALANCE?log_string:"", true);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	next=NULL;
	switch (screenType) {
		case PROFILE:
			//USERNAME
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, userlbl, 0, gFontBlack);
			listBox->add(label);

			//label = createLabel(feed->getUsername());
			//label->setVerticalAlignment(Label::VA_CENTER);
			//listBox->add(label);

			label = createEditLabel("");
			editBoxUsername = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, feed->getUsername(), L"Username:");
			editBoxUsername->setDrawBackground(false);
			label->addWidgetListener(this);
			listBox->add(label);

			//EMAIL
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, emaillbl, 0, gFontBlack);
			listBox->add(label);

			//label = createLabel(feed->getEmail());
			//label->setVerticalAlignment(Label::VA_CENTER);
			//listBox->add(label);

			label = createEditLabel("");
			editBoxEmail = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, feed->getEmail(), L"Email:");
			editBoxEmail->setDrawBackground(false);
			label->addWidgetListener(this);
			listBox->add(label);

			//HANDLE
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, handlelbl, 0, gFontBlack);
			listBox->add(label);

			label = createEditLabel("");
			editBoxHandle = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, feed->getHandle(), L"Handle:");
			editBoxHandle->setDrawBackground(false);
			label->addWidgetListener(this);
			listBox->add(label);

			//ID
			//label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "ID", 0, gFontBlack);
			//listBox->add(label);

			//label = createEditLabel("");
			//editBoxID = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, feed->getGameId(), L"ID:");
			//editBoxID->setDrawBackground(false);
			//label->addWidgetListener(this);
			//listBox->add(label);
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
				/*label = createLabel(card->getStats()[i]->getDesc() + " : " + card->getStats()[i]->getDisplay());
				label->setVerticalAlignment(Label::VA_CENTER);
				setPadding(label);
				listBox->add(label);*/
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

	if (screenType != CARD) {
		int res = mHttp.create(USER.c_str(), HTTP_GET);

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
	username = "";
	credits = "";
	encrypt = "";
	error_msg = "";
	parentTag = "";
	email = "";
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
		case MAK_SOFTRIGHT:
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
					label->setCaption("# extra field(s) filled in. You received x Credits.");
					break;
				case BALANCE:
					next = new ShopProductsScreen(this, feed, "credits", false);
					next->show();
					break;
			}
			break;
		case MAK_BACK:
		case MAK_SOFTLEFT:
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
	if(!strcmp(parentTag.c_str(), xml_username)) {
		username += data;
	} else if(!strcmp(parentTag.c_str(), xml_credits)) {
		credits += data;
	} else if(!strcmp(parentTag.c_str(), xml_email)) {
		email += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	}
}

void DetailScreen::mtxTagEnd(const char* name, int len) {
	//TODO not currently updating screen components. Only on screen recreate.
	if(!strcmp(name, xml_status)) {
		label->setCaption("");
		feed->setCredits(credits.c_str());
		feed->setEmail(email.c_str());
		feed->setUnsuccessful(success);
		username,error_msg= "";
		saveData(FEED, feed->getAll().c_str());

		refreshData();
	} else if(!strcmp(name, xml_error)) {
		if (label != NULL) {
			label->setCaption(error_msg.c_str());
		}
	} else {
		if (label != NULL) {
			label->setCaption("");
		}
	}
}

void DetailScreen::mtxParseError(int offSet) {
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
