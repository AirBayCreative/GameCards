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

class ImageCache : public DownloadListener
{
  public:
    ImageCache();
    ~ImageCache();

    void request(ImageCacheRequest* req);
    void finishedDownloading(Downloader* downloader, MAHandle data);
    void downloadCancelled(Downloader* downloader);
    void error(Downloader* downloader, int errorCode);
    void notifyProgress(Downloader* downloader, int downloadedBytes, int totalBytes);

  private:
    Vector<ImageCacheRequest*>  mRequests;
    Downloader* mDownloader;
    bool mIsBusy;

    void process();

    ImageCacheRequest *mNextRequest;
};
#endif /* IMAGECACHE_H_ */
