#ifndef _MENUSCREEN_H_
#define _MENUSCREEN_H_

#include "GameCardScreen.h"

class MenuScreen : public GameCardScreen, public WidgetListener {
public:
	MenuScreen(Feed *feed);
	~MenuScreen();

	void keyPressEvent(int keyCode);
private:
	Screen *menu;
	int c;

	void mtxTagData(const char*, int);
};

#endif
