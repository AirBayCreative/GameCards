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
	void setPremium(const char*);
	void setEmail(const char*);
	void setHandle(const char*);
	void setUnsuccessful(const char*);
	void setReplaceWhiteSpaces(const char*);
	void setReplaceSpecialCharacters(const char*);
	void setAll(const char*);
	void setLoaded(bool load);
	void setNoteLoaded(bool load);
	void setAlbum(const char*);
	void setGameId(const char*);
	bool setTouch(const char* touch);
	bool setTouchEnabled(bool touch);
	void setSeconds(const char* seconds);
	void setNoteSeconds(const char* seconds);
	void setFreebie(const char* freebie);
	void setRegistered(String reg);
	Albums* getAlbum();
	String getAlbumString();
	String getEncrypt();
	String getUsername();
	String getCredits();
	String getPremium();
	String getEmail();
	String getHandle();
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
	bool getNoteLoaded();
	int getHttps();
	String getNoteSeconds();
	String getRegistered();
	void addHttp();
	void remHttp();
private:
	String encrypt;
	String uname;
	String noSuccess;
	String whiteSpace;
	String specialCharacters;
	String credits;
	String premium;
	String email;
	String handle;
	String touch;
	String gameId;
	String seconds;
	String freebie;
	String registered;
	Albums *album;
	bool touchEnabled;
	bool loaded;
	bool noteLoaded;
	String noteSeconds;
	int https;
};

#endif	//_FEED_H_
