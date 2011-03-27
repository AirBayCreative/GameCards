#ifndef _STAT_H_
#define _STAT_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class Stat  {
public:
	Stat();

	String getDesc();
	void setDesc(const char *name);

	String getDisplay();
	void setDisplay(const char *display);

	String getIVal();
	void setIVal(const char *iVal);
private:
	String desc, display, iVal;
};

#endif	//_STAT_H_
