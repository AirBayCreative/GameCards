#include "Log.h"

Log::Log() {
	date = "";
	description = "";
}

Log::Log(const char *date, const char *description) : date(date), description(description){
}

Log::~Log() {
	date = "";
	description = "";
}

String Log::getDate() {
	return date;
}

void Log::setDate(const char *d) {
	date = d;
}

String Log::getDescription() {
	return description;
}

void Log::setDescription(const char *d) {
	description = d;
}
