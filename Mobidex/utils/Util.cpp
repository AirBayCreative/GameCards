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

Font *gFontGrey;
Font *gFontBlue;
Font *gFontBlack;
Font *gFontWhite;
WidgetSkin *gSkinEditBox;
WidgetSkin *gSkinButton;
WidgetSkin *gSkinBack;
WidgetSkin *gSkinList;
WidgetSkin *gSkinAlbum;
WidgetSkin *gSkinText;
WidgetSkin *gSkinKeyboard;
WidgetSkin *gSkinHeader;
Screen *orig;
Screen *origAlbum;
Screen *origMenu;
int scrWidth;
int scrHeight;
int mCount;
Image *image;
Widget *softKeys;


void increase() {
	mCount++;
}
void decrease() {
	mCount--;
}
int getCount() {
	return mCount;
}

void setPadding(Widget *w) {
	w->setPaddingTop(PADDING*2);
	w->setPaddingLeft(PADDING);
}

Label* createLabel(String str, int height) {
	Label *label = new Label(0,0, scrWidth-(PADDING*2), height, NULL, str, 0, gFontBlack);
	label->setSkin(gSkinText);
	setPadding(label);
	return label;
}
Label* createEditLabel(String str, int height) {
	Label *label = new Label(0,0, scrWidth-(PADDING*2), height, NULL, str, 0, gFontBlack);
	label->setSkin(gSkinEditBox);
	setPadding(label);
	return label;
}

Label* createSubLabel(String str, int height) {
	Label *label = new Label(0, 0, scrWidth, height, NULL, str, 0, gFontBlack);
	label->setHorizontalAlignment(Label::HA_LEFT);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setSkin(gSkinList);
	return label;
}
Widget* createSoftKeyBar(int height, const char *left, const char *right) {
	return createSoftKeyBar(height, left, right, "");
}

Widget* createSoftKeyBar(int height, const char *left, const char *right, const char *centre) {
	Layout *layout = new Layout(0, 0, scrWidth, height, NULL, 3, 1);
	layout->setSkin(gSkinBack);
	layout->setPaddingLeft(PADDING);
	layout->setPaddingRight(PADDING);
	layout->setMarginX(PADDING);
	layout->setDrawBackground(true);

	Label *label = new Label(0,0, scrWidth/3 - (PADDING*2), height - PADDING, NULL, left, 0, gFontWhite);
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(left) != 0) {
		label->setSkin(gSkinButton);
	}
	layout->add(label);

	//the %3 part is to make up for pixels lost due to int dropping fractions
	label = new Label(0,0, scrWidth/3 + (scrWidth%3), height - PADDING, NULL, centre, 0, gFontWhite);
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(centre) != 0) {
		label->setSkin(gSkinButton);
	}
	layout->add(label);

	label = new Label(0,0, scrWidth/3 - (PADDING*2), height - PADDING, NULL, right, 0, gFontWhite);
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(right) != 0) {
		label->setSkin(gSkinButton);
	}
	layout->add(label);

	return layout;
}
// first child is listbox
Layout* createMainLayout(const char *left, const char *right, bool useKinetic) {
	return createMainLayout(left, right, "", useKinetic);
}

Layout* createNoHeaderLayout() {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight, mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	return mainLayout;
}

Layout* createMainLayout(const char *left, const char *right, const char *centre, bool useKinetic) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);

	softKeys = createSoftKeyBar(getSoftKeyBarHeight(), left, right, centre);
	Label *label = new Label(0,0,scrWidth,scrHeight/4,NULL,"",0,gFontBlack);

	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);

	MAExtent imgSize = maGetImageSize(RES_IMAGE);
	int imgHeight = EXTENT_Y(imgSize);

	ListBox *mBox = new ListBox(0, 0, scrWidth, imgHeight, NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, false);
	mBox->setSkin(gSkinHeader);
	listBox->add(mBox);

	label->setAutoSizeY();
	label->setMultiLine(true);
	label->setPaddingLeft(PADDING);
	listBox->add(label);

	if (useKinetic) {
		KineticListBox *mKineticBox = new KineticListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()+imgHeight),
				NULL, KineticListBox::LBO_VERTICAL, KineticListBox::LBA_LINEAR, false);
		listBox->add(mKineticBox);
	}
	else {
		ListBox *mListBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()+imgHeight), NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, false);
		listBox->add(mListBox);
	}
	//setPadding(listBox);

	imgSize = -1;
	mainLayout->add(softKeys);

	return mainLayout;
}

