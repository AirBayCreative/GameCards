#ifndef IMAGECACHEREQUEST_H_
#define IMAGECACHEREQUEST_H_

#include <MAUtil/String.h>
#include <ma.h>
#include <MAUI/Image.h>

#include "../UI/Widgets/MobImage.h"
#include "Card.h"

using namespace MAUtil;
using namespace MAUI;

class ImageCacheRequest
{
  public:
    ImageCacheRequest();
    ImageCacheRequest(MobImage *img, Card *card, int height, int type);
    ~ImageCacheRequest();

    String getUrl();
    String getSaveName();
    MobImage* getImage();
    int getHeight();
    int getType();
    void setType(int type);

  private:
    Card *card;
    MobImage *img;
	int height, type;
};



#endif /* IMAGECACHEREQUEST_H_ */
