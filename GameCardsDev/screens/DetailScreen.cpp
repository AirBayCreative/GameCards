#include "DetailScreen.h"
#include "OptionsScreen.h"
#include "ShopProductsScreen.h"
#include "../utils/Util.h"
#include "../utils/Stat.h"
#include "../UI/CheckBox.h"

DetailScreen::DetailScreen(Screen *previous, Feed *feed, int screenType, Card *card) : mHttp(this), previous(previous),
		feed(feed), screenType(screenType), card(card) {
	lprintfln("DetailScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	mainLayout = Util::createMainLayout(screenType==CARD?"Select":screenType==BALANCE?"Buy":screenType==PROFILE?"Save":"", "Back", screenType==BALANCE?"Log":"", true);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	next=NULL;
	switch (screenType) {
		case PROFILE:


			//loop for each entry found in user_details. if Answered test->flip() to set checked.
			label = new Label(0,0, scrWidth-((PADDING*2)), 24, NULL, "Username:", 0, Util::getFontBlack());
			listBox->add(label);

			Layout *feedlayout = new Layout(0, 0, scrWidth, 74, listBox, 3, 1);
			feedlayout->setDrawBackground(true);
			feedlayout->addWidgetListener(this);

			label = new Label(0,0, scrWidth-(PADDING+40), 48, NULL, "", 0, Util::getFontBlack());
			label->setSkin(Util::getSkinEditBox());
			Util::setPadding(label);
			editBoxUsername = new NativeEditBox(0, 0, label->getWidth()-(PADDING*2), label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, feed->getUsername(), L"Username:");
			editBoxUsername->setDrawBackground(false);
			label->addWidgetListener(this);
			feedlayout->add(label);

			CheckBox *test = new CheckBox(scrWidth - 40, 0, 36, 46, feedlayout);
			test->setPaddingTop(10);

			break;
		case BALANCE:
			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Available Credits:", 0, Util::getFontBlack());
			listBox->add(label);

			balanceLabel = Util::createLabel(feed->getCredits());
			balanceLabel->setVerticalAlignment(Label::VA_CENTER);
			listBox->add(balanceLabel);

			label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Last Transactions:", 0, Util::getFontBlack());
			listBox->add(label);
			break;
		case CARD:
			for (int i = 0; i < card->getStats().size(); i++) {
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
	}

	if (screenType != CARD) {
		int res = mHttp.create("http://dev.mytcg.net/_phone/?profiledetails=1", HTTP_GET);

		if(res < 0) {

		} else {
			label = (Label *) mainLayout->getChildren()[0]->getChildren()[1];
			label->setCaption("Checking for updated info...");

			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
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
	encrypt = "";
	error_msg = "";
	parentTag = "";

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
	if (feed->setTouch("true")) {
		Util::saveData("fd.sav", feed->getAll().c_str());
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
			((Label *)widget)->setFont(Util::getFontBlue());
		} else {
			((Label *)widget)->setFont(Util::getFontBlack());
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
		case MAK_SOFTLEFT:
			switch (screenType) {
				case CARD:
					int index = listBox->getSelectedIndex();
					if(card->getStats()[index]!=NULL){
						Stat *stat = card->getStats()[index];
						if (strcmp(stat->getDesc().c_str(), "Mobile No") == 0) {
							if (next != NULL) {
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
				case PROFILE:
					label->setCaption("# extra field(s) filled in. You received x Credits.");

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
	if(!strcmp(parentTag.c_str(), "answer_id")) {
		//username += data;
	} else if(!strcmp(parentTag.c_str(), "detail_id")) {
		//credits += data;
	} else if(!strcmp(parentTag.c_str(), "desc")) {
		desc += data;
	} else if(!strcmp(parentTag.c_str(), "answer")) {
		answer += data;
	} else if(!strcmp(parentTag.c_str(), "answered")) {
		answered = Convert::toInt(data);
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg += data;
	}
}

void DetailScreen::mtxTagEnd(const char* name, int len) {
	//TODO not currently updating screen components. Only on screen recreate.
	if(!strcmp(name, "profiledetails")) {


	} else if(!strcmp(name, "detail")) {


		label = new Label(0,0, scrWidth-((PADDING*2)), 24, NULL, desc, 0, Util::getFontBlack());
		listBox->add(label);

		Layout *feedlayout = new Layout(0, 0, scrWidth, 74, listBox, 3, 1);
		feedlayout->setDrawBackground(true);
		feedlayout->addWidgetListener(this);

		label = new Label(0,0, scrWidth-(PADDING+40), 48, NULL, "", 0, Util::getFontBlack());
		label->setSkin(Util::getSkinEditBox());
		Util::setPadding(label);
		editBoxUsername = new NativeEditBox(0, 0, label->getWidth()-(PADDING*2), label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, answer, L"Username:");
		editBoxUsername->setDrawBackground(false);
		label->addWidgetListener(this);
		feedlayout->add(label);

		CheckBox *test = new CheckBox(scrWidth - 40, 0, 36, 46, feedlayout);
		if (answered) {
			test->flip();
		}
		test->setPaddingTop(10);


		desc = "";
		answered = 0;
		answer = "";
	} else if(!strcmp(name, "error")) {
		if (label != NULL) {
			label->setCaption(error_msg.c_str());
		}
	} else {
		if (label != NULL) {
			label->setCaption("");
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
