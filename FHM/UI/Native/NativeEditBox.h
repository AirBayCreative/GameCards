/* Copyright (C) 2009 Mobile Sorcery AB

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License, version 2, as published by
the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with this program; see the file COPYING.  If not, write to the Free
Software Foundation, 59 Temple Place - Suite 330, Boston, MA
02111-1307, USA.
*/

/**
* \file WidgetSkin.h
* \brief Class for defining the visual appearance of a widget
* \author Patrick Broman and Niklas Nummelin
*/

#ifndef _SE_MSAB_MAUI_NATIVE_EDIT_BOX_H_
#define _SE_MSAB_MAUI_NATIVE_EDIT_BOX_H_

#include <MAUI/EditBox.h>
#include <MAUtil/Environment.h>
#include <MAUtil/String.h>
#include <MAUI/Widget.h>

namespace MAUI {

class NativeEditBoxListener {
public:
	/// Called when the user has pressed the OK button on the native edit box, closing it.
	virtual void nativeEditFinished() = 0;
};

class NativeEditBox : public EditBox, PointerListener, public TextBoxListener {
public:
	NativeEditBox(int x=0, int y=0, int width=0, int height=0,
		int maxSize=128, int options=MA_TB_TYPE_ANY, Widget* parent=NULL,
		const MAUtil::String& initialText="",
		const MAUtil::WString& titleString=L"");

	~NativeEditBox();

	void disableListener();
	void setOptions(int options);
	void setMaxSize(int size);

	void focusGained();

	void setSelected(bool selected = false);

	void setTitleString(const MAUtil::WString& mTitleString);
	const MAUtil::WString& getTitleString() const;

	bool pointerPressed(MAPoint2d p, int id);
	bool pointerMoved(MAPoint2d p, int id);
	bool pointerReleased(MAPoint2d p, int id);

	// if caption is larger than mMaxSize mMaxSize will be changed to the length of the caption.
	virtual void setCaption(const String& caption);

	void activate(NativeEditBoxListener* listener=NULL);

protected:
	void textBoxClosed(int res, int length);
	void pointerPressEvent(MAPoint2d point);
	void pointerMoveEvent(MAPoint2d point);
	void pointerReleaseEvent(MAPoint2d point);
	void keyPressEvent(int keyCode, int nativeCode);
	void keyReleaseEvent(int keyCode, int nativeCode);

	MAUtil::WString mTitleString;
	wchar_t* mString;
	int mMaxSize;
	int mOptions;
	int x,y,width,height, moved;

	int mStartX, mStartY;

	NativeEditBoxListener* mListener;
};

} // namespace MAUI

#endif // _SE_MSAB_MAUI_NATIVE_EDIT_BOX_H_
