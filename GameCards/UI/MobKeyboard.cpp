#include <MAUtil/Moblet.h>
#include <conprint.h> //TODO rem

#include "MobKeyboard.h"
#include "Widgets/MobEditBox.h"
#include "../utils/MAHeaders.h"
#include "../utils/Util.h"

MobKeyboard::MobKeyboard(int x, int y, int width, int height)
	: Widget(x, y, width, height, NULL)
{
	shouldDrawBackground = true;
	m_isShown = false;
	m_layouts = new Vector<MobKeyboardLayout*>();
	m_attachedWidget = NULL;
	m_activeLayout = -1;

	m_backgroundColor = 0x262626;
	m_buttonColor = 0xDADAEB;
	m_buttonPressedColor = 0xAEAED2;
	m_buttonBorderColor = 0x7873A8;

	setupKeys();
	m_activeLayout = 0;

	m_attachedScreen = NULL;
	screenFunction = NULL;
}

MobKeyboard::~MobKeyboard()
{
	for (int i=m_layouts->size()-1; i>=0; i--)
	{
		MobKeyboardLayout* l_layout = (*m_layouts)[i];
		m_layouts->remove(i);
		delete l_layout;
		l_layout = NULL;
	}

	delete m_layouts;
	m_layouts = NULL;
}

void MobKeyboard::addLanguage(MobKeyboardLayout* a_lowercase, MobKeyboardLayout* a_uppercase,
		MobKeyboardLayout* a_num1, MobKeyboardLayout* a_num2)
{
	m_layouts->add(a_lowercase);
	m_layouts->add(a_uppercase);
	m_layouts->add(a_num1);
	m_layouts->add(a_num2);
}

bool MobKeyboard::isShown()
{
	return m_isShown;
}

void MobKeyboard::show()
{
	m_isShown = true;
	Environment::getEnvironment().addPointerListener(this);

	drawWidget();
}

void MobKeyboard::hide()
{
	last_pressed->setPressed(false);
	if (m_isShown) {
		Environment::getEnvironment().removePointerListener(this);
		Engine::getSingleton().hideOverlay();
	}
	m_isShown = false;
	m_attachedWidget = NULL;
}

void MobKeyboard::drawWidget()
{
	if (!m_isShown)
		return;

	if ((m_activeLayout < 0) || (m_activeLayout >= m_layouts->size()))
		return;

	Engine::getSingleton().showOverlay(0, 0, this);

	Rect l_bounds = this->getBounds();
	maSetClipRect(l_bounds.x, l_bounds.y, l_bounds.width, l_bounds.height);

	if (shouldDrawBackground) {
		gSkinButton->draw(
			0, 0,
			l_bounds.width, l_bounds.height, WidgetSkin::UNSELECTED);
		/*maSetColor(m_backgroundColor);
		maFillRect(l_bounds.x, l_bounds.y, l_bounds.width, l_bounds.height);*/
	}


	/*maSetColor(m_buttonBorderColor);
	maLine(l_bounds.x, l_bounds.y, l_bounds.x + l_bounds.width, l_bounds.y);
	maLine(l_bounds.x, l_bounds.y + l_bounds.height-1, l_bounds.x + l_bounds.width, l_bounds.y + l_bounds.height-1);*/

	for (int i=0; i<(*m_layouts)[m_activeLayout]->getButtons()->size(); i++)
	{
		MobKeyboardButton* l_button = (*(*m_layouts)[m_activeLayout]->getButtons())[i];
		Rect l_rect = l_button->getBounds();
		l_rect.y = l_rect.y + l_bounds.y; // initially the keyboard was positioned at point 0, 0

		if (l_button->getCharacter() == "")
			continue;

		bool l_isPressed = false;

		if ((l_button->getCharacter() == "Sh") &&
			(((*m_layouts)[m_activeLayout]->getLayoutType() == LT_UPPERCASE) ||
			 ((*m_layouts)[m_activeLayout]->getLayoutType() == LT_NUM2)))
		{
			l_isPressed = true;
		}
		else if ((l_button->getCharacter() == "Num") &&
			(((*m_layouts)[m_activeLayout]->getLayoutType() == LT_NUM1) ||
			 ((*m_layouts)[m_activeLayout]->getLayoutType() == LT_NUM2)))
		{
			l_isPressed = true;
		}
		else if (l_button->isPressed()) {
			l_isPressed = true;
		}

		// draw button background
		if (gSkinKeyboard != NULL)
		{
			if (l_isPressed)
				gSkinKeyboard->draw(
						l_rect.x - l_bounds.x, l_rect.y - l_bounds.y,
						l_rect.width, l_rect.height - 1, WidgetSkin::SELECTED);
			else
				gSkinKeyboard->draw(
						l_rect.x - l_bounds.x, l_rect.y - l_bounds.y,
						l_rect.width, l_rect.height - 1, WidgetSkin::UNSELECTED);
		}
		else
		{
			if (l_isPressed)
				maSetColor(m_buttonPressedColor);
			else
				maSetColor(m_buttonColor);

			maFillRect(l_rect.x, l_rect.y, l_rect.width, l_rect.height);

			maSetColor(m_buttonBorderColor);
			maLine(l_rect.x, l_rect.y, l_rect.x + l_rect.width -1, l_rect.y);
			maLine(l_rect.x, l_rect.y + l_rect.height -1, l_rect.x + l_rect.width -1, l_rect.y + l_rect.height -1);
			maLine(l_rect.x, l_rect.y, l_rect.x, l_rect.y + l_rect.height -1);
			maLine(l_rect.x + l_rect.width -1, l_rect.y, l_rect.x + l_rect.width -1, l_rect.y + l_rect.height -1);
		}

		// draw text (x, y are local)
		MAExtent l_strDimensions = gFontWhite->getStringDimensions(
				l_button->getCharacter().pointer(), l_button->getCharacter().length());
		gFontWhite->drawString(l_button->getCharacter().pointer(),
				l_button->getCharLocation().x + (l_rect.width / 2) - (EXTENT_X(l_strDimensions) / 2),
				l_button->getCharLocation().y + (l_rect.height / 2) - (EXTENT_Y(l_strDimensions) / 2));

		/*printf("l_button->getCharLocation().y: %d", l_button->getCharLocation().y);
		printf("l_rect.height / 2: %d", l_rect.height / 2);
		printf("EXTENT_Y(l_strDimensions) / 2: %d", (EXTENT_Y(l_strDimensions) / 2));*/
	}
}

