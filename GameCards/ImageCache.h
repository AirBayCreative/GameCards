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

#ifndef IMAGECACHE_H_
#define IMAGECACHE_H_

#include "ImageCacheRequest.h"
#include <MAUtil/Downloader.h>
#include <MAUtil/Map.h>

using namespace MAUtil;

class ImageCache : public HttpConnectionListener
{
  public:
    ImageCache();
    ~ImageCache();

    void process();
    void request(ImageCacheRequest* req);
    void httpFinished(MAUtil::HttpConnection*, int);
    void connRecvFinished(MAUtil::Connection* conn, int result);
    void finishedDownloading();

  private:
    Vector<ImageCacheRequest*>  mRequests;
    HttpConnection mHttp;
    bool mIsBusy;
    char mBuffer[1024];
	MAHandle mData;
	int mDataOffset;
	int mContentLength;

    ImageCacheRequest *mNextRequest;
};
#endif /* IMAGECACHE_H_ */
