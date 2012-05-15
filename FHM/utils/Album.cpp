#include "Album.h"
#include "Util.h"

Album::Album() {
	id = "";
	description = "";
	hasCards = false;
	updated = false;
}

Album::Album(String id, String desc, bool hasCards, bool updated):id(id), description(desc),
		hasCards(hasCards), updated(updated) {
}

Album::~Album() {
	id = "";
	description = "";
	hasCards = false;
	updated = false;
}

void Album::setHasCards(bool hc) {
	hasCards = hc;
}

bool Album::getHasCards() {
	return hasCards;
}

bool Album::getUpdated() {
	return updated;
}

void Album::setUpdated(bool u) {
	updated = u;
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