void MobKeyboard::addButtonLine(MobKeyboardLayout* a_layout, int a_lineHeight, int a_buttonCount, String a_lineChars[],
		int a_buttonWidth, int a_buttonHeight, int a_leftLinePadding, int a_rightLinePadding)
{
	Rect l_bounds = this->getBounds();
	l_bounds.y = 0; //hack

	//todo the scaling here was commented out to try get it running, should be worked out still
	int l_buttonWidth = (int) floor(((double) a_buttonWidth) * getHorzScale());
	int l_buttonHeight = (int) floor(((double) a_buttonHeight) * getVertScale());
	int l_leftPadding = (int) floor(((double) a_leftLinePadding) * getHorzScale());
	int l_rightPadding = (int) floor(((double) a_rightLinePadding) * getVertScale());
	int l_currentHeight = (int) floor(((double) a_lineHeight) * getVertScale());

	int l_startingIndex = a_layout->getButtons()->size();

	int l_sumButtonWidth = 0;
	for (int i=0; i<a_buttonCount; i++)
	{
		Rect l_buttonBounds;
		if (a_lineChars[i] == "Sh")
			l_buttonBounds = Rect(0, 0, (int) floor((double)l_buttonWidth*1.5), l_buttonHeight);
		else if (a_lineChars[i] == "Bs")
			l_buttonBounds = Rect(0, 0, (int) floor((double)l_buttonWidth*1.5), l_buttonHeight);
		else if (a_lineChars[i] == "Hide")
			l_buttonBounds = Rect(0, 0, (int) floor((double)l_buttonWidth*2.0), l_buttonHeight);
		else if (a_lineChars[i] == "Lang")
			l_buttonBounds = Rect(0, 0, (int) floor((double)l_buttonWidth*1.7), l_buttonHeight);
		else if (a_lineChars[i] == "Space")
			l_buttonBounds = Rect(0, 0, (int) floor((double)l_buttonWidth*3.0), l_buttonHeight);
		else if (a_lineChars[i] == "Num")
			l_buttonBounds = Rect(0, 0, (int) floor((double)l_buttonWidth*1.7), l_buttonHeight);
		else if (a_lineChars[i] == "Enter")
			l_buttonBounds = Rect(0, 0, (int) floor((double)l_buttonWidth*2.0), l_buttonHeight);
		else
			l_buttonBounds = Rect(0, 0, l_buttonWidth, l_buttonHeight);

		l_sumButtonWidth += l_buttonBounds.width;

		MobKeyboardButton* l_button = new MobKeyboardButton(l_buttonBounds, a_lineChars[i], Point(0, 0));
		a_layout->getButtons()->add(l_button);
	}

	int l_buttonLineWidth = l_bounds.width - l_rightPadding - l_leftPadding;
	int l_totalSpacingWidth = l_buttonLineWidth - l_sumButtonWidth;
	int l_singleSpacingWidth = (int) floor((double) (l_buttonLineWidth - l_sumButtonWidth) / (double) (a_buttonCount));

	int l_currentWidth = l_leftPadding + (l_singleSpacingWidth / 2);
	for (int i=l_startingIndex; i<a_layout->getButtons()->size(); i++)
	{
		MobKeyboardButton* l_button = (*a_layout->getButtons())[i];
		l_button->updatePosition(Point(l_currentWidth, l_currentHeight),
				Point(l_currentWidth - l_bounds.x, l_currentHeight - l_bounds.y));

		l_currentWidth += l_button->getBounds().width + l_singleSpacingWidth;
	}
	//printf("l_currentHeight: %d\nl_bounds.y: %d", l_currentHeight, l_bounds.y);
}

