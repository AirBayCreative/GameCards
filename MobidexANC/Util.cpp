#include <mavsprintf.h>
#include <conprint.h>

#include "UI/KineticListBox.h"
#include "ImageCacheRequest.h"
#include "MAHeaders.h"
#include "Util.h"

Font *gFontBlue;
Font *gFontBlack;
Font *gFontWhite;
Font *gFontBlackBold;
WidgetSkin *gSkinEditBox;
WidgetSkin *gSkinButton;
WidgetSkin *gSkinBack;
WidgetSkin *gSkinList;
WidgetSkin *gSkinAlbum;
Screen *orig;
int scrWidth;
int scrHeight;
Image *image;
Widget *softKeys;



void setPadding(Widget *w) {
	w->setPaddingLeft(PADDING);
}

Label* createLabel(String str, int height) {
	Label *label = new Label(0,0, scrWidth-(PADDING*2), height, NULL, str, 0, gFontBlack);
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
	Label *label = new Label(0, 0, scrWidth-(PADDING*2), height, NULL, str, 0, gFontBlack);
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setSkin(gSkinList);
	return label;
}
Widget* createSoftKeyBar(int height, const char *left, const char *right) {
	return createSoftKeyBar(height, left, right, "");
}

Widget* createSoftKeyBar(int height, const char *left, const char *right, const char *centre) {
	Layout *layout = new Layout(0, 0, scrWidth, height, NULL, 3, 1);
	layout->setDrawBackground(true);
	layout->setPaddingLeft(PADDING);
	layout->setPaddingRight(PADDING);
	layout->setMarginX(PADDING);

	Label *label;
	label = new Label(0,0, (scrWidth/3) - (PADDING*2), height, NULL, left, 0, gFontWhite);
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(left) != 0) {
		label->setSkin(gSkinButton);
	}
	layout->add(label);

	label = new Label(0,0, (scrWidth/3) + (scrWidth%3), height, NULL, centre, 0, gFontWhite);
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(centre) != 0) {
		label->setSkin(gSkinButton);
	}
	layout->add(label);

	label = new Label(0,0, (scrWidth/3) - (PADDING*2), height, NULL, right, 0, gFontWhite);
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

	softKeys = createSoftKeyBar(42, left, right, centre);
	Label *label = new Label(0,0,scrWidth,scrHeight/4,NULL,"",0,gFontBlack);

	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);

	MAExtent imgSize = maGetImageSize(RES_IMAGE);
	int imgWidth = EXTENT_X(imgSize);
	int imgHeight = EXTENT_Y(imgSize);

	image = new Image(0, 0, scrWidth,  imgHeight, NULL, false, false, RES_IMAGE);
	listBox->add(image);

	label->setAutoSizeY();
	label->setMultiLine(true);
	label->setPaddingLeft(PADDING);
	listBox->add(label);

	if (useKinetic) {
		KineticListBox *mKineticBox = new KineticListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()+label->getHeight()),
				NULL, KineticListBox::LBO_VERTICAL, KineticListBox::LBA_LINEAR, false);
		mKineticBox->setPaddingLeft(PADDING);
		listBox->add(mKineticBox);
	}
	else {
		ListBox *mBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()+label->getHeight()), NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, false);
		mBox->setPaddingLeft(PADDING);
		listBox->add(mBox);
	}
	//setPadding(listBox);

	imgSize = -1;
	mainLayout->add(softKeys);

	return mainLayout;
}

Layout* createImageLayout(const char *left) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	softKeys = createSoftKeyBar(42, left, "", "");
	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	MAExtent imgSize = maGetImageSize(RES_IMAGE);
	int imgWidth = EXTENT_X(imgSize);
	int imgHeight = EXTENT_Y(imgSize);

	image = new Image(0, 0, scrWidth,  imgHeight, NULL, false, false, RES_IMAGE);
	listBox->add(image);
	ListBox *mBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, false);
	listBox->add(mBox);
	setPadding(listBox);

	imgSize = -1;
	mainLayout->add(softKeys);

	return mainLayout;
}

Layout* createImageLayout(const char *left, const char *right, const char *centre) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	softKeys = createSoftKeyBar(42, left, right, centre);
	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	setPadding(listBox);

	mainLayout->add(softKeys);

	return mainLayout;
}

void saveData(const char* storefile, const char *value) {
	MAHandle store = maOpenStore(storefile, MAS_CREATE_IF_NECESSARY);
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
	MAHandle store = maOpenStore(storefile, MAS_CREATE_IF_NECESSARY);
	if (store > 0) {
		maWriteStore(store, data);
	}
	maCloseStore(store, 0);
	//store = -1;
}

char* getData(const char* storefile) {
	MAHandle store = maOpenStore(storefile, 0);
	MAHandle tmp = maCreatePlaceholder();
	if (store > 0) {
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

void returnImage(Image *img, MAHandle i, int height)
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

void retrieveThumb(Image *img, Card *card, ImageCache *mImageCache)
{
	if (card == NULL) {
		return;
	}
	if (card->getThumb().find("http://") == -1) {
		MAHandle store = maOpenStore(card->getThumb().c_str(), 0);
		MAHandle cacheimage = maCreatePlaceholder();
		if(store > 0)
		{
			maReadStore(store, cacheimage);
			int size = maGetDataSize(cacheimage);
			if (size > 0) {
				returnImage(img, cacheimage, 64);
			}
			maCloseStore(store, 0);
		}
		cacheimage = -1;
		store = -1;
	} else {
		ImageCacheRequest* req1 = new ImageCacheRequest(img, card, 64, 0);
		mImageCache->request(req1);
	}
}



void retrieveFront(Image *img, Card *card, int height, ImageCache *mImageCache)
{
	if (card == NULL) {
		return;
	}
	if (card->getFront().find("http://") == -1) {
		MAHandle cacheimage = maCreatePlaceholder();
		MAHandle store = maOpenStore(card->getFront().c_str(), 0);
		if(store != STERR_NONEXISTENT)
		{
			maReadStore(store, cacheimage);
			maCloseStore(store, 0);

			if (maGetDataSize(cacheimage) > 0) {
				returnImage(img, cacheimage, height);
			}
		}
		cacheimage = -1;
		store = -1;
	} else {
		ImageCacheRequest* req1 = new ImageCacheRequest(img, card, height, 1);
		mImageCache->request(req1);
	}
}
void retrieveBack(Image *img, Card *card, int height, ImageCache *mImageCache)
{
	if (card == NULL) {
		return;
	}
	if (card->getBack().find("http://") == -1) {
		MAHandle cacheimage = maCreatePlaceholder();
		MAHandle store = maOpenStore(card->getBack().c_str(), 0);
		if(store != STERR_NONEXISTENT)
		{
			maReadStore(store, cacheimage);
			maCloseStore(store, 0);

			if (maGetDataSize(cacheimage) > 0) {
				returnImage(img, cacheimage, height);
			}
		}
		cacheimage = -1;
		store = -1;
	} else {
		ImageCacheRequest* req1 = new ImageCacheRequest(img, card, height, 2);
		mImageCache->request(req1);
	}
}
