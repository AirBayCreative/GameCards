#include "CardStat.h"
#include "Util.h"

CardStat::CardStat() {
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

String CardStat::toString() {
	String result = "";
	result += "statType: " +statType;
	result += "\nstatDescription: " +statDescription;
	result += "\ncardStatId: " +cardStatId;
	return result;
}
