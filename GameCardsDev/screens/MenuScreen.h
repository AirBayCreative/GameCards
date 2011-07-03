#ifndef _MENUSCREEN_H_
#define _MENUSCREEN_H_

#include "GameCardScreen.h"

class MenuScreen : public GameCardScreen, public WidgetListener {
public:
	MenuScreen(Feed *feed);
	~MenuScreen();

	void keyPressEvent(int keyCode);
private:
	void selectionChanged(Widget *widget, bool selected);

	void show();
	void hide();
	void clearListBox();

	Screen *menu;
	int c;

	void mtxTagData(const char*, int);
};

#endif
