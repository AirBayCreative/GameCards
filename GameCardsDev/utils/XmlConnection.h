#ifndef XMLCONNECTION_H
#define XMLCONNECTION_H

#include <MAUtil/Connection.h>
#include <MTXml/MTXml.h>

class XCListener {
public:
    // Called when there is a connection error. Parsing stops.
    virtual void xcConnError(int code) = 0;
};

class XmlConnection : private MAUtil::ConnectionListener, Mtx::MtxListener {
public:
    // Inits an Mtx::Context, sets itself as ConnectionListener,
    // starts recieving data, which is passed on to the XML parser.
    // Callbacks from the parser are passed on to the XmlListener.
	XmlConnection();
	~XmlConnection();

	void stop();

    // The connection must be ready to recieve data, which means that either
    // MAUtil::Connection::connect() or MAUtil::HttpConnection::finish()
    // must have completed successfully.
    void parse(MAUtil::Connection* conn, XCListener* xc, Mtx::XmlListener* xml);

    // see mtxProcess().
    int process(char* data);

private:
    Mtx::Context mContext;
    MAUtil::Connection* mConn;
    XCListener* mXc;
    char mBuffer[1024];
    char* mPtr;

    void mtxDataRemains(const char* data, int len);
    void connRecvFinished(MAUtil::Connection* conn, int result);
    void connReadFinished();
};

#endif  //XMLCONNECTION_H
