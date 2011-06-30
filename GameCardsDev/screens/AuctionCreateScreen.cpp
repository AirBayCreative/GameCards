#include "AuctionCreateScreen.h"
#include "AlbumViewScreen.h"
#include "ShopCategoriesScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"
#include "../UI/Widgets/MobImage.h"

AuctionCreateScreen::AuctionCreateScreen(Screen *previous, Feed *feed, Card *card) : mHttp(this), previous(previous), feed(feed), card(card) {
	lprintfln("AuctionCreateScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
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
	cardText = "";

	busy = false;

	drawDataInputScreen();
}

AuctionCreateScreen::~AuctionCreateScreen() {
	delete mainLayout;
	if (mImageCache != NULL) {
		delete mImageCache;
	}
	mImageCache = NULL;
	tempImage = NULL;
	openingText = "";
	buyNowText = "";
	daysText = "";
	errorString = "";
	parentTag = "";
	createResult = "";
	cardText = "";
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
				case MAK_SOFTLEFT:
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
							int urlLength = 71 + card->getId().length() + openingText.length() + buyNowText.length() + daysText.length();
							char *url = new char[urlLength+1];
							memset(url,'\0',urlLength+1);
							sprintf(url, "http://dev.mytcg.net/_phone/?createauction=1&cardid=%s&bid=%s&buynow=%s&days=%s", card->getId().c_str(),
									openingText.c_str(), buyNowText.c_str(), daysText.c_str());
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
								mHttp.finish();
							}
							delete [] url;
						}
						else {
							notice->setCaption(errorString);
						}
					}
					break;
				case MAK_BACK:
				case MAK_SOFTRIGHT:
					if (editBoxOpening != NULL) {
						editBoxOpening->setSelected(false);
					}
					if (editBoxBuyNow != NULL) {
						editBoxBuyNow->setSelected(false);
					}
					if (editBoxDays != NULL) {
						editBoxDays->setSelected(false);
					}

					((AlbumViewScreen *)orig)->refresh();
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
					((AlbumViewScreen *)orig)->refresh();
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


	if (daysText.length() == 0) {
		errorString += "Please enter the length of the auction(in days).";
	}

}

void AuctionCreateScreen::setSelectedEditBox() {
	/*editBoxOpening->setSelected(false);
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
	}*/
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
		mainLayout = Util::createMainLayout("Auction", "Back", "", true);
		listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
		notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	}
	else {
		clearListBox();
		Util::updateSoftKeyLayout("Auction", "Back", "", mainLayout);
	}

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 74, listBox, 2, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(true);
	feedlayout->addWidgetListener(this);

	//if (tempImage != NULL) {
		//delete tempImage;
	//}

	tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);

	Util::retrieveThumb(tempImage, card, mImageCache);

	cardText = (card->getUpdated()?"*":"")+card->getText();
	cardText += " (";
	cardText += card->getQuantity();
	cardText += ")";
	cardText += "\nValue: ";
	cardText += card->getValue();
	cardText += "\n";
	cardText += card->getRarity();

	label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, Util::getFontBlack());
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setAutoSizeY();
	label->setMultiLine(true);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Opening bid", 0, Util::getFontBlack());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxOpening = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"Opening bid");
	editBoxOpening->setCaption(Convert::toString(Convert::toInt(card->getValue().c_str())+10));
	editBoxOpening->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Buy now price", 0, Util::getFontBlack());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxBuyNow = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"Buy now price");
	editBoxBuyNow->setCaption(buyNowText);
	editBoxBuyNow->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Auction duration(days)", 0, Util::getFontBlack());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxDays = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"Auction duration(days)");
	editBoxDays->setCaption("3");
	editBoxDays->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	this->setMain(mainLayout);

	moved = 0;
	editBoxOpening->setSelected(true);
	listBox->setSelectedIndex(2);
}

void AuctionCreateScreen::drawCreatedScreen() {
	cardText = (card->getUpdated()?"*":"")+card->getText();
	cardText += " (";
	cardText += Convert::toString(Convert::toInt(card->getQuantity().c_str())-1);
	cardText += ")";
	cardText += "\n";
	cardText += card->getRarity();

	cardText += "\nOpening Bid: ";
	cardText += openingText;
	if((!strcmp(buyNowText.c_str(), ""))||(!strcmp(buyNowText.c_str(), "0"))) {

	} else {
		cardText += "\nBuyout Price: ";
			cardText += buyNowText;
	}

	cardText += "\nDays Left : ";
	cardText += daysText;

	clearListBox();
	screenMode = ST_CREATED;
	Util::updateSoftKeyLayout("", "Back", "", mainLayout);

	String result = "";
	if (!strcmp(createResult.c_str(), "1")) {
		result = "Auction created!";
	}
	else {
		result = "Error creating auction.";
	}

	label = new Label(0,0, scrWidth-PADDING*2, 100, NULL, result, 0, Util::getFontBlack());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	//label->setSkin(Util::getSkinBack());
	label->setMultiLine(true);
	listBox->add(label);

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, listBox->getWidth()-(PADDING*2), 120, listBox, 2, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(true);
	feedlayout->addWidgetListener(this);

	tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, RES_LOADINGTHUMB);
	Util::retrieveThumb(tempImage, card, mImageCache);

	label = new Label(0,0, scrWidth-86, 120, feedlayout, cardText, 0, Util::getFontBlack());
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setAutoSizeY();
	label->setMultiLine(true);

	this->setMain(mainLayout);

	this->show();
}

void AuctionCreateScreen::drawInvalidInputScreen() {
	editBoxOpening->setSelected(false);
	editBoxBuyNow->setSelected(false);
	editBoxDays->setSelected(false);

	clearListBox();
	Util::updateSoftKeyLayout("", "Back", "", mainLayout);

	label = new Label(0,0, scrWidth-PADDING*2, scrHeight - 24, NULL, errorString, 0, Util::getFontBlack());
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
