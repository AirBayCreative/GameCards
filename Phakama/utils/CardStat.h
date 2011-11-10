#ifndef _CARDSTAT_H_
#define _CARDSTAT_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class CardStat  {
public:
	CardStat();
	~CardStat();
	CardStat(const char *cardStatId, const char *statType,
			const char *statDescription);

	String getCardStatId();
	void setCardStatId(const char *cardStatId);

	String getStatDescription();
	void setStatDescription(const char *statDescription);

	String getStatType();
	void setStatType(const char *statType);

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

	String toString();
private:
	String cardStatId, statDescription, statType;
	int top, left, width, height, frontOrBack;
};

#endif	//_CARDSTAT_H_
