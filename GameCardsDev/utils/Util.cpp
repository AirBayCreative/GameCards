#include <mavsprintf.h>
#include <conprint.h>

#include "../UI/Widgets/MobImage.h"
#include "../UI/KineticListBox.h"
#include "ImageCacheRequest.h"
#include "../MAHeaders.h"
#include "Util.h"
#include "../UI/Button.h"

#define RED(x)                  (((x)&0x00ff0000)>>16)
#define GREEN(x)                (((x)&0x0000ff00)>>8)
#define BLUE(x)                 (((x)&0x000000ff))
#define ALPHA(x)                (((x)&0xff000000)>>24)
#define RGBA(r,g,b,a)    ((((a)&0xff)<<24)| \
                                                 (((r)&0xff)<<16)| \
                                                 (((g)&0xff)<<8)| \
                                                 (((b)&0xff)));

MainScreen *orig;
MainScreen *origAlbum;
MainScreen *origMenu;
int scrWidth;
int scrHeight;

Util::Util() {}
Util::~Util() {}

MAHandle Util::loadImageFromResource(MAHandle resourceId)
{
	MAHandle image = maCreatePlaceholder();
	int result = maCreateImageFromData(
		image,
		resourceId,
		0,
		maGetDataSize(resourceId));

	if (RES_OK == result)
	{
		return image;
	}
	else
	{
		return NULL;
	}
}

Font* Util::getFontBlue() {
	static Font* blue;
	if (blue == NULL) {
#if defined(RES_FONT_BLUE)
		blue = new MAUI::Font(RES_FONT_BLUE);
#endif
	}
	return blue;
}

Font* Util::getFontBlack() {
	static Font* black;
	if (black == NULL) {
#if defined(RES_FONT_BLACK)
		black = new MAUI::Font(RES_FONT_BLACK);
#endif
#if defined(RES_FONT_PUREWHITE)
		black = new MAUI::Font(RES_FONT_PUREWHITE);
#endif
	}
	return black;
}

Font* Util::getFontWhite() {
	static Font* white;
	if (white == NULL) {
#if defined(RES_FONT_WHITE)
		white = new MAUI::Font(RES_FONT_WHITE);
#endif
	}
	return white;
}
Font* Util::getFontRed() {
	static Font* red;
	if (red == NULL) {
#if defined(RES_FONT_RED)
			red = new MAUI::Font(RES_FONT_RED);
#endif
	}
	return red;
}

Font* Util::getFontGreen() {
	static Font* green;
	if (green == NULL) {
#if defined(RES_FONT_GREEN)
		green = new MAUI::Font(RES_FONT_GREEN);
#endif
	}
	return green;
}
Font* Util::getFontGrey() {
	static Font* grey;
	if (grey == NULL) {
#if defined(RES_FONT_GREY)
		grey = new MAUI::Font(RES_FONT_GREY);
#endif
	}
	return grey;
}

Font* Util::getDefaultFont() {
#if defined(RES_FONT_GREY)
	return getFontGrey();
#endif
#if defined(RES_FONT_WHITE)
	return getFontWhite();
#endif
	return getFontBlack();
}
Font* Util::getDefaultSelected() {
#if defined(RES_FONT_GREEN)
	return getFontGreen();
#endif
#if defined(RES_FONT_RED)
	return getFontRed();
#endif
	return getFontBlue();
}
Font* Util::getButtonFont() {
	return getFontBlack();
}

WidgetSkin* Util::getSkinEditBox() {
	static WidgetSkin* gSkinEditBox;
	if (gSkinEditBox == NULL) {
		gSkinEditBox = new WidgetSkin(RES_SELECTED_EDITBOX, RES_UNSELECTED_EDITBOX,
				EDITBOX_X_LEFT, EDITBOX_X_RIGHT, EDITBOX_Y_TOP, EDITBOX_Y_BOTTOM, true, true);
	}
	return gSkinEditBox;
}

WidgetSkin* Util::getSkinButton() {
	static WidgetSkin* gSkinButton;
	if (gSkinButton == NULL) {
		gSkinButton = new WidgetSkin(RES_SELECTED_BUTTON, RES_UNSELECTED_BUTTON,
				BUTTON_X_LEFT, BUTTON_X_RIGHT, BUTTON_Y_TOP, BUTTON_Y_BOTTOM, true, true);
	}
	return gSkinButton;
}

