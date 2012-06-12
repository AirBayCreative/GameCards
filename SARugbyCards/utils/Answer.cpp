#include "Answer.h"

Answer::Answer() {
	answerid = "";
	detailid = "";
	desc = "";
	answer = "";
	answered = -1;
	creditvalue = "";
	editbox=NULL;
}

Answer::~Answer() {
	answerid = "";
	detailid = "";
	desc = "";
	answer = "";
	creditvalue = "";
	editbox=NULL;
}

String Answer::getAnswerId() {
	return answerid;
}
void Answer::setAnswerId(const char *ansid) {
	answerid = ansid;
}

String Answer::getDesc() {
	return desc;
}
void Answer::setDesc(const char *des) {
	desc = des;
}

String Answer::getAnswer() {
	return answer;
}

void Answer::setAnswer(const char *answe) {
	answer = answe;
}

int Answer::getAnswered() {
	return answered;
}

void Answer::setAnswered(int answere) {
	answered = answere;
}

String Answer::getCreditValue() {
	return creditvalue;
}

void Answer::setCreditValue(const char *creditvalu) {
	creditvalue = creditvalu;
}

NativeEditBox* Answer::getEditBoxPointer() {
	return editbox;
}

void Answer::setEditBoxPointer(NativeEditBox* editbo) {
	editbox = editbo;
}

CheckBox* Answer::getCheckBoxPointer() {
	return checkbox;
}

void Answer::setCheckBoxPointer(CheckBox* checkbo) {
	checkbox = checkbo;
}
