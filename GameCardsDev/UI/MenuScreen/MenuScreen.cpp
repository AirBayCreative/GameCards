#include "MenuScreen.h"

MenuScreen::MenuScreen(MAHandle blank) : mBlankImage(blank), mListener(NULL), mSkin(NULL), mFont(NULL),
										 mDock(MD_BOTTOM_LEFT), mIsDirty(false), mMarginX(0), mMarginY(0)
{
	MAExtent scr = maGetScrSize();
	mScreenHeight = EXTENT_Y(scr);
	mScreenWidth = EXTENT_X(scr);

	mBlank = new Image(0, 0, mScreenWidth, mScreenHeight, NULL, true, true, mBlankImage);

	mOptions = new ListBox(0, 0, (int)(mScreenHeight * 0.4), (int)(mScreenWidth * 0.4), mBlank,
			ListBox::LBO_VERTICAL, ListBox::LBA_LINEAR, false);
	mOptions->setAutoSize(true);

	setMain(mBlank);
}

MenuScreen::~MenuScreen()
{
	delete mBlank;
}

void MenuScreen::addItem(const char* text)
{
	addItem(createLabel(text));
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

void MenuScreen::setMenuFont(Font* font)
{
	mFont = font;
}

void MenuScreen::setMenuWidth(int w)
{
	mOptions->setWidth(w);
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
	if(mIsDirty)
		update();

	Screen::show();
}

void MenuScreen::update()
{
	if(mIsDirty)
	{
		if(mOptions->getChildren().size() == 1)
				mOptions->setSelectedIndex(0);

		mOptions->update();

		//Resize the menu to show all the content correctly
		int h = 0;
		Widget* w;
		Vector_each(Widget*, itr, mOptions->getChildren())
		{
			w = *itr;
			w->update();
			h += w->getHeight();
		}

		mOptions->setHeight(h);

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
			mOptions->selectPreviousItem();
			break;
		case MAK_RIGHT:
		case MAK_DOWN:
			mOptions->selectNextItem();
			break;
		case MAK_FIRE:
			informListener();
			break;
	}
}

void MenuScreen::pointerReleaseEvent(MAPoint2d point)
{
	Point p(point.x, point.y);
	if(mOptions->contains(p))
	{
		for(int i = 0; i < mOptions->getChildren().size(); i++)
		{
			Widget* w = mOptions->getChildren()[i];
			if(w->contains(p))
			{
				mOptions->setSelectedIndex(i);
				informListener();
				break;
			}
		}
	}
}

void MenuScreen::informListener()
{
	if(mListener != NULL)
		mListener->menuOptionSelected(mOptions->getSelectedIndex());
}

Label* MenuScreen::createLabel(const char* text)
{
	Label* l = new Label(0, 0, 20, 20, NULL);
	l->setMultiLine(true);
	l->setAutoSizeX(false);
	l->setAutoSizeY(true);
	l->setHorizontalAlignment(Label::HA_CENTER);
	l->setVerticalAlignment(Label::VA_CENTER);
	l->setPaddingTop(5);
	l->setPaddingBottom(5);
	l->setPaddingLeft(5);
	l->setPaddingRight(5);
	l->setCaption(text);
	l->setDrawBackground(true);

	if(mSkin != NULL)
		l->setSkin(mSkin);

	if(mFont != NULL)
		l->setFont(mFont);

	return l;
}

void MenuScreen::setSelectedIndex(int index) {
	mOptions->setSelectedIndex(index);
}

int MenuScreen::getSelectedIndex() {
	return mOptions->getSelectedIndex();
}
