#include <MAUI/Layout.h>
#include <mavsprintf.h>
#include <mastdlib.h>
#include <MAUtil/Graphics.h>

#include "GCMenu.h"
#include "../../utils/Util.h"

GCMenu::GCMenu(item items[], int numItems, int x, int y, int width, int height,
		bool autosizeX, bool autosizeY, Widget* parent)
	:Widget(x, y, width, height, parent), items(items), numItems(numItems), enabled(false) {
	setEnabled(true);
	/*setDrawBackground(false);*/

	Layout *mainLayout = new Layout(0, 0, width, height, NULL, 1, 2);
	mainLayout->setDrawBackground(false);

	int imageHeight = height - ICON_HEIGHT - DOT_HEIGHT;

	ListBox *listBox = new ListBox(0, 0, mainLayout->getWidth(), mainLayout->getHeight(), mainLayout, ListBox::LBO_VERTICAL);
	listBox->setSkin(Util::getSkinBack());

	subLayout = new Layout(0, 0, width, imageHeight, listBox, 3, 1);
	subLayout->setPaddingLeft(5);
	subLayout->setPaddingRight(5);
	subLayout->setDrawBackground(false);
	/*subLayout->setSkin(Util::getSkinBack());*/

	leftArrow = new Image(0, 0, ARROW_WIDTH, imageHeight, subLayout, false, false, RES_LEFT_ARROW);
	leftArrow->setDrawBackground(false);

	mainImage = new TransitionImage(0, 0, width - (ARROW_WIDTH * 2) - 10, imageHeight, subLayout, false, false, NULL);
	mainImage->setDrawBackground(false);

	rightArrow = new Image(0, 0, ARROW_WIDTH, imageHeight, subLayout, false, false, RES_RIGHT_ARROW);
	rightArrow->setDrawBackground(false);

	ListBox *iconAndDotList = new ListBox(0, 0, width, ICON_HEIGHT + DOT_HEIGHT, listBox,
			ListBox::LBO_VERTICAL);
	iconAndDotList->setSkin(Util::getIconListBack());

	iconList = new ListBox(0, 0, width, ICON_HEIGHT, iconAndDotList,
		ListBox::LBO_HORIZONTAL);
	iconList->setDrawBackground(false);

	iconsPerList = iconList->getWidth() / (PADDING + MIN_MENU_ICON_WIDTH);
	int currentList = -1;
	ListBox *tempList = NULL;
	Image *tempImage = NULL;

	for (int i = 0; i < numItems; i++) {
		if (i % iconsPerList == 0) {
			tempList = new ListBox(0, 0, iconList->getWidth(), iconList->getHeight(), NULL);
			tempList->setOrientation(ListBox::LBO_HORIZONTAL);
			tempList->setDrawBackground(false);
			currentList++;
			iconLists.add(tempList);
		}

		tempImage = new Image(0, 0, MIN_MENU_ICON_WIDTH + PADDING + ((iconList->getWidth() % (PADDING + MIN_MENU_ICON_WIDTH)) / iconsPerList),
				ICON_HEIGHT, tempList, false, false, items[i].icon);
		tempImage->setSkin(Util::getIconSelect());
		tempImage->setDrawBackground(true);
	}
	dotList = new ListBox(0, 0, width, DOT_HEIGHT, iconAndDotList,
			ListBox::LBO_HORIZONTAL);
	dotList->setDrawBackground(false);
	int dotListPadding = (width - (iconLists.size() * (11 + PADDING))) / 2;
	dotList->setPaddingLeft(dotListPadding>0?dotListPadding:0);
	for (int j = 0; j < iconLists.size(); j++) {
		tempImage = new Image(0, 0, 11 + PADDING, DOT_HEIGHT, dotList, false, false, RES_DESELECTED_LIST_DOT);
	}

	if (numItems > 0) {
		emp = false;
		selectedList = 0;

		((Image*)dotList->getChildren()[selectedList])->setResource(RES_SELECTED_LIST_DOT);

		iconList->add(iconLists[selectedList]);
		iconLists[selectedList]->setSelectedIndex(0);
		iconLists[selectedList]->getChildren()[iconLists[0]->getSelectedIndex()]->setSelected(true);

		mainImage->setResource(items[iconLists[selectedList]->getSelectedIndex() + (selectedList * iconsPerList)].bigImage);
	}
	else {
		emp = true;
	}
	add(mainLayout);
}

