/*
 * TransitionImage.h
 *
 *  Created on: 05/set/2011
 *      Author: Alessandro Sala Copyright (C) 2011
 *	   Version: 1.01
 *
 *  This program is free software; you can redistribute it and/or modify it under
 *  the terms of the GNU General Public License, version 2, as published by
 *  the Free Software Foundation.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 *  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 *  for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; see the file COPYING.  If not, write to the Free
 *  Software Foundation, 59 Temple Place - Suite 330, Boston, MA
 *  02111-1307, USA.
 */

#ifndef TRANSITIONIMAGE_H_
#define TRANSITIONIMAGE_H_

#include <MAUI/Image.h>
#include <MAUtil/Environment.h>
#include <MAUtil/Vector.h>
#include <mastdlib.h>
using namespace MAUtil;

/**
 * Transition types
 */
enum TransitionType
{
	TT_NONE,
	TT_PUSH,
	TT_SLIDE_IN,
	TT_SLIDE_OUT,
	TT_WIPE,
	TT_WIPE_CENTER
};

class ImageTransitionListener
{
public:
	ImageTransitionListener() {};

	/** This method is called whenever an image transition is completed **/
	virtual void imageTransitionCompleted(MAHandle fromRes, MAHandle toRes) = 0;

	/** This method is called whenever an image transition is aborted **/
	virtual void imageTransitionAborted(MAHandle fromRes, MAHandle toRes) = 0;
};

/** \brief Animated transitions between two images
 *
 * A TransitionImage is a simple widget capable of displaying
 * an animated transition between two images.
 */
class TransitionImage: public MAUI::Widget, public MAUtil::TimerListener
{
public:

	/**
	 * Result codes
	 */
	enum Result
	{
		OK = 0,
		ERR_RUNNING = -1,			// A transition is already running
		ERR_SIZE_MISMATCH = -2,		// The size of source and destination resources do not match
		ERR_INVALID_RESOURCE = -3,	// The resource handle is invalid
		ERR_MISSING_RESOURCE = -4	// Source or destination resource is not set
	};

	/**
	 * Constructor for TransitionImage, same as Image constructor.
	 */
	TransitionImage(int x, int y, int width, int height, Widget *parent, bool autoSizeX, bool autoSizeY, MAHandle res);

	/**
	 * Constructor for TransitionImage: simplified version, useful when
	 * this is to be used as the main widget of a Screen.
	 */
	TransitionImage();

	/** Destructor: frees all resources **/
	virtual ~TransitionImage();

	/** Sets source and destination image resources
	 * \param fromRes the starting image resource
	 * \param toRes the ending image resource
	 *
	 * \returns OK if resources were set, ERR_SIZE_MISMATCH if source and
	 * destination aren't the same size, ERR_INVALID_RESOURCE if fromRes or toRes
	 * is invalid
	 */
	Result setResourcePair(MAHandle fromRes, MAHandle toRes);

	/** Sets the image resource and starts the transition from the old resource, if any **/
	Result setResource(MAHandle res);

	/** Gets the current image resource **/
	MAHandle getResource() const
		{ return running ? toImage : fromImage; }

	/** Adds a transition listener **/
	void addTransitionListener(ImageTransitionListener *listener);

	/** Removes a transition listener **/
	void removeTransitionListener(ImageTransitionListener *listener);

	/** Returns the registered transition listener **/
	Vector<ImageTransitionListener *>& getTransitionListeners()
		{ return transitionListeners; }

	/** Overlays an image resource
	 *	\param x horizontal offset
	 *	\param y vertical offset
	 *	\param overlay image resource to overlay
	 **/
	void showOverlay(int x, int y, MAHandle overlay);

	/** Removes the overlay **/
	void hideOverlay();

	/** Sets/gets the transition type **/
	void setType(TransitionType type)
		{ transType = type; }

	TransitionType getType()
		{ return transType; }

	/** Sets/gets the direction of transitions
	 * \param dx horizontal direction; 1 = left to right; -1 = right to left
	 * \param dy vertical direction; 1 = top to bottom; -1 = bottom to top
	 */
	void setDirection(int dx, int dy);

	int getDirectionX()
		{ return directionX; }

	int getDirectionY()
		{ return directionY; }

	/** Sets/gets the duration of transitions (milliseconds) **/
	void setDuration(int dur)
		{ if (dur > 0) baseDuration = dur; }

	int getDuration()
		{ return baseDuration; }

	/** Sets/gets the refresh rate **/
	void setFps(int fps)
		{ if (fps > 0) time_step = 1000/fps; }

	int getFps()
		{ return 1000/time_step; }

	/** Sets all transition parameters at once (dur = -1 keeps the current duration) **/
	void setTransition(TransitionType type, int dx, int dy, int dur = -1);

	/** Starts the transition with current parameter set
	 * \param paused if true, the transition starts paused and can be
	 * 			controlled with stepTransition()/continueTransiton()
	 *
	 * \returns OK if the transition has started, ERR_RUNNING if it is already
	 * running, ERR_MISSING_RESOURCE if source or destination image is not set
	 */
	Result startTransition(bool paused = false);

	/** Pauses the transition **/
	void pauseTransition();

	/** Sets the progress status of the transition. Must be paused
	 * \param progress the new transition state (0.0 = start, 0.5 = middle, 1.0 = end)
	 */
	void stepTransition(double step);

	/** Continues a paused transition
	 * \param reverse if true the transition is reversed and the original image restored
	 */
	void continueTransiton(bool reverse = false);

	/** Aborts the running transition, if any, and restores the original image.
	 * \param fireEvents if true calls imageTransitionAborted() method of registered listeners.
 	 */
	void abortTransition(bool fireEvents = true);

	/** Ends the running transition, if any, optionally overriding the
	 * destination image.
	 * \param newToRes new destination resource, overriding the original one
	 * \param fireEvents if true calls imageTransitionComplete() method of registered listeners.
	 */
	void endTransition(MAHandle newToRes = 0, bool fireEvents = true);

	/** Returns the current transition step (0.0 = start, 0.5 = middle, 1.0 = end) **/
	double transitionStep()
		{ return alpha; }

	/** Returns true if the transition is running **/
	bool isRunning()
		{ return running; }

	/** Returns true if the transition is paused **/
	bool isPaused()
		{ return paused; }

protected:
	virtual double updateAlpha();
	Vector<ImageTransitionListener *> transitionListeners;

private:
	void drawWidget();
	void runTimerEvent();

	bool running, paused;
	MAHandle fromImage, toImage;
	int imageWidth, imageHeight;
	MAHandle overlay;
	MAPoint2d overlayPos;
	bool autoSizeX, autoSizeY;

	TransitionType transType;
	int baseDuration, duration;	// Time the animation takes to complete (ms)
	int time_step;				// Time between two animation steps (ms)
	int directionX;
	int directionY;
	int start_time;
	double alpha; // 0.0 = start of transition, 1.0 = end of transition
	double baseAlpha, alphaScale;
};

#endif /* TRANSITIONIMAGE_H_ */
