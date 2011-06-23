#include <conprint.h>

#include "AlbumViewScreen.h"
#include "CompareScreen.h"
#include "OptionsScreen.h"
#include "../utils/Util.h"

CompareScreen::CompareScreen(Screen *previous, MAHandle img, Feed *feed, bool flip, Card *card, Card *compare) :mHttp(this), previous(previous), img(img), flip(flip), card(card), feed(feed), compare(compare) {

	busy = false;
	next = NULL;
	currentSelectedStat = -1;
	flipOrSelect = 0;
	imageCache = new ImageCache();

	if (card != NULL) {
		mainLayout = createImageLayout("", back, flipit);
		listBox = (ListBox*) mainLayout->getChildren()[0];
		height = listBox->getHeight();
	}else{
		mainLayout = createImageLayout(back);
		listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[1];
		height = listBox->getHeight()-70;
	}
	imge = new MobImage(0, 0, scrWidth-PADDING*2, height/2, listBox, false, false, img);
	cmpge = new MobImage(0, 0, scrWidth-PADDING*2, height/2, listBox, false, false, img);
	this->setMain(mainLayout);
	if (card != NULL && compare != NULL) {
		if (flip) {
			retrieveBackFlip(imge, card, height-PADDING*2, imageCache);
			retrieveBackFlip(cmpge, compare, height-PADDING*2, imageCache);
		} else {
			retrieveFrontFlip(imge, card, height-PADDING*2, imageCache);
			retrieveFrontFlip(cmpge, compare, height-PADDING*2, imageCache);
		}
	}
	else {
		imageCache = NULL;
	}
}
#if defined(MA_PROF_SUPPORT_STYLUS)
void CompareScreen::pointerPressEvent(MAPoint2d point)
{
	pointPressed = point;
    locateItem(point);
}

void CompareScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void CompareScreen::pointerReleaseEvent(MAPoint2d point)
{
	pointReleased = point;
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
		return;
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
		return;
	}
	if (card != NULL) {
		if (list) {
			if(absoluteValue(pointPressed.x-pointReleased.x) >imge->getWidth()/100*15||absoluteValue(pointPressed.x-pointReleased.x) > 45){
				flipOrSelect = 1;
			}else{
				flipOrSelect = 0;
				currentSelectedStat = -1;
				for(int i = 0;i<card->getStats().size();i++){
					if(flip==card->getStats()[i]->getFrontOrBack()){
						if(imge->statContains(card->getStats()[i]->getLeft(),card->getStats()[i]->getTop(),card->getStats()[i]->getWidth(),card->getStats()[i]->getHeight(),point.x, point.y)){
							currentSelectedStat = i;
						}
					}
				}
			}
			keyPressEvent(MAK_FIRE);
		}
	}
}

void CompareScreen::locateItem(MAPoint2d point)
{
	list = false;
	left = false;
	right = false;

	Point p;
	p.set(point.x, point.y);
	if (card == NULL) {
		for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
		{
			if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
			{
				if (i == 0) {
					left = true;
				} else if (i == 1) {
					list = true;
				} else if (i == 2) {
					right = true;
				}
				return;
			}
		}
	} else {
		for(int i = 0; i < (this->getMain()->getChildren()).size(); i++)
		{
			if(this->getMain()->getChildren()[i]->contains(p))
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
				} else if (i == 1) {
					list = true;
				} else if (i == 2) {
					right = true;
				}
				return;
			}
		}
	}
}
#endif
CompareScreen::~CompareScreen() {
	/*if (card != NULL) {
		if (imge->getResource() != RES_LOADING && imge->getResource() != RES_TEMP) {
			maDestroyObject(imge->getResource());
		}
	} // <-- dont delete!*/
	delete mainLayout;
	img = -1;
	if (next != NULL) {
		delete next;
		next = NULL;
	}
	if (imageCache != NULL) {
		delete imageCache;
	}
}

