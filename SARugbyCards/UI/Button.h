/*
 * Button.h
 *
 *  Created on: 20 Apr 2012
 *      Author: WAWAWA
 */

#ifndef BUTTON_H_
#define BUTTON_H_

#include <MAUI/Widget.h>
#include <MAUI/Label.h>
#include <MAUI/Image.h>

using namespace MAUI;

class Button : public Label {
  public:
    Button(int x, int y, int height, int width, Widget* parent);
    ~Button();

    bool isSelectable();
    void setSelectable (bool selectable);
  private:
    bool _selectable;

};

#endif /* BUTTON_H_ */
