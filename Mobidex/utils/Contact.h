#ifndef _CONTACT_H_
#define _CONTACT_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class Contact  {
public:
	Contact();
	Contact(String name, String number);
	~Contact();

	String getName();
	void setName(const char *name);

	String getNumber();
	void setNumber(const char *number);

private:
	String name, number;
};

#endif	//_CONTACT_H_
