#include "MAHeaders.h"
#include "Util.h"
#include <conprint.h>


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
int scrWidth;
int scrHeight;
/*Label *label;
Layout *mainLayout;
Layout *layout;
ListBox* listBox;
Widget *softKeys;
ListBox *mBox;
Image *image;
MAHandle imageh;
MAHandle store;
MAHandle tmp;
MAHandle hValue;
MAHandle cacheimage;
int *texture;
int *tmpimg;*/

void setPadding(Widget *w) {
	w->setPaddingLeft(PADDING);
}

Label* createLabel(String str, int height) {
	Label *label = new Label(0,0, scrWidth-(PADDING*2), height, NULL, str, 0, gFontWhite);
	label->setSkin(gSkinText);
	setPadding(label);
	return label;
}
Label* createEditLabel(String str, int height) {
	Label *label = new Label(0,0, scrWidth-(PADDING*2), height, NULL, str, 0, gFontWhite);
	label->setSkin(gSkinEditBox);
	setPadding(label);
	return label;
}

Label* createSubLabel(String str, int height) {
	Label *label = new Label(0, 0, scrWidth-(PADDING*2), height, NULL, str, 0, gFontGrey);
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	label->setSkin(gSkinList);
	return label;
}
Widget* createSoftKeyBar(int height, const char *left, const char *right) {
	return createSoftKeyBar(height, left, right, blank);
}

Widget* createSoftKeyBar(int height, const char *left, const char *right, const char *centre) {
	Layout* layout = new Layout(0, 0, scrWidth, height, NULL, 3, 1);
	Label *label = new Label(0,0, scrWidth/3, height, NULL, left, 0, gFontWhite);
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(left) != 0) {
		label->setSkin(gSkinButton);
	}
	layout->add(label);

	label = new Label(0,0, scrWidth/3, height, NULL, centre, 0, gFontWhite);
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(centre) != 0) {
		label->setSkin(gSkinButton);
	}
	layout->add(label);

	label = new Label(0,0, scrWidth/3, height, NULL, right, 0, gFontWhite);
	label->setHorizontalAlignment(Label::HA_CENTER);
	label->setVerticalAlignment(Label::VA_CENTER);
	if (strlen(right) != 0) {
		label->setSkin(gSkinButton);
	}
	layout->add(label);

	return layout;
}
void bilinearScale(int *dst, int dwidth, int dheight, int dpitch, int *src, int swidth, int sheight, int spitch) {
	int deltax = (swidth<<16)/dwidth;
	int deltay = (sheight<<16)/dheight;

	int x = 0;
	int u, v;
	v = 0;
	int *src_scan;
	while(dheight) {
			x = dwidth;
			u = 0;
			src_scan = &src[(v>>16)*spitch];
			while(x) {
					// get bilinear filtered value
	//              int frac_x = (u-(u&0xffff0000));
	//              int frac_y = (v-(v&0xffff0000));
					int frac_x = 0xffff-(u&0xffff);
					int frac_y = (v&0xffff);

					int pos = (u>>16);

					int tl_r = RED(src_scan[pos]);
					int tl_g = GREEN(src_scan[pos]);
					int tl_b = BLUE(src_scan[pos]);
					int tl_a = ALPHA(src_scan[pos]);

					int bl_r = RED(src_scan[pos+spitch]);
					int bl_g = GREEN(src_scan[pos+spitch]);
					int bl_b = BLUE(src_scan[pos+spitch]);
					int bl_a = ALPHA(src_scan[pos+spitch]);

					tl_r = ((tl_r)*frac_x + (RED(src_scan[pos+1]))*(0xffff-frac_x))>>16;
					tl_g = ((tl_g)*frac_x + (GREEN(src_scan[pos+1]))*(0xffff-frac_x))>>16;
					tl_b = ((tl_b)*frac_x + (BLUE(src_scan[pos+1]))*(0xffff-frac_x))>>16;
					tl_a = ((tl_a)*frac_x + (ALPHA(src_scan[pos+1]))*(0xffff-frac_x))>>16;

					bl_r = ((bl_r)*frac_x + (RED(src_scan[pos+spitch+1]))*(0xffff-frac_x))>>16;
					bl_g = ((bl_g)*frac_x + (GREEN(src_scan[pos+spitch+1]))*(0xffff-frac_x))>>16;
					bl_b = ((bl_b)*frac_x + (BLUE(src_scan[pos+spitch+1]))*(0xffff-frac_x))>>16;
					bl_a = ((bl_a)*frac_x + (ALPHA(src_scan[pos+spitch+1]))*(0xffff-frac_x))>>16;


					//tl_r += (((RED(src_scan[pos+1])-tl_r)*frac_x)>>16);
					//tl_g += (((GREEN(src_scan[pos+1])-tl_g)*frac_x)>>16);
					//tl_b += (((BLUE(src_scan[pos+1])-tl_b)*frac_x)>>16);
					//tl_a += (((ALPHA(src_scan[pos+1])-tl_a)*frac_x)>>16);

					//bl_r += (((RED(src_scan[pos+spitch+1])-bl_r)*frac_x)>>16);
					//bl_g += (((GREEN(src_scan[pos+spitch+1])-bl_g)*frac_x)>>16);
					//bl_b += (((BLUE(src_scan[pos+spitch+1])-bl_b)*frac_x)>>16);
					//bl_a += (((ALPHA(src_scan[pos+spitch+1])-bl_a)*frac_x)>>16);

					*dst = RGBA(
							tl_r + (((bl_r-tl_r)*frac_y)>>16),
							tl_g + (((bl_g-tl_g)*frac_y)>>16),
							tl_b + (((bl_b-tl_b)*frac_y)>>16),
							tl_a + (((bl_a-tl_a)*frac_y)>>16)
							);

					u+=deltax;

					x--;
					dst++;
			}
			dst+=-dwidth+dpitch;
			dheight--;
			v+=deltay;
	}
}

