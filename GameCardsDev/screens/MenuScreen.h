#ifndef _MENUSCREEN_H_
#define _MENUSCREEN_H_

#include "GameCardScreen.h"

class MenuScreen : public GameCardScreen, public WidgetListener {
public:
	MenuScreen(Feed *feed);
	~MenuScreen();

	void keyPressEvent(int keyCode);
	void refresh();
private:
	void selectionChanged(Widget *widget, bool selected);

	void show();
	void hide();
	void clearListBox();

	Screen *menu;
	Label *noteLabel;
	String parentTag, notedate;
	int c, versionChecked, first;
	bool shown;

	void mtxTagData(const char*, int);
	void mtxTagStart(const char*, int);
	void mtxParseError(int);
};

#endif
