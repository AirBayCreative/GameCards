#include "NativeEditBox.h"
#include <mastdlib.h>
#include <mavsprintf.h>
#include <mawvsprintf.h>
#include <maassert.h>
#include "../../utils/Util.h"

namespace MAUI {

void NativeEditBox::textBoxClosed(int res, int length) {
	if(res == MA_TB_RES_OK) {
		String str;
		str.resize(length);
		sprintf(str.pointer(), "%S", mString);
		setCaption(str);
		requestRepaint();
		if(mListener != NULL) {
			mListener->nativeEditFinished();
		}
	}
	mListener = NULL;
	Environment::getEnvironment().removeTextBoxListener(this);
}

NativeEditBox::NativeEditBox(int x, int y, int width, int height, int maxSize, int options, Widget *parent,
	const String& initialText, const WString& titleString) :
	EditBox(x, y, width, height, parent),
mTitleString(titleString),
mString(NULL),
mOptions(options), x(x), y(y), width(width), height(height)
{
	setMaxSize(maxSize);
	setCaption(initialText);
	Environment::getEnvironment().addPointerListener(this);
}

NativeEditBox::~NativeEditBox() {
	Environment::getEnvironment().removePointerListener(this);
	if(mString)
	{
		delete mString;
		mString = NULL;
	}
}

void NativeEditBox::setOptions(int options) {
	mOptions = options;
}

void NativeEditBox::disableListener(){
	Environment::getEnvironment().removePointerListener(this);
}

void NativeEditBox::setMaxSize(int size) {
	if(mString) delete mString;
	mString = new wchar_t[size];
	mMaxSize = size;
}

bool NativeEditBox::pointerPressed(MAPoint2d p, int id) {
	mStartX = p.x;
	mStartY = p.y;
	return true;
}

bool NativeEditBox::pointerMoved(MAPoint2d p, int id) {
	p.x-=mStartX;
	p.y-=mStartY;
	if((abs(p.x)<7) && (abs(p.y)<7)) return true;
	else return false;
}

bool NativeEditBox::pointerReleased(MAPoint2d p, int id) {
	activate();
	return false;
}
void NativeEditBox::pointerPressEvent(MAPoint2d point)
{
}

void NativeEditBox::pointerMoveEvent(MAPoint2d point)
{
}

void NativeEditBox::pointerReleaseEvent(MAPoint2d point)
{
	if (point.y < scrHeight-48) {
		if(this->isActive()&&this->contains(point.x, point.y)) {
			activate();
		}
	}
}

void NativeEditBox::activate(NativeEditBoxListener* listener) {
	mListener = listener;
	wsprintf(mString, L"%s",getCaption().c_str());
	int res = maTextBox((const wchar*)mTitleString.c_str(), (wchar*)mString,
		(wchar*)mString, mMaxSize, mOptions);
	if(res < 0) {
		PANIC_MESSAGE("maTextBox failed");
	}
	Environment::getEnvironment().addTextBoxListener(this);
}

void NativeEditBox::setTitleString(const WString& titleString) {
	mTitleString = titleString;
}
const WString& NativeEditBox::getTitleString() const {
	return mTitleString;
}

void NativeEditBox::setCaption(const String& caption) {
	if(caption.length() > mMaxSize) {
		setMaxSize(caption.length()+1);
	}
	//Label::setCaption(caption);
	EditBox::setText("");
	EditBox::setText(caption);
	EditBox::moveCursorHorizontal(caption.length(), false);
}

} // namespace MAUI