// first child is listbox
Layout* createMainLayout(const char *left, const char *right) {
	return createMainLayout(left, right, blank);
}

Layout* createNoHeaderLayout() {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight, mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	return mainLayout;
}

Layout* createMainLayout(const char *left, const char *right, const char *centre) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);

	Widget *softKeys = createSoftKeyBar(42, left, right, centre);
	Label *label = new Label(0,0,scrWidth,scrHeight/4,NULL,blank,0,gFontWhite);

	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);

	MAExtent imgSize = maGetImageSize(RES_IMAGE);
	int imgWidth = EXTENT_X(imgSize);
	int imgHeight = EXTENT_Y(imgSize);

	Image *image = new Image(0, 0, scrWidth,  imgHeight, NULL, false, false, RES_IMAGE);
	listBox->add(image);

	label->setAutoSizeY();
	label->setMultiLine(true);
	listBox->add(label);

	ListBox *mBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()+/*image->getHeight()+*/label->getHeight()), NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, false);
	listBox->add(mBox);
	setPadding(listBox);

	mainLayout->add(softKeys);

	return mainLayout;
}

Layout* createImageLayout(const char *left, const char *right, const char *centre) {
	Layout *mainLayout = new Layout(0, 0, scrWidth, scrHeight, NULL, 1, 2);
	Widget *softKeys = createSoftKeyBar(42, left, right, centre);
	ListBox *listBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), mainLayout, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, true);
	MAExtent imgSize = maGetImageSize(RES_IMAGE);
	int imgWidth = EXTENT_X(imgSize);
	int imgHeight = EXTENT_Y(imgSize);

	Image *image = new Image(0, 0, scrWidth,  imgHeight, NULL, false, false, RES_IMAGE);
	listBox->add(image);
	ListBox *mBox = new ListBox(0, 0, scrWidth, scrHeight-(softKeys->getHeight()), NULL, ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, false);
	listBox->add(mBox);
	setPadding(listBox);

	mainLayout->add(softKeys);

	return mainLayout;
}

void saveData(const char* storefile, const char *value) {
	MAHandle hValue = maCreatePlaceholder();
	MAHandle store = maOpenStore(storefile, MAS_CREATE_IF_NECESSARY);
	if (store > 0) {
		if (maCreateData(hValue, strlen(value)) == RES_OK) {
			maWriteData(hValue, value, 0, strlen(value));
			maWriteStore(store, hValue);
		}
		maCloseStore(store, 0);
	}
}

void saveFile(const char* storefile, MAHandle data) {
	MAHandle store = maOpenStore(storefile, MAS_CREATE_IF_NECESSARY);
	if (store > 0) {
		maWriteStore(store, data);
	}
	maCloseStore(store, 0);
}

