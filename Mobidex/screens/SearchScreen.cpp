#include <mastdlib.h>

#include "SearchScreen.h"
#include "../utils/Util.h"
#include "AlbumViewScreen.h"

SearchScreen::SearchScreen(Feed *feed, Screen *previous) : mHttp(this), feed(feed), prev(previous) {
	lprintfln("SearchScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	moved = 0;
	isBusy = false;
	isActive = true;
	next = NULL;

	statDesc = "";
	statDisplay = "";
	statIVal = "";
	id = "";
	description = "";
	quantity = "";
	thumburl = "";
	fronturl = "";
	backurl = "";
	rate = "";
	value = "";
	updated = "";
	note = "";
	parentTag = "";
	error_msg = "";

	mainLayout = Util::createMainLayout("Search", "Back", "", false);

	mainLayout->setDrawBackground(true);
	listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	//listBox->setPaddingLeft(PADDING);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	//notice->setMultiLine(true);

	label = new Label(0,0, scrWidth-PADDING*2, 16, NULL, "", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	fresh = true;
	editBoxSearch = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, 48-PADDING*2, 64, MA_TB_TYPE_ANY, label, "enter search term",L"Search term:", fresh);
	editBoxSearch->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	Label *n = new Label(0,0, scrWidth-PADDING*2, scrHeight, NULL, "You can search by name, company or even email. Any detail on a Mobidex card will help you find it.", 0, Util::getDefaultFont());
	n->setMultiLine(true);
	n->setHorizontalAlignment(Label::HA_CENTER);
	//label->setVerticalAlignment(Label::VA_CENTER);
	listBox->add(n);
	//delete n;

	//NativeLabel *test = new NativeLabel("You can search by name, company or even email. Any detail on a Mobidex card will help you find it.", 0xffffff, true);
	//listBox->add(test);

	if (feed->getUnsuccessful() != "Success") {
		label->setCaption(feed->getUnsuccessful());
	}
	this->setMain(mainLayout);
	listBox->setSelectedIndex(1);
}

SearchScreen::~SearchScreen() {
	delete mainLayout;
	if (next != NULL) {
		feed->remHttp();
		delete next;
	}
	statDesc = "";
	statDisplay = "";
	statIVal = "";
	id = "";
	description = "";
	quantity = "";
	thumburl = "";
	fronturl = "";
	backurl = "";
	rate = "";
	value = "";
	updated = "";
	note = "";
	parentTag = "";
	error_msg = "";
}

void SearchScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		widget->getChildren()[0]->setSelected(true);
	} else {
		widget->getChildren()[0]->setSelected(false);
	}
}
void SearchScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void SearchScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void SearchScreen::pointerReleaseEvent(MAPoint2d point)
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

void SearchScreen::locateItem(MAPoint2d point)
{
	left = false;
	right = false;
	mid = false;

    Point p;
    p.set(point.x, point.y);
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
void SearchScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void SearchScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void SearchScreen::doSearch() {
	String searchString = editBoxSearch->getText();
	notice->setCaption("");
	if (searchString.length() == 0) {
		notice->setCaption("Please enter search term");
		isBusy = false;
	} else {
		String base64SearchString = Util::base64_encode(reinterpret_cast<const unsigned char*>(searchString.c_str()), searchString.length());
		int urlLength = 0;
		urlLength = 100 + urlLength + base64SearchString.length() + feed->getSeconds().length()
				+ Util::intlen(Util::getMaxImageHeight()) + Util::intlen(Util::getMaxImageWidth());
		char *url = new char[urlLength];
		memset(url,'\0',urlLength);
		sprintf(url, "%s?search=%s&seconds=%s&height=%d&width=%d&%s", URL, base64SearchString.c_str(),
				feed->getSeconds().c_str(), Util::getMaxImageHeight(), Util::getMaxImageWidth(), JPG);
		if(mHttp.isOpen()){
			mHttp.close();
		}
		mHttp = HttpConnection(this);
		int res = mHttp.create(url, HTTP_GET);
		if(res < 0) {
			notice->setCaption("Unable to connect, try again later...");
		} else {
			notice->setCaption("Searching...");
			mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
			mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
			feed->addHttp();
			mHttp.finish();
		}
		delete [] url;
		searchString = "";
		base64SearchString = "";
	}
}

void SearchScreen::keyPressEvent(int keyCode) {
	error = false;
	if (fresh) {
		String text = editBoxSearch->getText();
		//enter search term
		if (text.length() == 16) {
			text.remove(0,text.length());
		} else if (text.length() == 17){
			text.remove(0,17);
		} else if (text.length() == 18) {
			text.remove(0,17);
		}
		editBoxSearch->setText(text);
		text.clear();
		//editBoxSearch->clearText();
		//editBoxSearch->
		//editBoxSearch->setText("");
		fresh = !fresh;
	}
	int index = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTLEFT:
			if (!isBusy) {
				isBusy = true;
				clearCardMap();
				doSearch();
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			isActive = false;
			editBoxSearch->setSelected(false);
			editBoxSearch->disableListener();
			prev->show();
			break;
		case MAK_UP:
			break;
		case MAK_DOWN:
			break;
		case MAK_LEFT:
			break;
	}
}

void SearchScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	error_msg = "";
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption("");
		isBusy = false;
		feed->remHttp();
	}
}

