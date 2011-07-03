#include "Checkbox.h"
#include "../MAHeaders.h"

CheckBox::CheckBox(int x, int y, int width, int height, Widget* parent = NULL)
              : Widget(x, y, width, height, parent)
{
  image = new Image(0, 0, width, height, this);
  text = new Label(image->getWidth(), 0, width - image->getWidth(), height, this);
  resChecked = RES_BOX_SELECTED;
  resUnchecked = RES_BOX_UNSELECTED;
  _checked = false;
  updateCheckBox();
}

CheckBox::~CheckBox()
{}

void CheckBox::drawWidget()
{}

void CheckBox::setResources(MAHandle unchecked, MAHandle checked)
{
  resChecked = RES_BOX_SELECTED;
  resUnchecked = RES_BOX_UNSELECTED;

  updateCheckBox();
}

void CheckBox::flip()
{
   _checked = !_checked;
   updateCheckBox();
}

bool CheckBox::isChecked()
{
  return _checked;
}

void CheckBox::updateCheckBox()
{
  if(_checked)
     image->setResource(resChecked);
  else
     image->setResource(resUnchecked);
}
