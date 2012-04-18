#include "Feed.h"
#include "Util.h"
#include <mastdlib.h>

void Feed::setLoaded(bool load) {
	loaded = load;
}
void Feed::setNoteLoaded(bool load) {
	noteLoaded = load;
}
bool Feed::getLoaded() {
	return loaded;
}
bool Feed::getNoteLoaded() {
	return noteLoaded;
}
int Feed::getHttps() {
	return https;
}
void Feed::addHttp() {
	https++;
}
void Feed::remHttp() {
	https--;
}
Feed::Feed() {
	https = 0;
	encrypt = "";
	uname = "";
	noSuccess = "";
	whiteSpace = "";
	specialCharacters = "";
	credits = "0";
	premium = "0";
	email = "";
	handle = "";
	touch = "";
	gameId = "";
	seconds = "";
	album = NULL;
	touchEnabled = false;
	loaded = false;
	noteLoaded = false;
	noteSeconds = "0";
	registered = "0";
}
Feed::~Feed() {
	encrypt = "";
	uname = "";
	noSuccess = "";
	whiteSpace = "";
	specialCharacters = "";
	credits = "0";
	premium = "0";
	email = "";
	handle = "";
	touch = "";
	gameId = "";
	seconds = "";
	touchEnabled = false;
	loaded = false;
	noteLoaded = false;
	noteSeconds = "";
	registered = "0";
}

bool Feed::setTouch(const char *tch) {
	touch = tch;
	return setTouchEnabled(touch == "true");
}

bool Feed::setTouchEnabled(bool tch) {
	if (touchEnabled != tch) {
		touchEnabled = tch;
		return true;
	}
	return false;
}

void Feed::setCredits(const char *creds) {
	credits = creds;
}

void Feed::setPremium(const char *prem) {
	premium = prem;
}

MAUtil::String Feed::getCredits() {
	return credits;
}

MAUtil::String Feed::getPremium() {
	return premium;
}

void Feed::setEmail(const char *eml) {
	email = eml;
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

void Feed::setSeconds(const char *sec) {
	seconds = sec;
}

void Feed::setNoteSeconds(const char* sec) {
	noteSeconds = sec;
}

void Feed::setFreebie(const char *free) {
	freebie = free;
}

void Feed::setRegistered(String regi) {
	registered = regi;
}

MAUtil::String Feed::getGameId() {
	return gameId;
}

void Feed::setGameId(const char *g) {
	gameId = g;
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
	return uname+","+encrypt+","+noSuccess+","+whiteSpace+","+specialCharacters+","+credits+","+email+","+handle+","+touch+","+seconds+","+freebie+","+noteSeconds+","+registered+","+premium+",";
}

void Feed::setAll(const char* allch) {
	if (strlen(allch) <= 0) {
		allch = "";
	}
	String all = allch;
	int indexof = all.find(",");
	if (indexof > -1) {
		setUsername(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setEncrypt(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setUnsuccessful(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setReplaceWhiteSpaces(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setReplaceSpecialCharacters(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setCredits(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setEmail(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setHandle(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setTouch(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setSeconds(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setFreebie(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setNoteSeconds(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setRegistered(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(",");
		setPremium(all.substr(0,indexof++).c_str());
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
		setPremium("");
		setEmail("");
		setHandle("");
		setNoteLoaded(false);
		setAlbum("");
		setGameId("");
		setTouch("false");
		setTouchEnabled(false);
		setSeconds("");
		setNoteSeconds("");
		setFreebie("");
		setRegistered("0");
	}
}
void Feed::setAlbum(const char* allch) {
	if (album != NULL) {
		album->clearAll();
	} else if (album == NULL) {
		album = new Albums();
	}
	album->clearAll();
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
String Feed::getSeconds() {
	return seconds;
}

String Feed::getNoteSeconds() {
	return noteSeconds;
}

String Feed::getRegistered() {
	return registered;
}

String Feed::getFreebie() {
	return freebie;
}
