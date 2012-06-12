#ifndef _GCMENU_H_
#define _GCMENU_H_

#include <MAUI/Widget.h>
#include <MAUI/ListBox.h>

#include "TransitionImage.h"

using namespace MAUI;

struct item {
	MAHandle icon;
	MAHandle iconSel;
	MAHandle bigImage;
	int key;
};

class GCMenu: public Widget, PointerListener, KeyListener {
public:
	GCMenu(item items[], int numItems, int x, int y, int width, int height,
			bool autosizeX, bool autosizeY, Widget* parent);
	~GCMenu();

	void keyPressEvent(int keyCode);

	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void locateItem(MAPoint2d point);

	void selectNext();
	void selectPrevious();
	void select(int i);
	void swipeList(int dir); //-1 to select previous, 1 for next

	int getSelectedKey();
	int getSelectedIndex();

	bool iconListContains(int x, int y);
	bool imageContains(int x, int y);

	void setEnabled(bool e);
private:
	item *items;
	TransitionImage *mainImage;
	Layout *subLayout;
	Image *leftArrow, *rightArrow;

	ListBox *iconList;
	Vector<ListBox*> iconLists;

	ListBox *dotList;

	int moved, numItems, xStart, selectedList, iconsPerList;
	bool emp, enabled;
protected:
   void drawWidget();
};

#endif
