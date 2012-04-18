
#include "MainScreen.h"
#include "../utils/Util.h"

using namespace MAUI;

void MainScreen::pop() {previous->refresh(true);}
void MainScreen::refresh() {show();}
void MainScreen::refresh(bool pop) {show();}
void MainScreen::show() {Screen::show();}
