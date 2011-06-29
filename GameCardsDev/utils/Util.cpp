#include <mavsprintf.h>
#include <conprint.h>

#include "../UI/Widgets/MobImage.h"
#include "../UI/KineticListBox.h"
#include "ImageCacheRequest.h"
#include "MAHeaders.h"
#include "Util.h"

#define RED(x)                  (((x)&0x00ff0000)>>16)
#define GREEN(x)                (((x)&0x0000ff00)>>8)
#define BLUE(x)                 (((x)&0x000000ff))
#define ALPHA(x)                (((x)&0xff000000)>>24)
#define RGBA(r,g,b,a)    ((((a)&0xff)<<24)| \
                                                 (((r)&0xff)<<16)| \
                                                 (((g)&0xff)<<8)| \
                                                 (((b)&0xff)));

Screen *orig;
Screen *origAlbum;
Screen *origMenu;
int scrWidth;
int scrHeight;
Image *image;
Widget *softKeys;


Util::Util() {}
Util::~Util() {}

Font* Util::getFontBlue() {
	static Font* blue;
	if (blue == NULL) {
		blue = new MAUI::Font(RES_FONT_BLUE);
	}
	return blue;
}

Font* Util::getFontBlack() {
	static Font* black;
	if (black == NULL) {
		black = new MAUI::Font(RES_FONT_BLACK);
	}
	return black;
}

WidgetSkin* Util::getSkinEditBox() {
	static WidgetSkin* gSkinEditBox;
	if (gSkinEditBox == NULL) {
		gSkinEditBox = new WidgetSkin(RES_SELECTED_EDITBOX, RES_UNSELECTED_EDITBOX, 16, 32, 22, 26, true, true);
	}
	return gSkinEditBox;
}

WidgetSkin* Util::getSkinButton() {
	static WidgetSkin* gSkinButton;
	if (gSkinButton == NULL) {
		gSkinButton = new WidgetSkin(RES_UNSELECTED_BUTTON, RES_UNSELECTED_BUTTON, 16, 32, 23, 25, true, true);
	}
	return gSkinButton;
}

WidgetSkin* Util::getSkinBack() {
	static WidgetSkin* gSkinBack;
	if (gSkinBack == NULL) {
		gSkinBack = new WidgetSkin(RES_BACKGROUND, RES_BACKGROUND, 39, 78, 39, 78, true, true);
	}
	return gSkinBack;
}

WidgetSkin* Util::getSkinList() {
	static WidgetSkin* gSkinList;
	if (gSkinList == NULL) {
		gSkinList = new WidgetSkin(RES_SELECTED_LIST, RES_UNSELECTED_LIST, 16, 32, 16, 32, true, true);
	}
	return gSkinList;
}

WidgetSkin* Util::getSkinListNoArrows() {
	static WidgetSkin* gSkinListNoArrows;
	if (gSkinListNoArrows == NULL) {
		gSkinListNoArrows = new WidgetSkin(RES_UNSELECTED_LIST, RES_UNSELECTED_LIST, 16, 32, 16, 32, true, true);
	}
	return gSkinListNoArrows;
}

WidgetSkin* Util::getSkinAlbum() {
	static WidgetSkin* gSkinAlbum;
	if (gSkinAlbum == NULL) {
		gSkinAlbum = new WidgetSkin(RES_SELECTED_ALBUM, RES_UNSELECTED_ALBUM, 16, 32, 16, 32, true, true);
	}
	return gSkinAlbum;
}

WidgetSkin* Util::getSkinText() {
	static WidgetSkin* gSkinText;
	if (gSkinText == NULL) {
		gSkinText = new WidgetSkin(RES_TEXT_BOX, RES_TEXT_BOX, 16, 32, 16, 32, true, true);
	}
	return gSkinText;
}

void Util::setPadding(Widget *w) {
	w->setPaddingTop(10);
	w->setPaddingLeft(PADDING);
}

Label* Util::createLabel(String str, int height) {
	Label *label = new Label(0,0, scrWidth-(PADDING*2), height, NULL, str, 0, Util::getFontBlack());
	label->setSkin(Util::getSkinText());
	Util::setPadding(label);
	return label;
}
Label* Util::createEditLabel(String str, int height) {
	Label *label = new Label(0,0, scrWidth-(PADDING*2), height, NULL, str, 0, Util::getFontBlack());
	label->setSkin(Util::getSkinEditBox());
	Util::setPadding(label);
	return label;
}

