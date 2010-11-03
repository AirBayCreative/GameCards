#ifndef _SHOPPRODUCTSSCREEN_H_
#define _SHOPPRODUCTSSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Label.h>

#include "../utils/XmlConnection.h"
#include "../utils/Feed.h"
#include "../utils/Product.h"
#include "../utils/ImageCache.h"
#include "../UI/KineticListBox.h"

using namespace MAUI;
using namespace MAUtil;

class ShopProductsScreen : public Screen, WidgetListener, private XCListener, Mtx::XmlListener, private HttpConnectionListener {
public:
	ShopProductsScreen(Screen *previous, Feed *feed, String category);
	~ShopProductsScreen();
	void keyPressEvent(int keyCode);
	void selectionChanged(Widget *widget, bool selected);
	void drawList();

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	typedef Vector<Product> ProductVector;
private:
	Screen *next, *previous;
	ImageCache *mImageCache;
	Image *tempImage;
	Label *notice, *label;
	KineticListBox *listBox;
	Layout *mainLayout;

	HttpConnection mHttp;
	XmlConnection xmlConn;

	String parentTag,cardText;
	String id, description, productName, price, currency, thumb, category;
	int i, moved;
	bool list, left, right, emp;

	Feed *feed;
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
	void mtxParseError();
	void mtxEmptyTagEnd();
	void mtxTagStartEnd();
};

#endif	//_SHOPPRODUCTSCREEN_H_*/
