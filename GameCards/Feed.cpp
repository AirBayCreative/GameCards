#include "Feed.h"
#include "Util.h"

void Feed::setLoaded(bool load) {
	loaded = load;
}

bool Feed::getLoaded() {
	return loaded;
}

void Feed::setCredits(const char *creds) {
	credits = creds;
}

MAUtil::String Feed::getCredits() {
	return credits;
}

void Feed::setEmail(const char *eml) {
	email = eml;
}

bool Feed::setTouch(const char *tch) {
	touch = tch;
	return setTouchEnabled(touch == truesz);
}

bool Feed::setTouchEnabled(bool tch) {
	if (touchEnabled != tch) {
		touchEnabled = tch;
		return true;
	}
	return false;
}

MAUtil::String Feed::getEmail() {
	return email;
}

void Feed::setHandle(const char *hndl) {
	handle = hndl;
}

MAUtil::String Feed::getHandle() {
	return handle;
}

void Feed::setUsername(const char *username) {
	uname = username;
}

MAUtil::String Feed::getUsername() {
	return uname;
}

void Feed::setEncrypt(const char *base64encrypt) {
	encrypt = base64encrypt;
}

MAUtil::String Feed::getEncrypt() {
	return encrypt;
}

void Feed::setUnsuccessful(const char *u) {
	noSuccess = u;
}

MAUtil::String Feed::getUnsuccessful() {
	return noSuccess;
}

MAUtil::String Feed::getTouch() {
	return touch;
}

bool Feed::getTouchEnabled() {
	return touchEnabled;
}

void Feed::setReplaceWhiteSpaces(const char *space) {
	whiteSpace = space;
}

MAUtil::String Feed::getReplaceWhiteSpaces() {
	int index = 0;

	while((index=whiteSpace.findFirstOf(' ',index))!=String::npos) {
		whiteSpace.remove(index,1);
	}
	return whiteSpace;
}

void Feed::setReplaceSpecialCharacters(const char *special) {
	specialCharacters = special;
}

MAUtil::String Feed::getReplaceSpecialCharacters() {
	String ampersand = "&amp;";
	String lt = "&amp;lt;";
	String gt = "&amp;gt;";
	String quot = "&quot;";
	String apos = "&apos;";
	size_t index;

	while((index=specialCharacters.find(lt))!=String::npos) {
		specialCharacters.remove(index,8);
		specialCharacters.insert(index,"<");
	}

	while((index=specialCharacters.find(gt))!=String::npos) {
		specialCharacters.remove(index,8);
		specialCharacters.insert(index,">");
	}

	while((index=specialCharacters.find(ampersand))!=String::npos) {
		specialCharacters.remove(index,5);
		specialCharacters.insert(index,"&");
	}

	while((index=specialCharacters.find(quot))!=String::npos) {
		specialCharacters.remove(index,6);
		specialCharacters.insert(index,"\"");
	}

	while((index=specialCharacters.find(apos))!=String::npos) {
		specialCharacters.remove(index,6);
		specialCharacters.insert(index,"'");
	}
	return specialCharacters;
}

MAUtil::String Feed::getAll() {
	return uname+delim+encrypt+delim+noSuccess+delim+whiteSpace+delim+specialCharacters+delim+credits+delim+email+delim+handle+delim+touch+delim;
}

void Feed::setAll(const char* allch) {
	String all = allch;
	int indexof = all.find(delim);
	if (indexof > -1) {
		setUsername(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(delim);
		setEncrypt(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(delim);
		setUnsuccessful(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(delim);
		setReplaceWhiteSpaces(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(delim);
		setReplaceSpecialCharacters(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(delim);
		setCredits(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(delim);
		setEmail(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(delim);
		setHandle(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(delim);
		setTouch(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		setLoaded(true);
		if ((getUsername().length() <= 0)||(getEncrypt().length() <= 0)) {
			setUsername("");
			setEncrypt("");
			setLoaded(false);
		}
	} else {
		setLoaded(false);
		setUsername("");
		setEncrypt("");
		setUnsuccessful("");
		setReplaceWhiteSpaces("");
		setReplaceSpecialCharacters("");
		setCredits("");
		setEmail("");
		setHandle("");
		setTouch(falsesz);
	}
}
void Feed::setAlbum(const char* allch) {
	real_album = Albums();
	album = &real_album;
	album->setAll(allch);
}
Albums* Feed::getAlbum() {
	return album;
}
String Feed::getAlbumString() {
	return album->getAll();
}
Vector<String> Feed::getAlbumNames() {
	return album->getNames();
}
