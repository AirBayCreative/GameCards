#include "AuctionCreateScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"
#include "../UI/Widgets/MobImage.h"

AuctionCreateScreen::AuctionCreateScreen(Screen *previous, Feed *feed, Card *card) : mHttp(this), previous(previous), feed(feed), card(card) {
	listBox = NULL;
	mainLayout= NULL;

	mImageCache = new ImageCache();

	screenMode = ST_DATA;

	errorString = "";
	openingText = "";
	buyNowText = "";
	daysText = "";
	parentTag = "";
	createResult = "";

	busy = false;

	drawDataInputScreen();
}

AuctionCreateScreen::~AuctionCreateScreen() {
	delete mainLayout;
	delete mImageCache;
}

#if defined(MA_PROF_SUPPORT_STYLUS)
void AuctionCreateScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void AuctionCreateScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void AuctionCreateScreen::pointerReleaseEvent(MAPoint2d point)
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

void AuctionCreateScreen::locateItem(MAPoint2d point)
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
#endif

void AuctionCreateScreen::keyPressEvent(int keyCode) {
	switch(screenMode) {
		case ST_DATA:
			switch(keyCode) {
				case MAK_FIRE:
					break;
				case MAK_SOFTRIGHT:
					if (!busy) {
						openingText = editBoxOpening->getCaption();
						buyNowText = editBoxBuyNow->getCaption();
						daysText = editBoxDays->getCaption();

						validateInput();

						if (errorString.length() == 0) {
							editBoxOpening->setSelected(false);
							editBoxBuyNow->setSelected(false);
							editBoxDays->setSelected(false);

							busy = true;
							notice->setCaption("Creating auction...");

							//work out how long the url will be, the 8 is for the & and = symbols
							int urlLength = CREATE_AUCTION.length() + strlen(xml_cardid) + card->getId().length() + strlen(xml_opening) +
									openingText.length() + strlen(xml_buyout) + buyNowText.length() + strlen(xml_days) + daysText.length() + 8;
							char *url = new char[urlLength];
							memset(url,'\0',urlLength);
							sprintf(url, "%s&%s=%s&%s=%s&%s=%s&%s=%s", CREATE_AUCTION.c_str(), xml_cardid, card->getId().c_str(),
									xml_opening, openingText.c_str(), xml_buyout, buyNowText.c_str(), xml_days, daysText.c_str());
							if(mHttp.isOpen()){
								mHttp.close();
							}
							mHttp = HttpConnection(this);
							int res = mHttp.create(url, HTTP_GET);

							if(res < 0) {
								notice->setCaption("");
							} else {
								mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
								mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
								mHttp.finish();
							}
							delete [] url;
						}
						else {
							screenMode = ST_INVALID;
							drawInvalidInputScreen();
						}
					}
					break;
				case MAK_BACK:
				case MAK_SOFTLEFT:
					editBoxOpening->setSelected(false);
					editBoxBuyNow->setSelected(false);
					editBoxDays->setSelected(false);

					previous->show();
					break;
				case MAK_UP:
					if (listBox->getSelectedIndex() > 1) {
						listBox->setSelectedIndex(listBox->getSelectedIndex() - 2);
					}
					//setSelectedEditBox();
					break;
				case MAK_DOWN:
					if (listBox->getSelectedIndex() < 5) {
						listBox->setSelectedIndex(listBox->getSelectedIndex() + 2);
					}
					//setSelectedEditBox();
					break;
			}
			break;
		case ST_CREATED:
			switch(keyCode) {
				case MAK_SOFTRIGHT:
					orig->show();
					break;
			}
			break;
		case ST_INVALID:
			switch(keyCode) {
				case MAK_BACK:
				case MAK_SOFTLEFT:
					screenMode = ST_DATA;
					drawDataInputScreen();
					break;
			}
			break;
	}
}

void AuctionCreateScreen::validateInput() {
	errorString = "";

	if (openingText.length() == 0) {
		errorString += "Please enter an opening bid.\n";
	}
	else if (!isNumeric(openingText)) {
		errorString += "Please enter a valid opening bid.\n";
	}

	if (buyNowText.length() == 0) {
		errorString += "Please enter a buy now price.\n";
	}
	else if (!isNumeric(buyNowText)) {
		errorString += "Please enter a valid buy now price.\n";
	}

	if (daysText.length() == 0) {
		errorString += "Please enter the length of the auction(in days).";
	}
	else if (!isNumeric(daysText)) {
		errorString += "Please enter a valid length of the auction(in days).";
	}
}

void AuctionCreateScreen::setSelectedEditBox() {
	editBoxOpening->setSelected(false);
	editBoxBuyNow->setSelected(false);
	editBoxDays->setSelected(false);

	switch(listBox->getSelectedIndex()) {
		case 2:
			editBoxOpening->setSelected(true);
			break;
		case 4:
			editBoxBuyNow->setSelected(true);
			break;
		case 6:
			editBoxDays->setSelected(true);
			break;
	}
}

void AuctionCreateScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}

