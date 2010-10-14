#include "ImageCache.h"
#include <mavsprintf.h>
#include <MAUI/Image.h>
#include "Util.h"
#include <conprint.h>
#include <mastdlib.h>

ImageCache::ImageCache() : mHttp(this)
{
	mIsBusy = false;
}

ImageCache::~ImageCache()
{
}

void ImageCache::request(ImageCacheRequest* req)
{
	//Add the request to the queue
	mRequests.add(req);

	//Process the queue
	process();
}

void ImageCache::process()
{
	//Check to see if the cache can process this request at this time
	if(mIsBusy) return;

	//Check to see if there are any outstanding requests
	if(mRequests.size() == 0)
	return;

	//Set the mIsBusy flag, so we don't try to do too much at once
	mIsBusy = true;

	//Get the next image request from the queue
    mNextRequest = mRequests[0];

    mHttp = HttpConnection(this);
	int res = mHttp.create(mNextRequest->getUrl().c_str(), HTTP_GET);
	if(res < 0) {

	} else {
		mHttp.finish();
	}
}

void ImageCache::finishedDownloading()
{
	//Save to storage
	saveFile((mNextRequest->getSaveName()).c_str(), mData);
	returnImage(mNextRequest->getImage(), mData, mNextRequest->getHeight());

	delete mNextRequest;
	mRequests.remove(0);

	mIsBusy = false;
	maDestroyObject(mData);
	process();
}

void ImageCache::httpFinished(MAUtil::HttpConnection* http, int result) {
	MAUtil::String *contentLengthStr = new MAUtil::String();
	int responseBytes = mHttp.getResponseHeader("content-length", contentLengthStr);
	mContentLength = 0;
	mDataOffset = 0;
	mData = maCreatePlaceholder();
	if(responseBytes == CONNERR_NOHEADER) {

	} else {
		mContentLength = atoi(contentLengthStr->c_str());
	}
	lprintfln("1");
	delete contentLengthStr;
	lprintfln("2");
	if (maCreateData(mData, mContentLength) == RES_OK){

	}

	if(mContentLength >= 1024 || mContentLength == 0) {
		mHttp.recv(mBuffer, 1024);
	} else {
		mBuffer[mContentLength] = 0;
		mHttp.recv(mBuffer, mContentLength);
	}
}

void ImageCache::connRecvFinished(MAUtil::Connection* conn, int result) {
	if (result >= 0) {
		mDataOffset += result;

		if((mContentLength - mDataOffset)>=0)
		{
			maWriteData(mData, mBuffer, mDataOffset-result, result);
			mHttp.recv(mBuffer, 1024);
			//mHttp.recvToData(mData, mDataOffset, mContentLength - mDataOffset);
		}
	} else if(result == CONNERR_CLOSED) {
		mContentLength = 0;
		finishedDownloading();
		mHttp.close();
		mIsBusy = false;
	} else {
		mIsBusy = false;
	}
}
