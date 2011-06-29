#include "CardStat.h"
#include "Util.h"

CardStat::CardStat() {
	cardStatId = "";
	statDescription = "";
	statType = "";
}

CardStat::~CardStat() {
	cardStatId = "";
	statDescription = "";
	statType = "";
}

CardStat::CardStat(const char *cardStatId, const char *statDescription,
			const char *statType) : cardStatId(cardStatId), statDescription(statDescription),
			statType(statType) {
}

String CardStat::getCardStatId() {
	return cardStatId;
}

void CardStat::setCardStatId(const char *i) {
	cardStatId = i;
}

String CardStat::getStatDescription() {
	return statDescription;
}

void CardStat::setStatDescription(const char *d) {
	statDescription = d;
}

String CardStat::getStatType() {
	return statType;
}

void CardStat::setStatType(const char *t) {
	statType = t;
}

void CardStat::setTop(int i) {
	top = i;
}

int CardStat::getTop() {
	return top;
}

void CardStat::setLeft(int i) {
	left = i;
}

int CardStat::getLeft() {
	return left;
}

void CardStat::setWidth(int i) {
	width = i;
}

int CardStat::getWidth() {
	return width;
}

void CardStat::setHeight(int i) {
	height = i;
}

int CardStat::getHeight() {
	return height;
}

void CardStat::setFrontOrBack(int i) {
	frontOrBack = i;
}

int CardStat::getFrontOrBack() {
	return frontOrBack;
}

String CardStat::toString() {
	String result = "";
	result += "statType: " +statType;
	result += "\nstatDescription: " +statDescription;
	result += "\ncardStatId: " +cardStatId;
	return result;
}
