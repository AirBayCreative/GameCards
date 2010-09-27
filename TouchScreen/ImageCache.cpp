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
	process();
}

void ImageCache::httpFinished(MAUtil::HttpConnection* http, int result) {
	MAUtil::String contentLengthStr;
	int responseBytes = mHttp.getResponseHeader("content-length", &contentLengthStr);
	mContentLength = 0;
	mDataOffset = 0;
	mData = maCreatePlaceholder();
	if(responseBytes == CONNERR_NOHEADER) {

	} else {
		mContentLength = atoi(contentLengthStr.c_str());
	}
	if (maCreateData(mData, mContentLength) == RES_OK) {}

	if(mContentLength >= 1024 || mContentLength == 0) {
		mHttp.recv(mBuffer, 1024);
	} else {
		mBuffer[mContentLength] = 0;
		mHttp.read(mBuffer, mContentLength);
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
		finishedDownloading();
		mHttp.close();
		mIsBusy = false;
	} else {
		mIsBusy = false;
	}
}
