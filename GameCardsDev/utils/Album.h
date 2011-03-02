#ifndef _ALBUM_H_
#define _ALBUM_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class Album  {
public:
	Album();
	Album(String id, String desc, bool hasCards=false);
	~Album();

	String getId();
	void setId(const char *id);

	String getDescription();
	void setDescription(const char *description);

	bool getHasCards();
	void setHasCards(bool hasCards);

	bool getLoaded();
	void setLoaded(bool load);

	String getAll();
	void setAll(const char*);
private:
	String id, description;
	bool hasCards;
};

#endif	//_ALBUM_H_
