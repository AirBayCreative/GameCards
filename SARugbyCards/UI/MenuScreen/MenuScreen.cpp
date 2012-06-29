#include "MenuScreen.h"
#include "../../utils/Util.h"

MenuScreen::MenuScreen(MAHandle blank, const char *headerLabel) : mBlankImage(blank), mListener(NULL), mSkin(NULL), mFontSel(NULL), mFontUnsel(NULL),
										 mDock(MD_BOTTOM_LEFT), mIsDirty(false), mMarginX(0), mMarginY(0), header(NULL)
{
	MAExtent scr = maGetScrSize();
	mScreenHeight = EXTENT_Y(scr);
	mScreenWidth = EXTENT_X(scr);

	mBlank = new Image(0, 0, mScreenWidth, mScreenHeight, NULL, true, true, mBlankImage);

	mOptions = new KineticListBox(0, 0, (int)(mScreenHeight * 0.4), (int)(mScreenWidth * 0.4),
			mBlank, KineticListBox::LBO_VERTICAL, KineticListBox::LBA_LINEAR, false);

	mOptions->setSkin(Util::getSkinDropDownBack());
	mOptions->setPaddingBottom(2);
	mOptions->setPaddingLeft(2);
	mOptions->setPaddingRight(2);
	mOptions->setPaddingTop(2);
	//mOptions->setAutoSize(true);

	if (strlen(headerLabel) > 0) {
		header = new Label(0, 0, mOptions->getWidth() - 4, 20, mOptions);
		header->setMultiLine(true);
		header->setFont(Util::getFontBlack());
		header->setSkin(Util::getSkinPopupHeader());
		header->setDrawBackground(true);
		header->setAutoSizeY(true);
		header->setHorizontalAlignment(Label::HA_LEFT);
		header->setVerticalAlignment(Label::VA_CENTER);
		header->setPaddingTop(5);
		header->setPaddingBottom(5);
		header->setPaddingLeft(5);
		header->setPaddingRight(5);
		header->setCaption(headerLabel);
	}
}

MenuScreen::~MenuScreen()
{
	delete mBlank;
}

void MenuScreen::addItem(const char* text)
{
	addItem(createLabel(text));
}

String MenuScreen::getItem(int index) {
	return ((Label *)mOptions->getChildren()[index])->getCaption();
}

void MenuScreen::addItem(Widget* w)
{
	mOptions->add(w);
	mIsDirty = true;
}

void MenuScreen::setMenuSkin(WidgetSkin* skin)
{
	mSkin = skin;
}

void MenuScreen::setMenuFontSel(Font* font)
{
	mFontSel = font;
}

void MenuScreen::setMenuFontUnsel(Font* font)
{
	mFontUnsel = font;
}

void MenuScreen::setMenuWidth(int w)
{
	mOptions->setWidth(w);

	 if (header != NULL) {
	  header->setWidth(w - 4);
	 }
}

void MenuScreen::setListener(MenuListener* listener)
{
	mListener = listener;
}

void MenuScreen::setMarginX(int margin)
{
	mMarginX = margin;
}

void MenuScreen::setMarginY(int margin)
{
	mMarginY = margin;
}


void MenuScreen::setDock(MenuDock dock)
{
	mDock = dock;
}

void MenuScreen::show()
{
	setMain(mBlank);

	if(mIsDirty)
		update();

	((Label*)mOptions->getChildren()[mOptions->getSelectedIndex()])->setSelected(true);

	Screen::show();
}