String MobKeyboard::getClickedCharacter(MAPoint2d a_clickPoint, bool setLastClicked)
{
	for (int i=0; i<(*m_layouts)[m_activeLayout]->getButtons()->size(); i++)
	{
		MobKeyboardButton* l_button = (*(*m_layouts)[m_activeLayout]->getButtons())[i];
		Rect l_rect = l_button->getBounds();
		l_rect.y = l_rect.y + getBounds().y; // initially the keyboard was positioned at point 0, 0

		if ((a_clickPoint.x >= l_rect.x) &&
			(a_clickPoint.x <= l_rect.x + l_rect.width) &&
			(a_clickPoint.y >= l_rect.y) &&
			(a_clickPoint.y <= l_rect.y + l_rect.height))
		{
			if (setLastClicked) {
				last_pressed = l_button;
				last_pressed->setPressed(true);
			}
			return l_button->getCharacter();
		}
	}

	return "";
}

void MobKeyboard::pointerPressEvent(MAPoint2d p)
{
	getClickedCharacter(p, true);
	requestRepaint();
}

void MobKeyboard::pointerMoveEvent(MAPoint2d p)
{

}

void MobKeyboard::pointerReleaseEvent(MAPoint2d p)
{
	// if the click is outside the keyboard do nothing and return
	if ((p.y < getBounds().y) || (p.y > getBounds().y + getBounds().height))
		return;

	last_pressed->setPressed(false);

	String l_char = getClickedCharacter(p);

	if (l_char == "Sh")
	{
		toggleShift();
	}
	else if (l_char == "Bs")
	{
		/*if (m_attachedWidget->getClassName() == "MobEditBox")
		{*/
			String s = ((MobEditBox*) m_attachedWidget)->getText();
			if (s.length() > 0)
			{
				bool isPasswordMode = ((MobEditBox*) m_attachedWidget)->isPasswordMode();
				if (isPasswordMode) {
					((MobEditBox*) m_attachedWidget)->setPasswordMode(FALSE);
				}

				((MobEditBox*) m_attachedWidget)->moveCursorHorizontal(-1, true);
				s.remove(((MobEditBox*) m_attachedWidget)->getText().length()-1, 1);
				((MobEditBox*) m_attachedWidget)->setText(s);

				if (isPasswordMode) {
					((MobEditBox*) m_attachedWidget)->setPasswordMode(TRUE);
				}
			}
			else {
				requestRepaint();
			}
		//}
	}
	else if (l_char == "Hide")
	{
		//MobileApplication::Instance()->hideKeyboard();
		this->hide();
		//Engine::getSingleton().hideOverlay();
	}
	else if (l_char == "Lang")
	{
		toggleLanguage();
	}
	else if (l_char == "Space")
	{
		if (m_attachedWidget != NULL)
		{
			/*if (m_attachedWidget->getClassName() == "MobEditBox")
			{*/
				((MobEditBox*) m_attachedWidget)->setText(((MobEditBox*) m_attachedWidget)->getText() + " ");
				((MobEditBox*) m_attachedWidget)->moveCursorHorizontal(1, true);
			//}
		}
	}
	else if (l_char == "Num")
	{
		toggleNum();
	}
	else if (l_char == "Enter")
	{
		if (m_attachedWidget != NULL && ((MobEditBox*) m_attachedWidget)->isMultiLine())
		{
			((MobEditBox*) m_attachedWidget)->setText(((MobEditBox*) m_attachedWidget)->getText() + "\n");
			((MobEditBox*) m_attachedWidget)->moveCursorHorizontal(1, true);
		}
		else {
			requestRepaint();
		}
	}
	else
	{
		if (m_attachedWidget != NULL)
		{
			bool isPasswordMode = ((MobEditBox*) m_attachedWidget)->isPasswordMode();
			if (isPasswordMode) {
				((MobEditBox*) m_attachedWidget)->setPasswordMode(FALSE);
			}

			//printf("l_char: %s", l_char.pointer());

			((MobEditBox*) m_attachedWidget)->setText(((MobEditBox*) m_attachedWidget)->getText() + l_char);
			((MobEditBox*) m_attachedWidget)->moveCursorHorizontal(1, true);

			if (isPasswordMode) {
				((MobEditBox*) m_attachedWidget)->setPasswordMode(TRUE);
			}
		}
	}
}

