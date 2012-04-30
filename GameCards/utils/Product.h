#ifndef _PRODUCT_H_
#define _PRODUCT_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class Product  {
public:
	Product();
	Product(const char *id, const char *name,
			const char *productType, const char *thumb,
			const char *price, const char *cardsInPack, const char *premium);
	~Product();

	String getId();
	void setId(const char *id);

	String getName();
	void setName(const char *name);

	String getProductType();
	void setProductType(const char *productType);

	String getThumb();
	void setThumb(const char *thumb);

	String getPrice();
	void setPrice(const char *price);

	String getCurrency();
	void setCurrency(const char *currency);

	String getCardsInPack();
	void setCardsInPack(const char *cardsInPack);

	String getFormattedPrice();

	String getDetailsString();

	String getPremium();
	void setPremium(const char *premium);
private:
	String id, name, productType, thumb, price, cardsInPack, premium;
};

#endif	//_PRODUCT_H_
