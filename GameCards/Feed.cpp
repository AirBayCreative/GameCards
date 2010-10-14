#include "Feed.h"
#include "Util.h"

void Feed::setLoaded(bool load) {
	loaded = load;
}

bool Feed::getLoaded() {
	return loaded;
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

MAUtil::String Feed::getAll() {
	return uname+delim+encrypt+delim+noSuccess+delim+touch+delim;
}

void Feed::setAll(const char* allch) {
	if (strlen(allch) <= 0) {
		allch = "";
	}
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
