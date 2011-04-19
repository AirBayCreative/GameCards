#include <conprint.h>

#include "ImageCacheRequest.h"

ImageCacheRequest::ImageCacheRequest(MobImage *img, Card *card, int height, int type) : img(img), card(card), height(height), type(type) {
	product = NULL;
}

ImageCacheRequest::ImageCacheRequest(MobImage *img, Product *product, int height, int type) : img(img), product(product), height(height), type(type) {
	card = NULL;
}

ImageCacheRequest::~ImageCacheRequest() {}

String ImageCacheRequest::getUrl()
{
	switch (type) {
			case 0:
				if (card != NULL) {
					return card->getThumb();
				}
				else {
					return product->getThumb();
				}
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
				if (card != NULL) {
					card->setThumb((card->getId()+".sav").c_str());
					return (card->getId()+".sav");
				}
				else {
					product->setThumb(("prod_"+product->getId()+".sav").c_str());
					return (product->getThumb());
				}
			case 1:
				card->setFront((card->getId()+"f.sav").c_str());
				return (card->getId()+"f.sav");
			case 2:
				card->setBack((card->getId()+"b.sav").c_str());
				return (card->getId()+"b.sav");
		}
  return "";
}

MobImage* ImageCacheRequest::getImage()
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
