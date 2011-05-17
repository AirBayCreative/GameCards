#ifndef MOBIMAGE_H_
#define MOBIMAGE_H_

#include <MAUtil/Moblet.h>
#include <MAUI/Widget.h>
#include <MAUI/Image.h>
#include <MAUtil/util.h>

using namespace MAUtil;
using namespace MAUI;

class MobImage: public Image {
public:
	MobImage(int x=0, int y=0, int width=0, int height=0, Widget* parent=NULL,
			bool autosizeX=false, bool autosizeY=false, MAHandle res=NULL);
	~MobImage();

	void setHasNote(bool n);
	void selectStat(int x, int y, int width, int height, int red, int green, int blue);
	bool statContains(int x, int y, int width, int height, int pointX, int pointY);
	void drawRectangle(int x, int y, int width, int height);
	void refreshWidget();
protected:
	virtual void drawWidget();
	bool hasNote;
};

#endif /* MOBIMAGE_H_ */
