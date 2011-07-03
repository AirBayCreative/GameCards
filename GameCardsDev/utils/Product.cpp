#include "Product.h"
#include "Util.h"

Product::Product() {
	name = "";
	id = "";
	productType = "";
	thumb = "";
	price = "";
	cardsInPack = "";
}

Product::~Product() {
	name = "";
	id = "";
	productType = "";
	thumb = "";
	price = "";
	cardsInPack = "";
}

Product::Product(const char *id, const char *name,
			const char *productType, const char *thumb,
			const char *price, const char *cardsInPack) : id(id), name(name),
			productType(productType), thumb(thumb), price(price), cardsInPack(cardsInPack) {
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

String Product::getProductType() {
	return productType;
}

void Product::setProductType(const char *d) {
	productType = d;
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
	String details = "Credits: ";

	details += price;
	details += "\nCards: " + cardsInPack;
	details += "\nType: " + productType;

	return details;
}
