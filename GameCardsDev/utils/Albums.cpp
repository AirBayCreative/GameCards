#include "Albums.h"
#include "Util.h"

Albums::Albums() {
	loaded = false;
	clearAll();
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
		all+=",";
		all+=itr->second->getId();
		all+=",";
		all+=itr->second->getHasCards()?"true":"false";
		all+="#";
	}
	return all;
}

String Albums::getId(String val) {
	Map<String,Album*>::Iterator i = album.find(albumnames.find(val)->second);
	if(i != album.end()) {
		return i->second->getId();
	} else {
		return "-1";
	}
}

Album* Albums::getAlbum(String val) {

	lprintfln("%s", val.c_str());

	for(Map<String,String>::Iterator i = albumnames.begin(); i != albumnames.end(); i++) {
		lprintfln("%s", i->second.c_str());
	}
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
	String id;
	String name;

	bool hasCards;

	while ((indexof = all.find("#")) > -1) {
		tmp = all.substr(0,indexof++);
		if ((indentindexof = tmp.find(",")) > -1) {
			name = tmp.substr(0,indentindexof++);
			tmp = tmp.substr(indentindexof);

			indentindexof = tmp.find(",");
			id = tmp.substr(0,indentindexof++);
			tmp = tmp.substr(indentindexof);

			indentindexof = tmp.find(",");
			hasCards = tmp=="true";

			Map<String,String>::Iterator i = albumnames.find(name);
			if (i == albumnames.end()) {
				albumnames.insert(name,id);
			}
			Map<String,Album *>::Iterator it = album.find(id);
			if (it == album.end()) {
				album.insert(id, new Album(id, name, hasCards, false));
			}
			tmp = "";
		}
		all = all.substr(indexof);
	}
	all.clear();
}

void Albums::clearAll() {
	for(Map<String,Album*>::Iterator i = album.begin(); i != album.end(); i++) {
		delete i->second;
		i->second = NULL;
	}
	for(Map<String,String>::Iterator i = albumnames.begin(); i != albumnames.end(); i++) {
		i->second.clear();
	}
	album.clear();
	albumnames.clear();
	loaded = false;
}

void Albums::addAlbum(const char* id, const char *name, bool hasCards, bool updated) {
	albumnames.insert(name, id);
	album.insert(id, new Album(id, name, hasCards, updated));
}

void Albums::removeAlbum(const char* id) {
	album.erase(id);
}

Vector<String> Albums::getNames() {
	Vector<String> names;
	for(Map<String,Album*>::Iterator itr = album.begin(); itr != album.end(); itr++) {
		 //The iterator needs to be dereferenced.
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
