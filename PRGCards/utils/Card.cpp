#include "Card.h"
#include "Util.h"

Card::Card() {
	quantity = "";
	text = "";
	thumb = "";
	front = "";
	back = "";
	id = "";
	rate = "";
	value = "";
	fullDesc = "";
	note = "";
	loaded = false;
	updated = false;
}

Card::~Card() {
	quantity = "";
	text = "";
	thumb = "";
	front = "";
	back = "";
	id = "";
	rate = "";
	value = "";
	fullDesc = "";
	note = "";
}

void Card::setLoaded(bool load) {
	loaded = load;
}

bool Card::getLoaded() {
	return loaded;
}

void Card::setUpdated(bool u) {
	updated = u;
}

bool Card::getUpdated() {
	return updated;
}

String Card::getQuantity() {
	return quantity;
}
void Card::setQuantity(const char *quan) {
	quantity = quan;
}

String Card::getText() {
	return text;
}
void Card::setText(const char *tex) {
	text = tex;
}

String Card::getThumb() {
	return thumb;
}

void Card::setThumb(const char *thum) {
	thumb = thum;
}

String Card::getFront() {
	return front;
}

void Card::setFront(const char *fron) {
	front = fron;
}

String Card::getBack() {
	return back;
}

void Card::setBack(const char *bac) {
	back = bac;
}

String Card::getId() {
	return id;
}

void Card::setId(const char *i) {
	id = i;
}

String Card::getRate() {
	return rate;
}

void Card::setRate(const char *rat) {
	rate = rat;
}

String Card::getValue() {
	return value;
}

void Card::setValue(const char *valu) {
	value = valu;
}

String Card::getFullDesc() {
	return fullDesc;
}

void Card::setFullDesc(const char *f) {
	fullDesc = f;
}

String Card::getGamePlayerCardId() {
	return gamePlayerCardId;
}

void Card::setGamePlayerCardId(const char *g) {
	gamePlayerCardId = g;
}

String Card::getNote() {
	return note;
}

void Card::setNote(const char *n) {
	note = n;
}

String Card::getAll() {
	String all = getQuantity()+delim+getText()+delim+getThumb()+delim+getFront()+
			delim+getBack()+delim+getId()+delim+getRate()+delim+getValue()+delim+getNote()+delim;
	return all;
}

void Card::setAll(const char* allch) {
		String all = allch;
		int indexof = all.find(delim);
		if (indexof > -1) {
			setQuantity(all.substr(0,indexof++).c_str());
			all=all.substr(indexof);
			indexof = all.find(delim);
			setText(all.substr(0,indexof++).c_str());
			all=all.substr(indexof);
			indexof = all.find(delim);
			setThumb(all.substr(0,indexof++).c_str());
			all=all.substr(indexof);
			indexof = all.find(delim);
			setFront(all.substr(0,indexof++).c_str());
			all=all.substr(indexof);
			indexof = all.find(delim);
			setBack(all.substr(0,indexof++).c_str());
			all=all.substr(indexof);
			indexof = all.find(delim);
			setId(all.substr(0,indexof++).c_str());
			all=all.substr(indexof);
			indexof = all.find(delim);
			setRate(all.substr(0,indexof++).c_str());
			all=all.substr(indexof);
			indexof = all.find(delim);
			setValue(all.substr(0,indexof++).c_str());
			all=all.substr(indexof);
			indexof = all.find(delim);
			setNote(all.substr(0,indexof++).c_str());
			all=all.substr(indexof);

			setLoaded(true);
			if ((getText().length() <= 0)||(getQuantity().length() <= 0)) {
				setQuantity("");
				setText("");
				setLoaded(false);
			}
		} else {
			setQuantity("");
			setText("");
			setThumb("");
			setFront("");
			setBack("");
			setId("");
			setRate("");
			setValue("");
			setNote("");
			setLoaded(false);
		}
}
