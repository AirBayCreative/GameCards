#ifndef _STAT_H_
#define _STAT_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class Stat  {
public:
	Stat();
	~Stat();

	String getCardStatId();
	void setCardStatId(const char *name);

	String getDesc();
	void setDesc(const char *name);

	String getDisplay();
	void setDisplay(const char *display);

	String getIVal();
	void setIVal(const char *iVal);

	String getCategoryStatId();
	void setCategoryStatId(const char *categoryStatId);

	String getAll();
	void setAll(const char*);

	int getTop();
	void setTop(int);

	int getLeft();
	void setLeft(int);

	int getWidth();
	void setWidth(int);

	int getHeight();
	void setHeight(int);

	int getFrontOrBack();
	void setFrontOrBack(int);

	int getColorRed();
	void setColorRed(int);

	int getColorGreen();
	void setColorGreen(int);

	int getColorBlue();
	void setColorBlue(int);

	int getSelectable();
	void setSelectable(int);
private:
	String desc, display, iVal, cardStatId, categoryStatId;
	int top, left, width, height, frontOrBack, colorRed, colorGreen, colorBlue, selectable;
};

#endif	//_STAT_H_
