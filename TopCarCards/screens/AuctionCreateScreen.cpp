#include "AuctionCreateScreen.h"
#include "AlbumViewScreen.h"
#include "ShopCategoriesScreen.h"
#include <mastdlib.h>
#include "../utils/Util.h"
#include "../UI/Widgets/MobImage.h"
#include "../UI/Button.h"

AuctionCreateScreen::AuctionCreateScreen(MainScreen *previous, Feed *feed, Card *card) : mHttp(this), card(card) {
	lprintfln("AuctionCreateScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
		this->feed = feed;
	kinListBox = NULL;
	mainLayout= NULL;
	currentSelectedKey = NULL;
	currentKeyPosition = -1;

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

void AuctionCreateScreen::menuOptionSelected(int index) {
	previous->pop();
}

AuctionCreateScreen::~AuctionCreateScreen() {
	lprintfln("~AuctionCreateScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	delete mainLayout;
	mainLayout = NULL;
	if (mImageCache != NULL) {
		delete mImageCache;
		mImageCache = NULL;
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

void AuctionCreateScreen::keyPressEvent(int keyCode) {
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];
	switch(screenMode) {
		case ST_DATA:
			switch(keyCode) {
				case MAK_FIRE:
					if(currentSoftKeys->getChildren()[0]->isSelected()){
						keyPressEvent(MAK_SOFTLEFT);
					}else if(currentSoftKeys->getChildren()[2]->isSelected()){
						keyPressEvent(MAK_SOFTRIGHT);
					}
					break;
				case MAK_SOFTLEFT:
					openingText = editBoxOpening->getCaption();
					buyNowText = editBoxBuyNow->getCaption();
					daysText = editBoxDays->getCaption();
					validateInput();
					if (errorString.length() == 0) {
						notice->setCaption("");
						drawConfirmScreen();
					}else {
						notice->setCaption(errorString);
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
					previous->show();
					//((AlbumViewScreen *)orig)->refresh();
					break;
				case MAK_UP:
					if(currentSelectedKey!=NULL){
						currentSelectedKey->setSelected(false);
						currentSelectedKey = NULL;
						currentKeyPosition = -1;
						kinListBox->getChildren()[kinListBox->getChildren().size()-1]->setSelected(true);
					}
					else if (kinListBox->getSelectedIndex() > 1) {
						kinListBox->setSelectedIndex(kinListBox->getSelectedIndex() - 2);
					}
					//setSelectedEditBox();
					break;
				case MAK_DOWN:
					if (kinListBox->getSelectedIndex() < 5) {
						kinListBox->setSelectedIndex(kinListBox->getSelectedIndex() + 2);
					} else if(currentSelectedKey==NULL){
						kinListBox->getChildren()[kinListBox->getSelectedIndex()]->setSelected(false);
						for(int i = 0; i < currentSoftKeys->getChildren().size();i++){
							if(((Button *)currentSoftKeys->getChildren()[i])->isSelectable()){
								currentKeyPosition=i;
								currentSelectedKey= currentSoftKeys->getChildren()[i];
								currentSelectedKey->setSelected(true);
								break;
							}
						}
					}
					//setSelectedEditBox();
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
			break;
		case ST_CREATED:
			switch(keyCode) {
				case MAK_FIRE:
					if(currentSoftKeys->getChildren()[0]->isSelected()){
						keyPressEvent(MAK_SOFTLEFT);
					}else if(currentSoftKeys->getChildren()[2]->isSelected()){
						keyPressEvent(MAK_SOFTRIGHT);
					}
					break;
				case MAK_UP:
					if(currentSelectedKey!=NULL){
						currentSelectedKey->setSelected(false);
						currentSelectedKey = NULL;
						currentKeyPosition = -1;
					}
					break;
				case MAK_DOWN:
					if(currentSelectedKey==NULL){
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
				case MAK_SOFTRIGHT:
					((AlbumViewScreen *)orig)->refresh();
					break;
			}
			break;
		case ST_INVALID:
			switch(keyCode) {
				case MAK_FIRE:
					if(currentSoftKeys->getChildren()[0]->isSelected()){
						keyPressEvent(MAK_SOFTLEFT);
					}else if(currentSoftKeys->getChildren()[2]->isSelected()){
						keyPressEvent(MAK_SOFTRIGHT);
					}
					break;
				case MAK_UP:
					if(currentSelectedKey!=NULL){
						currentSelectedKey->setSelected(false);
						currentSelectedKey = NULL;
						currentKeyPosition = -1;
					}
					break;
				case MAK_DOWN:
					if(currentSelectedKey==NULL){
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
				case MAK_BACK:
				case MAK_SOFTLEFT:
					screenMode = ST_DATA;
					drawDataInputScreen();
					break;
			}
			break;
		case ST_CONFIRM:
					switch(keyCode) {
						case MAK_FIRE:
							if(currentSoftKeys->getChildren()[0]->isSelected()){
								keyPressEvent(MAK_SOFTLEFT);
							}else if(currentSoftKeys->getChildren()[2]->isSelected()){
								keyPressEvent(MAK_SOFTRIGHT);
							}
							break;
						case MAK_BACK:
						case MAK_SOFTRIGHT:
							screenMode = ST_DATA;
							drawDataInputScreen();
							break;
						case MAK_SOFTLEFT:
							if (!busy) {
								if (errorString.length() == 0) {
									//editBoxOpening->setSelected(false);
									//editBoxBuyNow->setSelected(false);
									//editBoxDays->setSelected(false);

									busy = true;
									notice->setCaption("Creating auction...");

									//work out how long the url will be, the 8 is for the & and = symbols
									int urlLength = 71 + URLSIZE + card->getId().length() + openingText.length() + buyNowText.length() + daysText.length();
									char *url = new char[urlLength+1];
									memset(url,'\0',urlLength+1);
									sprintf(url, "%s?createauction=1&cardid=%s&bid=%s&buynow=%s&days=%s", URL, card->getId().c_str(),
											openingText.c_str(), buyNowText.c_str(), daysText.c_str());
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
									delete [] url;
									url = NULL;
								}
								else {
									notice->setCaption(errorString);
								}
							}
							break;
						case MAK_UP:
							if(currentSelectedKey!=NULL){
								currentSelectedKey->setSelected(false);
								currentSelectedKey = NULL;
								currentKeyPosition = -1;
							}
							break;
						case MAK_DOWN:
							if(currentSelectedKey==NULL){
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
					break;
	}
}

void AuctionCreateScreen::validateInput() {
	errorString = "";

	if (openingText.length() == 0) {
		errorString = "Please enter an opening bid.\n";
	}

	if (daysText.length() == 0) {
		errorString = "Please enter the length of the auction(in days).";
	}

	if (buyNowText.length() > 0) {
		if (Convert::toInt(buyNowText) < ((Convert::toInt(openingText))*2)) {
			errorString = "Buy Now price must be at least twice the opening bid.";
		}
	}

	if (strcmp(daysText.c_str(), "0") == 0) {
		errorString = "Auction must last at least one day.";
	}

	if (atoi(daysText.c_str()) > 9) {
		errorString = "Auctions are not allowed to last longer then 9 days.";
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
		mainLayout = Util::createMainLayout("Auction", "Back", "", true);
		kinListBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
		notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	}
	else {
		clearListBox();
		currentSelectedKey = NULL;
		currentKeyPosition = -1;
		Util::updateSoftKeyLayout("Auction", "Back", "", mainLayout);
	}

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, kinListBox->getWidth()-(PADDING*2), 74, kinListBox, 2, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(false);
	feedlayout->addWidgetListener(this);

	//if (tempImage != NULL) {
		//delete tempImage;
	//}

	tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_LOADINGTHUMB));

	Util::retrieveThumb(tempImage, card, mImageCache);

	String cardText = card->getText();
	cardText += " (";
	cardText += card->getQuantity();
	cardText += ")";
	cardText += "\nValue: ";
	cardText += card->getValue();
	cardText += "\n";
	cardText += card->getRarity();

	label = new Label(0,0, scrWidth-86, 74, feedlayout, cardText, 0, Util::getDefaultFont());
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setAutoSizeY();
	label->setDrawBackground(false);
	label->setMultiLine(true);

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Opening bid", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	label = Util::createEditLabel("");
	editBoxOpening = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"Opening bid");
	editBoxOpening->setCaption(Convert::toString(Convert::toInt(card->getValue().c_str())));
	editBoxOpening->setDrawBackground(false);
	label->addWidgetListener(this);
	kinListBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Buy now price", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	label = Util::createEditLabel("");
	editBoxBuyNow = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"Buy now price");
	int buynow = ((Convert::toInt(card->getValue().c_str()))*2)+1;
	editBoxBuyNow->setCaption(Convert::toString(buynow));
	editBoxBuyNow->setDrawBackground(false);
	label->addWidgetListener(this);
	kinListBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Auction duration(days)", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	label = Util::createEditLabel("");
	editBoxDays = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"Auction duration(days)");
	editBoxDays->setCaption("5");
	editBoxDays->setDrawBackground(false);
	label->addWidgetListener(this);
	kinListBox->add(label);

	this->setMain(mainLayout);

	moved = 0;
	editBoxOpening->setSelected(true);
	kinListBox->setSelectedIndex(2);
	cardText = "";
}

void AuctionCreateScreen::drawConfirmScreen() {
	String cardText = card->getText();
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
	screenMode = ST_CONFIRM;
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	Util::updateSoftKeyLayout("Confirm", "Back", "", mainLayout);
	String result = "Are you sure you want to auction " + card->getText() + "?";

	label = new Label(0,0, scrWidth-PADDING*2, 60, NULL, result, 0, Util::getDefaultSelected());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setDrawBackground(false);
	label->setMultiLine(true);
	kinListBox->add(label);

	result = "";

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, kinListBox->getWidth()-(PADDING*2), 120, kinListBox, 2, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(false);
	feedlayout->addWidgetListener(this);

	tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_LOADINGTHUMB));
	Util::retrieveThumb(tempImage, card, mImageCache);

	label = new Label(0,0, scrWidth-86, 120, feedlayout, cardText, 0, Util::getDefaultFont());
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setAutoSizeY();
	label->setMultiLine(true);
	label->setDrawBackground(false);

	this->setMain(mainLayout);

	this->show();
}

void AuctionCreateScreen::drawCreatedScreen() {
	String cardText = card->getText();
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
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	Util::updateSoftKeyLayout("", "Back", "", mainLayout);

	String result = "";
	if (!strcmp(createResult.c_str(), "1")) {
		result = "Auction created!";
	}
	else {
		result = "Error creating auction.";
	}

	/*label = new Label(0,0, scrWidth-PADDING*2, 40, NULL, result, 0, Util::getDefaultSelected());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setDrawBackground(false);
	label->setMultiLine(true);
	kinListBox->add(label);

	Layout *feedlayout;

	feedlayout = new Layout(0, 0, kinListBox->getWidth()-(PADDING*2), 120, kinListBox, 2, 1);
	feedlayout->setSkin(Util::getSkinAlbum());
	feedlayout->setDrawBackground(false);
	feedlayout->addWidgetListener(this);

	tempImage = new MobImage(0, 0, 56, 64, feedlayout, false, false, Util::loadImageFromResource(RES_LOADINGTHUMB));
	Util::retrieveThumb(tempImage, card, mImageCache);

	label = new Label(0,0, scrWidth-86, 120, feedlayout, cardText, 0, Util::getDefaultFont());
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setDrawBackground(false);
	label->setAutoSizeY();
	label->setMultiLine(true);

	this->setMain(mainLayout);

	this->show();*/

	MenuScreen *confirmation = new MenuScreen(RES_BLANK, result.c_str());
	confirmation->setMenuWidth(180);
	confirmation->setMarginX(5);
	confirmation->setMarginY(5);
	confirmation->setDock(MenuScreen::MD_CENTER);
	confirmation->setListener(this);
	confirmation->setMenuFontSel(Util::getDefaultFont());
	confirmation->setMenuFontUnsel(Util::getDefaultFont());
	confirmation->setMenuSkin(Util::getSkinDropDownItem());
	confirmation->addItem("Ok");
	confirmation->show();
}

void AuctionCreateScreen::drawInvalidInputScreen() {
	editBoxOpening->setSelected(false);
	editBoxBuyNow->setSelected(false);
	editBoxDays->setSelected(false);

	clearListBox();
	currentSelectedKey = NULL;
	currentKeyPosition = -1;
	Util::updateSoftKeyLayout("", "Back", "", mainLayout);

	label = new Label(0,0, scrWidth-PADDING*2, scrHeight - DEFAULT_SMALL_LABEL_HEIGHT, NULL, errorString, 0, Util::getDefaultSelected());
	label->setMultiLine();
	label->setAutoSizeY();
	label->setDrawBackground(false);
	kinListBox->add(label);

	this->setMain(mainLayout);

	this->show();
}

void AuctionCreateScreen::clearListBox() {
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

void AuctionCreateScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
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

void AuctionCreateScreen::connReadFinished(Connection* conn, int result) {}

void AuctionCreateScreen::xcConnError(int code) {
	feed->remHttp();
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
	if (!strcmp(name, "result")) {
		notice->setCaption("");
		busy = false;

		screenMode = ST_CREATED;
		drawCreatedScreen();
	}
}

void AuctionCreateScreen::mtxParseError(int) {
}

void AuctionCreateScreen::mtxEmptyTagEnd() {
}

void AuctionCreateScreen::mtxTagStartEnd() {
}