Layout* createImageLayout(const char *left, bool useKinetic) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	softKeys = createSoftKeyBar(getSoftKeyBarHeight(), left, "", "");
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

Layout* createImageLayout(const char *left, const char *right, const char *centre, bool useKinetic) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	softKeys = createSoftKeyBar(getSoftKeyBarHeight(), left, right, centre);

	if (useKinetic) {
		KineticListBox *mKineticBox = new KineticListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()),
				mainLayout, KineticListBox::LBO_VERTICAL, KineticListBox::LBA_LINEAR, true);
		setPadding(mKineticBox);
	}
	else {
		ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
		setPadding(listBox);
	}

	mainLayout->add(softKeys);

	return mainLayout;
}

void updateSoftKeyLayout(const char *left, const char *right, const char *centre, Layout *mainLayout) {
	//this function assumes the standard mainlayout format, with softkeys at the end.
	Widget *currentSoftKeys = mainLayout->getChildren()[mainLayout->getChildren().size() - 1];

	mainLayout->getChildren().remove(mainLayout->getChildren().size() - 1);
	if (currentSoftKeys != NULL) {
		delete currentSoftKeys;
	}

	currentSoftKeys = createSoftKeyBar(getSoftKeyBarHeight(), left, right, centre);

	mainLayout->add(currentSoftKeys);
}

void saveData(const char* storefile, const char *value) {
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
		hValue = -1;
	}
	store = -1;
}

void saveFile(const char* storefile, MAHandle data) {
	MAHandle store = maOpenStore((FILE_PREFIX+storefile).c_str(), MAS_CREATE_IF_NECESSARY);
	if (store > 0) {
		maWriteStore(store, data);
	}
	maCloseStore(store, 0);
	store = -1;
}

char* getData(const char* storefile) {
	MAHandle store = maOpenStore((FILE_PREFIX+storefile).c_str(), 0);
	MAHandle tmp = maCreatePlaceholder();
	if (store != STERR_NONEXISTENT) {
		maReadStore(store, tmp);
		int size = maGetDataSize(tmp);
		if (size > 0) {
			char *ret = new char[size+1];
			memset(ret,'\0',size+1);
			maReadData(tmp, ret, 0, size);
			maCloseStore(store, 0);
			return ret;
		} else {
			return "";
		}
	}
	return "";
}

void returnImage(MobImage *img, MAHandle i, int height)
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

void retrieveThumb(MobImage *img, Card *card, ImageCache *mImageCache)
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
		ImageCacheRequest* req1 = new ImageCacheRequest(img, card, 64, 0);
		mImageCache->request(req1);
	}
}

void retrieveFront(MobImage *img, Card *card, int height, ImageCache *mImageCache)
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

void retrieveBack(MobImage *img, Card *card, int height, ImageCache *mImageCache)
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
		ImageCacheRequest* req1 = new ImageCacheRequest(img, card, 64, 1);
		mImageCache->request(req1);
	}
}

bool isNumeric(String isValid) {
	const char* isValArr = isValid.c_str();
	for (int i = 0; i < isValid.length(); i++) {
		if (!isdigit(isValArr[i])) {
			return false;
		}
	}
	return true;
}

int intlen(float start) {
	int end = 0;
	while(start >= 1) {
		start = start/10;
		end++;
	}
	return end;
}

int absoluteValue(int num){
	if(num <0){
		num = num * -1;
	}
	return num;
}

bool validateEmailAddress(String email) {
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

int getSoftKeyBarHeight() {
	//42 is the default height. It needs to scale up a bit for bigger screens
	int scaledHeight = ((42*0.1)>scrHeight?42:(int)(scrHeight*0.1));

	return scaledHeight;
}

int getMaxImageHeight() {
	return scrHeight - getSoftKeyBarHeight() - (PADDING * 4);
}

String base64_encode(unsigned char const* bytes_to_encode, unsigned int in_len) {
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

String base64_decode(String encoded_string) {
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

static inline bool is_base64(unsigned char c) {
	return (isalnum(c) || (c == '+') || (c == '/'));
}

