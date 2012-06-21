#ifndef _MAINSCREEN_H_
#define _MAINSCREEN_H_
#include <conprint.h>
#include <MAUI/Screen.h>
#include <MAUI/ListBox.h>
#include <MAUI/Image.h>

#include "../utils/XmlConnection.h"
#include "../UI/KineticListBox.h"
#include "../UI/MenuScreen/MenuScreen.h"
#include "../utils/Albums.h"
#include "../utils/Feed.h"

using namespace MAUI;

class MainScreen : public Screen  {
public:
	MainScreen() {
		lprintfln("MainScreen::MainScreen");
		next = NULL;
		previous = NULL;
		album = NULL;
		Screen();
	}
	~MainScreen() {
		next = NULL;
		previous = NULL;
		album = NULL;
	}
	virtual void pop();
	virtual void refresh();
	virtual void refresh(bool pop);
	virtual void show();

	MainScreen *previous, *next;
	XmlConnection xmlConn;

	Layout *mainLayout;
	KineticListBox *kinListBox;
	ListBox *listBox;

	Feed *feed;
	Albums *album;

	Label *notice, *label;
};

#endif	//_MAINSCREEN_H_

