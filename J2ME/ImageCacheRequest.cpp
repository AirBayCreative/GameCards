/* Copyright (C) 2010 MoSync AB

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License, version 2, as published by
the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with this program; see the file COPYING.  If not, write to the Free
Software Foundation, 59 Temple Place - Suite 330, Boston, MA
02111-1307, USA.
*/

#include "ImageCacheRequest.h"
#include <conprint.h>

ImageCacheRequest::ImageCacheRequest(Image *img, Card *card, int height, int type) : img(img), card(card), height(height), type(type) {}

ImageCacheRequest::~ImageCacheRequest() {}

String ImageCacheRequest::getUrl()
{
	switch (type) {
			case 0:
				return card->getThumb();
			case 1:
				return card->getFront();
			case 2:
				return card->getBack();
		}
  return "";
}

String ImageCacheRequest::getSaveName()
{
	switch (type) {
			case 0:
				card->setThumb((card->getId()+".sav").c_str());
				return (card->getId()+".sav");
			case 1:
				card->setFront((card->getId()+"f.sav").c_str());
				return (card->getId()+"f.sav");
			case 2:
				card->setBack((card->getId()+"b.sav").c_str());
				return (card->getId()+"b.sav");
		}
  return "";
}

Image* ImageCacheRequest::getImage()
{
	return img;
}

int ImageCacheRequest::getHeight()
{
	return height;
}

int ImageCacheRequest::getType()
{
	return type;
}
