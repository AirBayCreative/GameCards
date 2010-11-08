#include <conprint.h>
#include <madmath.h>
#include <MAUI/Image.h>

#include "ShopPurchaseScreen.h"
#include "../utils/Util.h"
#include "../utils/MAHeaders.h"

ShopPurchaseScreen::ShopPurchaseScreen(Screen *previous, Feed *feed, Product *product)
		:mHttp(this), previous(previous), feed(feed), product(product) {
	next = new Screen();

	//check that the user can afford the product
	if (atof(feed->getCredits().c_str()) >= atof(product->getPrice().c_str())) {
		canPurchase = true;
	}
	else {
		canPurchase = false;
	}

	String confirmLabel = "";
	if (canPurchase) {
		layout = createMainLayout(back, confirm, true);
		confirmLabel += sure_you_want_to_purchase + product->getName() + priceFor +
				product->getCurrency() + " " + product->getFormattedPrice() + "?";
	}
	else {
		layout = createMainLayout(back, "", true);
		confirmLabel += not_enough_credits;
	}
	listBox = (KineticListBox*)layout->getChildren()[0]->getChildren()[2];

	//notice = (Label*) layout->getChildren()[0]->getChildren()[1];
	//notice->setCaption(confirmLabel);
	lbl = new Label(0,0, scrWidth-PADDING*2, 100, NULL, confirmLabel, 0, gFontGrey);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	listBox->add(lbl);

	this->setMain(layout);

	purchased = false;
	flip = true;
	height = 0;
	moved = 0;

	//for testing. rem!
	//purchased = true;
	//drawPostPurchaseScreen();
}

ShopPurchaseScreen::~ShopPurchaseScreen() {
	layout->getChildren().clear();
	listBox->getChildren().clear();

	delete listBox;
	delete layout;
	delete image;
	if (softKeys != NULL) {
		softKeys->getChildren().clear();
		delete softKeys;
		softKeys = NULL;
	}
	parentTag="";
	temp="";
	temp1="";
	error_msg="";
}

void ShopPurchaseScreen::drawPostPurchaseScreen() {
	/*card = new Card();
	card->setId("18");
	card->setQuantity("");
	card->setText("");
	card->setFront("http://www.mytcg.net/images/cards/18_front.jpg");
	card->setBack("http://www.mytcg.net/images/cards/18_back.jpg");
	card->setValue("");*/
	lprintfln("drawing post purchase screen");

	listBox->getChildren().clear();
	layout->getChildren().clear();

	layout = createImageLayout("", done, "", true);
	listBox = (KineticListBox*)layout->getChildren()[0];

	height = listBox->getHeight()-70;
	if (card != NULL) {
		height = scrHeight - 70 - 42 - PADDING*2;
	}

	//notice = (Label*) layout->getChildren()[0]->getChildren()[1];
	//notice->setCaption(purchaseComplete);
	lbl = new Label(0,0, scrWidth-PADDING*2, height, NULL, purchaseComplete, 0, gFontGrey);
	lbl->setHorizontalAlignment(Label::HA_CENTER);
	lbl->setVerticalAlignment(Label::VA_CENTER);
	lbl->setSkin(gSkinBack);
	lbl->setMultiLine(true);
	lbl->setAutoSizeY(true);
	listBox->add(lbl);

	imge = new Image(PADDING, 0, scrWidth-PADDING*2, height, listBox, true, true, RES_LOADING);
	imge->setPaddingLeft(PADDING);

	this->setMain(layout);
	listBox->requestRepaint();
	if (card != NULL) {
		retrieveFront(imge, card, height, new ImageCache());
	}

	maUpdateScreen();

	listBox->setSelectedIndex(0);

	this->show();
}

void ShopPurchaseScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void ShopPurchaseScreen::pointerMoveEvent(MAPoint2d point)
{
	moved++;
    locateItem(point);
}

void ShopPurchaseScreen::pointerReleaseEvent(MAPoint2d point)
{
	lprintfln("moved: %d",moved);
	lprintfln("right: %s",right?"true":"false");
	lprintfln("left: %s",left?"true":"false");
	lprintfln("list: %s",list?"true":"false");
	if (moved <= 8) {
		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (purchased || list) {
			keyPressEvent(MAK_FIRE);
		}
	}
	moved= 0;
}

void ShopPurchaseScreen::locateItem(MAPoint2d point)
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

void ShopPurchaseScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
			lprintfln("purchased: %s", purchased?"true":"false");
			if (purchased) {
				if (imge->getResource() != RES_LOADING) {
					maDestroyObject(imge->getResource());
				}
				imge->setResource(RES_LOADING);
				imge->update();
				imge->requestRepaint();
				maUpdateScreen();

				lprintfln("flip: %s", flip?"true":"false");
				if (flip) {
					retrieveBack(imge, card, height-PADDING*2, new ImageCache());
				}
				else {
					retrieveFront(imge, card, height-PADDING*2, new ImageCache());
				}
				flip = !flip;
			}
			break;
		case MAK_SOFTRIGHT:
			if (canPurchase && !purchased) {
				lbl->setCaption(purchasing);

				int res = mHttp.create((BUYPRODUCT + product->getId()).c_str(), HTTP_GET);
				mHttp.setRequestHeader(auth_user, feed->getUsername().c_str());
				mHttp.setRequestHeader(auth_pw, feed->getEncrypt().c_str());
				if(res < 0) {

				} else {
					mHttp.finish();
				}
			}
			else if (purchased) {
				next = orig;
				next->show();
			}
			break;
		case MAK_SOFTLEFT:
			if (!purchased) {
				previous->show();
			}
			break;
		case MAK_UP:
			listBox->selectPreviousItem();
			break;
		case MAK_DOWN:
			listBox->selectNextItem();
			break;
	}
}

void ShopPurchaseScreen::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
	}
}

void ShopPurchaseScreen::connReadFinished(Connection* conn, int result) {}

void ShopPurchaseScreen::xcConnError(int code) {
}

void ShopPurchaseScreen::mtxEncoding(const char* ) {
}

void ShopPurchaseScreen::mtxTagStart(const char* name, int len) {
	parentTag = name;
}

void ShopPurchaseScreen::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void ShopPurchaseScreen::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), xml_id)) {
		id += data;
	} else if(!strcmp(parentTag.c_str(), xml_carddescription)) {
		description += data;
	} else if(!strcmp(parentTag.c_str(), xml_count)) {
		quantity += data;
	} else if(!strcmp(parentTag.c_str(), xml_urlfront)) {
		urlfront += data;
	} else if(!strcmp(parentTag.c_str(), xml_urlback)) {
		urlback += data;
	} else if(!strcmp(parentTag.c_str(), xml_quality)) {
		quality += data;
	} else if(!strcmp(parentTag.c_str(), xml_error)) {
		error_msg += data;
	}
}

void ShopPurchaseScreen::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, xml_card)) {
		card = new Card();
		card->setId(id.c_str());
		card->setQuantity(quantity.c_str());
		card->setText(description.c_str());
		card->setFront(urlfront.c_str());
		card->setBack(urlback.c_str());
		card->setValue(quality.c_str());
		id = "";
		quantity = "";
		description = "";
		urlfront = "";
		urlback = "";
		quality = "";
		error_msg = "";

		purchased = true;
		drawPostPurchaseScreen();
	} else {
		lbl->setCaption("");
	}
}

void ShopPurchaseScreen::mtxParseError() {
}

void ShopPurchaseScreen::mtxEmptyTagEnd() {
}

void ShopPurchaseScreen::mtxTagStartEnd() {
}
