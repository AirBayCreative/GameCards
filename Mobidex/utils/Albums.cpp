#include "Albums.h"
#include "Util.h"

int cmp(const String &a, const String &b) {
	return 0;
}

Albums::Albums() {
	album = MAUtil::Map<String,Album*>(&cmp);
	loaded = false;
}

Albums::~Albums() {
	clearAll();
}

void Albums::setLoaded(bool load) {
	loaded = load;
}

bool Albums::getLoaded() {
	return loaded;
}

String Albums::getAll() {
	String all = "";
	for(Map<String,Album*>::Iterator itr = album.begin(); itr != album.end(); itr++) {
		// The iterator needs to be dereferenced.
		all+=itr->second->getDescription();
		all+=delim;
		all+=itr->second->getId();
		all+=delim;
		all+=itr->second->getHasCards()?"true":"false";
		all+=newline;
	}
	return all;
}

String Albums::getId(String val) {
	Map<String,Album*>::Iterator i = album.find(albumnames.find(val)->second);
	if(i != album.end()) {
		return i->second->getId();
	} else {
		return demoid;
	}
}

Album* Albums::getAlbum(String val) {

	return album.find(albumnames.find(val)->second)->second;
}

int Albums::size() {
	return album.size();
}

void Albums::setAll(const char* allch) {
	String all = allch;
	int indexof = 0;
	int indentindexof = 0;
	String tmp;
	String id, name;
	bool hasCards;
	while ((indexof = all.find(newline)) > -1) {
		tmp = all.substr(0,indexof++);
		if (indentindexof = tmp.find(delim)) {
			name = tmp.substr(0,indentindexof++);
			tmp = tmp.substr(indentindexof);

			indentindexof = tmp.find(delim);
			id = tmp.substr(0,indentindexof++);
			tmp = tmp.substr(indentindexof);

			indentindexof = tmp.find(delim);
			hasCards = tmp=="true";

			albumnames.insert(name,id);
			album.insert(id, new Album(id, name, hasCards));
		}
		all = all.substr(indexof);
	}
}
void Albums::clearAll() {
	for(Map<String,Album*>::Iterator i = album.begin(); i != album.end(); i++) {
		delete i->second;
		i->second = NULL;
	}
	album.clear();
}

void Albums::addAlbum(const char* id, String name, bool hasCards, bool updated) {
	//album.CompareFunction = &CompareFunction;
	//album = MAUtil::Map<String,Album*>(&CompareFunction);
	//album.init(&CompareFunction);
	//album.insert(((updated?updated_symbol:"")+name).c_str(), new Album(id, name.c_str(), hasCards, updated));
	albumnames.insert(((updated?updated_symbol:"")+name).c_str(), id);
	album.insert(id, new Album(id, name.c_str(), hasCards, updated));
}

void Albums::removeAlbum(const char* id) {
	album.erase(id);
}

Vector<String> Albums::getNames() {
	Vector<String> names;
	for(Map<String,Album*>::Iterator itr = album.begin(); itr != album.end(); itr++) {
		 //The iterator needs to be dereferenced.
		names.add((itr->second->getUpdated()?updated_symbol:"")+itr->second->getDescription());
	}
	return names;
}

Vector<String> Albums::getIDs() {
	Vector<String> ids;
	for(Map<String,Album*>::Iterator itr = album.begin(); itr != album.end(); itr++) {
		ids.add(itr->second->getId());
	}
	return ids;
}

Vector<Album*> Albums::getAlbums() {
	Vector<Album*> albums;
	for(Map<String,Album*>::Iterator itr = album.begin(); itr != album.end(); itr++) {
		albums.add(itr->second);
	}
	return albums;
}
