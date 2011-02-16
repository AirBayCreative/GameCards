#ifndef XMLCONNECTION_H
#define XMLCONNECTION_H

#include <MAUtil/Connection.h>
#include <MTXml/MTXml.h>

class XCListener {
public:
    virtual void xcConnError(int code) = 0;
};

class XmlConnection : private MAUtil::ConnectionListener, Mtx::MtxListener {
public:
	XmlConnection();
	~XmlConnection();
    void parse(MAUtil::Connection* conn, XCListener* xc, Mtx::XmlListener* xml);
    int process(char* data);

private:
    Mtx::Context mContext;
    MAUtil::Connection* mConn;
    XCListener* mXc;
    char mBuffer[2048];
    char* mPtr;

    void mtxDataRemains(const char* data, int len);
    void connRecvFinished(MAUtil::Connection* conn, int result);
};

#endif  //XMLCONNECTION_H
