#include <mastdlib.h>

#include "SearchScreen.h"
#include "../utils/Util.h"
#include "AlbumViewScreen.h"

SearchScreen::SearchScreen(Feed *feed, Screen *previous) : mHttp(this), feed(feed), prev(previous) {
	moved = 0;
	isBusy = false;

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

	mainLayout = createMainLayout(back, search, "", true);

	mainLayout->setDrawBackground(true);
	listBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];
	setPadding(listBox);
	notice = (Label*) mainLayout->getChildren()[0]->getChildren()[1];
	notice->setMultiLine(true);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, searchTermlbl, 0, gFontBlack);
	listBox->add(label);

	label = createEditLabel("");
	editBoxSearch = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "",L"Search term:");
	editBoxSearch->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	if (feed->getUnsuccessful() != success) {
		label->setCaption(feed->getUnsuccessful());
	}
	this->setMain(mainLayout);
	listBox->setSelectedIndex(1);
}

SearchScreen::~SearchScreen() {
	delete mainLayout;

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
#if defined(MA_PROF_SUPPORT_STYLUS)
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
#endif
void SearchScreen::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void SearchScreen::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void SearchScreen::doSearch() {
	String searchString = editBoxSearch->getCaption();
	int urlLength = SEARCH.length() + searchString.length() + strlen(seconds) + feed->getSeconds().length()
			+ strlen(height) + intlen(getMaxImageHeight()) + strlen(width) + intlen(scrWidth) + 6;
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s%s&%s=%s&%s=%d&%s=%d", SEARCH.c_str(), searchString.c_str(), seconds,
			feed->getSeconds().c_str(), height, getMaxImageHeight(), width, scrWidth);
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption(no_connect);
	} else {
		notice->setCaption("Searching...");
		mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
		mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
		mHttp.finish();
	}
	delete [] url;
	searchString = "";
}

void SearchScreen::keyPressEvent(int keyCode) {
	error = false;
	int index = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_FIRE:
		case MAK_SOFTRIGHT:
			if (!isBusy) {
				isBusy = true;
				clearCardMap();
				doSearch();
			}
			break;
		case MAK_SOFTLEFT:
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
	}
}

void SearchScreen::connReadFinished(Connection* conn, int result) {}

void SearchScreen::xcConnError(int code) {
	mHttp.close();
	if (next != NULL) {
		delete next;
		next = NULL;
	}
	next = new AlbumViewScreen(this, feed, album_search, AlbumViewScreen::AT_SEARCH, cards);
	((AlbumViewScreen*)next)->setSearchString(editBoxSearch->getCaption());
	next->show();
}

void SearchScreen::mtxEncoding(const char* ) {
}

void SearchScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void SearchScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
	if(!strcmp(parentTag.c_str(), xml_stat)) {
		if(!strcmp(attrName, xml_desc)) {
			statDesc += attrValue;
		} else if(!strcmp(attrName, xml_ival)) {
			statIVal += attrValue;
		}
	}
}

void SearchScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), xml_cardid)) {
		id += data;
	} else if(!strcmp(parentTag.c_str(), xml_carddescription)) {
		description += data;
	} else if(!strcmp(parentTag.c_str(), xml_cardquantity)) {
		quantity += data;
	} else if(!strcmp(parentTag.c_str(), xml_thumburl)) {
		thumburl += data;
	} else if(!strcmp(parentTag.c_str(), xml_fronturl)) {
		fronturl += data;
	} else if(!strcmp(parentTag.c_str(), xml_backurl)) {
		backurl += data;
	} else if(!strcmp(parentTag.c_str(), xml_rate)) {
		rate += data;
	} else if(!strcmp(parentTag.c_str(), xml_value)) {
		value += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	} else if(!strcmp(parentTag.c_str(), xml_updated)) {
		updated += data;
	} else if(!strcmp(parentTag.c_str(), xml_stat)) {
		statDisplay += data;
	} else if(!strcmp(parentTag.c_str(), xml_note)) {
		note += data;
	}
}

void SearchScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_card)) {
		notice->setCaption("");
		Card *newCard = new Card();
		newCard->setAll((quantity+delim+description+delim+thumburl+delim+fronturl+delim+backurl+delim+id+delim+rate+delim+value+delim+note+delim).c_str());
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
	} else if(!strcmp(name, xml_stat)) {
		stat = new Stat();
		stat->setDesc(statDesc.c_str());
		stat->setDisplay(statDisplay.c_str());
		stat->setIVal(statIVal.c_str());

		stats.add(stat);

		statDesc = "";
		statDisplay = "";
		statIVal = "";
	} else if(!strcmp(name, xml_error)) {
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, xml_carddone)) {
		notice->setCaption("");
		isBusy = false;
	} else {
		notice->setCaption("");
	}
}

void SearchScreen::clearCardMap() {
	for (Map<String, Card*>::Iterator iter = cards.begin(); iter != cards.end(); iter++) {
		if (iter->second != NULL) {
			delete iter->second;
			iter->second = NULL;
		}
	}
	cards.clear();
}

void SearchScreen::mtxParseError() {
}

void SearchScreen::mtxEmptyTagEnd() {
}

void SearchScreen::mtxTagStartEnd() {
}
