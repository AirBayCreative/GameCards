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

ImageCache::ImageCache()
{
  mDownloader = new Downloader();
  mDownloader->addDownloadListener(this);
  mIsBusy = false;
}

ImageCache::~ImageCache()
{
  if(mDownloader->isDownloading())
    mDownloader->cancelDownloading();
  delete mDownloader;
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

	//Not in memory, and not in storage
	if(mDownloader->isDownloading())
		return;

	mDownloader->beginDownloading(mNextRequest->getUrl().c_str());
}

void ImageCache::finishedDownloading(Downloader* downloader, MAHandle data)
{
	//Save to storage
	saveFile((mNextRequest->getSaveName()).c_str(), data);
	returnImage(mNextRequest->getImage(), data, mNextRequest->getHeight());

	delete mNextRequest;
	mRequests.remove(0);

	mIsBusy = false;
	process();
}

void ImageCache::notifyProgress(Downloader* downloader, int d, int t)
{
}

void ImageCache::downloadCancelled(Downloader* downloader)
{
}

void ImageCache::error(Downloader* downloader, int errorCode)
{
}
