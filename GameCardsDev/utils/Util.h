#ifndef _UTIL_H_
#define _UTIL_H_

#include <MAUI/Widget.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Font.h>
#include <MAUI/Image.h>
#include <MAUI/ListBox.h>
#include <conprint.h>

#include "MAHeaders.h"
#include "Card.h"
#include "Product.h"
#include "ImageCache.h"
#include "Convert.h"

using namespace MAUI;

#define PADDING 5
#define VIRTUAL_KEYBOARD_HEIGHT 135
#define VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER 0.33
#define VIRTUAL_KEYBOARD_WIDTH 240

class Util
{
	public:
		Util();
		~Util();

		static void setPadding(Widget *w);
		static Label* createLabel(String str, int height=48);
		static Label* createEditLabel(String str, int height=48);
		static Label* createSubLabel(String str, int height=48);
		static Widget* createSoftKeyBar(int height, const char *left, const char *right);
		static Widget* createSoftKeyBar(int height, const char *left, const char *right, const char *centre);
		static Layout* createNoHeaderLayout();
		static Layout* createMainLayout(const char *left, const char *right, bool useKinetic = false);
		static Layout* createMainLayout(const char *left, const char *right, const char *centre, bool useKinetic = false);
		static Layout* createImageLayout(const char *left, bool useKinetic = false);
		static Layout* createImageLayout(const char *left, const char *right, const char *centre, bool useKinetic = false);
		static void updateSoftKeyLayout(const char *left, const char *right, const char *centre, Layout *mainLayout);
		static char* getData(char* storefile);
		static void saveData(const char* storefile, const char *value);
		static void saveFile(const char* storefile, MAHandle data);
		static void bilinearScale(int *dst, int dwidth, int dheight, int dpitch, int *src, int swidth, int sheight, int spitch);
		static void nearestNeighbour(int *dst, int dwidth, int dheight, int dpitch, int *src, int swidth, int sheight, int spitch);
		static void retrieveThumb(MobImage *img, Card *card, ImageCache *mImageCache);
		static void retrieveProductThumb(MobImage *img, Product *product, ImageCache *mImageCache);
		static void retrieveFront(MobImage *img, Card *card, int height, ImageCache *mImageCache);
		static void retrieveBack(MobImage *img, Card *card, int height, ImageCache *mImageCache);
		static void retrieveFrontFlip(MobImage *img, Card *card, int height, ImageCache *mImageCache);
		static void retrieveBackFlip(MobImage *img, Card *card, int height, ImageCache *mImageCache);
		static void returnImage(MobImage *img, MAHandle i, int height);
		static int intlen(float start);
		static int absoluteValue(int num);
		static bool validateEmailAddress(String email);
		static int getSoftKeyBarHeight();
		static int getMaxImageHeight();
		static int getMaxImageWidth();
		static String base64_encode(unsigned char const* bytes_to_encode, unsigned int in_len);
		static String base64_decode(String encoded_string);
		static inline bool is_base64(unsigned char c);

		static Font* getFontBlue();
		static Font* getFontBlack();
		static WidgetSkin* getSkinEditBox();
		static WidgetSkin* getSkinButton();
		static WidgetSkin* getSkinBack();
		static WidgetSkin* getSkinList();
		static WidgetSkin* getSkinListNoArrows();
		static WidgetSkin* getSkinText();
		static WidgetSkin* getSkinAlbum();



		/*static Screen* orig();
		static Screen* origAlbum();
		static Screen* origMenu();*/

	private:
};

extern int scrWidth;
extern int scrHeight;
extern Image *image;
extern Widget *softKeys;
extern Screen *orig;
extern Screen *origAlbum;
extern Screen *origMenu;


static String FILE_PREFIX = "dev_";

#endif	//_UTIL_H_
