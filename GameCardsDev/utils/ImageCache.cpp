#include <mavsprintf.h>
#include <MAUI/Image.h>
#include <conprint.h>
#include <mastdlib.h>

#include "Util.h"
#include "ImageCache.h"
#include "../MAHeaders.h"

ImageCache::ImageCache() : mHttp(this)
{
	mIsBusy = false;
	mData = NULL;
	destroyed = false;
}

ImageCache::~ImageCache()
{
	memset(mBuffer, 0, READSIZE);
	clearImageCache();
	//maDestroyObject(mData);
	mData = NULL;
	destroyed = true;
}

void ImageCache::request(ImageCacheRequest* req)
{
	lprintfln("ImageCache::request added for %s", req->getUrl().c_str());
	//Add the request to the queue
	mRequests.add(req);
	//Process the queue
	process();
}

void ImageCache::process(bool afterFin)
{
	lprintfln("process mIsBusy %d", mIsBusy);
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

    lprintfln("mNextRequest url %s", mNextRequest->getUrl().c_str());

    mHttp = HttpConnection(this);
	int res = mHttp.create(mNextRequest->getUrl().c_str(), HTTP_GET);
	lprintfln("connection created %d", res);
	if(res < 0) {
		finishedDownloading();
	} else {
		mHttp.finish();
		lprintfln("do connection NOW");
	}
}

void ImageCache::finishedDownloading()
{
	if (mData != NULL) {
		//Save to storage
		if ((mNextRequest != NULL)&&(!destroyed)) {
			Util::saveFile((mNextRequest->getSaveName()).c_str(), mData);
			Util::returnImage(mNextRequest->getImage(), mData, mNextRequest->getHeight());
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
		if ((mRequests.size() > 0)&&(!destroyed))
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

	lprintfln("httpFinished result %d", result);
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

		if(mContentLength >= READSIZE || mContentLength == 0) {
			mHttp.recv(mBuffer, READSIZE);
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
		double val = (double)((double)mDataOffset/(double)mContentLength)*100;

		if (mNextRequest->getImage()->getHeight() < 150) {
			//normal loading
		} else {

			if (val <= 5.5) {
				mNextRequest->getImage()->setResource(RES_LOADING);
			} else if (val <= 11) {
				mNextRequest->getImage()->setResource(RES_LOADING2);
			} else if (val <= 16.5) {
				mNextRequest->getImage()->setResource(RES_LOADING3);
			} else if (val <= 22) {
				mNextRequest->getImage()->setResource(RES_LOADING4);
			} else if (val <= 27.5) {
				mNextRequest->getImage()->setResource(RES_LOADING5);
			} else if (val <= 33) {
				mNextRequest->getImage()->setResource(RES_LOADING6);
			} else if (val <= 38.5) {
				mNextRequest->getImage()->setResource(RES_LOADING7);
			} else if (val <= 44) {
				mNextRequest->getImage()->setResource(RES_LOADING8);
			} else if (val <= 49.5) {
				mNextRequest->getImage()->setResource(RES_LOADING9);
			} else if (val <= 55) {
				mNextRequest->getImage()->setResource(RES_LOADING10);
			} else if (val <= 60.5) {
				mNextRequest->getImage()->setResource(RES_LOADING11);
			} else if (val <= 66) {
				mNextRequest->getImage()->setResource(RES_LOADING12);
			} else if (val <= 71.5) {
				mNextRequest->getImage()->setResource(RES_LOADING13);
			} else if (val <= 77) {
				mNextRequest->getImage()->setResource(RES_LOADING14);
			} else if (val <= 82.5) {
				mNextRequest->getImage()->setResource(RES_LOADING15);
			} else if (val <= 88) {
				mNextRequest->getImage()->setResource(RES_LOADING16);
			} else if (val <= 93.5) {
				mNextRequest->getImage()->setResource(RES_LOADING17);
			} else if (val <= 99) {
				mNextRequest->getImage()->setResource(RES_LOADING18);
			}
			mNextRequest->getImage()->requestRepaint();
		}

		if((mContentLength - mDataOffset)>=0)
		{
			maWriteData(mData, mBuffer, mDataOffset-result, result);
			mHttp.recv(mBuffer, READSIZE);
		}
	} else if(result == CONNERR_CLOSED) {
		mContentLength = 0;
		finishedDownloading();
		mIsBusy = false;
	} else {
		mIsBusy = false;
	}
}
