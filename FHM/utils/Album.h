#ifndef _ALBUM_H_
#define _ALBUM_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class Album  {
public:
	Album();
	Album(String id, String desc, bool hasCards=false, String seconds="");
	~Album();

	String getId();
	void setId(const char *id);

	String getDescription();
	void setDescription(const char *description);

	bool getHasCards();
	void setHasCards(bool hasCards);

	String getSeconds();
	void setSeconds(const char *seconds);
private:
	String id;
	String description;
	String seconds;
	bool hasCards;
};

#endif	//_ALBUM_H_
