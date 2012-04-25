/*
 * This screen displays a menu.  It needs a MenuListener to send its selected option to.  You add items
 * to the menu using the addItem() method.
 */

#ifndef MENUSCREEN_H_
#define MENUSCREEN_H_

#include <MAUI/Screen.h>
#include <MAUI/Image.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>

#include "MenuListener.h"
#include "../KineticListBox.h"

using namespace MAUI;

class MenuScreen : public Screen, WidgetListener
{
	public:
		//When you create a menu screen, you must pass the handle to the blank image.
		//Make this quite large (the correct size for the screen if possible).  If you
		//use a 1x1 pixel blank image, then it will have to tile it across the whole background,
		//which even for a small screen will be 240x320 (76800) separate drawing calls, instead of 1
		MenuScreen(MAHandle blankPng,const char *header = "");
		~MenuScreen();

		//An interface to add menu options
		void addItem(const char* text);
		String getItem(int index);
		//Add any widget (e.g. an image) to the menu
		void addItem(Widget* w);

		//The menu listener
		void setListener(MenuListener* listener);

		void keyPressEvent(int keyCode, int nativeCode);
		void selectionChanged(Widget *widget, bool selected);
		void pointerPressEvent(MAPoint2d point);
		void pointerMoveEvent(MAPoint2d point);
		void pointerReleaseEvent(MAPoint2d point);

		//Enum for the positions the menu may be docked
		enum MenuDock
		{
			MD_BOTTOM_LEFT,
			MD_BOTTOM_RIGHT,
			MD_TOP_LEFT,
			MD_TOP_RIGHT,
			MD_CENTER,
			MD_FILL
		};
		//Set the look and feel
		void setMenuSkin(WidgetSkin* skin);
		void setMenuWidth(int width);
		void setMenuFontSel(Font* font);
		void setMenuFontUnsel(Font* font);
		void setMarginX(int margin);
		void setMarginY(int margin);
		void setDock(MenuDock dock);

		void setSelectedIndex(int index);
		int getSelectedIndex();

		void show();
	private:
		Image* mBlank;
		KineticListBox* mOptions;
		MenuListener* mListener;
		int mScreenHeight;
		int mScreenWidth;
		Font *mFontSel, *mFontUnsel;
		WidgetSkin* mSkin;
		MAHandle mBlankImage;
		MenuDock mDock;
		bool mIsDirty;
		int mMarginX;
		int mMarginY;
		int moved;

		Label *header;

		Label* createLabel(const char* text);

		void informListener();

		//Positions and formats the menu
		void update();
};
#endif /* MENUSCREEN_H_ */