Label* Util::createSubLabel(String str, int height) {
	Label *label = new Label(0, 0, scrWidth-(PADDING*2), height, NULL, str, 0, Util::getFontBlack());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setSkin(Util::getSkinList());
	return label;
}
Widget* Util::createSoftKeyBar(int height, const char *left, const char *right) {
	return Util::createSoftKeyBar(height, left, right, "");
}

Widget* Util::createSoftKeyBar(int height, const char *left, const char *right, const char *centre) {
	Layout *layout = new Layout(0, 0, scrWidth, height, NULL, 3, 1);
	//layout->setSkin(Util::getSkinBack());
	layout->setDrawBackground(true);

	Label *label = new Label(0,0, scrWidth/3, height, NULL, left, 0, Util::getFontBlack());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(left) != 0) {
		label->setSkin(Util::getSkinButton());
	}
	layout->add(label);

	//the %3 part is to make up for pixels lost due to int dropping fractions
	label = new Label(0,0, scrWidth/3 + (scrWidth%3), height, NULL, centre, 0, Util::getFontBlack());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(centre) != 0) {
		label->setSkin(Util::getSkinButton());
	}
	layout->add(label);

	label = new Label(0,0, scrWidth/3, height, NULL, right, 0, Util::getFontBlack());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(right) != 0) {
		label->setSkin(Util::getSkinButton());
	}
	layout->add(label);

	return layout;
}
// first child is listbox
Layout* Util::createMainLayout(const char *left, const char *right, bool useKinetic) {
	return createMainLayout(left, right, "", useKinetic);
}

Layout* Util::createNoHeaderLayout() {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight, mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	return mainLayout;
}

Layout* Util::createMainLayout(const char *left, const char *right, const char *centre, bool useKinetic) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);

	softKeys = Util::createSoftKeyBar(getSoftKeyBarHeight(), left, right, centre);
	Label *label = new Label(0,0,scrWidth,scrHeight/4,NULL,"",0,Util::getFontBlack());

	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);

	MAExtent imgSize = maGetImageSize(RES_IMAGE);
	int imgWidth = EXTENT_X(imgSize);
	int imgHeight = EXTENT_Y(imgSize);

	image = new Image(0, 0, scrWidth, imgHeight, NULL, false, false, RES_IMAGE);
	listBox->add(image);

	label->setAutoSizeY();
	label->setMultiLine(true);
	listBox->add(label);

	if (useKinetic) {
		KineticListBox *mKineticBox = new KineticListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()+image->getHeight()),
				NULL, KineticListBox::LBO_VERTICAL, KineticListBox::LBA_LINEAR, false);
		listBox->add(mKineticBox);
	}
	else {
		ListBox *mBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()+image->getHeight()), NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, false);
		listBox->add(mBox);
	}
	listBox->setPaddingLeft(PADDING);

	imgSize = -1;
	mainLayout->add(softKeys);

	return mainLayout;
}

Layout* Util::createImageLayout(const char *left, bool useKinetic) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	softKeys = Util::createSoftKeyBar(getSoftKeyBarHeight(), left, "", "");
	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	MAExtent imgSize = maGetImageSize(RES_IMAGE);
	int imgWidth = EXTENT_X(imgSize);
	int imgHeight = EXTENT_Y(imgSize);

	image = new Image(0, 0, scrWidth,  imgHeight, NULL, false, false, RES_IMAGE);
	listBox->add(image);
	if (useKinetic) {
		KineticListBox *mKineticBox = new KineticListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()),
				NULL, KineticListBox::LBO_VERTICAL, KineticListBox::LBA_LINEAR, false);
		listBox->add(mKineticBox);
	}
	else {
		ListBox *mBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, false);
		listBox->add(mBox);
	}
	setPadding(listBox);

	imgSize = -1;
	mainLayout->add(softKeys);

	return mainLayout;
}

Layout* Util::createImageLayout(const char *left, const char *right, const char *centre, bool useKinetic) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	softKeys = Util::createSoftKeyBar(getSoftKeyBarHeight(), left, right, centre);

	if (useKinetic) {
		KineticListBox *mKineticBox = new KineticListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()),
				mainLayout, KineticListBox::LBO_VERTICAL, KineticListBox::LBA_LINEAR, true);
		mKineticBox->setPaddingLeft(PADDING);
	}
	else {
		ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
		listBox->setPaddingLeft(PADDING);
	}

	mainLayout->add(softKeys);

	return mainLayout;
}