void SearchScreen::connReadFinished(Connection* conn, int result) {}

void SearchScreen::xcConnError(int code) {
	feed->remHttp();
	mHttp.close();
	if(isActive){
		if (next != NULL) {
			feed->remHttp();
			delete next;
			next = NULL;
		}
		next = new AlbumViewScreen(this, feed, "-5", Util::AT_SEARCH, cards);
		((AlbumViewScreen*)next)->setSearchString(editBoxSearch->getCaption());
		next->show();
	}
}

void SearchScreen::mtxEncoding(const char* ) {
}

void SearchScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void SearchScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
	if(!strcmp(parentTag.c_str(), "stat")) {
		if(!strcmp(attrName, "desc")) {
			statDesc += attrValue;
		}else if(!strcmp(attrName, "ival")) {
			statIVal += attrValue;
		}else if(!strcmp(attrName, "top")) {
			statTop = atoi(attrValue);
		}else if(!strcmp(attrName, "left")) {
			statLeft = atoi(attrValue);
		}else if(!strcmp(attrName, "width")) {
			statWidth = atoi(attrValue);
		}else if(!strcmp(attrName, "height")) {
			statHeight = atoi(attrValue);
		}else if(!strcmp(attrName, "frontorback")) {
			statFrontOrBack = atoi(attrValue)-1;
		}else if(!strcmp(attrName, "red")) {
			statRed = atoi(attrValue);
		}else if(!strcmp(attrName, "green")) {
			statGreen = atoi(attrValue);
		}else if(!strcmp(attrName, "blue")) {
			statBlue = atoi(attrValue);
		}
	}
}

void SearchScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "cardid")) {
		id += data;
	} else if(!strcmp(parentTag.c_str(), "description")) {
		description += data;
	} else if(!strcmp(parentTag.c_str(), "quantity")) {
		quantity += data;
	} else if(!strcmp(parentTag.c_str(), "thumburl")) {
		thumburl += data;
	} else if(!strcmp(parentTag.c_str(), "fronturl")) {
		fronturl += data;
	} else if(!strcmp(parentTag.c_str(), "backurl")) {
		backurl += data;
	} else if(!strcmp(parentTag.c_str(), "rate")) {
		rate += data;
	} else if(!strcmp(parentTag.c_str(), "value")) {
		value += data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), "updated")) {
		updated += data;
	} else if(!strcmp(parentTag.c_str(), "stat")) {
		statDisplay += data;
	} else if(!strcmp(parentTag.c_str(), "note")) {
		note += data;
	}
}

void SearchScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "card")) {
		notice->setCaption("");
		Card *newCard = new Card();
		newCard->setAll((quantity+","+description+","+thumburl+","+fronturl+","+backurl+","+id+","+rate+","+value+","+note+",").c_str());
		newCard->setStats(stats);
		newCard->setUpdated(updated == "1");
		cards.insert(newCard->getId(),newCard);
		id = "";
		description = "";
		quantity = "";
		thumburl = "";
		fronturl = "";
		backurl = "";
		rate = "";
		value = "";
		updated = "";
		note = "";
		stats.clear();
	} else if(!strcmp(name, "stat")) {
		stat = new Stat();
		stat->setDesc(statDesc.c_str());
		stat->setDisplay(statDisplay.c_str());
		stat->setIVal(statIVal.c_str());
		stat->setTop(statTop);
		stat->setLeft(statLeft);
		stat->setWidth(statWidth);
		stat->setHeight(statHeight);
		stat->setFrontOrBack(statFrontOrBack);
		stat->setColorRed(statRed);
		stat->setColorGreen(statGreen);
		stat->setColorBlue(statBlue);
		stats.add(stat);

		statDesc = "";
		statDisplay = "";
		statIVal = "";
	} else if(!strcmp(name, "error")) {
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, "cardsincategory")) {
		notice->setCaption("");
		isBusy = false;
	} else {
		notice->setCaption("");
	}
}

void SearchScreen::clearCardMap() {
	//for (Map<String, Card*>::Iterator iter = cards.begin(); iter != cards.end(); iter++) {
	//	if (iter->second != NULL) {
	//		delete iter->second;
	//		iter->second = NULL;
	//	}
	//}
	cards.clear();
}

void SearchScreen::mtxParseError(int) {
}

void SearchScreen::mtxEmptyTagEnd() {
}

void SearchScreen::mtxTagStartEnd() {
}
