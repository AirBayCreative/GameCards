/* Copyright (C) 2010 MoSync AB

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

#ifndef _KINETICLISTBOX_H_
#define _KINETICLISTBOX_H_

#include <MAUI/Widget.h>
#include <MAUI/Engine.h>
#include <MAUtil/Environment.h>

namespace MAUI {

        class KineticListBox;

        /** A listener interface that receives notifications whenever an item in a KineticListBox is selected.
          **/
        class KineticListBoxListener {
        public:
                KineticListBoxListener(){}
                /** This function is called whenever the selected item in a listbox changes **/
                virtual void itemSelected(KineticListBox *sender, Widget *selectedWidget, Widget *unselectedWidget) = 0;

                /** This function is called whenever the selection is blocked, due to bounds. 'direction' is -1 when selectPreviousItem was called and 1 when selectedNextItem was called. */
                virtual void blocked(KineticListBox *sender, int direction) = 0;
        };


        /** The MAUI KineticListBox is a very generic and flexible container that enables laying out widgets in vertical
          * or horizontal lists. Unlike list boxes you might find in other UI toolkits, this one doesn't only support
          * text-based items - it supports putting in any type of widget. You could add an image followed by a label,
          * followed by another, nested KineticListBox. Furthermore, the navigation is decoupled from input. For instance, it
          * provides functions such as selectNextItem() rather than assuming that the way of doing this should always
          * be done by pressing the "down" key.
          **/
        class KineticListBox : public Widget, MAUtil::TimerListener, WidgetListener, public PointerListener {
        public:
                enum KineticListBoxOrientation {
                        LBO_HORIZONTAL,
                        LBO_VERTICAL
                };

                enum KineticListBoxAnimationType {
                        LBA_NONE,
                        LBA_LINEAR
                };

                /** Constructor.
                  * \param x the horizontal position of the KineticListBox relative to its parent's top left padded corner.
                  * \param y the vertical position of the KineticListBox relative to its parent's top left padded corner
                  * \param width the width of the KineticListBox.
                  * \param height the height of the KineticListBox.
                  * \param parent pointer to the parent widget. Passing anything else than NULL causes the KineticListBox to be added to the parent's children.
                  **/

                KineticListBox(int x, int y, int width, int height, Widget *parent);
                /** Constructor.
                  * \param x the horizontal position of the KineticListBox relative to its parent's top left padded corner.
                  * \param y the vertical position of the KineticListBox relative to its parent's top left padded corner
                  * \param width the width of the KineticListBox.
                  * \param height the height of the KineticListBox.
                  * \param parent pointer to the parent widget. Passing anything else than NULL causes the KineticListBox to be added to the parent's children.
                  * \param orientation controls the orientation of the KineticListBox
                  * \param animType controls the type of animation used when scrolling the listbox content.
                  * \param wrapping controls the behavior of the listbox when navigating. When set to true, the listbox will wrap around to selecting the first element when moving beyond the last one, and equivalently wrap around to the last one when moving back beyond the first one.
                  **/

                KineticListBox (
                        int x,
                        int y,
                        int width,
                        int height,
                        Widget *parent,
                        KineticListBoxOrientation orientation,
                        KineticListBoxAnimationType animType=LBA_NONE,
                        bool wrapping=false
                );

                /** Destructor **/
                virtual ~KineticListBox();

                /** Addes the Widget w as a child of the listbox **/
                void add(Widget *w);
                /** Renders the listbox **/
                void draw(bool forceDraw=false);
                void update();

                /** Navigates to the next item in the listbox - down if the orientation is vertical, right if it's horizontal. **/
                void selectNextItem(bool shouldFireListeners=true);
                /** Navigates to the previous item in the listbox - up if the orientation is vertical, left if it's horizontal. **/
                void selectPreviousItem(bool shouldFireListeners=true);
                /** Adds a item selection listener **/
                void addKineticListBoxListener(KineticListBoxListener *listener);
                /** Specifies which item in the KineticListBox should be selected **/
                void setSelectedIndex(int selectedIndex);
                /** Sets the orientation of the KineticListBox **/
                void setOrientation(KineticListBoxOrientation orientation);
                /** Sets the type of animation to be used by the KineticListBox **/
                void setAnimationType(KineticListBoxAnimationType type);
                /** Controls the wrapping behavior of the KineticListBox **/
                void setWrapping(bool wrapping=true);
                /** Returns the type of animation used by the List Box **/
                KineticListBoxAnimationType getAnimationType() const;
                /** Returns whether the KineticListBox will wrap around when moving beyond the first or last element **/
                bool isWrapping() const;
                /** Returns the index of the KineticListBox's currently selected child widget **/
                int     getSelectedIndex() const;

                /** Sets autosizing on a KineticListBox. This autosizes the children of the listbox in the opposite direction of the orientation. I.e. if the list box is vertically oriented, the widgets will be resized to the width of the listbox (the padded width), and vice versa.**/
                void setAutoSize(bool as=true);

                /** Overloaded setWidth. If autosizing is set and the orientation is vertical on the KineticListBox this will set the width of the children. **/
                void setWidth(int w);

                /** Overloaded setHeight. If autosizing is set and the orientation is horizontal on the KineticListBox this will set the height of the children. **/
                void setHeight(int h);

                /** Returns true if child widgets is outside of the front of the list. */
                bool listFrontOutsideBounds();

                /** Returns true if child widgets is outside of the back of the list. */
                bool listBackOutsideBounds();

                void setEnabled(bool e);

                int getYOffset();
                void setYOffset(int y);

        private:
				void pointerPressEvent( MAPoint2d point );
				void pointerMoveEvent( MAPoint2d point );
				void pointerReleaseEvent( MAPoint2d point );

				void stop();

        protected:
                void runTimerEvent();

                void drawWidget();

                bool mustRebuild;
                void rebuild();

                Vector<KineticListBoxListener*> mKineticListBoxListeners;
                bool wrapping;
                KineticListBoxAnimationType animationType;

                KineticListBoxOrientation orientation;
                int yOffsetFrom;
                int yOffsetTo;
                int yOffset;
                int yOffsetInc;

                int animTimeStart;

                int selectedIndex;

                bool autoSize;
                bool kineticTimer;
                bool enabled;

                Point velocity;
                Vector<Point> previousPoints;
                Vector<float> previousTimes;

                //WidgetListener
                void boundsChanged(Widget *widget, const Rect& bounds);
        };
}

#endif /* _KINETICLISTBOX_H_ */
