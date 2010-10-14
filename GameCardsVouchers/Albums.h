#ifndef _ALBUMS_H_
#define _ALBUMS_H_

#include <MAUtil/String.h>
#include <MAUtil/Map.h>
#include <MAUtil/Vector.h>

using namespace MAUtil;

class Albums  {
public:
	Vector<String> getNames();
	Vector<String> getIDs();
	void setAll(const char*);
	void addAlbum(const char*, const char*);
	void removeAlbum(const char*);
	String getAll();
	bool getLoaded();
	void setLoaded(bool load);
	void clearAll();
	int size();
	//given a name returns the valid id for lookup on filesystem.
	String getId(String name);

private:
	Map<String,String> album;
	bool loaded;
};

#endif	//_ALBUMS_H_
