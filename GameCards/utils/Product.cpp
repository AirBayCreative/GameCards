#include "Product.h"
#include "Util.h"

Product::Product() {
	name = "";
	id = "";
	description = "";
	thumb = "";
	price = "";
	currency = "";
	cardsInPack = "";
}

Product::Product(const char *id, const char *name,
			const char *description, const char *thumb,
			const char *price, const char *currency, const char *cardsInPack) : id(id), name(name),
			description(description), thumb(thumb), price(price), currency(currency), cardsInPack(cardsInPack) {
}

String Product::getId() {
	return id;
}

void Product::setId(const char *i) {
	id = i;
}

String Product::getName() {
	return name;
}

void Product::setName(const char *n) {
	name = n;
}

String Product::getDescription() {
	return description;
}

void Product::setDescription(const char *d) {
	description = d;
}

String Product::getThumb() {
	return thumb;
}

void Product::setThumb(const char *t) {
	thumb = t;
}

String Product::getPrice() {
	return price;
}

void Product::setPrice(const char *p) {
	price = p;
}

String Product::getCurrency() {
	return currency;
}

void Product::setCurrency(const char *c) {
	currency = c;
}

String Product::getCardsInPack() {
	return cardsInPack;
}

void Product::setCardsInPack(const char *c) {
	cardsInPack = c;
}

String Product::getFormattedPrice() {
	String before = price.substr(0, price.findLastOf('.'));
	String after = price.substr(price.findLastOf('.'), 3);
	return before + after;
}

String Product::getDetailsString() {
	String details = "Price: ";

	details += currency + " " + getFormattedPrice();
	details += "\nCards in pack: " + cardsInPack;
	details += "\nDescription: " + description;

	return details;
}