void AuctionCreateScreen::drawDataInputScreen() {
	if (mainLayout == NULL) {
		mainLayout = createMainLayout(back, auction, true);
		listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
		notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	}
	else {
		clearListBox();
		updateSoftKeyLayout(back, auction, "", mainLayout);
	}

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 2, 1);
	feedlayout->setSkin(gSkinBack);
	feedlayout->setDrawBackground(true);
	feedlayout->addWidgetListener(this);

	MobImage *tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

	retrieveThumb(tempImage, card, mImageCache);

	label = new Label(0,0, scrWidth-86, 74, feedlayout, card->getText(), 0, gFontBlack);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setAutoSizeY();
	label->setMultiLine(true);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, opening_bid, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	//editBoxOpening = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, openingText, 0, gFontBlack, true, false);
	editBoxOpening = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"Opening bid");
	editBoxOpening->setCaption(openingText);
	editBoxOpening->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, buy_now_price, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	//editBoxBuyNow = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, buyNowText, 0, gFontBlack, true, false);
	editBoxBuyNow = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"Buy now price");
	editBoxBuyNow->setCaption(buyNowText);
	editBoxBuyNow->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, auction_duration, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	//editBoxDays = new MobEditBox(0, 12, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, label, daysText, 0, gFontBlack, true, false);
	editBoxDays = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"Auction duration(days)");
	editBoxDays->setCaption(daysText);
	editBoxDays->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	this->setMain(mainLayout);

	moved = 0;
	editBoxOpening->setSelected(true);
	listBox->setSelectedIndex(2);
}

void AuctionCreateScreen::drawCreatedScreen() {
	clearListBox();
	updateSoftKeyLayout("", confirm, "", mainLayout);

	String result = "";
	if (!strcmp(createResult.c_str(), auction_created_successfully_result)) {
		result = auction_created;
	}
	else {
		result = auction_failed;
	}

	label = new Label(0,0, scrWidth-PADDING*2, scrHeight - 24, NULL, result, 0, gFontBlack);
	label->setMultiLine(true);
	label->setAutoSizeY(true);
	listBox->add(label);

	this->setMain(mainLayout);

	this->show();
}

void AuctionCreateScreen::drawInvalidInputScreen() {
	editBoxOpening->setSelected(false);
	editBoxBuyNow->setSelected(false);
	editBoxDays->setSelected(false);

	clearListBox();
	updateSoftKeyLayout(back, "", "", mainLayout);

	label = new Label(0,0, scrWidth-PADDING*2, scrHeight - 24, NULL, errorString, 0, gFontBlack);
	label->setMultiLine(true);
	label->setAutoSizeY(true);
	listBox->add(label);

	this->setMain(mainLayout);

	this->show();
}

void AuctionCreateScreen::clearListBox() {
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

/*#if defined(MA_PROF_SUPPORT_STYLUS)
void AuctionCreateScreen::setKeyboardDetails(MAPoint2d point){
	int index = listBox->getSelectedIndex();
	int yClick = point.y;
	int yKeyboardTop = keyboard->getPosition().y;
	int yKeyboardBot = keyboard->getPosition().y + keyboard->getHeight();
	if ((yClick > yKeyboardTop && yClick < yKeyboardBot) ||
			(index == 2 || index == 4 || index == 6)) {

		if (!keyboard->isShown() || (keyboard->isShown() && (yClick < yKeyboardTop || yClick > yKeyboardBot))) {

			if (index == 2) {
				keyboard->attachWidget(editBoxOpening);
			}
			else if (index == 4) {
				keyboard->attachWidget(editBoxBuyNow);
			}
			else if (index == 6) {
				keyboard->attachWidget(editBoxDays);
			}

			//then work out where the keyboard needs to be drawn.
			bool useDefault = true;
			//first get default values. 0 is always the value for x
			int defaultY = (int)floor((double)scrHeight - keyboard->getHeight());
			int attachedY = keyboard->getAttachedWidget()->getParent()->getBounds().y + (listBox->getYOffset()>>16);
			int attachedHeight = keyboard->getAttachedWidget()->getHeight();

			if (defaultY < (attachedY + attachedHeight)) {
				useDefault = false;
			}

			//if the default position at the bottom covers the edit box, then check for when its at the top
			if (!useDefault) {
				if (keyboard->getHeight() > attachedY) {
					//if the top covers it too, just default to bottom
					useDefault = true;
				}
			}

			//set the position accordingly
			if (useDefault) {
				keyboard->setPosition(0, defaultY);
			} else {
				keyboard->setPosition(0, 70);
			}
		}
		keyboard->show();
	}
	else if (keyboard->isShown()) {
		keyboard->deAttachEditBox();
		keyboard->hide();

		mainLayout->draw(true);
	}
}
#endif*/

void AuctionCreateScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		busy = false;
		mHttp.close();
	}
}

void AuctionCreateScreen::connReadFinished(Connection* conn, int result) {}

void AuctionCreateScreen::xcConnError(int code) {
	busy = false;
}

void AuctionCreateScreen::mtxEncoding(const char* ) {
}

void AuctionCreateScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void AuctionCreateScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void AuctionCreateScreen::mtxTagData(const char* data, int len) {
	createResult = data;
}

void AuctionCreateScreen::mtxTagEnd(const char* name, int len) {
	notice->setCaption("");
	busy = false;

	screenMode = ST_CREATED;
	drawCreatedScreen();
}

void AuctionCreateScreen::mtxParseError() {
}

void AuctionCreateScreen::mtxEmptyTagEnd() {
}

void AuctionCreateScreen::mtxTagStartEnd() {
}