char* getData(const char* storefile) {
	MAHandle store = maOpenStore(storefile, 0);
	MAHandle tmp = maCreatePlaceholder();
	if (store > 0) {
		maReadStore(store, tmp);
		int size = maGetDataSize(tmp);
		char *ret = new char[size+1];
		memset(ret,'\0',size+1);
		maReadData(tmp, ret, 0, size);
		maCloseStore(store, 0);
		return ret;
	}
	return "";
}

void returnImage(Image *img, MAHandle i, int height)
{
	MAHandle imageh = maCreatePlaceholder();
	maCreateImageFromData(imageh, i, 0, maGetDataSize(i));
	img->setResource(resize(imageh,height));
	img->update();
	img->requestRepaint();
	maUpdateScreen();
}

void retrieveThumb(Image *img, Card *card, ImageCache *mImageCache)
{
	if (card == NULL) {
		return;
	}
	if (card->getThumb().find("http://") == -1) {
		MAHandle cacheimage = maCreatePlaceholder();
		MAHandle store = maOpenStore(card->getThumb().c_str(), -1);
		if(store != STERR_NONEXISTENT)
		{
			maReadStore(store, cacheimage);
			maCloseStore(store, 0);

			if (maGetDataSize(cacheimage) > 0) {
				returnImage(img, cacheimage, 64);
			}
		}
	} else {
		//TODO implement listener for connections
		ImageCacheRequest* req1 = new ImageCacheRequest(img, card, 64, 0);
		(new ImageCache())->request(req1);
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
	} else {
		ImageCacheRequest* req1 = new ImageCacheRequest(img, card, height, 1);
		(new ImageCache())->request(req1);
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
	} else {
		ImageCacheRequest* req1 = new ImageCacheRequest(img, card, height, 2);
		(new ImageCache())->request(req1);
	}
}

void nearestNeighbour(int *dst, int dwidth, int dheight, int dpitch, int *src, int swidth, int sheight, int spitch) {
	int deltax = (swidth<<16)/dwidth;
	int deltay = (sheight<<16)/dheight;

	int x = 0;
	int u, v;
	v = 0;
	int *src_scan;
	while(dheight) {
			x = dwidth;
			u = 0;
			src_scan = &src[(v>>16)*spitch];

			while(x > 0)
			{
					 switch (x & 0x3)
					 {
					   case 0:
							*dst++ = src_scan[(u>>16)];
							u+=deltax;
							*dst++ = src_scan[(u>>16)];
							u+=deltax;
							*dst++ = src_scan[(u>>16)];
							u+=deltax;
							*dst++ = src_scan[(u>>16)];
							u+=deltax;
							x-=4;
							break;

					   case 3:
							*dst++ = src_scan[(u>>16)];
							u+=deltax;
							*dst++ = src_scan[(u>>16)];
							u+=deltax;
							*dst++ = src_scan[(u>>16)];
							u+=deltax;
							x-=3;
							break;

					   case 2:
							*dst++ = src_scan[(u>>16)];
							u+=deltax;
							*dst++ = src_scan[(u>>16)];
							u+=deltax;
							x-=2;
							break;

					   case 1:
							*dst++ = src_scan[(u>>16)];
							u+=deltax;
							x-=1;
							break;

					 }
			}
			dst+=-dwidth+dpitch;
			dheight--;
			v+=deltay;
	}

}

MAHandle resize(MAHandle img, int height) {
	if (scrHeight < 350) {
		MAExtent textureSize = maGetImageSize(img);

		int sTextureWidth = EXTENT_X(textureSize);
		int sTextureHeight = EXTENT_Y(textureSize);

		int newHeight = height;
		if (newHeight+1 < sTextureHeight) {
			int *texture = new int [sTextureWidth*sTextureHeight];
			MARect srcRect = {0, 0, sTextureWidth, sTextureHeight};

			double origRatio = (double)((double)sTextureHeight / (double)sTextureWidth);

			maGetImageData(img, texture, &srcRect, sTextureWidth);

			int newWidth = (int)((double)(newHeight) / (double)origRatio);

			MAHandle imageh = maCreatePlaceholder();
			int *tmpimg = new int[newWidth*newHeight];
			bilinearScale( tmpimg, newWidth, newHeight, newWidth, texture, sTextureWidth, sTextureHeight, sTextureWidth);

			maCreateImageRaw(imageh,tmpimg, EXTENT(newWidth, newHeight),0);

			delete texture;
			delete tmpimg;
			return imageh;
		}
	}
	return img;
}
