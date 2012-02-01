#ifndef _LOG_H_
#define _LOG_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class Log  {
public:
	Log();
	Log(const char *date, const char *description);
	~Log();

	String getDate();
	void setDate(const char *date);

	String getDescription();
	void setDescription(const char *description);
private:
	String date, description;
};

#endif	//_LOG_H_