void Util::setCaption(Label *label) {
	label->setHeight(36);
	label->setAutoSizeY(false);
	label->setFont(Util::getDefaultSelected());
}

WidgetSkin* Util::getSkinBack() {
	static WidgetSkin* gSkinBack;
	if (gSkinBack == NULL) {
		gSkinBack = new WidgetSkin(RES_BACKGROUND, RES_BACKGROUND,
				BACKGROUND_X_LEFT, BACKGROUND_X_RIGHT, BACKGROUND_Y_TOP, BACKGROUND_Y_BOTTOM, false, false);
	}
	return gSkinBack;
}

WidgetSkin* Util::getSkinHeader() {
	static WidgetSkin* gSkinHead;
	if (gSkinHead == NULL) {
		gSkinHead = new WidgetSkin(RES_HEAD, RES_HEAD,
				HEAD_X_LEFT, HEAD_X_RIGHT, HEAD_Y_TOP, HEAD_Y_BOTTOM, false, false);
	}
	return gSkinHead;
}


WidgetSkin* Util::getSkinList() {
	static WidgetSkin* gSkinList;
	if (gSkinList == NULL) {
		gSkinList = new WidgetSkin(RES_SELECTED_LIST, RES_UNSELECTED_LIST,
				LIST_X_LEFT, LIST_X_RIGHT, LIST_Y_TOP, LIST_Y_BOTTOM, true, true);
	}
	return gSkinList;
}

WidgetSkin* Util::getSkinListNoArrows() {
	static WidgetSkin* gSkinListNoArrows;
	if (gSkinListNoArrows == NULL) {
		gSkinListNoArrows = new WidgetSkin(RES_UNSELECTED_LIST, RES_UNSELECTED_LIST,
				LISTNOARROWS_X_LEFT, LISTNOARROWS_X_RIGHT, LISTNOARROWS_Y_TOP, LISTNOARROWS_Y_BOTTOM, true, true);
	}
	return gSkinListNoArrows;
}

WidgetSkin* Util::getSkinAlbum() {
	static WidgetSkin* gSkinAlbum;
	if (gSkinAlbum == NULL) {
		gSkinAlbum = new WidgetSkin(RES_SELECTED_ALBUM, RES_UNSELECTED_ALBUM,
				ALBUM_X_LEFT, ALBUM_X_RIGHT, ALBUM_Y_TOP, ALBUM_Y_BOTTOM, true, true);
	}
	return gSkinAlbum;
}

WidgetSkin* Util::getSkinText() {
	static WidgetSkin* gSkinText;
	if (gSkinText == NULL) {
		gSkinText = new WidgetSkin(RES_TEXT_BOX, RES_TEXT_BOX,
				TEXT_X_LEFT, TEXT_X_RIGHT, TEXT_Y_TOP, TEXT_Y_BOTTOM, true, true);
	}
	return gSkinText;
}
WidgetSkin* Util::getSkinDropDownItem() {
	static WidgetSkin* gSkinDropDownItem;
	if (gSkinDropDownItem == NULL) {
		gSkinDropDownItem = new WidgetSkin(RES_DROPDOWNITEM_SEL, RES_DROPDOWNITEM_UNSEL,
				DROPDOWNITEM_X_LEFT, DROPDOWNITEM_X_RIGHT, DROPDOWNITEM_Y_TOP,
				DROPDOWNITEM_Y_BOTTOM, true, true);
	}
	return gSkinDropDownItem;
}

WidgetSkin* Util::getSkinDropDownBox() {
	static WidgetSkin* gSkinDropDownBox;
	if (gSkinDropDownBox == NULL) {
		gSkinDropDownBox = new WidgetSkin(RES_DROPDOWNBOX_SEL, RES_DROPDOWNBOX_UNSEL,
				DROPDOWNBOX_X_LEFT, DROPDOWNBOX_X_RIGHT, DROPDOWNBOX_Y_TOP,
				DROPDOWNBOX_Y_BOTTOM, true, true);
	}
	return gSkinDropDownBox;
}

