#include <MAUI/Label.h>

#include "MenuTestScreen.h"
#include "../utils/Util.h"

using namespace MAUtil;

static const char* genders[] =
{
	"Male",
	"Female"
};

MenuTestScreen::MenuTestScreen(MainScreen *previous) {
	lprintfln("MenuTestScreen::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	this->previous = previous;
	mainLayout = Util::createMainLayout("", "Back", "");

	kinListBox = (KineticListBox*) mainLayout->getChildren()[0]->getChildren()[2];

	Label *label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Gender", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	dropDownGender = Util::createEditLabel("");
	dropDownGender->addWidgetListener(this);
	kinListBox->add(dropDownGender);

	label = new Label(0,0, scrWidth-PADDING*2, DEFAULT_SMALL_LABEL_HEIGHT, NULL, "Username", 0, Util::getDefaultFont());
	label->setDrawBackground(false);
	kinListBox->add(label);

	label = Util::createEditLabel("");
	editBoxLogin = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2,64,MA_TB_TYPE_ANY, label, "", L"Username");
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	kinListBox->add(label);

	genderList = new MenuScreen(RES_BLANK);
	genderList->setMenuWidth(120);
	genderList->setMarginX(5);
	genderList->setMarginY(5);
	genderList->setDock(MenuScreen::MD_CENTER);
	genderList->setListener(this);
	//genderList->setMenuFont(Util::getDefaultFont());
	genderList->setMenuSkin(Util::getSkinEditBox());

	int genderCount = sizeof(genders)/sizeof(const char*);
	for (int i = 0; i < genderCount; i++) {
		genderList->addItem(genders[i]);
	}

	editBoxLogin->setSelected(true);

	kinListBox->setSelectedIndex(1);

	this->setMain(mainLayout);
}

MenuTestScreen::~MenuTestScreen() {
	delete mainLayout;
	delete genderList;

	mainLayout = NULL;
	kinListBox = NULL;
	dropDownGender = NULL;
	editBoxLogin = NULL;
}

void MenuTestScreen::menuOptionSelected(int index) {
	dropDownGender->setCaption(genders[index]);
	this->show();
}

void MenuTestScreen::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void MenuTestScreen::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
}

void MenuTestScreen::pointerReleaseEvent(MAPoint2d point)
{
	if (right) {
		keyPressEvent(MAK_SOFTRIGHT);
	} else if (left) {
		keyPressEvent(MAK_SOFTLEFT);
	} else if (list) {
		keyPressEvent(MAK_FIRE);
	}
}

void MenuTestScreen::locateItem(MAPoint2d point)
{
	list = false;
	left = false;
	right = false;

    Point p;
    p.set(point.x, point.y);

    for(int i = 0; i < (kinListBox->getChildren()).size(); i++)
	{
		if(kinListBox->getChildren()[i]->contains(p))
		{
			kinListBox->getChildren()[i]->setSelected(true);
			list = true;
		}
		else {
			kinListBox->getChildren()[i]->setSelected(false);
		}
	}

    if (dropDownGender->contains(p)) {
    	genderList->show();
    }

    for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
			if (i == 0) {
				left = true;
			} else if (i == 2) {
				right = true;
			}
			return;
		}
	}
}

void MenuTestScreen::selectionChanged(Widget *widget, bool selected) {\
	if (widget->getChildren().size() > 0) {
		if(selected) {
			widget->getChildren()[0]->setSelected(true);
		} else {
			widget->getChildren()[0]->setSelected(false);
		}
	}
}

void MenuTestScreen::show() {
	Screen::show();
}

void MenuTestScreen::hide() {
	Screen::hide();
}

void MenuTestScreen::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_FIRE:
			if (dropDownGender->isSelected()) {
				genderList->show();
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			// Go back to menu screen
			previous->show();
			break;
		case MAK_UP:
			if (kinListBox->getSelectedIndex()-2 > 0) {
				kinListBox->setSelectedIndex(kinListBox->getSelectedIndex()-2);
			}
			break;
		case MAK_DOWN:
			if (kinListBox->getSelectedIndex()+2 < kinListBox->getChildren().size()) {
				kinListBox->setSelectedIndex(kinListBox->getSelectedIndex()+2);
			}
			break;
	}
}
