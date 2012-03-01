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
		all+=",";
		all+=itr->second->getSeconds();
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
	return album.find(albumnames.find(val)->second)->second;
}

int Albums::size() {
	return album.size();
}

void Albums::setAll(const char* allch) {
	String all = allch;
	int indexof = 0;
	int indentindexof = 0;
	String tmp = "";
	String id = "";
	String name = "";
	String seconds = "";

	clearAll();

	bool hasCards;

	while ((indexof = all.find("#")) > -1) {
		tmp = all.substr(0,indexof++);
		if ((indentindexof = tmp.find(",")) > -1) {
			name = tmp.substr(0,indentindexof++);
			tmp = tmp.substr(indentindexof);
			if ((indentindexof = tmp.find(",")) > -1) {
				id = tmp.substr(0,indentindexof++);
				tmp = tmp.substr(indentindexof);
			}
			if ((indentindexof = tmp.find(",")) > -1) {
				hasCards = tmp.substr(0,indentindexof++)=="true";
				tmp = tmp.substr(indentindexof);
			}
			if ((indentindexof = tmp.find(",")) > -1) {
				seconds = tmp.substr(0,indentindexof++);
			}

			albumnames.insert(name,id);
			album.insert(id, new Album(id, name, hasCards, seconds));
		}
		tmp = "";
		id = "";
		name = "";
		seconds = "";

		all = all.substr(indexof);
	}
	tmp = "";
	id = "";
	name = "";
	seconds = "";
	all = "";
}

void Albums::clearAll() {
	Map<String,Album*>::Iterator i = album.begin();
	while (i != album.end()) {
		Album *del = i->second;
		delete del;
		del = NULL;
		i->second = NULL;
		album.erase(i);
		i = album.begin();
	}
	Map<String,String>::Iterator x = albumnames.begin();
	while (x != albumnames.end()) {
		x->second = "";
		albumnames.erase(x);
		x = albumnames.begin();
	}
	album.clear();
	albumnames.clear();
	loaded = false;
}

void Albums::addAlbum(const char* id, const char *name, bool hasCards, const char* seconds) {
	albumnames.insert(name, id);
	album.insert(id, new Album(id, name, hasCards, seconds));
}

void Albums::removeAlbum(const char* id) {
	album.erase(id);
}

void Albums::updateSeconds(const char* seconds, const char* albumid) {
	Album* alb = album.find(albumid)->second;
	alb->setSeconds(seconds);
}

String Albums::getSeconds(const char* albumid) {
	Album* alb = album.find(albumid)->second;
	return alb->getSeconds();
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
