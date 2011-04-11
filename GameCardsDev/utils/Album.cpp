#include "Album.h"

Album::Album() {
	id = "";
	description = "";
	hasCards = false;
}

Album::Album(String id, String desc, bool hasCards):id(id), description(desc),
		hasCards(hasCards) {
}

Album::~Album() {
	id = "";
	description = "";
	hasCards = false;
}

void Album::setHasCards(bool hc) {
	hasCards = hc;
}

bool Album::getHasCards() {
	return hasCards;
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
