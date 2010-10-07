#include "ImageCacheRequest.h"
#include <mastdlib.h>
#include "Util.h"

ImageCacheRequest::ImageCacheRequest(Image *img, Card *card, int height, int type) : img(img), card(card), height(height), type(type), mHttp(this) {
	mIsBusy = false;
}

ImageCacheRequest::~ImageCacheRequest() {}

void ImageCacheRequest::runHttp(/*ImageCache *cche*/) {
	//cache = cche;
	int res = mHttp.create(getUrl().c_str(), HTTP_GET);
	if(res < 0) {

	} else {
		mHttp.finish();
	}
}

String ImageCacheRequest::getUrl()
{
	switch (type) {
			case 0:
				return card->getThumb();
			case 1:
				return card->getFront();
			case 2:
				return card->getBack();
		}
  return "";
}

void ImageCacheRequest::finishedDownloading()
{
	saveFile((getSaveName()).c_str(), mData);
	returnImage(getImage(), mData, getHeight());
	//cache->decrease();
}
void ImageCacheRequest::httpFinished(MAUtil::HttpConnection* http, int result) {
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

void ImageCacheRequest::connRecvFinished(MAUtil::Connection* conn, int result) {
	if (result >= 0) {
		mDataOffset += result;

		if((mContentLength - mDataOffset)>=0)
		{
			maWriteData(mData, mBuffer, mDataOffset-result, result);
			mHttp.recv(mBuffer, 1024);
		}
	} else if(result == CONNERR_CLOSED) {
		finishedDownloading();
		mHttp.close();
		mIsBusy = false;
	} else {
		mIsBusy = false;
	}
}

String ImageCacheRequest::getSaveName()
{
	switch (type) {
			case 0:
				card->setThumb((card->getId()+".sav").c_str());
				return (card->getId()+".sav");
			case 1:
				card->setFront((card->getId()+"f.sav").c_str());
				return (card->getId()+"f.sav");
			case 2:
				card->setBack((card->getId()+"b.sav").c_str());
				return (card->getId()+"b.sav");
		}
  return "";
}

Image* ImageCacheRequest::getImage()
{
	return img;
}

int ImageCacheRequest::getHeight()
{
	return height;
}

int ImageCacheRequest::getType()
{
	return type;
}
