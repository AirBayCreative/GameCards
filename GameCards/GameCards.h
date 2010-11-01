#ifndef _MOBILEGAMECARDS_H_
#define _MOBILEGAMECARDS_H_

#include <MAUtil/Moblet.h>
#include <MAUI/Screen.h>

#include "utils/Feed.h"

using namespace MAUI;
using namespace MAUtil;

class MAUIMoblet : public Moblet  {
	public:
		MAUIMoblet();
		~MAUIMoblet();
		void keyPressEvent(int keyCode);
		void keyReleaseEvent(int keyCode);
		//void customEvent(const MAEvent&);
		void closeEvent();
		Feed feed;
		Screen *next;
};

#endif /* _MOBILEGAMECARDS_H_ */
