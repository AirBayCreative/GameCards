#ifndef FRIEND_H_
#define FRIEND_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class Friend  {
public:
	Friend();
	~Friend();

	String getFriendId();
	void setFriendId(const char *friendid);

private:
	String friendid;
};

#endif /* FRIEND_H_ */
