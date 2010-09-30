#ifndef MOBEDITBOX_H_
#define MOBEDITBOX_H_

#include <MAUtil/Moblet.h>
#include <MAUI/Widget.h>
#include <MAUI/EditBox.h>
#include <MAUtil/util.h>

using namespace MAUtil;
using namespace MAUI;

class MobEditBox : public EditBox
{
	public:

	MobEditBox(int x, int y, int width, int height, Widget* parent, const String &text="",
			int backColor=0, Font* font=NULL, bool manageNavigation=false, bool multiLine=false,
			int maxLength=64, InputMode inputMode=IM_STANDARD);
	~MobEditBox();

	bool getMultiline();
	virtual bool supportsVKeyboard() const;

	virtual void setText(const String& text);
	void moveCursorToEnd();

	bool isPasswordMode();

	protected:

	virtual void drawWidget();

	private:
};

#endif /* MOBEDITBOX_H_ */
