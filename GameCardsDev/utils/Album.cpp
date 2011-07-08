#include "Album.h"
#include "Util.h"

Album::Album() {
	id = "";
	description = "";
	totalcards = "";
	collected = "";
	hasCards = false;
	updated = false;
}

Album::Album(String id, String desc, bool hasCards, bool updated, String totalcards, String collected):id(id), description(desc),
		hasCards(hasCards), updated(updated), totalcards(totalcards), collected(collected) {
}

Album::~Album() {
	id = "";
	description = "";
	totalcards = "";
	collected = "";
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

String Album::getDesc() {
	return description;
}

String Album::getDescription() {
	if (getTotalCards().length() >= 1) {
		if ((strcmp(getId().c_str(), "-2")==0)||(strcmp(getId().c_str(), "-3")==0)) {
			return description + " (" + getTotalCards() + ")";
		} else {
			return description + " (" + getCollected() + "/" + getTotalCards() + ")";
		}
	}
	return description;
}

void Album::setDescription(const char *d) {
	description = d;
}

String Album::getTotalCards() {
	return totalcards;
}

void Album::setTotalCards(const char *d) {
	totalcards = d;
}

String Album::getCollected() {
	return collected;
}

void Album::setCollected(const char *d) {
	collected = d;
}