GCMenu::~GCMenu() {
	for (int i = 0; i < children.size(); i++) {
		delete children[i];
		children[i] = NULL;
	}

	items = NULL;
}

void GCMenu::setEnabled(bool e) {
	Environment& env = Environment::getEnvironment();
	if(!enabled && e) {
		env.addPointerListener(this);
		env.addKeyListener(this);
	}
	else if(enabled && !e) {
		env.removePointerListener(this);
		env.removeKeyListener(this);
	}

	enabled = e;
}

void GCMenu::selectNext() {
	if (!emp) {
		if (iconLists[selectedList]->getSelectedIndex() + 1 >= iconLists[selectedList]->getChildren().size()) {
			((Image*)dotList->getChildren()[selectedList])->setResource(RES_DESELECTED_LIST_DOT);
			iconList->clear();
			selectedList = (selectedList + 1 >= iconLists.size())?0:(selectedList + 1);
			iconList->add(iconLists[selectedList]);
			((Image*)dotList->getChildren()[selectedList])->setResource(RES_SELECTED_LIST_DOT);

			iconLists[selectedList]->setSelectedIndex(0);
			iconLists[selectedList]->getChildren()[0]->setSelected(true);
		}
		else {
			iconLists[selectedList]->selectNextItem();
		}
		mainImage->setTransition(TT_PUSH, -1, 0);
		mainImage->setResource(items[iconLists[selectedList]->getSelectedIndex() + (selectedList * iconsPerList)].bigImage);
	}
}

void GCMenu::selectPrevious() {
	if (!emp) {
		if (iconLists[selectedList]->getSelectedIndex() - 1 < 0) {
			((Image*)dotList->getChildren()[selectedList])->setResource(RES_DESELECTED_LIST_DOT);
			iconList->clear();
			selectedList = (selectedList - 1 < 0)?iconLists.size() - 1:(selectedList - 1);
			iconList->add(iconLists[selectedList]);
			((Image*)dotList->getChildren()[selectedList])->setResource(RES_SELECTED_LIST_DOT);

			iconLists[selectedList]->setSelectedIndex(iconLists[selectedList]->getChildren().size() - 1);
			iconLists[selectedList]->getChildren()[iconLists[selectedList]->getSelectedIndex()]->setSelected(true);
		}
		else {
			iconLists[selectedList]->selectPreviousItem();
		}
		mainImage->setTransition(TT_PUSH, 1, 0);
		mainImage->setResource(items[iconLists[selectedList]->getSelectedIndex() + (selectedList * iconsPerList)].bigImage);
	}
}

void GCMenu::select(int i) {
	if (!emp && i < numItems) {

		if (i < selectedList*iconsPerList && i >= selectedList*(iconsPerList + 1)) {
			((Image*)dotList->getChildren()[selectedList])->setResource(RES_DESELECTED_LIST_DOT);
			iconList->clear();
			selectedList = i / iconsPerList;
			iconList->add(iconLists[selectedList]);
			((Image*)dotList->getChildren()[selectedList])->setResource(RES_SELECTED_LIST_DOT);
		}

		iconLists[selectedList]->setSelectedIndex(i % iconsPerList);
		iconLists[selectedList]->getChildren()[iconLists[selectedList]->getSelectedIndex()]->setSelected(true);

		mainImage->setTransition(TT_WIPE, 0, -1);
		mainImage->setResource(items[iconLists[selectedList]->getSelectedIndex() + (selectedList * iconsPerList)].bigImage);
	}
}

