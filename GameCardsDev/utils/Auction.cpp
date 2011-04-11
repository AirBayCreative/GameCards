#include "Auction.h"

Auction::Auction() {
	openingBid = "";
	price = "";
	userCardId = "";
	auctionCardId = "";
	username = "";
	buyNowPrice = "";
	endDate = "";
	lastBidUser = "";

	card = NULL;
}

Auction::~Auction() {
	openingBid = "";
	price = "";
	userCardId = "";
	auctionCardId = "";
	username = "";
	buyNowPrice = "";
	endDate = "";
	lastBidUser = "";
	if (card != NULL) {
		delete card;
		card = NULL;
	}
}

String Auction::getOpeningBid() {
	return openingBid;
}

void Auction::setOpeningBid(const char *o) {
	openingBid = o;
}

String Auction::getPrice() {
	return price;
}

void Auction::setPrice(const char *p) {
	price = p;
}

String Auction::getUserCardId() {
	return userCardId;
}

void Auction::setUserCardId(const char *u) {
	userCardId = u;
}

String Auction::getAuctionCardId() {
	return auctionCardId;
}

void Auction::setAuctionCardId(const char *a) {
	auctionCardId = a;
}

String Auction::getBuyNowPrice() {
	return buyNowPrice;
}

void Auction::setBuyNowPrice(const char *b) {
	buyNowPrice = b;
}

String Auction::getUsername() {
	return username;
}

void Auction::setUsername(const char *u) {
	username = u;
}

String Auction::getEndDate() {
	return endDate;
}

void Auction::setEndDate(const char *e) {
	endDate = e;
}

String Auction::getLastBidUser() {
	return lastBidUser;
}

void Auction::setLastBidUser(const char *l) {
	lastBidUser = l;
}

Card* Auction::getCard() {
	return card;
}

void Auction::setCard(Card* c) {
	card = c;
}
