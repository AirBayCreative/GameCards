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

void MobImage::drawWidget() {
	if (resource) {
		Gfx_drawImage(resource, (paddedBounds.width >> 1) - (imageWidth >> 1),
			(paddedBounds.height >> 1) - (imageHeight >> 1));
		if (hasNote) {
			Gfx_drawImage(RES_CHANGE_STAR, (paddedBounds.width >> 1) - (imageWidth >> 1),
				(paddedBounds.height >> 1) - (imageHeight >> 1));
		}
	}
}
