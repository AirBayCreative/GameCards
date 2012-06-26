#ifndef _SHOPPRODUCTSSCREEN_H_
#define _SHOPPRODUCTSSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../utils/Product.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"
#include "../UI/Widgets/MobImage.h"
#include "MainScreen.h"

using namespace MAUI;
using namespace MAUtil;

class ShopProductsScreen : public MainScreen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	ShopProductsScreen(MainScreen *previous, Feed *feed, String category, bool free, bool first=false);
	~ShopProductsScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void drawList();
	void pop();
	void refresh();
	void clearListBox();

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	typedef Vector<Product*> ProductVector;
private:
	Widget* currentSelectedKey;
	ImageCache *mImageCache;
	MobImage *tempImage;
	HttpConnection mHttp;

	String parentTag,cardText;
	String id,productType,productName,price,thumb,cardsInPack,category,cred,prem,productprem;
	int i, moved, currentKeyPosition;
	bool list,left,right,emp,free,credits,first;

	ProductVector products;
	Product *product;

	void httpFinished(MAUtil::HttpConnection*, int);
	void connReadFinished(Connection*, int);
	void xcConnError(int code);
	void mtxEncoding(const char*);
	void mtxTagStart(const char*, int);
	void mtxTagAttr(const char*, const char*);
	void mtxTagData(const char*, int);
	void mtxTagEnd(const char*, int);
	void mtxParseError(int);
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();

	void clearProductsList();
};

#endif	//_SHOPPRODUCTSCREEN_H_*/
