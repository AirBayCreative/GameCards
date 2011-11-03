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
	//Add the request to the queue
	Map<String,String>::Iterator i = mRequestsUrl.find(req->getUrl());
	if(i == mRequestsUrl.end()) {
		mRequestsUrl.insert(req->getUrl(), req->getUrl());
		mRequests.add(req);
		//Process the queue
		process();
	} else if (req->getType() == 0) {
		req->setType(5);
		mRequests.add(req);
	}
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

    if (mNextRequest->getType() == 5) {
		MAHandle store = maOpenStore((FILE_PREFIX+mNextRequest->getSaveName()).c_str(), 0);
		if(store != STERR_NONEXISTENT) {
			MAHandle cacheimage = maCreatePlaceholder();
			maReadStore(store, cacheimage);
			maCloseStore(store, 0);

			if (maGetDataSize(cacheimage) > 0) {
				Util::returnImage(mNextRequest->getImage(), cacheimage, 64);
			}
			maDestroyObject(cacheimage);
			cacheimage = -1;
		}
		store = -1;
		finishedDownloading();
    } else {
		mHttp = HttpConnection(this);
		int res = mHttp.create(mNextRequest->getUrl().c_str(), HTTP_GET);
		if(res < 0) {
			finishedDownloading();
		} else {
			mHttp.finish();
		}
    }
}

void ImageCache::finishedDownloading()
{
	if (mData != NULL) {
		if ((mNextRequest != NULL)&&(!destroyed)) {
			Util::saveFile((mNextRequest->getSaveName()).c_str(), mData);
			if (mNextRequest->getImage() != NULL) {
				Util::returnImage(mNextRequest->getImage(), mData, mNextRequest->getHeight());
			}
		}
	} else if (mNextRequest != NULL){
		if (mNextRequest->getImage() != NULL) {
			if (mNextRequest->getType() == 0) {
				if (mNextRequest->getImage()->getResource() != NULL) {
					maDestroyObject(mNextRequest->getImage()->getResource());
				}
				mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_TEMPTHUMB));
			} else if ((mNextRequest->getType() == 1) || (mNextRequest->getType() == 2)) {
				if (mNextRequest->getImage()->getResource() != NULL) {
					maDestroyObject(mNextRequest->getImage()->getResource());
				}
				mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_TEMP));
			} else if ((mNextRequest->getType() == 3) || (mNextRequest->getType() == 4)) {
				if (mNextRequest->getImage()->getResource() != NULL) {
					maDestroyObject(mNextRequest->getImage()->getResource());
				}
				mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_EMPTY_FLIP));
			}
			mNextRequest->getImage()->requestRepaint();
		}
	} else {
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
	if (mData != NULL) {
		maDestroyObject(mData);
		mData = NULL;
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
	mRequestsUrl.clear();
	mRequestsUrl = NULL;
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

		if (mNextRequest->getImage() != NULL) {
			if (mNextRequest->getType() == 0) {
				//normal loading
			} else if ((mNextRequest->getType() == 3)||(mNextRequest->getType() == 4)) {
				if (val <= 5.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP1));
				} else if (val <= 11) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP2));
				} else if (val <= 16.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP3));
				} else if (val <= 22) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP4));
				} else if (val <= 27.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP5));
				} else if (val <= 33) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP6));
				} else if (val <= 38.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP7));
				} else if (val <= 44) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP8));
				} else if (val <= 49.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP9));
				} else if (val <= 55) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP10));
				} else if (val <= 60.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP11));
				} else if (val <= 66) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP12));
				} else if (val <= 71.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP13));
				} else if (val <= 77) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP14));
				} else if (val <= 82.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP15));
				} else if (val <= 88) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP16));
				} else if (val <= 93.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP17));
				} else if (val <= 99) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING_FLIP18));
				}
				mNextRequest->getImage()->requestRepaint();
			} else if ((mNextRequest->getType() == 1)||(mNextRequest->getType() == 2)) {
				if (val <= 5.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING1));
				} else if (val <= 11) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING2));
				} else if (val <= 16.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING3));
				} else if (val <= 22) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING4));
				} else if (val <= 27.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING5));
				} else if (val <= 33) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING6));
				} else if (val <= 38.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING7));
				} else if (val <= 44) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING8));
				} else if (val <= 49.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING9));
				} else if (val <= 55) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING10));
				} else if (val <= 60.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING11));
				} else if (val <= 66) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING12));
				} else if (val <= 71.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING13));
				} else if (val <= 77) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING14));
				} else if (val <= 82.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING15));
				} else if (val <= 88) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING16));
				} else if (val <= 93.5) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING17));
				} else if (val <= 99) {
					maDestroyObject(mNextRequest->getImage()->getResource());
					mNextRequest->getImage()->setResource(Util::loadImageFromResource(RES_LOADING18));
				}
				mNextRequest->getImage()->requestRepaint();
			}
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
