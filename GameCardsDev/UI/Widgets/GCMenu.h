#ifndef _GCMENU_H_
#define _GCMENU_H_

#include <MAUI/Widget.h>

#include "../KineticListBox.h"
#include "MobImage.h"

using namespace MAUI;

struct item {
	MAHandle icon;
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

	int getSelectedKey();
	int getSelectedIndex();

	bool iconListContains(int x, int y);
	bool imageContains(int x, int y);

	void setEnabled(bool e);
private:
	item *items;
	KineticListBox *iconList;
	MobImage *mainImage;
	Layout *subLayout;

	int moved, numItems, xStart;
	bool emp, enabled;
protected:
   void drawWidget();
};

#endif
