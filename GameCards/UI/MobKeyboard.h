#ifndef MOBKEYBOARD_H_
#define MOBKEYBOARD_H_

#include "../Header.h"

#include <MAUtil/Moblet.h>
#include <MAUI/Widget.h>
#include <MAUtil/util.h>
#include <MAUtil/HashMap.h>

#include <madmath.h>

using namespace MAUtil;
using namespace MAUI;

class MobKeyboardLayout;
class MobKeyboardButton;

class MobKeyboard : public Widget, PointerListener
{
public:

	MobKeyboard(int x, int y, int width, int height);
	~MobKeyboard();

	enum LayoutType {LT_LOWERCASE , LT_UPPERCASE, LT_NUM1, LT_NUM2};

	bool isShown();
	void show();
	void hide();

	void applyScaling();
	static int getDesignHeight() {return 135;};
	void attachWidget(Widget* a_widget);
	void deAttachEditBox();
	void setActiveLayout(const String& a_layoutName);
	void setActiveLayout(const String& a_language, MobKeyboard::LayoutType a_layoutType);
	void toggleShift();
	void toggleNum();
	void toggleLanguage();
	void addLanguage(MobKeyboardLayout* a_lowercase, MobKeyboardLayout* a_uppercase,
			MobKeyboardLayout* a_num1, MobKeyboardLayout* a_num2);
	void addButtonLine(MobKeyboardLayout* a_layout, int a_lineHeight, int a_buttonCount, String a_lineChars[],
			int a_buttonWidth, int a_buttonHeight, int a_leftLinePadding, int a_rightLinePadding);

	void attachScreen(Screen* screen);
	void deAttachScreen();
	void setScreenFunction(void (Screen::*screenFunc)(int));
	void clearScreenFunction();
protected:

	virtual void drawWidget();
	void pointerPressEvent(MAPoint2d p);
	void pointerMoveEvent(MAPoint2d p);
	void pointerReleaseEvent(MAPoint2d p);

private:

	bool m_isShown;
	Vector<MobKeyboardLayout*>* m_layouts;
	int m_activeLayout;

	int m_backgroundColor;
	int m_buttonColor;
	int m_buttonPressedColor;
	int m_buttonBorderColor;

	Widget* m_attachedWidget;
	WidgetSkin* m_keyboardSkin;

	MobKeyboardButton* last_pressed;

	void setupKeys();
	String getClickedCharacter(MAPoint2d a_clickPoint, bool setLastClicked = false);

	Screen* m_attachedScreen;
	void (Screen::*screenFunction)(int);
};


class MobKeyboardButton
{
private:
	Rect m_bounds;
	String m_character;
	Point m_charLocation;
	bool pressed;

public:
	MobKeyboardButton(const Rect& a_bounds, const String& a_character, const Point& a_charLocation)
	{
		m_bounds = a_bounds;
		m_character = a_character;
		m_charLocation = a_charLocation;

		pressed = false;
	}

	~MobKeyboardButton() {}

	Rect getBounds() const
	{
		return m_bounds;
	}

	String getCharacter() const
	{
		return m_character;
	}

	Point getCharLocation() const
	{
		return m_charLocation;
	}

	void updatePosition(const Point& a_position, const Point& a_characterPosition)
	{
		m_bounds.x = a_position.x;
		m_bounds.y = a_position.y;

		m_charLocation.x = a_characterPosition.x;
		m_charLocation.y = a_characterPosition.y;
	}

	void setPressed(const bool isPressed) {
		pressed = isPressed;
	}

	bool isPressed() {
		return pressed;
	}
};


class MobKeyboardLayout
{
public:
	MobKeyboardLayout(const String &a_uniqueIdentifier, const String &a_language, MobKeyboard::LayoutType a_layoutType)
	{
		m_uniqueIdentifier = a_uniqueIdentifier;
		m_language = a_language;
		m_layoutType = a_layoutType;
		m_buttons = new Vector<MobKeyboardButton*>();
	}

	~MobKeyboardLayout()
	{
		for (int i=m_buttons->size()-1; i>=0; i--)
		{
			MobKeyboardButton* l_button = (*m_buttons)[i];
			m_buttons->remove(i);
			delete l_button;
			l_button = NULL;
		}

		delete m_buttons;
		m_buttons = NULL;
	}

	String getUniqueIdentifier() const { return m_uniqueIdentifier; }
	String getLanguage() const { return m_language; }
	MobKeyboard::LayoutType getLayoutType() const { return m_layoutType; }
	Vector<MobKeyboardButton*>* getButtons() const { return m_buttons; }

private:
	String m_uniqueIdentifier;
	String m_language;
	MobKeyboard::LayoutType m_layoutType;
	Vector<MobKeyboardButton*>* m_buttons;
};

#endif /* MOBKEYBOARD_H_ */
