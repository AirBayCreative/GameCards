#include "Stat.h"

Stat::Stat() {
	desc = "";
	display = "";
	iVal = "";
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