void MobKeyboard::attachScreen(Screen* screen) {
	m_attachedScreen = screen;
}

void MobKeyboard::deAttachScreen() {
	m_attachedScreen = NULL;
}

void MobKeyboard::setScreenFunction(void (Screen::*screenFunc)(int)){
	screenFunction = screenFunc;
}

void MobKeyboard::clearScreenFunction() {
	screenFunction = NULL;
}

void MobKeyboard::attachWidget(Widget* a_widget)
{
	m_attachedWidget = a_widget;
}

void MobKeyboard::deAttachEditBox()
{
	m_attachedWidget = NULL;
}

Widget* MobKeyboard::getAttachedWidget() {
	return m_attachedWidget;
}

double MobKeyboard::getHorzScale() const
{
	return (double) getWidth() / (double) VIRTUAL_KEYBOARD_WIDTH;
}

double MobKeyboard::getVertScale() const
{
	return (double) getHeight() / (double) VIRTUAL_KEYBOARD_HEIGHT;
}

void MobKeyboard::setActiveLayout(const String& a_layoutName)
{
	for (int i=0; i<m_layouts->size(); i--)
	{
		if ((*m_layouts)[i]->getUniqueIdentifier() == a_layoutName)
		{
			m_activeLayout = i;
			requestRepaint();
			break;
		}
	}
}

void MobKeyboard::setActiveLayout(const String& a_language, MobKeyboard::LayoutType a_layoutType)
{
	for (int i=0; i<m_layouts->size(); i++)
	{
		if (((*m_layouts)[i]->getLanguage() == a_language) &&
			((*m_layouts)[i]->getLayoutType() == a_layoutType))
		{
			m_activeLayout = i;
			requestRepaint();
			break;
		}
	}
}

void MobKeyboard::toggleShift()
{
	if ((m_activeLayout < 0) || (m_activeLayout >= m_layouts->size()))
		return;

	String l_activeLanguage = (*m_layouts)[m_activeLayout]->getLanguage();
	MobKeyboard::LayoutType a_activeLayoutType = (*m_layouts)[m_activeLayout]->getLayoutType();

	if (a_activeLayoutType == MobKeyboard::LT_LOWERCASE)
		setActiveLayout(l_activeLanguage, MobKeyboard::LT_UPPERCASE);
	else if (a_activeLayoutType == MobKeyboard::LT_UPPERCASE)
		setActiveLayout(l_activeLanguage, MobKeyboard::LT_LOWERCASE);
	else if (a_activeLayoutType == MobKeyboard::LT_NUM1)
		setActiveLayout(l_activeLanguage, MobKeyboard::LT_NUM2);
	else if (a_activeLayoutType == MobKeyboard::LT_NUM2)
		setActiveLayout(l_activeLanguage, MobKeyboard::LT_NUM1);
}

void MobKeyboard::toggleNum()
{
	if ((m_activeLayout < 0) || (m_activeLayout >= m_layouts->size()))
		return;

	String l_activeLanguage = (*m_layouts)[m_activeLayout]->getLanguage();
	MobKeyboard::LayoutType a_activeLayoutType = (*m_layouts)[m_activeLayout]->getLayoutType();

	if (a_activeLayoutType == MobKeyboard::LT_LOWERCASE)
		setActiveLayout(l_activeLanguage, MobKeyboard::LT_NUM1);
	else if (a_activeLayoutType == MobKeyboard::LT_UPPERCASE)
		setActiveLayout(l_activeLanguage, MobKeyboard::LT_NUM2);
	else if (a_activeLayoutType == MobKeyboard::LT_NUM1)
		setActiveLayout(l_activeLanguage, MobKeyboard::LT_LOWERCASE);
	else if (a_activeLayoutType == MobKeyboard::LT_NUM2)
		setActiveLayout(l_activeLanguage, MobKeyboard::LT_UPPERCASE);
}

