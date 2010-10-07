#include "Albums.h"
#include "Util.h"

void Albums::setLoaded(bool load) {
	loaded = load;
}

bool Albums::getLoaded() {
	return loaded;
}

String Albums::getAll() {
	String all = blank;
	for(Map<String,String>::Iterator itr = album.begin(); itr != album.end(); itr++) {
		// The iterator needs to be dereferenced.
		all+=itr->first.c_str();
		all+=delim;
		all+=itr->second.c_str();
		all+=newline;
	}
	return all;
}
String Albums::getId(String val) {
	Map<String,String>::Iterator i = album.find(val);
	if(i != album.end()) {
		return i->second.c_str();
	} else {
		return demoid;
	}
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
	while ((indexof = all.find(newline)) > -1) {
		tmp = all.substr(0,indexof++);
		if (indentindexof = tmp.find(delim)) {
			name = tmp.substr(0,indentindexof++);
			id = tmp.substr(indentindexof);
			album.insert(name,id);
		}
		all = all.substr(indexof);
	}
}
void Albums::clearAll() {
	album.clear();
}

void Albums::addAlbum(const char* id, const char* name) {
	album.insert(id, name);
}
void Albums::removeAlbum(const char* id) {
	album.erase(id);
}
Vector<String> Albums::getNames() {
	Vector<String> names;
	for(Map<String,String>::Iterator itr = album.begin(); itr != album.end(); itr++) {
		// The iterator needs to be dereferenced.
		names.add(itr->first.c_str());
	}
	return names;
}
Vector<String> Albums::getIDs() {
	Vector<String> ids;
	for(Map<String,String>::Iterator itr = album.begin(); itr != album.end(); itr++) {
		ids.add(itr->second.c_str());
	}
	return ids;
}