void GCMenu::swipeList(int dir) {
	if (iconLists.size() > 1) {
		((Image*)dotList->getChildren()[selectedList])->setResource(RES_DESELECTED_LIST_DOT);
		int index = iconLists[selectedList]->getSelectedIndex();
		selectedList = selectedList + dir;
		if (selectedList < 0) {
			selectedList = iconLists.size() - 1;
		}
		else if (selectedList >= iconLists.size()) {
			selectedList = 0;
		}
		((Image*)dotList->getChildren()[selectedList])->setResource(RES_SELECTED_LIST_DOT);
		iconList->clear();
		iconList->add(iconLists[selectedList]);

		index = index>=iconLists[selectedList]->getChildren().size()?iconLists[selectedList]->getChildren().size()-1:index;

		iconLists[selectedList]->setSelectedIndex(index);
		iconLists[selectedList]->getChildren()[iconLists[selectedList]->getSelectedIndex()]->setSelected(true);

		mainImage->setTransition(TT_WIPE, 0, -1);
		mainImage->setResource(items[iconLists[selectedList]->getSelectedIndex() + (selectedList * iconsPerList)].bigImage);
	}
}

int GCMenu::getSelectedKey() {
	if (!emp) {
		return items[iconLists[selectedList]->getSelectedIndex() + (selectedList * iconsPerList)].key;
	}
	return -1;
}

int GCMenu::getSelectedIndex() {
	if (!emp) {
		return iconLists[selectedList]->getSelectedIndex();
	}
	return -1;
}

void GCMenu::keyPressEvent(int keyCode) {
	switch(keyCode) {
		case MAK_RIGHT:
			mainImage->setTransition(TT_PUSH, -1, 0);
			selectNext();
			break;
		case MAK_LEFT:
			mainImage->setTransition(TT_PUSH, 1, 0);
			selectPrevious();
			break;
	}
}

void GCMenu::pointerPressEvent(MAPoint2d point) {
	moved = 0;
	xStart = point.x;
}

void GCMenu::pointerMoveEvent(MAPoint2d point) {
	moved++;
}

void GCMenu::pointerReleaseEvent(MAPoint2d point) {
	if (moved < 8) {
		locateItem(point);
	}
	else if (subLayout->contains(point.x, point.y)) {
		int xEnd = point.x;
		int distance = abs(xEnd - xStart);

		if (distance >= (scrWidth * 0.3)) {
			moved=0;
			if (xEnd>xStart) {
				mainImage->setTransition(TT_PUSH, 1, 0);
				selectPrevious();
			} else {
				mainImage->setTransition(TT_PUSH, -1, 0);
				selectNext();
			}
		}
	}
	else if (iconList->contains(point.x, point.y)) {
		int xEnd = point.x;
		int distance = abs(xEnd - xStart);

		if (distance >= (scrWidth * 0.3)) {
			moved=0;
			xEnd>xStart?swipeList(-1):swipeList(1);
		}
	}
}

void GCMenu::locateItem(MAPoint2d point) {
	Point p;
	p.set(point.x, point.y);
	if (leftArrow->contains(p)) {
		keyPressEvent(MAK_LEFT);
		return;
	}
	else if (rightArrow->contains(p)) {
		keyPressEvent(MAK_RIGHT);
		return;
	}
	for (int i = 0; i < iconLists[selectedList]->getChildren().size(); i++) {
		if(iconLists[selectedList]->getChildren()[i]->contains(p))
		{
			select(i);
			return;
		}
	}
}

void GCMenu::drawWidget() {
}

bool GCMenu::iconListContains(int x, int y) {
	return iconLists[selectedList]->contains(x, y);
}

bool GCMenu::imageContains(int x, int y) {
	return mainImage->contains(x, y);
}
