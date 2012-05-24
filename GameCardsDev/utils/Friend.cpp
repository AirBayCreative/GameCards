#include "Friend.h"

Friend::Friend() {
	friendid = "";

}

Friend::~Friend() {
	friendid = "";

}

String Friend::getFriendId() {
	return friendid;
}
void Friend::setFriendId(const char *frienid) {
	friendid = frienid;
}
