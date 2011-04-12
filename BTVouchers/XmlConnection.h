#ifndef XMLCONNECTION_H
#define XMLCONNECTION_H

#include <MAUtil/Connection.h>
#include <MTXml/MTXml.h>
#include <MAUI/Label.h>

class XCListener {
public:
    virtual void xcConnError(int code) = 0;
};

class XmlConnection : private MAUtil::ConnectionListener, Mtx::MtxListener {
public:
	XmlConnection();
	~XmlConnection();
    void parse(MAUtil::Connection* conn, XCListener* xc, Mtx::XmlListener* xml, MAUI::Label *lbl=NULL);
    int process(char* data);

private:
    Mtx::Context mContext;
    MAUtil::Connection* mConn;
    XCListener* mXc;
    char mBuffer[2048];
    char* mPtr;
    MAUI::Label *label;

    void mtxDataRemains(const char* data, int len);
    void connRecvFinished(MAUtil::Connection* conn, int result);
    void connWriteFinished(MAUtil::Connection* conn, int result);
};

#endif  //XMLCONNECTION_H
