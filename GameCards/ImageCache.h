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
