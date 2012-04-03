#include "Album.h"
#include "Util.h"

Album::Album() {
	id = "";
	description = "";
	hasCards = false;
	seconds = "";
}

Album::Album(String id, String desc, bool hasCards, String seconds):id(id), description(desc),
		hasCards(hasCards), seconds(seconds) {
}

Album::~Album() {
	id = "";
	description = "";
	hasCards = false;
	seconds = "";
}

void Album::setHasCards(bool hc) {
	hasCards = hc;
}

bool Album::getHasCards() {
	return hasCards;
}

String Album::getSeconds() {
	return seconds;
}

void Album::setSeconds(const char *d) {
	seconds = d;
}

String Album::getId() {
	return id;
}

void Album::setId(const char *i) {
	id = i;
}

String Album::getDescription() {
	return description;
}

void Album::setDescription(const char *d) {
	description = d;
}
