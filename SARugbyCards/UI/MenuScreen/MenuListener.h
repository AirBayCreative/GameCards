/*
 * This is an interface class to receive the selected option from a popup menu.  If you need to know
 * which option was selected in a screen (or other class), then set it to inherit from this interface
 * and implement menuOptionSelected(int index)
 *
 * e.g.
 * class MyScreen : public MenuListener
 * {
 * 		public:
 * 			MyScreen();
 * 			~MyScreen();
 *
 * 			//MenuListener
 * 			void menuOptionSelected(int index);
 * };
 */

#ifndef MENULISTENER_H_
#define MENULISTENER_H_

class MenuListener
{
	public:
		virtual void menuOptionSelected(int index) = 0;
};

#endif /* MENULISTENER_H_ */