WidgetSkin* Util::getSkinDropDownBack() {
	static WidgetSkin* gSkinDropDownBack;
	if (gSkinDropDownBack == NULL) {
		gSkinDropDownBack = new WidgetSkin(RES_BLANK, RES_BLANK,
				DROPDOWNBACK_X_LEFT, DROPDOWNBACK_X_RIGHT, DROPDOWNBACK_Y_TOP,
				DROPDOWNBACK_Y_BOTTOM, true, true);
	}
	return gSkinDropDownBack;
}

WidgetSkin* Util::getIconListBack() {
	static WidgetSkin* gSkinIconListBack;
	if (gSkinIconListBack == NULL) {
		gSkinIconListBack = new WidgetSkin(RES_ICONS_BACK, RES_ICONS_BACK,
				5, 315, 10, 90, true, true);
	}
	return gSkinIconListBack;
}

WidgetSkin* Util::getIconSelect() {
	static WidgetSkin* gSkinIconSelect;
	if (gSkinIconSelect == NULL) {
		gSkinIconSelect = new WidgetSkin(RES_SELECT_ICON, RES_UNSELECT_ICON,
				4, 48, 10, 50, true, true);
	}
	return gSkinIconSelect;
}

WidgetSkin* Util::getSkinPopupHeader() {
	static WidgetSkin* gSkinPopupHeader;
	if (gSkinPopupHeader == NULL) {
		gSkinPopupHeader = new WidgetSkin(RES_POPUP_HEADER, RES_POPUP_HEADER,
				POPUP_HEADER_X_LEFT, POPUP_HEADER_X_RIGHT, POPUP_HEADER_Y_TOP,
				POPUP_HEADER_Y_BOTTOM, true, true);
	}
	return gSkinPopupHeader;
}

void Util::setPadding(Widget *w) {
	w->setPaddingTop(PADDING*2);
	w->setPaddingLeft(PADDING);
}

Label* Util::createLabel(String str, int height) {
	Label *label = new Label(0,0, scrWidth-(PADDING*2), height, NULL, str, 0, Util::getDefaultFont());
	label->setSkin(Util::getSkinText());
	Util::setPadding(label);
	return label;
}

Label* Util::createEditLabel(String str, int height) {
	Label* label = new Label(0,0, scrWidth-(PADDING*2), height, NULL, str, 0, Util::getDefaultFont());
	label->setSkin(Util::getSkinEditBox());
	Util::setPadding(label);
	return label;
}
Label* Util::createDropDownLabel(String str, int height) {
	Label* label = new Label(0,0, scrWidth-(PADDING*2), height, NULL, str, 0, Util::getFontBlack());
	label->setSkin(Util::getSkinDropDownBox());
	Util::setPadding(label);
	return label;
}
Label* Util::createSubLabel(String str, int height) {
	Label *label = new Label(0, 0, scrWidth-(PADDING*2), height, NULL, str, 0, Util::getDefaultFont());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setSkin(Util::getSkinList());
	return label;
}
Label* Util::createSubLabel(String str, int width, int height) {
	Label *label = new Label(0, 0, width, height, NULL, str, 0, Util::getDefaultFont());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setSkin(Util::getSkinList());
	return label;
}
Widget* Util::createSoftKeyBar(int height, const char *left, const char *right) {
	return Util::createSoftKeyBar(height, left, right, "");
}

