#include "ImageCache.h"

ImageCache::ImageCache(){}

ImageCache::~ImageCache(){}

void ImageCache::request(ImageCacheRequest* req)
{
	//Add the request to the queue
	mNextRequest = req;

	//Process the queue
	mCount++;
	process();
}

void ImageCache::decrease() {
	mCount--;
}

void ImageCache::process()
{
	if(mCount >= 6) {
		maWait(1000);
	}
    mNextRequest->runHttp();
}


