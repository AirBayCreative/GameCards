#include "ImageCache.h"
#include "Util.h"

ImageCache::ImageCache(){}

ImageCache::~ImageCache(){}

void ImageCache::request(ImageCacheRequest* req)
{
	//Add the request to the queue
	mNextRequest = req;

	//Process the queue
	increase();
	process();
}

void ImageCache::process()
{
	while(getCount() >= 6) {
		lprintfln("getCount %d", getCount());
		maWait(1000);
	}
    mNextRequest->runHttp();
}


