#include <conprint.h>
#include <MAUtil/Graphics.h>

#include "AlbumViewScreen.h"
#include "ImageScreen.h"
#include "OptionsScreen.h"
#include "../utils/Util.h"

ImageScreen::ImageScreen(Screen *previous, MAHandle img, Feed *feed, bool flip, Card *card, int screenType, bool hasConnection,
		bool canAuction) :mHttp(this), previous(previous), img(img), flip(flip), card(card), screenType(screenType), feed(feed), hasConnection(hasConnection), canAuction(canAuction) {
	lprintfln("ImageScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	//TODO add touch
	busy = false;
	next = NULL;
	currentSelectedStat = -1;
	flipOrSelect = 0;
	imageCacheFront = new ImageCache();
	imageCacheBack = new ImageCache();

	if (card != NULL) {
		if (screenType == ST_NEW_CARD) {
			mainLayout =  Util::createImageLayout("Accept", "Reject", "Flip");
		} else if (screenType == Util::AT_SHARE) {
			mainLayout = Util::createImageLayout("Share", "Back", "Flip");
		} else {
			mainLayout = Util::createImageLayout((hasConnection&&canAuction)?"Options":"", "Back", "Flip");
		}
		listBox = (ListBox*) mainLayout->getChildren()[0];
		listBox->setPaddingTop(0);
		height = listBox->getHeight();
	}else{
		mainLayout = Util::createImageLayout("Back");
		listBox = (ListBox*) mainLayout->getChildren()[0]->getChildren()[1];
		height = listBox->getHeight()-70;
	}
	imge = new MobImage(0, 0, scrWidth-PADDING*2, height, listBox, false, false, img);
	this->setMain(mainLayout);
	if (card != NULL) {
		if (flip) {
			Util::retrieveBack(imge, card, height-PADDING*2, imageCacheBack);
			Util::retrieveFront(NULL, card, height-PADDING*2, imageCacheFront);
		} else {
			Util::retrieveFront(imge, card, height-PADDING*2, imageCacheFront);
			Util::retrieveBack(NULL, card, height-PADDING*2, imageCacheBack);
		}
	}
	else {
		imageCacheFront = NULL;
		imageCacheBack = NULL;
	}
}
void ImageScreen::pointerPressEvent(MAPoint2d point)
{
	pointPressed = point;
    locateItem(point);
}

void ImageScreen::menuOptionSelected(int index) {
	this->show();
}

void ImageScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void ImageScreen::pointerReleaseEvent(MAPoint2d point)
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
			if(Util::absoluteValue(pointPressed.x-pointReleased.x) >imge->getWidth()/100*15||
					Util::absoluteValue(pointPressed.x-pointReleased.x) > 45){
				flipOrSelect = 1;
			}else{
				flipOrSelect = 0;
				bool gotstat = false;
				for(int i = 0;i<card->getStats().size();i++){
					if(flip==card->getStats()[i]->getFrontOrBack()){
						if(imge->statContains(card->getStats()[i]->getLeft(),card->getStats()[i]->getTop(),card->getStats()[i]->getWidth(),card->getStats()[i]->getHeight(),point.x, point.y)){
							gotstat = true;
							imge->refreshWidget();
							currentSelectedStat = i;
						}
					}
				}
				if (!gotstat) {
					currentSelectedStat = -1;
				}
			}
			keyPressEvent(MAK_FIRE);
		}
	}
}

void ImageScreen::locateItem(MAPoint2d point)
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
ImageScreen::~ImageScreen() {
	/*if (card != NULL) {
		if (imge->getResource() != RES_LOADING && imge->getResource() != RES_TEMP) {
			maDestroyObject(imge->getResource());
		}
	} // <-- dont delete!*/
	delete mainLayout;
	img = -1;
	if (next != NULL) {
		feed->remHttp();
		delete next;
		next = NULL;
	}
	if (imageCacheFront != NULL) {
		delete imageCacheFront;
	}
	if (imageCacheBack != NULL) {
		delete imageCacheBack;
	}
}

