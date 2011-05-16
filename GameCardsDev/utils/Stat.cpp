#include "Stat.h"
#include "Util.h"

Stat::Stat() {
	desc = "";
	display = "";
	iVal = "";
}

void Stat::setCardStatId(const char *d) {
	cardStatId = d;
}

String Stat::getCardStatId() {
	return cardStatId;
}

void Stat::setDesc(const char *d) {
	desc = d;
}

String Stat::getDesc() {
	return desc;
}

void Stat::setDisplay(const char *d) {
	display = d;
}

String Stat::getDisplay() {
	return display;
}

void Stat::setIVal(const char *i) {
	iVal = i;
}

String Stat::getIVal() {
	return iVal;
}

String Stat::getAll() {
	return getDesc()+delim+getDisplay()+delim+getIVal();
}

void Stat::setAll(const char* allch) {
	String all = allch;
	int indexof = all.find(delim);
	if (indexof > -1) {
		setDesc(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(delim);
		setDisplay(all.substr(0,indexof++).c_str());
		all=all.substr(indexof);
		indexof = all.find(delim);
		setIVal(all.substr(0,indexof++).c_str());
	} else {
		setDesc("");
		setDisplay("");
		setIVal("");
	}
}

void Stat::setTop(int i) {
	top = i;
}

int Stat::getTop() {
	return top;
}

void Stat::setLeft(int i) {
	left = i;
}

int Stat::getLeft() {
	return left;
}

void Stat::setWidth(int i) {
	width = i;
}

int Stat::getWidth() {
	return width;
}

void Stat::setHeight(int i) {
	height = i;
}

int Stat::getHeight() {
	return height;
}

void Stat::setFrontOrBack(int i) {
	frontOrBack = i;
}

int Stat::getFrontOrBack() {
	return frontOrBack;
}
