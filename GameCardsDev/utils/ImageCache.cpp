#include <mavsprintf.h>
#include <MAUI/Image.h>
#include <conprint.h>
#include <mastdlib.h>

#include "Util.h"
#include "ImageCache.h"
#include "MAHeaders.h"

ImageCache::ImageCache() : mHttp(this)
{
	mIsBusy = false;
	mData = NULL;
}

ImageCache::~ImageCache()
{
	memset(mBuffer, 0, 1024);
	clearImageCache();
}

void ImageCache::request(ImageCacheRequest* req)
{
	//Add the request to the queue
	mRequests.add(req);
	//Process the queue
	process();
}

void ImageCache::process(bool afterFin)
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
    if(mHttp.isOpen()){
    	mHttp.close();
    }
    mHttp = HttpConnection(this);
	int res = mHttp.create(mNextRequest->getUrl().c_str(), HTTP_GET);
	lprintfln("downloadurl %s", mNextRequest->getUrl().c_str());
	if(res < 0) {
		//lprintfln("Error creating http connection in ImageCache.\nres = %d", res);
	} else {
		mHttp.finish();
	}
}

void ImageCache::finishedDownloading()
{
	if (mData != NULL) {
		//Save to storage
		if (mNextRequest != NULL) {
			saveFile((mNextRequest->getSaveName()).c_str(), mData);
			returnImage(mNextRequest->getImage(), mData, mNextRequest->getHeight());
		}
		maDestroyObject(mData);
		mData = NULL;
	}
	else if (mNextRequest != NULL){
		if (mNextRequest->getImage()->getHeight() < 150) {
			mNextRequest->getImage()->setResource(RES_TEMPTHUMB);
		}
		else {
			mNextRequest->getImage()->setResource(RES_TEMP);
		}
		//mNextRequest->getImage()->update();
		mNextRequest->getImage()->requestRepaint();
	}
	else {
		mIsBusy = false;
		if (mRequests.size() > 0)
			process(true);
		return;
	}

	if (mNextRequest != NULL) {
		delete mNextRequest;
		mNextRequest = NULL;
	}
	if (mRequests.size() > 0) {
		mRequests.remove(0);
	}
	mIsBusy = false;
	process(true);
}

void ImageCache::clearImageCache() {
	for (int i = 0; i < mRequests.size(); i++) {
		if(mRequests[i]!=NULL){
			delete mRequests[i];
			mRequests[i] == NULL;
		}
	}
	mNextRequest = NULL;
	mRequests.clear();

	mIsBusy = false;
}

void ImageCache::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		MAUtil::String *contentLengthStr = new MAUtil::String("-1");
		int responseBytes = mHttp.getResponseHeader("content-length", contentLengthStr);
		mContentLength = 0;
		mDataOffset = 0;
		mData = maCreatePlaceholder();
		if(responseBytes == CONNERR_NOHEADER) {

		} else {
			mContentLength = atoi(contentLengthStr->c_str());
		}
		delete contentLengthStr;
		if (maCreateData(mData, mContentLength) == RES_OK){

		}

		if(mContentLength >= 1024 || mContentLength == 0) {
			mHttp.recv(mBuffer, 1024);
		} else {
			mBuffer[mContentLength] = 0;
			mHttp.recv(mBuffer, mContentLength);
		}
	}
	else {
		finishedDownloading();
	}
}

void ImageCache::connectFinished() {
}

void ImageCache::connRecvFinished(MAUtil::Connection* conn, int result) {
	if (result >= 0) {
		mDataOffset += result;

		if((mContentLength - mDataOffset)>=0)
		{
			maWriteData(mData, mBuffer, mDataOffset-result, result);
			mHttp.recv(mBuffer, 1024);
		}
	} else if(result == CONNERR_CLOSED) {
		mContentLength = 0;
		finishedDownloading();
		//mHttp.close();
		mIsBusy = false;
	} else {
		mIsBusy = false;
	}
}
