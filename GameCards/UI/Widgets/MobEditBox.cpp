#include "MobEditBox.h"

MobEditBox::MobEditBox(int x, int y, int width, int height, Widget* parent, const String &text,
		int backColor, Font* font, bool manageNavigation, bool multiLine,
		int maxLength, InputMode inputMode)
	: EditBox(x, y, width, height, parent, text, backColor, font,
			manageNavigation, multiLine, maxLength, inputMode)
{

}

MobEditBox::~MobEditBox() {}

bool MobEditBox::getMultiline()
{
	return multiLine;
}

void MobEditBox::drawWidget()
{
	EditBox::drawWidget();
}

bool MobEditBox::supportsVKeyboard() const
{
	return true;
}

void MobEditBox::setText(const String& text)
{
	EditBox::setText(text);
	moveCursorToEnd();
}

void MobEditBox::moveCursorToEnd()
{
	String s = getText();
	EditBox::setText("  ");
	EditBox::setText(s);
	moveCursorHorizontal(s.length(), false);
}

bool MobEditBox::isPasswordMode()
{
	return passwordMode;
}
