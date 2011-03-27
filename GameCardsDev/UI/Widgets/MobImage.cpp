#include <MAUtil/Graphics.h>

#include "../../utils/MAHeaders.h"
#include "MobImage.h"

MobImage::MobImage(int x, int y, int width, int height,
		Widget* parent, bool autosizeX, bool autosizeY, MAHandle res)
	: Image(x, y, width, height, parent, autosizeX, autosizeY, res) {
	changes = false;
	isNew = false;
}

MobImage::~MobImage() {

}

void MobImage::setChanges(bool c) {
	changes = c;
}

void MobImage::setIsNew(bool i) {
	isNew = i;
}

void MobImage::drawWidget() {
	if (resource) {
		Gfx_drawImage(resource, (paddedBounds.width >> 1) - (imageWidth >> 1),
			(paddedBounds.height >> 1) - (imageHeight >> 1));
		if (changes) {
			Gfx_drawImage(RES_CHANGE_STAR, (paddedBounds.width >> 1) - (imageWidth >> 1),
				(paddedBounds.height >> 1) - (imageHeight >> 1));
		}
		if (isNew) {
			Gfx_drawImage(RES_CHANGE_STAR, paddedBounds.width - 20,
				(paddedBounds.height >> 1) - (imageHeight >> 1));
		}
	}
}