void MobKeyboard::toggleLanguage()
{
	if ((m_activeLayout < 0) || (m_activeLayout >= m_layouts->size()))
		return;

	// if only one language set is available then return
	if (m_layouts->size() <= 4)
		return;

	if (m_activeLayout + 4 >= m_layouts->size())
		m_activeLayout = m_activeLayout % 4;
	else
		m_activeLayout = m_activeLayout + 4;

	requestRepaint();
}

void MobKeyboard::setupKeys()
{
	int l_buttonWidth = 21;
	int l_buttonHeight = 25;

	/********* English *********/

	// layout 1: english - lowecase
	MobKeyboardLayout* l_layout1 = new MobKeyboardLayout("en_lower", "English", MobKeyboard::LT_LOWERCASE);

	String l_l1_line1Chars[10] = {"q","w","e","r","t","y","u","i","o","p"};
	String l_l1_line2Chars[9] = {"a","s","d","f","g","h","j","k","l"};
	String l_l1_line3Chars[9] = {"Sh","z","x","c","v","b","n","m","Bs"};
	String l_l1_line4Chars[5] = {"Hide","Lang","Space","Num","Enter"};

	addButtonLine(l_layout1, 10, 10, l_l1_line1Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_layout1, 40, 9, l_l1_line2Chars, l_buttonWidth, l_buttonHeight, 10, 10);
	addButtonLine(l_layout1, 70, 9, l_l1_line3Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_layout1, 100, 5, l_l1_line4Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	//


	// layout 2: english - uppercase
	MobKeyboardLayout* l_layout2 = new MobKeyboardLayout("en_upper", "English", MobKeyboard::LT_UPPERCASE);

	String l_l2_line1Chars[10] = {"Q","W","E","R","T","Y","U","I","O","P"};
	String l_l2_line2Chars[9] = {"A","S","D","F","G","H","J","K","L"};
	String l_l2_line3Chars[9] = {"Sh","Z","X","C","V","B","N","M","Bs"};
	String l_l2_line4Chars[5] = {"Hide","Lang","Space","Num","Enter"};

	addButtonLine(l_layout2, 10, 10, l_l2_line1Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_layout2, 40, 9, l_l2_line2Chars, l_buttonWidth, l_buttonHeight, 10, 10);
	addButtonLine(l_layout2, 70, 9, l_l2_line3Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_layout2, 100, 5, l_l2_line4Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	//


	// layout 3: english - num1
	MobKeyboardLayout* l_layout3 = new MobKeyboardLayout("en_num1", "English", MobKeyboard::LT_NUM1);

	String l_l3_line1Chars[10] = {"1","2","3","4","5","6","7","8","9","0"};
	String l_l3_line2Chars[9] = {".",",","+","-","!","?","@","&","/"};
	String l_l3_line3Chars[9] = {"Sh","_","*","'",";","(",")",":","Bs"};
	String l_l3_line4Chars[5] = {"Hide","Lang","Space","Num","Enter"};

	addButtonLine(l_layout3, 10, 10, l_l3_line1Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_layout3, 40, 9, l_l3_line2Chars, l_buttonWidth, l_buttonHeight, 10, 10);
	addButtonLine(l_layout3, 70, 9, l_l3_line3Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_layout3, 100, 5, l_l3_line4Chars, l_buttonWidth, l_buttonHeight, 5, 5);


	// layout 4: english - num2
	MobKeyboardLayout* l_layout4 = new MobKeyboardLayout("en_num2", "English", MobKeyboard::LT_NUM2);

	String l_l4_line1Chars[10] = {"=","<",">","{","}","[","]","£","$","€"};
	String l_l4_line2Chars[9] = {"¥","~","^","%","\"","†","#","‰","\\"};
	String l_l4_line3Chars[9] = {"Sh","©","|","`","±","½","«","»","Bs"};
	String l_l4_line4Chars[5] = {"Hide","Lang","Space","Num","Enter"};

	addButtonLine(l_layout4, 10, 10, l_l4_line1Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_layout4, 40, 9, l_l4_line2Chars, l_buttonWidth, l_buttonHeight, 10, 10);
	addButtonLine(l_layout4, 70, 9, l_l4_line3Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_layout4, 100, 5, l_l4_line4Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	//

	/********* English *********/


	/********* Greek *********/

	// layout 1: greek - lowecase
	MobKeyboardLayout* l_grLayout1 = new MobKeyboardLayout("gr_lower", "Greek", MobKeyboard::LT_LOWERCASE);

	String l_grl1_line1Chars[10] = {";","ò","å","ñ","ô","õ","è","é","ï","ð"};
	String l_grl1_line2Chars[9] = {"á","ó","ä","ö","ã","ç","î","ê","ë"};
	String l_grl1_line3Chars[9] = {"Sh","æ","÷","ø","ù","â","í","ì","Bs"};
	String l_grl1_line4Chars[5] = {"Hide","Lang","Space","Num","Enter"};

	addButtonLine(l_grLayout1, 10, 10, l_grl1_line1Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_grLayout1, 40, 9, l_grl1_line2Chars, l_buttonWidth, l_buttonHeight, 10, 10);
	addButtonLine(l_grLayout1, 70, 9, l_grl1_line3Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_grLayout1, 100, 5, l_grl1_line4Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	//


	// layout 2: greek - uppercase
	MobKeyboardLayout* l_grLayout2 = new MobKeyboardLayout("gr_upper", "Greek", MobKeyboard::LT_UPPERCASE);

	String l_grl2_line1Chars[10] = {";","ò","Å","Ñ","Ô","Õ","È","É","Ï","Ð"};
	String l_grl2_line2Chars[9] = {"Á","Ó","Ä","Ö","Ã","Ç","Î","Ê","Ë"};
	String l_grl2_line3Chars[9] = {"Sh","Æ","×","Ø","Ù","Â","Í","Ì","Bs"};
	String l_grl2_line4Chars[5] = {"Hide","Lang","Space","Num","Enter"};

	addButtonLine(l_grLayout2, 10, 10, l_grl2_line1Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_grLayout2, 40, 9, l_grl2_line2Chars, l_buttonWidth, l_buttonHeight, 10, 10);
	addButtonLine(l_grLayout2, 70, 9, l_grl2_line3Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_grLayout2, 100, 5, l_grl2_line4Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	//


	// layout 3: greek - num1
	MobKeyboardLayout* l_grLayout3 = new MobKeyboardLayout("gr_num1", "Greek", MobKeyboard::LT_NUM1);

	String l_grl3_line1Chars[10] = {"1","2","3","4","5","6","7","8","9","0"};
	String l_grl3_line2Chars[9] = {".",",","+","-","!","?","@","&","/"};
	String l_grl3_line3Chars[9] = {"Sh","_","*","'",";","(",")",":","Bs"};
	String l_grl3_line4Chars[5] = {"Hide","Lang","Space","Num","Enter"};

	addButtonLine(l_grLayout3, 10, 10, l_grl3_line1Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_grLayout3, 40, 9, l_grl3_line2Chars, l_buttonWidth, l_buttonHeight, 10, 10);
	addButtonLine(l_grLayout3, 70, 9, l_grl3_line3Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_grLayout3, 100, 5, l_grl3_line4Chars, l_buttonWidth, l_buttonHeight, 5, 5);


	// layout 4: greek - num2
	MobKeyboardLayout* l_grLayout4 = new MobKeyboardLayout("gr_num2", "Greek", MobKeyboard::LT_NUM2);

	String l_grl4_line1Chars[10] = {"=","<",">","{","}","[","]","£","$","€"};
	String l_grl4_line2Chars[9] = {"¥","~","^","%","\"","†","#","‰","\\"};
	String l_grl4_line3Chars[9] = {"Sh","©","|","`","±","½","«","»","Bs"};
	String l_grl4_line4Chars[5] = {"Hide","Lang","Space","Num","Enter"};

	addButtonLine(l_grLayout4, 10, 10, l_grl4_line1Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_grLayout4, 40, 9, l_grl4_line2Chars, l_buttonWidth, l_buttonHeight, 10, 10);
	addButtonLine(l_grLayout4, 70, 9, l_grl4_line3Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	addButtonLine(l_grLayout4, 100, 5, l_grl4_line4Chars, l_buttonWidth, l_buttonHeight, 5, 5);
	//

	/********* Greek *********/


	addLanguage(l_layout1, l_layout2, l_layout3, l_layout4);
	addLanguage(l_grLayout1, l_grLayout2, l_grLayout3, l_grLayout4);
}
