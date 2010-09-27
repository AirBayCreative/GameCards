#ifndef _FEED_H_
#define _FEED_H_

#include <MAUtil/String.h>
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
	Albums *album;
	Albums real_album;
	bool loaded;
};

#endif	//_FEED_H_
