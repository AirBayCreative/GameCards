#include "XmlConnection.h"
#include "snprintf.h"
#include <conprint.h>
#include <mastdlib.h>

XmlConnection::XmlConnection() : mConn(NULL) {}

void XmlConnection::parse(MAUtil::Connection* conn, XCListener* xc, Mtx::XmlListener* xml) {
    mConn = conn;
    mXc = xc;
    mContext.init(this, xml);
    mConn->setListener(this);

    mPtr = mBuffer;
    mConn->recv(mBuffer, sizeof(mBuffer)-1);
}
XmlConnection::~XmlConnection() {

}

void XmlConnection::connRecvFinished(MAUtil::Connection* conn, int result) {
    MAASSERT(conn == mConn);
    if(result < 0) {
        mXc->xcConnError(result);
        return;
    }

    mPtr[result] = 0;
    mPtr = mBuffer;

    /*lprintfln("%s", mBuffer);*/

    bool stopped = mContext.feed(mBuffer);
	if(!stopped) {
		mConn->recv(mPtr, sizeof(mBuffer) - 1 - (mPtr - mBuffer));
	}
}

void XmlConnection::connReadFinished() {

}

void XmlConnection::mtxDataRemains(const char* data, int len) {
    if(mBuffer != data) {
        memcpy(mBuffer, data, len);
    }
    mPtr = mBuffer + len;
}

void XmlConnection::stop() {
    if(mConn != NULL)
        mConn->close();
    mContext.stop();
}

int XmlConnection::process(char* data) {
	return mContext.process(data);
}
