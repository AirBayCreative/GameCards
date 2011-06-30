#ifndef _FEED_H_
#define _FEED_H_

#include "Albums.h"

using namespace MAUtil;

class Feed  {
public:
	Feed();
	~Feed();
	void setEncrypt(const char*);
	void setUsername(const char*);
	void setCredits(const char*);
	void setEmail(const char*);
	void setHandle(const char*);
	void setID(const char*);
	void setUnsuccessful(const char*);
	void setReplaceWhiteSpaces(const char*);
	void setReplaceSpecialCharacters(const char*);
	void setAll(char*);
	void setLoaded(bool load);
	void setAlbum(const char*);
	void setGameId(const char*);
	bool setTouch(const char* touch);
	bool setTouchEnabled(bool touch);
	void setSeconds(const char* seconds);
	void setFreebie(const char* freebie);
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
	String getGameId();
	String getSeconds();
	String getFreebie();
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
	String gameId;
	String seconds;
	String freebie;
	Albums *album;
	Albums real_album;
	bool touchEnabled;
	bool loaded;
};

#endif	//_FEED_H_
