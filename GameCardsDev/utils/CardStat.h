#ifndef _CARDSTAT_H_
#define _CARDSTAT_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class CardStat  {
public:
	CardStat();
	CardStat(const char *cardStatId, const char *statType,
			const char *statDescription);

	String getCardStatId();
	void setCardStatId(const char *cardStatId);

	String getStatDescription();
	void setStatDescription(const char *statDescription);

	String getStatType();
	void setStatType(const char *statType);

	String toString();
private:
	String cardStatId, statDescription, statType;
};

#endif	//_CARDSTAT_H_