void Util::updateSoftKeyLayout(const char *left, const char *right, const char *centre, Layout *mainLayout) {
	//this function assumes the standard mainlayout format, with softkeys at the end.
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];

	mainLayout->getChildren().remove(mainLayout->getChildren().size() - 1);
	if (currentSoftKeys != NULL) {
		delete currentSoftKeys;
	}

	currentSoftKeys = Util::createSoftKeyBar(getSoftKeyBarHeight(), left, right, centre);

	mainLayout->add(currentSoftKeys);
}

void Util::saveData(const char* storefile, const char *value) {
	MAHandle store = maOpenStore((FILE_PREFIX+storefile).c_str(), MAS_CREATE_IF_NECESSARY);
	if (strlen(value) == 0) {
		maCloseStore(store, 1);
	} else if (store > 0) {
		MAHandle hValue = maCreatePlaceholder();
		if (maCreateData(hValue, strlen(value)) == RES_OK) {
			maWriteData(hValue, value, 0, strlen(value));
			maWriteStore(store, hValue);
		}
		maCloseStore(store, 0);
		maDestroyObject(hValue);
		hValue = -1;
	}
	store = -1;
}

void Util::saveFile(const char* storefile, MAHandle data) {
	MAHandle store = maOpenStore((FILE_PREFIX+storefile).c_str(), MAS_CREATE_IF_NECESSARY);
	if (store > 0) {
		maWriteStore(store, data);
	}
	maCloseStore(store, 0);
	store = -1;
}

char* Util::getData(char* storefile) {
	MAHandle store = maOpenStore((FILE_PREFIX+storefile).c_str(), 0);
	MAHandle tmp = maCreatePlaceholder();
	if (store != STERR_NONEXISTENT) {
		maReadStore(store, tmp);
		int size = maGetDataSize(tmp);
		if (size > 0) {
			storefile = new char[size+1];
			memset(storefile,0,size+1);
			maReadData(tmp, storefile, 0, size);
			maCloseStore(store, 0);
			return storefile;
		} else {
			return "";
		}
	}
	store = -1;
	tmp = -1;
	return "";
}

void Util::returnImage(MobImage *img, MAHandle i, int height)
{
	MAHandle imageh = maCreatePlaceholder();
	maCreateImageFromData(imageh, i, 0, maGetDataSize(i));
	img->setResource(imageh);
	img->update();
	img->requestRepaint();
	maUpdateScreen();
	imageh = -1;
	i = -1;
}

void Util::retrieveThumb(MobImage *img, Card *card, ImageCache *mImageCache)
{
	if (card == NULL) {
		return;
	}

	MAHandle store = maOpenStore((FILE_PREFIX+card->getId()+".sav").c_str(), -1);
	ImageCacheRequest* req1;
	if(store != STERR_NONEXISTENT) {
		MAHandle cacheimage = maCreatePlaceholder();
		maReadStore(store, cacheimage);
		maCloseStore(store, 0);

		if (maGetDataSize(cacheimage) > 0) {
			returnImage(img, cacheimage, 64);
		}
		else {
			req1 = new ImageCacheRequest(img, card, 64, 0);
			mImageCache->request(req1);
		}
		cacheimage = -1;
	}
	else {
		req1 = new ImageCacheRequest(img, card, 64, 0);
		mImageCache->request(req1);
	}
}

void Util::retrieveProductThumb(MobImage *img, Product *product, ImageCache *mImageCache)
{
	if (product == NULL) {
		return;
	}

	MAHandle store = maOpenStore((FILE_PREFIX+"prod_"+product->getId()+".sav").c_str(), -1);
	ImageCacheRequest* req1;
	if(store != STERR_NONEXISTENT)
	{
		MAHandle cacheimage = maCreatePlaceholder();
		maReadStore(store, cacheimage);
		maCloseStore(store, 0);

		if (maGetDataSize(cacheimage) > 0) {
			returnImage(img, cacheimage, 64);
		}
		else {
			req1 = new ImageCacheRequest(img, product, 64, 0);
			mImageCache->request(req1);
		}
		cacheimage = -1;
	}
	else {
		req1 = new ImageCacheRequest(img, product, 64, 0);
		mImageCache->request(req1);
	}
	store = -1;
}

