#include "Albums.h"
#include "Util.h"

Albums::Albums() {
	loaded = false;
}

Albums::~Albums() {
	album.clear();
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
	Map<String,Album*>::Iterator i = album.find(val);
	if(i != album.end()) {
		return i->second->getId();
	} else {
		return demoid;
	}
}

Album* Albums::getAlbum(String val) {
	return album.find(val)->second;
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

			album.insert(name, new Album(id, name, hasCards));
		}
		all = all.substr(indexof);
	}
}
void Albums::clearAll() {
	album.clear();
}

void Albums::addAlbum(const char* id, const char* name, bool hasCards) {
	album.insert(name, new Album(id, name, hasCards));
}

void Albums::removeAlbum(const char* id) {
	album.erase(id);
}

Vector<String> Albums::getNames() {
	Vector<String> names;
	for(Map<String,Album*>::Iterator itr = album.begin(); itr != album.end(); itr++) {
		// The iterator needs to be dereferenced.
		names.add(itr->second->getDescription());
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
