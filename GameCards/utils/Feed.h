#ifndef _FEED_H_
#define _FEED_H_

#include "Albums.h"

using namespace MAUtil;

class Feed  {
public:
	void setEncrypt(const char*);
	void setUsername(const char*);
	void setCredits(const char*);
	void setEmail(const char*);
	void setHandle(const char*);
	void setID(const char*);
	void setUnsuccessful(const char*);
	void setReplaceWhiteSpaces(const char*);
	void setReplaceSpecialCharacters(const char*);
	void setAll(const char*);
	void setLoaded(bool load);
	void setAlbum(const char*);
	bool setTouch(const char* touch);
	bool setTouchEnabled(bool touch);
	Albums* getAlbum();
	String getAlbumString();
	String getEncrypt();
	String getUsername();
	String getCredits();
	String getEmail();
	String getHandle();
	String getID();
	String getUnsuccessful();
	String getReplaceWhiteSpaces();
	String getReplaceSpecialCharacters();
	String getAll();
	Vector<String> getAlbumNames();
	bool getTouchEnabled();
	String getTouch();
	bool getLoaded();
private:
	String encrypt;
	String uname;
	String noSuccess;
	String whiteSpace;
	String specialCharacters;
	String credits;
	String email;
	String handle;
	String touch;
	Albums *album;
	Albums real_album;
	bool touchEnabled;
	bool loaded;
};

#endif	//_FEED_H_
