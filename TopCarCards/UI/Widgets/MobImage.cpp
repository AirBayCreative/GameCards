#include <MAUtil/Graphics.h>
#include <conprint.h>

#include "../../MAHeaders.h"
#include "MobImage.h"

MobImage::MobImage(int x, int y, int width, int height,
		Widget* parent, bool autosizeX, bool autosizeY, MAHandle res)
	: Image(x, y, width, height, parent, autosizeX, autosizeY, res) {
	statAdded = false;
	hasNote = false;
}

MobImage::~MobImage() {
	if (getResource() != NULL) {
		maDestroyObject(getResource());
	}
	resource = NULL;
}

void MobImage::setResource(MAHandle res) {
	if (getResource() != NULL) {
		maDestroyObject(getResource());
	}
	Image::setResource(res);
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

bool MobImage::statContains(int x, int y, int width, int height, int pointX, int pointY, int orientation){
	Rect *r = NULL;
	switch(orientation) {
		case LANDSCAPE:
			r = new Rect((((paddedBounds.width >> 1) + (imageWidth >> 1))-((y*imageWidth/350)+height*imageWidth/350))+3,
					(((paddedBounds.height >> 1) - (imageHeight >> 1))+getPosition().y)+(x*imageHeight/250),
					height*imageWidth/350,
					width*imageHeight/250);
			break;
		case PORTRAIT:
			r = new Rect((x*this->getWidth()/250),(y*this->getHeight()/350),width*this->getWidth()/250,height*this->getHeight()/350);
			break;
	}

	return (r==NULL?false:r->contains(pointX, pointY));
}

void MobImage::selectStat(int x, int y, int width, int height, int red, int green, int blue, int orientation){
	_x = x;
	_y = y;
	_width = width;
	_height = height;
	_red = red;
	_green = green;
	_blue = blue;
	_orientation = orientation;
	statAdded = true;

	Gfx_setColor(red,green,blue);
	//Gfx_clearMatrix();
	//drawRectangle((x*this->getWidth()/250),(y*this->getHeight()/350),width*this->getWidth()/250,height*this->getHeight()/350);
	//code for portrait
	switch(_orientation) {
		case LANDSCAPE:
			drawRectangle((((paddedBounds.width >> 1) + (imageWidth >> 1))-((y*imageWidth/350)+height*imageWidth/350))+3
				,(((paddedBounds.height >> 1) - (imageHeight >> 1))+getPosition().y)+(x*imageHeight/250),
				height*imageWidth/350,
				width*imageHeight/250);
			break;
		case PORTRAIT:
			drawRectangle((5 + (paddedBounds.width >> 1) - (imageWidth >> 1))+(x*imageWidth/250),
				((paddedBounds.height >> 1) - (imageHeight >> 1))+(y*imageHeight/350),
				width*imageWidth/250,height*imageHeight/350);
			break;
	}
	Gfx_updateScreen();
}

void MobImage::refreshWidget() {
	if (resource) {
		Gfx_drawImage(resource, PADDING + (paddedBounds.width >> 1) - (imageWidth >> 1),
			((paddedBounds.height >> 1) - (imageHeight >> 1))+getPosition().y);
		if (hasNote) {
			Gfx_drawImage(RES_CHANGE_STAR, PADDING + (paddedBounds.width >> 1) - (imageWidth >> 1),
				((paddedBounds.height >> 1) - (imageHeight >> 1))+getPosition().y);
		}
	}
}

void MobImage::drawWidget() {
	if (resource) {
		Gfx_drawImage(resource, (paddedBounds.width >> 1) - (imageWidth >> 1),
			(paddedBounds.height >> 1) - (imageHeight >> 1));
		if (hasNote) {
			Gfx_drawImage(RES_CHANGE_STAR, (paddedBounds.width >> 1) - (imageWidth >> 1),
				(paddedBounds.height >> 1) - (imageHeight >> 1));
		}
		if (statAdded) {
			//selectStat(_x - 5,_y,_width,_height,_red,_green,_blue,_orientation);
		}
	}
}