Widget* Util::createSoftKeyBar(int height, const char *left, const char *right, const char *centre) {
	Layout *layout = new Layout(0, 0, scrWidth, height + 5, NULL, 3, 1);
	layout->setPaddingTop(5);
	layout->setSkin(Util::getIconListBack());
	layout->setDrawBackground(true);

	Button *label = new Button(0,0, scrWidth/3, height, NULL);
	label->setCaption(left);
	label->setBackgroundColor(0);
	label->setFont(Util::getButtonFont());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(left) != 0) {
		label->setSkin(Util::getSkinButton());
	}
	else {
		label->setDrawBackground(false);
		label->setSelectable(false);
	}
	layout->add(label);

	//the %3 part is to make up for pixels lost due to int dropping fractions
	label = new Button(0,0, scrWidth/3, height, NULL);
	label->setCaption(centre);
	label->setBackgroundColor(0);
	label->setFont(Util::getButtonFont());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(centre) != 0) {
		label->setSkin(Util::getSkinButton());
	}
	else {
		label->setDrawBackground(false);
		label->setSelectable(false);
	}
	layout->add(label);

	label= new Button(0,0, scrWidth/3, height, NULL);
	label->setCaption(right);
	label->setBackgroundColor(0);
	label->setFont(Util::getButtonFont());
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(right) != 0) {
		label->setSkin(Util::getSkinButton());
	}
	else {
		label->setDrawBackground(false);
		label->setSelectable(false);
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
	new ListBox(0, 0, scrWidth, scrHeight, mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	return mainLayout;
}

Layout* Util::createMainLayout(const char *left, const char *right, const char *centre, bool useKinetic) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	mainLayout->setSkin(Util::getSkinBack());
	mainLayout->setDrawBackground(true);

	Widget *softKeys = Util::createSoftKeyBar(getSoftKeyBarHeight(), left, right, centre);
	Label *label = new Label(0,0,scrWidth,36,NULL,"",0,Util::getDefaultSelected());

	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	listBox->setDrawBackground(false);

	MAExtent imgSize = maGetImageSize(RES_IMAGE);
	//int imgWidth = EXTENT_X(imgSize);
	int imgHeight = EXTENT_Y(imgSize);

	ListBox *header = new ListBox(0, 0, scrWidth, imgHeight, NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	header->setSkin(Util::getSkinHeader());

	Image *image = new Image(0, 0, scrWidth,  imgHeight, NULL, true, true, RES_IMAGE);
	header->add(image);

	listBox->add(header);

	label->setAutoSizeY();
	label->setMultiLine(true);
	label->setDrawBackground(false);
	listBox->add(label);

	if (useKinetic) {
		KineticListBox *mKineticBox = new KineticListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()+imgHeight/*image->getHeight()*/),
				NULL, KineticListBox::LBO_VERTICAL, KineticListBox::LBA_LINEAR, false);
		mKineticBox->setPaddingLeft(PADDING);
		mKineticBox->setDrawBackground(false);
		listBox->add(mKineticBox);
	}
	else {
		ListBox *mBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()+imgHeight),
				NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, false);
		mBox->setDrawBackground(false);
		mBox->setPaddingLeft(PADDING);
		listBox->add(mBox);
	}

	imgSize = -1;
	mainLayout->add(softKeys);

	return mainLayout;
}

Layout* Util::createImageLayout(const char *left, bool useKinetic) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	mainLayout->setSkin(Util::getSkinBack());
	mainLayout->setDrawBackground(true);

	Widget *softKeys = Util::createSoftKeyBar(getSoftKeyBarHeight(), left, "", "");
	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	MAExtent imgSize = maGetImageSize(RES_IMAGE);
	//int imgWidth = EXTENT_X(imgSize);
	int imgHeight = EXTENT_Y(imgSize);

	ListBox *header = new ListBox(0, 0, scrWidth, imgHeight, NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	header->setSkin(Util::getSkinHeader());

	Image *image = new Image(0, 0, scrWidth,  imgHeight, NULL, true, true, RES_IMAGE);
	header->add(image);

	listBox->add(header);

	if (useKinetic) {
		KineticListBox *mKineticBox = new KineticListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()),
				NULL, KineticListBox::LBO_VERTICAL, KineticListBox::LBA_LINEAR, false);
		mKineticBox->setDrawBackground(false);
		listBox->add(mKineticBox);
	}
	else {
		ListBox *mBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, false);
		listBox->setDrawBackground(false);
		listBox->add(mBox);
	}

	imgSize = -1;
	mainLayout->add(softKeys);

	return mainLayout;
}

