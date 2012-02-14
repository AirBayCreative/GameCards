#include "Contact.h"

Contact::Contact() {
	name = "";
	number = "";
}

Contact::Contact(String name, String number):name(name), number(number) {
}

Contact::~Contact() {
	name = "";
	number = "";
}

String Contact::getName() {
	return name;
}

void Contact::setName(const char *n) {
	name = n;
}

String Contact::getNumber() {
	return number;
}

void Contact::setNumber(const char *n) {
	number = n;
}
