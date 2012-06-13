#ifndef _UTIL_H_
#define _UTIL_H_

#include <MAUI/Widget.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Font.h>
#include <MAUI/Image.h>
#include <MAUI/ListBox.h>
#include <conprint.h>
#include "../screens/MainScreen.h"

#include "../MAHeaders.h"
#include "Card.h"
#include "Product.h"
#include "ImageCache.h"
#include "Convert.h"
#include "URLEncode.h"
#include "PIM.h"


using namespace MAUI;

class Util
{
	public:
		Util();
		~Util();

		static MAHandle loadImageFromResource(MAHandle resourceId);
		static void setPadding(Widget *w);
		static Label* createLabel(String str, int height=DEFAULT_LABEL_HEIGHT);
		static Label* createEditLabel(String str, int height=DEFAULT_LABEL_HEIGHT);
		static Label* createDropDownLabel(String str, int height=DEFAULT_DROPDOWN_HEIGHT);
		static Label* createSubLabel(String str, int height=DEFAULT_LABEL_HEIGHT);
		static Label* createSubLabel(String str, int width, int height=DEFAULT_LABEL_HEIGHT);
		static Widget* createSoftKeyBar(int height, const char *left, const char *right);
		static Widget* createSoftKeyBar(int height, const char *left, const char *right, const char *centre);
		static Layout* createNoHeaderLayout();
		static Layout* createMainLayout(const char *left, const char *right, bool useKinetic = false);
		static Layout* createMainLayout(const char *left, const char *right, const char *centre, bool useKinetic = false);
		static Layout* createImageLayout(const char *left, bool useKinetic = false);
		static Layout* createImageLayout(const char *left, const char *right, const char *centre, bool useKinetic = false);
		static void updateSoftKeyLayout(const char *left, const char *right, const char *centre, Layout *mainLayout);
		//static char* getData(const char* storefile);
		static bool getData(const char *name, String &data);
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
		static bool validateNoWhiteSpaces(String val);
		static int getSoftKeyBarHeight();
		static int getMaxImageHeight();
		static int getMaxImageWidth();
		static int getAppHeight();
		static String base64_encode(unsigned char const* bytes_to_encode, unsigned int in_len);
		static String base64_decode(String encoded_string);
		static inline bool is_base64(unsigned char c);
		static const wchar* getWCharArrayFromBuf(void* buffer, const int arrayIndex);
		static int findIgnoreCase(String mainString, String searchString);

		static Font* getFontBlue();
		static Font* getFontBlack();
		static Font* getFontWhite();
		static Font* getFontRed();
		static Font* getFontGreen();
		static Font* getFontGrey();
		static Font* getDefaultFont();
		static Font* getDefaultSelected();
		static Font* Util::getButtonFont();
		static WidgetSkin* getSkinEditBox();
		static WidgetSkin* getSkinButton();
		static void setCaption(Label *label);
		static WidgetSkin* getSkinBack();
		static WidgetSkin* getSkinHeader();
		static WidgetSkin* getSkinList();
		static WidgetSkin* getSkinListNoArrows();
		static WidgetSkin* getSkinText();
		static WidgetSkin* getSkinAlbum();
		static WidgetSkin* getSkinDropDownItem();
		static WidgetSkin* getSkinDropDownBox();
		static WidgetSkin* getSkinDropDownBack();
		static WidgetSkin* getSkinPopupHeader();
		static WidgetSkin* getIconListBack();
		static WidgetSkin* getIconSelect();


	private:

};

extern int scrWidth;
extern int scrHeight;
extern bool portrait;
extern MainScreen *orig;
extern MainScreen *origAlbum;
extern MainScreen *origMenu;

#endif	//_UTIL_H_
