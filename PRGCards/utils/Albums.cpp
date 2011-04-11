#include "Albums.h"
#include "Util.h"

Albums::Albums() {
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
	for(int i = 0; i < albumList.size(); i++) {
		// The iterator needs to be dereferenced.
		all+=albumList[i]->getDescription();
		all+=delim;
		all+=albumList[i]->getId();
		all+=delim;
		all+=albumList[i]->getHasCards()?"true":"false";
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
	Album *temp;
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

			temp = new Album(id, name, hasCards);
			album.insert(name, temp);
			albumList.add(temp);
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
	albumList.clear();
}

void Albums::addAlbum(const char* id, String name, bool hasCards, bool updated) {
	Album *temp = new Album(id, name.c_str(), hasCards, updated);
	album.insert(((updated?updated_symbol:"")+name).c_str(), temp);
	albumList.add(temp);
}

Vector<String> Albums::getNames() {
	Vector<String> names;
	for(int i = 0; i < albumList.size(); i++) {
		// The iterator needs to be dereferenced.
		names.add((albumList[i]->getUpdated()?updated_symbol:"")+albumList[i]->getDescription());
	}
	return names;
}

Vector<String> Albums::getIDs() {
	Vector<String> ids;
	for(int i = 0; i < albumList.size(); i++) {
		ids.add(albumList[i]->getId());
	}
	return ids;
}

Vector<Album*> Albums::getAlbums() {
	return albumList;
}
