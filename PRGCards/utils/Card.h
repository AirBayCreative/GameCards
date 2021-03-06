#ifndef _CARD_H_
#define _CARD_H_

#include <MAUtil/String.h>

using namespace MAUtil;

class Card  {
public:
	Card();
	~Card();

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

	String getFullDesc();
	void setFullDesc(const char *fullDesc);

	String getGamePlayerCardId();
	void setGamePlayerCardId(const char *gamePlayerCardId);

	String getNote();
	void setNote(const char *note);

	bool getLoaded();
	void setLoaded(bool load);

	bool getUpdated();
	void setUpdated(bool update);

	String getAll();
	void setAll(const char*);
private:
	//the note is generally saved in base64
	String quantity, text, thumb, front, back, id, rate, value, fullDesc, gamePlayerCardId, note;
	bool loaded, updated;
};

#endif	//_CARD_H_