void CompareScreen::keyPressEvent(int keyCode) {
	switch (keyCode) {
		case MAK_LEFT:
		case MAK_RIGHT:
			updateSoftKeyLayout("", back, flipit, mainLayout);
			imge->refreshWidget();
			imge->statAdded = false;
			currentSelectedStat = -1;

			flip=!flip;
			if (imge->getResource() != RES_LOADING_FLIP && imge->getResource() != RES_TEMP) {
				maDestroyObject(imge->getResource());
			}
			imge->setResource(RES_LOADING_FLIP);
			imge->update();
			imge->requestRepaint();

			cmpge->setResource(RES_LOADING_FLIP);
			cmpge->update();
			cmpge->requestRepaint();

			maUpdateScreen();
			if (flip) {
				retrieveBackFlip(imge, card, height-PADDING*2, imageCache);
				retrieveBackFlip(cmpge, compare, height-PADDING*2, imageCache);
			} else {
				retrieveFrontFlip(imge, card, height-PADDING*2, imageCache);
				retrieveFrontFlip(cmpge, compare, height-PADDING*2, imageCache);
			}
			currentSelectedStat = -1;
			break;
		case MAK_UP:
			if (imge->getResource() != RES_LOADING_FLIP && imge->getResource() != RES_TEMP) {
				if(card->getStats().size()>0){
					if(flip==card->getStats()[0]->getFrontOrBack()){
						currentSelectedStat--;
						if(currentSelectedStat < -1){
							currentSelectedStat = 2;
							updateSoftKeyLayout("", back, select, mainLayout);
							imge->refreshWidget();
							imge->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(), card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(), card->getStats()[currentSelectedStat]->getColorBlue(), 1);
						} else if (currentSelectedStat == -1) {
							updateSoftKeyLayout("", back, flipit, mainLayout);
							imge->refreshWidget();
							imge->statAdded = false;
						} else {
							updateSoftKeyLayout("", back, select, mainLayout);
							imge->refreshWidget();
							imge->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(), card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(), card->getStats()[currentSelectedStat]->getColorBlue(), 1);
						}
					}
				}
			}
			break;
		case MAK_DOWN:
			if (imge->getResource() != RES_LOADING_FLIP && imge->getResource() != RES_TEMP) {
				if(card->getStats().size()>0){
					if(flip==card->getStats()[0]->getFrontOrBack()){
						if(currentSelectedStat <= card->getStats().size()-1){
							currentSelectedStat++;
						}
						if (currentSelectedStat > card->getStats().size()-1) {
							updateSoftKeyLayout("", back, flipit, mainLayout);
							imge->refreshWidget();
							imge->statAdded = false;
							currentSelectedStat = -1;
						} else {
							updateSoftKeyLayout("", back, select, mainLayout);
							imge->refreshWidget();
							imge->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(), card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(), card->getStats()[currentSelectedStat]->getColorBlue(), 1);
						}
					}
				}
			}
			break;
		case MAK_SOFTLEFT:
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			previous->show();
			break;
		case MAK_FIRE:
			if (card != NULL) {
				if(flipOrSelect){
					flip=!flip;
					updateSoftKeyLayout("", back, flipit, mainLayout);
					imge->refreshWidget();
					imge->statAdded = false;
					currentSelectedStat = -1;
					if (imge->getResource() != RES_LOADING_FLIP && imge->getResource() != RES_LOADING && imge->getResource() != RES_TEMP) {
						maDestroyObject(imge->getResource());
					}

					imge->setResource(RES_LOADING_FLIP);
					imge->update();
					imge->requestRepaint();

					cmpge->setResource(RES_LOADING_FLIP);
					cmpge->update();
					cmpge->requestRepaint();

					maUpdateScreen();
					if (flip) {
						retrieveBackFlip(imge, card, height-PADDING*2, imageCache);
						retrieveBackFlip(cmpge, compare, height-PADDING*2, imageCache);
					} else {
						retrieveFrontFlip(imge, card, height-PADDING*2, imageCache);
						retrieveFrontFlip(cmpge, compare, height-PADDING*2, imageCache);
					}
					flipOrSelect=0;
					currentSelectedStat = -1;
				}
				else{
					if (imge->getResource() != RES_LOADING_FLIP && imge->getResource() != RES_TEMP) {
						if(currentSelectedStat!=-1){
							if(flip==card->getStats()[currentSelectedStat]->getFrontOrBack()){
								imge->refreshWidget();
								imge->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(), card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(), card->getStats()[currentSelectedStat]->getColorBlue(), 1);

								Stat *stat = card->getStats()[currentSelectedStat];
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
						}
					}
				}
			} else {
				previous->show();
			}
			break;
	}
}

void CompareScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
	}
}

void CompareScreen::connReadFinished(Connection* conn, int result) {}

void CompareScreen::xcConnError(int code) {
	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
}

void CompareScreen::mtxEncoding(const char* ) {
}

void CompareScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void CompareScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void CompareScreen::mtxTagData(const char* data, int len) {
}

void CompareScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_result)) {
		((AlbumViewScreen *)previous)->refresh();
	}
}

void CompareScreen::mtxParseError() {
}

void CompareScreen::mtxEmptyTagEnd() {
}

void CompareScreen::mtxTagStartEnd() {
}
