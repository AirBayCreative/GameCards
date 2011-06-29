#ifndef _ANSWER_H_
#define _ANSWER_H_

#include <MAUtil/String.h>
#include "../UI/Native/NativeEditBox.h"
#include "../UI/CheckBox.h"

using namespace MAUtil;
using namespace MAUI;

class Answer  {
public:
	Answer();
	~Answer();

	String getAnswerId();
	void setAnswerId(const char *answerid);

	String getDetailId();
	void setText(const char *detailid);

	String getDesc();
	void setDesc(const char *desc);

	String getAnswer();
	void setAnswer(const char *answer);

	int getAnswered();
	void setAnswered(int answered);

	String getCreditValue();
	void setCreditValue(const char *creditvalue);

	NativeEditBox* getEditBoxPointer();
	void setEditBoxPointer(NativeEditBox * editbox);

	CheckBox* getCheckBoxPointer();
	void setCheckBoxPointer(CheckBox * checkbox);

private:
	String answerid, detailid, desc, answer, creditvalue;
	NativeEditBox * editbox;
	CheckBox * checkbox;
	int answered;
};

#endif	//_ANSWER_H_
