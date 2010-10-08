#ifndef IMAGECACHE_H_
#define IMAGECACHE_H_

#include "ImageCacheRequest.h"

class ImageCache
{
  public:
    ImageCache();
    ~ImageCache();

    void process();
    void request(ImageCacheRequest* req);

  private:
    int mCount;
    ImageCacheRequest *mNextRequest;
};
#endif /* IMAGECACHE_H_ */
