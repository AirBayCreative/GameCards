#include "XmlConnection.h"
#include <conprint.h>
#include <mastdlib.h>

XmlConnection::XmlConnection(){
}

void XmlConnection::parse(MAUtil::Connection* conn, XCListener* xc, Mtx::XmlListener* xml) {
    mConn = conn;
    mXc = xc;
    mContext.init(this, xml);
    mConn->setListener(this);

    mPtr = mBuffer;
    mConn->recv(mBuffer, sizeof(mBuffer)-1);
}
XmlConnection::~XmlConnection() {}

void XmlConnection::connRecvFinished(MAUtil::Connection* conn, int result) {
    MAASSERT(conn == mConn);
    if(result < 0) {
        mXc->xcConnError(result);
        return;
    }
    //lprintfln("----");
    //lprintfln(mBuffer);

    mPtr[result] = 0;
    mPtr = mBuffer;
   	mContext.feed(mBuffer);
   	mConn->recv(mPtr, sizeof(mBuffer) - 1 - (mPtr - mBuffer));
}

void XmlConnection::connReadFinished(){

}

void XmlConnection::mtxDataRemains(const char* data, int len) {
    if(mBuffer != data) {
        memcpy(mBuffer, data, len);
    }
    mPtr = mBuffer + len;
}

int XmlConnection::process(char* data) {
	return mContext.process(data);
}
