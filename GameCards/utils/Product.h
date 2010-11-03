#ifndef _PRODUCT_H_
#define _PRODUCT_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class Product  {
public:
	Product();
	Product(const char *id, const char *name,
			const char *description, const char *thumb,
			const char *price, const char *currency);

	String getId();
	void setId(const char *id);

	String getName();
	void setName(const char *name);

	String getDescription();
	void setDescription(const char *description);

	String getThumb();
	void setThumb(const char *thumb);

	String getPrice();
	void setPrice(const char *price);

	String getCurrency();
	void setCurrency(const char *currency);

	String getDetailsString();
private:
	String id, name, description, thumb, price, currency;
};

#endif	//_PRODUCT_H_