void Util::retrieveFront(MobImage *img, Card *card, int height, ImageCache *mImageCache)
{
	if (card == NULL) {
		return;
	}

	MAHandle store = maOpenStore((FILE_PREFIX+card->getId()+"f.sav").c_str(), -1);
	ImageCacheRequest* req1;
	if(store != STERR_NONEXISTENT) {
		MAHandle cacheimage = maCreatePlaceholder();
		maReadStore(store, cacheimage);
		maCloseStore(store, 0);

		if (maGetDataSize(cacheimage) > 0) {
			returnImage(img, cacheimage, 64);
		}
		else {
			req1 = new ImageCacheRequest(img, card, 64, 1);
			mImageCache->request(req1);
		}
		cacheimage = -1;
	}
	else {
		ImageCacheRequest* req1 = new ImageCacheRequest(img, card, 64, 1);
		mImageCache->request(req1);
	}
}

void Util::retrieveFrontFlip(MobImage *img, Card *card, int height, ImageCache *mImageCache)
{
	if (card == NULL) {
		return;
	}

	MAHandle store = maOpenStore((FILE_PREFIX+card->getId()+"f_flip.sav").c_str(), -1);
	ImageCacheRequest* req1;
	if(store != STERR_NONEXISTENT) {
		MAHandle cacheimage = maCreatePlaceholder();
		maReadStore(store, cacheimage);
		maCloseStore(store, 0);

		if (maGetDataSize(cacheimage) > 0) {
			returnImage(img, cacheimage, 64);
		}
		else {
			req1 = new ImageCacheRequest(img, card, 64, 3);
			mImageCache->request(req1);
		}
		cacheimage = -1;
	}
	else {
		req1 = new ImageCacheRequest(img, card, 64, 3);
		mImageCache->request(req1);
	}
}

void Util::retrieveBack(MobImage *img, Card *card, int height, ImageCache *mImageCache)
{
	if (card == NULL) {
		return;
	}

	MAHandle store = maOpenStore((FILE_PREFIX+card->getId()+"b.sav").c_str(), -1);
	ImageCacheRequest* req1;
	if(store != STERR_NONEXISTENT) {
		MAHandle cacheimage = maCreatePlaceholder();
		maReadStore(store, cacheimage);
		maCloseStore(store, 0);

		if (maGetDataSize(cacheimage) > 0) {
			returnImage(img, cacheimage, 64);
		}
		else {
			req1 = new ImageCacheRequest(img, card, 64, 2);
			mImageCache->request(req1);
		}
		cacheimage = -1;
	}
	else {
		req1 = new ImageCacheRequest(img, card, 64, 2);
		mImageCache->request(req1);
	}
}

void Util::retrieveBackFlip(MobImage *img, Card *card, int height, ImageCache *mImageCache)
{
	if (card == NULL) {
		return;
	}

	MAHandle store = maOpenStore((FILE_PREFIX+card->getId()+"b_flip.sav").c_str(), -1);
	ImageCacheRequest* req1;
	if(store != STERR_NONEXISTENT) {
		MAHandle cacheimage = maCreatePlaceholder();
		maReadStore(store, cacheimage);
		maCloseStore(store, 0);

		if (maGetDataSize(cacheimage) > 0) {
			returnImage(img, cacheimage, 64);
		}
		else {
			req1 = new ImageCacheRequest(img, card, 64, 4);
			mImageCache->request(req1);
		}
		cacheimage = -1;
	}
	else {
		req1 = new ImageCacheRequest(img, card, 64, 4);
		mImageCache->request(req1);
	}
}

int Util::intlen(float start) {
	int end = 0;
	while(start >= 1) {
		start = start/10;
		end++;
	}
	return end;
}

int Util::absoluteValue(int num){
	if(num <0){
		num = num * -1;
	}
	return num;
}

bool Util::validateEmailAddress(String email) {
	int atIndex = email.findFirstOf('@');
	int lastDotIndex = email.findLastOf('.');
	if (atIndex == email.npos || atIndex == 0 || atIndex == email.length()-1
			|| atIndex != email.findLastOf('@')) {
		//checks if there is an @, that there is something in front of it, after it, and only one
		return false;
	}
	else if (lastDotIndex == email.length()-1 || atIndex > lastDotIndex) {
		//checks that there is a character after the dot, and that it is after the @
		return false;
	}
	return true;
}

int Util::getSoftKeyBarHeight() {
	//42 is the default height. It needs to scale up a bit for bigger screens
	int scaledHeight = ((42*0.1)>scrHeight?42:(int)(scrHeight*0.1));

	return scaledHeight;
}

