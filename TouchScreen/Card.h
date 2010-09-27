#ifndef _CARD_H_
#define _CARD_H_

#include <MAUtil/String.h>
#include <MAUtil/Map.h>

using namespace MAUtil;

class Card  {
public:
	String getQuantity();
	void setQuantity(const char *name);

	String getText();
	void setText(const char *text);

	String getThumb();
	void setThumb(const char *thumb);

	String getFront();
	void setFront(const char *front);

	String getBack();
	void setBack(const char *back);

	String getId();
	void setId(const char *id);

	String getRate();
	void setRate(const char *rate);

	String getValue();
	void setValue(const char *value);

	bool getLoaded();
	void setLoaded(bool load);

	String getAll();
	void setAll(const char*);
private:
	String quantity, text, thumb, front, back, id, rate, value;
	bool loaded;
};

#endif	//_CARD_H_
