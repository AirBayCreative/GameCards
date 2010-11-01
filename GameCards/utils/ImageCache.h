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

    void process(bool afterFin=false);
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