Layout* Util::createImageLayout(const char *left, const char *right, const char *centre, bool useKinetic) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	mainLayout->setSkin(Util::getSkinBack());
	mainLayout->setDrawBackground(true);

	Widget *softKeys = Util::createSoftKeyBar(getSoftKeyBarHeight(), left, right, centre);

	if (useKinetic) {
		KineticListBox *mKineticBox = new KineticListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()),
				mainLayout, KineticListBox::LBO_VERTICAL, KineticListBox::LBA_LINEAR, true);
		mKineticBox->setDrawBackground(false);
		mKineticBox->setPaddingLeft(PADDING);
	}
	else {
		ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
		listBox->setDrawBackground(false);
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
		currentSoftKeys = NULL;
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

bool Util::getData(const char* storefile, String &data) {
	MAHandle store = maOpenStore((FILE_PREFIX+storefile).c_str(), 0);
	if(store>0)
	{
		MAHandle dataHandle = maCreatePlaceholder();
		if( maReadStore(store, dataHandle) != RES_OUT_OF_MEMORY  )
		{
			int size = maGetDataSize(dataHandle);
			char temp[size + 1];
			temp[size] = '\0';
			maReadData(dataHandle, &temp, 0, size);

			data.clear();
			data = String(temp);

			memset(temp, 0, size+1);
			maDestroyObject(dataHandle);
			return true;
		}
	}
	return false;
}

void Util::returnImage(MobImage *img, MAHandle i, int height)
{
	MAHandle imageh = maCreatePlaceholder();
	maCreateImageFromData(imageh, i, 0, maGetDataSize(i));
	if (img != NULL) {
		if (img->getResource() != NULL) {
			maDestroyObject(img->getResource());
		}
		img->setResource(imageh);
		img->requestRepaint();
	}
	maUpdateScreen();
	imageh = -1;
	i = -1;
}

void Util::retrieveThumb(MobImage *img, Card *card, ImageCache *mImageCache)
{
	if (card == NULL) {
		return;
	}

	MAHandle store = maOpenStore((FILE_PREFIX+card->getId()+".sav").c_str(), 0);
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
		maDestroyObject(cacheimage);
		cacheimage = -1;
	}
	else {
		req1 = new ImageCacheRequest(img, card, 64, 0);
		mImageCache->request(req1);
	}
	store = -1;
	req1 = NULL;
}

void Util::retrieveProductThumb(MobImage *img, Product *product, ImageCache *mImageCache)
{
	if (product == NULL) {
		return;
	}

	MAHandle store = maOpenStore((FILE_PREFIX+"prod_"+product->getId()+".sav").c_str(), 0);
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
	/*if (img == NULL) {
		return;
	}*/
	if (mImageCache == NULL) {
		return;
	}

	MAHandle store = maOpenStore((FILE_PREFIX+card->getId()+"f.sav").c_str(), 0);
	ImageCacheRequest* req1;
	if(store != STERR_NONEXISTENT) {
		MAHandle cacheimage = maCreatePlaceholder();
		maReadStore(store, cacheimage);
		maCloseStore(store, 0);

		if (maGetDataSize(cacheimage) > 0) {
			if (img == NULL) {
				return;
			}
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

	MAHandle store = maOpenStore((FILE_PREFIX+card->getId()+"f_flip.sav").c_str(), 0);
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
	/*if (img == NULL) {
		return;
	}*/
	if (mImageCache == NULL) {
		return;
	}

	if (card != NULL) {
		String filename = (FILE_PREFIX+card->getId()+"b.sav");
		MAHandle store = maOpenStore(filename.c_str(), 0);
		ImageCacheRequest* req1;
		if(store != STERR_NONEXISTENT) {
			MAHandle cacheimage = maCreatePlaceholder();
			maReadStore(store, cacheimage);
			maCloseStore(store, 0);

			if (maGetDataSize(cacheimage) > 0) {
				if (img == NULL) {
					return;
				}
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
}

void Util::retrieveBackFlip(MobImage *img, Card *card, int height, ImageCache *mImageCache)
{
	if (card == NULL) {
		return;
	}

	MAHandle store = maOpenStore((FILE_PREFIX+card->getId()+"b_flip.sav").c_str(), 0);
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
	} else {
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
bool Util::validateNoWhiteSpaces(String val) {
	int spaceIndex = val.find(" ");
	if (spaceIndex < 0) {
		return true;
	}
	return false;
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
	int scaledHeight = ((scrHeight*0.1)>MIN_SOFTKEY_BAR_HEIGHT?(int)(scrHeight*0.1):MIN_SOFTKEY_BAR_HEIGHT);

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


	/* Copyright (C) 2004-2008 Ren� Nyffenegger

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

	   Ren� Nyffenegger rene.nyffenegger@adp-gmbh.ch */

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