void MenuScreen::update()
{
	if(mIsDirty)
	{
		if(mOptions->getChildren().size() == 1)
				mOptions->setSelectedIndex(0);

		mOptions->update();

		if (mDock != MD_FILL) {
			//Resize the menu to show all the content correctly
			int h = 0;
			Widget* w;
			Vector_each(Widget*, itr, mOptions->getChildren())
			{
				w = *itr;
				w->update();
				h += w->getHeight();
			}

			h += 4; //for the padding
			mOptions->setHeight(h>=mScreenHeight?(mScreenHeight - (int) (mMarginY * 2)):h);
		}

		//Dock in the correct position
		switch(mDock)
		{
			case MD_BOTTOM_LEFT:
				mOptions->setPosition(mMarginX, mScreenHeight - mOptions->getHeight() - mMarginY);
				break;
			case MD_BOTTOM_RIGHT:
				mOptions->setPosition(mScreenWidth - mOptions->getWidth() - mMarginX,
									  mScreenHeight - mOptions->getHeight() - mMarginY);
				break;
			case MD_TOP_LEFT:
				mOptions->setPosition(mMarginX, mMarginY);
				break;
			case MD_TOP_RIGHT:
				mOptions->setPosition(mScreenWidth - mOptions->getWidth() - mMarginX, mMarginY);
				break;
			case MD_CENTER:
				mOptions->setPosition((mScreenWidth - mOptions->getWidth()) / 2,
									  (mScreenHeight - mOptions->getHeight()) / 2);
				break;
			case MD_FILL:
				mOptions->setPosition(mMarginX, mMarginY);
				mOptions->setWidth(mScreenWidth - (int) (mMarginX * 2));
				mOptions->setHeight(mScreenHeight - (int) (mMarginY * 2));
				break;
		}

		mIsDirty = false;
	}
}

void MenuScreen::keyPressEvent(int keyCode, int nativeCode)
{
	switch(keyCode)
	{
		case MAK_LEFT:
		case MAK_UP:
			if (mOptions->getSelectedIndex() == (header==NULL?0:1)) {
				mOptions->setSelectedIndex(mOptions->getChildren().size() - 1);
			}
			else {
				mOptions->selectPreviousItem();
			}
			break;
		case MAK_RIGHT:
		case MAK_DOWN:
			if (mOptions->getSelectedIndex() == mOptions->getChildren().size() - 1) {
				mOptions->setSelectedIndex(header==NULL?0:1);
			}
			else {
				mOptions->selectNextItem();
			}
			break;
		case MAK_FIRE:
			informListener();
			break;
	}
}

void MenuScreen::selectionChanged(Widget *widget, bool selected) {
	if(selected) {
		if(mFontSel != NULL) {
			((Label*)widget)->setFont(mFontSel);
		}
	} else {
		if(mFontUnsel != NULL) {
			((Label*)widget)->setFont(mFontUnsel);
		}
	}
}

void MenuScreen::pointerPressEvent(MAPoint2d point) {
	moved = 0;

	int firstVisible = (-1*mOptions->getYOffset()>>16) / DEFAULT_DROPDOWNITEM_HEIGHT;
	int lastVisible = firstVisible + (mOptions->getHeight() / DEFAULT_DROPDOWNITEM_HEIGHT);

	Point p(point.x, point.y);
	if(mOptions->contains(p))
	{
		for(int i = firstVisible; i < lastVisible; i++)
		{
			Widget* w = mOptions->getChildren()[i];
			if(w->contains(p))
			{
				mOptions->setSelectedIndex(i);
				break;
			}
		}
	}
}

void MenuScreen::pointerMoveEvent(MAPoint2d point) {
	moved++;
}

void MenuScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 5) {
		if (header==NULL ||
				(header!=NULL && !header->isSelected())) {
			informListener();
		}
	}
}

void MenuScreen::informListener()
{
	if(mListener != NULL)
		mListener->menuOptionSelected(header==NULL?mOptions->getSelectedIndex():mOptions->getSelectedIndex()-1);
}

Label* MenuScreen::createLabel(const char* text)
{
	Label* l = new Label(0, 0, mOptions->getWidth() - 4, DEFAULT_DROPDOWNITEM_HEIGHT, NULL);
	//l->setMultiLine(true);
	//l->setAutoSizeX(false);
	//l->setAutoSizeY(true);
	l->setHorizontalAlignment(Label::HA_CENTER);
	l->setVerticalAlignment(Label::VA_CENTER);
	l->setPaddingTop(5);
	l->setPaddingBottom(5);
	l->setPaddingLeft(5);
	l->setPaddingRight(5);
	l->setCaption(text);
	l->setDrawBackground(true);
	l->addWidgetListener(this);

	if(mSkin != NULL)
		l->setSkin(mSkin);

	if(mFontUnsel != NULL)
		l->setFont(mFontUnsel);

	return l;
}

void MenuScreen::setSelectedIndex(int index) {
	mOptions->setSelectedIndex(index);
}

int MenuScreen::getSelectedIndex() {
	return mOptions->getSelectedIndex();
}
