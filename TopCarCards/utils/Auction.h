#ifndef _AUCTION_H_
#define _AUCTION_H_

#include <MAUtil/String.h>

#include "Card.h"

using namespace MAUtil;

class Auction  {
public:
	Auction();
	~Auction();

	String getOpeningBid();
	void setOpeningBid(const char *openingBid);

	String getPrice();
	void setPrice(const char *price);

	String getUserCardId();
	void setUserCardId(const char *userCardId);

	String getAuctionCardId();
	void setAuctionCardId(const char *auctionCardId);

	String getUsername();
	void setUsername(const char *username);

	String getBuyNowPrice();
	void setBuyNowPrice(const char *buyNowPrice);

	String getEndDate();
	void setEndDate(const char *endDate);

	String getLastBidUser();
	void setLastBidUser(const char *lastBidUser);

	Card* getCard();
	void setCard(Card* card);
private:
	String openingBid, price, userCardId, auctionCardId, username, buyNowPrice, endDate, lastBidUser;
	Card *card;
};

#endif