int Util::getMaxImageWidth() {
	return scrWidth - (PADDING * 4);
}
int Util::getMaxImageHeight() {
	return scrHeight - getSoftKeyBarHeight() - (PADDING * 4);
}

String Util::base64_encode(unsigned char const* bytes_to_encode, unsigned int in_len) {
	String base64_chars =  "ABCDEFGHIJKLMNOPQRSTUVWXYZ"  //  0 to 25
										"abcdefghijklmnopqrstuvwxyz"  // 26 to 51
										"0123456789"				  // 52 to 61
										"+"							  // 62
										"/";


	/* Copyright (C) 2004-2008 René Nyffenegger

	   This source code is provided 'as-is', without any express or implied
	   warranty. In no event will the author be held liable for any damages
	   arising from the use of this software.

	   Permission is granted to anyone to use this software for any purpose,
	   including commercial applications, and to alter it and redistribute it
	   freely, subject to the following restrictions:

	   1. The origin of this source code must not be misrepresented; you must not
		  claim that you wrote the original source code. If you use this source code
		  in a product, an acknowledgment in the product documentation would be
		  appreciated but is not required.

	   2. Altered source versions must be plainly marked as such, and must not be
		  misrepresented as being the original source code.

	   3. This notice may not be removed or altered from any source distribution.

	   René Nyffenegger rene.nyffenegger@adp-gmbh.ch */

	unsigned char char_array_3[3];
	unsigned char char_array_4[4];

	String ret = "";
	int i = 0;
	int j = 0;
	while (in_len--) {
		char_array_3[i++] = *(bytes_to_encode++);
		if (i == 3) {
			char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
			char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
			char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
			char_array_4[3] = char_array_3[2] & 0x3f;
			for(i = 0; (i <4) ; i++) {
				ret += base64_chars[char_array_4[i]];
			}
			i = 0;
		}
	}
	if (i) {
		for(j = i; j < 3; j++)
			char_array_3[j] = '\0';
			char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
			char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
			char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
			char_array_4[3] = char_array_3[2] & 0x3f;

			for (j = 0; (j < i + 1); j++)
				ret += base64_chars[char_array_4[j]];

		while((i++ < 3))
		ret += '=';
	}
	return ret;
}

String Util::base64_decode(String encoded_string) {
	String base64_chars =  "ABCDEFGHIJKLMNOPQRSTUVWXYZ"  //  0 to 25
										"abcdefghijklmnopqrstuvwxyz"  // 26 to 51
										"0123456789"				  // 52 to 61
										"+"							  // 62
										"/";

	int in_len = encoded_string.size();
	int i = 0;
	int j = 0;
	int in_ = 0;
	unsigned char char_array_4[4], char_array_3[3];
	String ret;
	String temp = "";

	while (in_len-- && ( encoded_string[in_] != '=') && is_base64(encoded_string[in_])) {
		char_array_4[i++] = encoded_string[in_]; in_++;
		if (i ==4) {
			for (i = 0; i <4; i++) {
				temp += char_array_4[i];
				char_array_4[i] = base64_chars.find(temp.c_str());
				temp.clear();
			}

			char_array_3[0] = (char_array_4[0] << 2) + ((char_array_4[1] & 0x30) >> 4);
			char_array_3[1] = ((char_array_4[1] & 0xf) << 4) + ((char_array_4[2] & 0x3c) >> 2);
			char_array_3[2] = ((char_array_4[2] & 0x3) << 6) + char_array_4[3];

			for (i = 0; (i < 3); i++)
				ret += char_array_3[i];
			i = 0;
		}
	}

	if (i) {
		for (j = i; j <4; j++)
			char_array_4[j] = 0;

		for (j = 0; j <4; j++) {
			temp += char_array_4[j];
			char_array_4[j] = base64_chars.find(temp.c_str());
			temp.clear();
		}

		char_array_3[0] = (char_array_4[0] << 2) + ((char_array_4[1] & 0x30) >> 4);
		char_array_3[1] = ((char_array_4[1] & 0xf) << 4) + ((char_array_4[2] & 0x3c) >> 2);
		char_array_3[2] = ((char_array_4[2] & 0x3) << 6) + char_array_4[3];

		for (j = 0; (j < i - 1); j++) ret += char_array_3[j];
	}

	return ret;
}

inline bool Util::is_base64(unsigned char c) {
	return (isalnum(c) || (c == '+') || (c == '/'));
}

