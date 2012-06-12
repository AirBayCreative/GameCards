/*
 * Button.cpp
 *
 *  Created on: 20 Apr 2012
 *      Author: Win7User
 */

#include "Button.h"
#include "../MAHeaders.h"

Button::Button(int x, int y, int width, int height, Widget* parent = NULL)
              : Label(x, y, width, height, parent)
{
_selectable = true;
}

Button::~Button()
{}


bool Button::isSelectable()
{
  return _selectable;
}

void Button::setSelectable(bool selectable)
{
	_selectable = selectable;
}
