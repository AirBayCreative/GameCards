
#include "MainScreen.h"
#include "../utils/Util.h"

using namespace MAUI;

void MainScreen::pop() {lprintfln("MainScreen::pop()"); previous->refresh(true);}
void MainScreen::refresh() {lprintfln("MainScreen::refresh()"); show();}
void MainScreen::refresh(bool pop) {lprintfln("MainScreen::refresh(bool pop)"); show();}
void MainScreen::show() {lprintfln("MainScreen::show()"); Screen::show();}
