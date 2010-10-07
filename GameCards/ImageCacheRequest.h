#ifndef IMAGECACHEREQUEST_H_
#define IMAGECACHEREQUEST_H_

#include <MAUtil/Downloader.h>

#include <MAUI/Image.h>
#include "Card.h"



using namespace MAUtil;
using namespace MAUI;

class ImageCacheRequest : HttpConnectionListener
{
  public:
    ImageCacheRequest();
    ImageCacheRequest(Image *img, Card *card, int height, int type);
    ~ImageCacheRequest();
    void httpFinished(MAUtil::HttpConnection*, int);
    void runHttp(/*ImageCache *cache*/);
	void connRecvFinished(MAUtil::Connection* conn, int result);
	void finishedDownloading();


    String getUrl();
    String getSaveName();
    Image* getImage();
    int getHeight();
    int getType();

  private:
    //ImageCache *cache;
    Card *card;
    Image *img;
	int height, type;
	HttpConnection mHttp;
	bool mIsBusy;
	char mBuffer[1024];
	MAHandle mData;
	int mDataOffset;
	int mContentLength;
};



#endif /* IMAGECACHEREQUEST_H_ */
