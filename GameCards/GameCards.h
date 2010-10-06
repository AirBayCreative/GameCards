#ifndef _MOBILEGAMECARDS_H_
#define _MOBILEGAMECARDS_H_

#include <ma.h>
#include "Header.h"
#include "MAHeaders.h"
#include "Feed.h"
#include "MAUI.h"
#include <MAUtil/Moblet.h>

using namespace MAUI;
using namespace MAUtil;

class MAUIMoblet : public Moblet  {
	public:
		MAUIMoblet();
		~MAUIMoblet();
		void keyPressEvent(int keyCode);
		void keyReleaseEvent(int keyCode);
		void closeEvent();

		Screen *login;
		Screen *exit;
		Screen *mainScreen;
		Screen *main;
		Screen *next;
		Feed feed;
};

#endif /* _MOBILEGAMECARDS_H_ */