void ImageScreen::keyPressEvent(int keyCode) {
	if (strcmp(Card::ORIENTATION_LANDSCAPE, card->getOrientation().c_str()) == 0) {
		//if it is a landscape card, the orientation must be switched
		switch(keyCode) {
			case MAK_UP:
			case MAK_DOWN:
				keyCode = MAK_LEFT;
				break;
			case MAK_LEFT:
				keyCode = MAK_DOWN;
				break;
			case MAK_RIGHT:
				keyCode = MAK_UP;
				break;
		}
	}

	switch (keyCode) {
		case MAK_LEFT:
		case MAK_RIGHT:
			imge->refreshWidget();
			imge->statAdded = false;
			currentSelectedStat = -1;

			flip=!flip;
			if (imge->getResource() != NULL) {
				maDestroyObject(imge->getResource());
			}
			imge->setResource(Util::loadImageFromResource(RES_LOADING1));
			imge->update();
			imge->requestRepaint();
			maUpdateScreen();
			if (flip) {
				Util::retrieveBack(imge, card, height-PADDING*2, imageCacheBack);
				Util::retrieveFront(NULL, card, height-PADDING*2, imageCacheFront);
			} else {
				Util::retrieveFront(imge, card, height-PADDING*2, imageCacheFront);
				Util::retrieveBack(NULL, card, height-PADDING*2, imageCacheBack);
			}
			currentSelectedStat = -1;
			break;
		case MAK_UP:
			if (imge->getResource() != RES_TEMP) {
				if(card->getStats().size()>0){
					selectStat(-1);
					if (currentSelectedStat == -1) {
						if (screenType == ST_NEW_CARD) {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Accept":"", "Reject", "Flip", mainLayout);
						} else if (screenType == Util::AT_SHARE) {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Share":"", "Back", "Flip", mainLayout);
						} else {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Options":"", "Back", "Flip", mainLayout);
						}
						imge->refreshWidget();
						imge->statAdded = false;
					} else {
						if (screenType == ST_NEW_CARD) {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Accept":"", "Reject", "Flip", mainLayout);
						} else if (screenType == Util::AT_SHARE) {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Share":"", "Back", "Flip", mainLayout);
						} else {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Options":"", "Back", "Flip", mainLayout);
						}
						imge->refreshWidget();
						if(flip==card->getStats()[currentSelectedStat]->getFrontOrBack()){
							imge->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),
									card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(),
									card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(),
									card->getStats()[currentSelectedStat]->getColorBlue(), MobImage::PORTRAIT);
						}
					}
				}
			}
			break;
		case MAK_DOWN:
			if (imge->getResource() != RES_TEMP) {
				if(card->getStats().size()>0){
					selectStat(1);
					if (currentSelectedStat == -1) {
						if (screenType == ST_NEW_CARD) {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Accept":"", "Reject", "Flip", mainLayout);
						} else if (screenType == Util::AT_SHARE) {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Share":"", "Back", "Flip", mainLayout);
						} else {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Options":"", "Back", "Flip", mainLayout);
						}
						imge->refreshWidget();
						imge->statAdded = false;
					} else {
						if (screenType == ST_NEW_CARD) {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Accept":"", "Reject", "Flip", mainLayout);
						} else if (screenType == Util::AT_SHARE) {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Share":"", "Back", "Flip", mainLayout);
						} else {
							Util::updateSoftKeyLayout((hasConnection&&canAuction)?"Options":"", "Back", "Flip", mainLayout);
						}
						imge->refreshWidget();
						if(flip==card->getStats()[currentSelectedStat]->getFrontOrBack()){
							imge->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),
									card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(),
									card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(),
									card->getStats()[currentSelectedStat]->getColorBlue(), MobImage::PORTRAIT);
						} else {
							while((flip!=card->getStats()[currentSelectedStat]->getFrontOrBack())&&(currentSelectedStat <= card->getStats().size())){
								selectStat(1);
							}
							imge->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),
																card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(),
																card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(),
																card->getStats()[currentSelectedStat]->getColorBlue(), MobImage::PORTRAIT);
						}
					}
				}
			}
			break;
		case MAK_SOFTLEFT:
			if (screenType == ST_NEW_CARD) {
				busy = true;
				acceptCard();
			} else if (screenType == Util::AT_SHARE) {
				if (next != NULL) {
					feed->remHttp();
					delete next;
				}
				next = new TradeFriendDetailScreen(this, feed, card);
				next->show();
			} else {
				if (card != NULL && hasConnection && canAuction) {
					if (next != NULL) {
						feed->remHttp();
						delete next;
					}
					next = new OptionsScreen(feed,
							OptionsScreen::ST_CARD_OPTIONS, this, card);
					next->show();
				}
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			if (screenType == ST_NEW_CARD) {
				busy = true;
				rejectCard();
			}
			else {
				previous->show();
			}
			break;
		case MAK_FIRE:
			if (card != NULL) {
				if((flipOrSelect)||(currentSelectedStat == -1)){
					flip=!flip;
					imge->refreshWidget();
					imge->statAdded = false;
					currentSelectedStat = -1;
					if (imge->getResource() != NULL) {
						maDestroyObject(imge->getResource());
					}
					imge->setResource(Util::loadImageFromResource(RES_LOADING1));
					imge->update();
					imge->requestRepaint();
					maUpdateScreen();
					if (flip) {
						if ((imageCacheBack != NULL)&&(imge != NULL)) {
							Util::retrieveBack(imge, card, height-PADDING*2, imageCacheBack);
							Util::retrieveFront(NULL, card, height-PADDING*2, imageCacheFront);
						}
					} else {
						if ((imageCacheFront != NULL)&&(imge != NULL)) {
							Util::retrieveFront(imge, card, height-PADDING*2, imageCacheFront);
							Util::retrieveBack(NULL, card, height-PADDING*2, imageCacheBack);
						}
					}
					flipOrSelect=0;
					currentSelectedStat = -1;
				}else{
					if (imge->getResource() != RES_TEMP) {
						if(currentSelectedStat>-1){
							if(flip==card->getStats()[currentSelectedStat]->getFrontOrBack()){
								imge->refreshWidget();
								imge->selectStat(card->getStats()[currentSelectedStat]->getLeft(),card->getStats()[currentSelectedStat]->getTop(),
										card->getStats()[currentSelectedStat]->getWidth(),card->getStats()[currentSelectedStat]->getHeight(),
										card->getStats()[currentSelectedStat]->getColorRed(), card->getStats()[currentSelectedStat]->getColorGreen(),
										card->getStats()[currentSelectedStat]->getColorBlue(), MobImage::PORTRAIT);
								Stat *stat = card->getStats()[currentSelectedStat];
								if ((strcmp(stat->getDesc().c_str(), "Mobile No") == 0)||
									(strcmp(stat->getDesc().c_str(), "Tel No") == 0) ){
									if (next != NULL) {
										feed->remHttp();
										delete next;
										next == NULL;
									}
									next = new OptionsScreen(feed, OptionsScreen::ST_NUMBER_OPTIONS, this, card, stat->getDisplay());
									next->show();
								} else if (strcmp(stat->getDesc().c_str(), "Email") == 0) {
									String email = stat->getDisplay();
									int ret = maPlatformRequest(("mailto:"+email).c_str());
									if (ret < 0 ) {
										ret = maPlatformRequest(email.c_str());
									}
									if (ret < 0) {
										MenuScreen *confirmation = new MenuScreen(RES_BLANK, "Feature currently not supported on device.");
										confirmation->setMenuWidth(170);
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
								}
								else if ((strcmp(stat->getDesc().c_str(), "Web Address") == 0)||
										(strcmp(stat->getDesc().c_str(), "Social Media Link 1") == 0)||
										(strcmp(stat->getDesc().c_str(), "Social Media Link 1") == 0)||
										(strcmp(stat->getDesc().c_str(), "Social Media Link 1") == 0)||
										(strcmp(stat->getDesc().c_str(), "Social Media Link 1") == 0)||
										(strcmp(stat->getDesc().c_str(), "Social Media Link 1") == 0)) {
									String url = stat->getDisplay();
									//maPlatformRequest will only work if the url starts with http://
									//so we need to check for it, and add it if it isnt there
									if (url.find("http://") != 0) {
										url = "http://"+url;
									}
									int ret = maPlatformRequest(url.c_str());
									if (ret < 0) {
										MenuScreen *confirmation = new MenuScreen(RES_BLANK, "Feature currently not supported on device.");
										confirmation->setMenuWidth(170);
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

void ImageScreen::selectStat(int upOrDown) {
	currentSelectedStat += upOrDown;
	int loops = 0;

	if (currentSelectedStat == card->getStats().size()) {
		currentSelectedStat = -1;
		return;
	}

	if (currentSelectedStat < -1) {
		currentSelectedStat = card->getStats().size() - 1;
	}
	else if (currentSelectedStat == -1) {
		return;
	}

	while (card->getStats().size() > loops &&
			card->getStats()[currentSelectedStat]->getHeight() == 0 &&
			card->getStats()[currentSelectedStat]->getWidth() == 0) {
		loops++;
		currentSelectedStat += upOrDown;
		if (currentSelectedStat == -1) {
			return;
		}
		else if (currentSelectedStat >= card->getStats().size()) {
			currentSelectedStat = -1;
		}
	}

	if (loops >= card->getStats().size()) {
		currentSelectedStat = -1;
	}
}

void ImageScreen::acceptCard() {
	//work out how long the url will be
	int urlLength = 40 + URLSIZE + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s?savecard=%s", URL, card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();
	}
	delete [] url;
}

void ImageScreen::rejectCard() {
	//work out how long the url will be
	int urlLength = 42 + URLSIZE + card->getId().length();
	char *url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s?rejectcard=%s", URL, card->getId().c_str());
	if(mHttp.isOpen()){
		mHttp.close();
	}
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();
	}
	delete [] url;
}

void ImageScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		feed->remHttp();
	}
}

void ImageScreen::connReadFinished(Connection* conn, int result) {}

void ImageScreen::xcConnError(int code) {
	feed->remHttp();
	if (code == -6) {
		return;
	} else {
		//TODO handle error
	}
}

void ImageScreen::mtxEncoding(const char* ) {

}

void ImageScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void ImageScreen::mtxTagAttr(const char* attrName, const char* attrValue) {

}

void ImageScreen::mtxTagData(const char* data, int len) {

}

void ImageScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "result")) {
		((AlbumViewScreen *)previous)->refresh();
	}
}

void ImageScreen::mtxParseError(int) {
}

void ImageScreen::mtxEmptyTagEnd() {
}

void ImageScreen::mtxTagStartEnd() {
}
