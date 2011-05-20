#include <MAUtil/Graphics.h>

#include "../../utils/MAHeaders.h"
#include "MobImage.h"

MobImage::MobImage(int x, int y, int width, int height,
		Widget* parent, bool autosizeX, bool autosizeY, MAHandle res)
	: Image(x, y, width, height, parent, autosizeX, autosizeY, res) {
	hasNote = false;
}

MobImage::~MobImage() {

}

void MobImage::setHasNote(bool n) {
	hasNote = n;
}

void MobImage::drawRectangle(int x, int y, int width, int height){
	Gfx_line(x, y, x+width, y);
	Gfx_line(x, y, x, y+height);
	Gfx_line(x+width, y, x+width, y+height);
	Gfx_line(x, y+height, x+width, y+height);
}

bool MobImage::statContains(int x, int y, int width, int height, int pointX, int pointY){
	Rect * r = new Rect((x*this->getWidth()/250),(y*this->getHeight()/350),width*this->getWidth()/250,height*this->getHeight()/350);
	return r->contains(pointX, pointY);
}

void MobImage::selectStat(int x, int y, int width, int height, int red, int green, int blue){
	Gfx_setColor(red,green,blue);
	Gfx_clearMatrix();
	//drawRectangle((x*this->getWidth()/250),(y*this->getHeight()/350),width*this->getWidth()/250,height*this->getHeight()/350);
	drawRectangle((5 + (paddedBounds.width >> 1) - (imageWidth >> 1))+(x*imageWidth/250),((paddedBounds.height >> 1) - (imageHeight >> 1))+(y*imageHeight/350),width*imageWidth/250,height*imageHeight/350);
	Gfx_updateScreen();
}

void MobImage::refreshWidget() {
	if (resource) {
		Gfx_drawImage(resource, 5 + (paddedBounds.width >> 1) - (imageWidth >> 1),
			(paddedBounds.height >> 1) - (imageHeight >> 1));
		if (hasNote) {
			Gfx_drawImage(RES_NOTE, 5 + (paddedBounds.width >> 1) - (imageWidth >> 1),
				(paddedBounds.height >> 1) - (imageHeight >> 1));
		}
	}
}

void MobImage::drawWidget() {
	if (resource) {
		Gfx_drawImage(resource, (paddedBounds.width >> 1) - (imageWidth >> 1),
			(paddedBounds.height >> 1) - (imageHeight >> 1));
		if (hasNote) {
			Gfx_drawImage(RES_NOTE, (paddedBounds.width >> 1) - (imageWidth >> 1),
				(paddedBounds.height >> 1) - (imageHeight >> 1));
		}
	}
}
