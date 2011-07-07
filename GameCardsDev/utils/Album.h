#ifndef _ALBUM_H_
#define _ALBUM_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class Album  {
public:
	Album();
	Album(String id, String desc, bool hasCards=false, bool updated=false, String totalcards="", String collected="");
	~Album();

	String getId();
	void setId(const char *id);

	String getDescription();
	void setDescription(const char *description);

	String getTotalCards();
	void setTotalCards(const char *total);

	String getCollected();
	void setCollected(const char *collect);

	bool getHasCards();
	void setHasCards(bool hasCards);

	bool getUpdated();
	void setUpdated(bool updated);
private:
	String id;
	String description;
	String totalcards;
	String collected;
	bool hasCards, updated;
};

#endif	//_ALBUM_H_
