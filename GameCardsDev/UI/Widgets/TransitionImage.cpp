/*
 * TransitionImage.cpp
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

#include <MAUtil/Graphics.h>
#include <conprint.h>
#include "madmath.h"
#include "TransitionImage.h"

/*
 * Full constructor
 */
TransitionImage::TransitionImage(int x, int y, int width, int height, Widget *parent,bool autoSizeX, bool autoSizeY, MAHandle res) :
					MAUI::Widget(x, y, width, height, parent),
					autoSizeX(autoSizeX),
					autoSizeY(autoSizeY),
					running(false),
					paused(false),
					fromImage(0),
					toImage(0),
					transType(TT_PUSH),
					directionX(-1),
					directionY(0),
					baseDuration(400),
					time_step(20),
					alpha(0)
{
	setResource(res);
	hideOverlay();
}

/**
 * Simplified constructor
 */
TransitionImage::TransitionImage() :
					MAUI::Widget(0, 0, 0, 0, NULL),
					autoSizeX(false),
					autoSizeY(false),
					running(false),
					fromImage(0),
					toImage(0),
					transType(TT_PUSH),
					directionX(-1),
					directionY(0),
					baseDuration(400),
					time_step(20),
					alpha(0)
{
	hideOverlay();
}


/**
 * Destructor
 */
TransitionImage::~TransitionImage()
{

}

/** Sets source and destination image resources
 * \param fromRes the starting image resource
 * \param toRes the ending image resource
 *
 * \returns OK if resources were set, ERR_SIZE_MISMATCH if source and
 * destination aren't the same size, ERR_INVALID_RESOURCE if fromRes or toRes
 * is invalid
 */
TransitionImage::Result TransitionImage::setResourcePair(MAHandle fromRes, MAHandle toRes)
{
	if (!fromRes || !toRes)
		return ERR_INVALID_RESOURCE;

	MAExtent fromSize = maGetImageSize(fromRes);
	MAExtent toSize = maGetImageSize(toRes);

	if (toSize != fromSize)
		return ERR_SIZE_MISMATCH;

	// Abort a running transition and repaint the widget
	if (running)
		abortTransition();
	else if (fromImage != fromRes)
		requestRepaint();

	imageWidth = EXTENT_X(fromSize);
	imageHeight = EXTENT_Y(fromSize);

	fromImage = fromRes;
	toImage = toRes;

	if(autoSizeX)
		this->setWidth(imageWidth);
	if(autoSizeY)
		this->setHeight(imageHeight);

	return OK;
}

/** Sets the new image resource and starts the transition from the old resource, if any **/
TransitionImage::Result TransitionImage::setResource(MAHandle res)
{
	if (res == 0)
	{
		fromImage = toImage = res;
		if (running)
			abortTransition();
		requestRepaint();
		return OK;
	}

	if (!fromImage)
	{
		fromImage = res;
		MAExtent fromSize = maGetImageSize(res);
		imageWidth = EXTENT_X(fromSize);
		imageHeight = EXTENT_Y(fromSize);

		if(autoSizeX)
			this->setWidth(imageWidth);
		if(autoSizeY)
			this->setHeight(imageHeight);

		requestRepaint();
		return OK;
	}

	// If already running, abort and restart
	if (running)
		abortTransition();

	Result result;
	if ((result = setResourcePair(fromImage, res)) != OK)
		return result;

	startTransition();
}

/** Adds a transition listener **/
void TransitionImage::addTransitionListener(ImageTransitionListener *listener)
{

	Vector_each(ImageTransitionListener*, i, transitionListeners)
	{
		if((*i) == listener) return;
	}

	transitionListeners.add(listener);
}

/** Removes a transition listener **/
void TransitionImage::removeTransitionListener(ImageTransitionListener *listener) {

	Vector_each(ImageTransitionListener*, i, transitionListeners)
	{
		if((*i) == listener)
		{
			transitionListeners.remove(i);
			return;
		}
	}
}

/** Overlays an image resource
 *	\param x horizontal offset
 *	\param y vertical offset
 *	\param overlay image resource to overlay
 */
void TransitionImage::showOverlay(int x, int y, MAHandle overlay)
{
	overlayPos.x = bounds.x + x;
	overlayPos.y = bounds.y + y;
	this->overlay = overlay;
	requestRepaint();
}

/** Removes the overlay **/
void TransitionImage::hideOverlay()
{
	overlay = 0;
	requestRepaint();
}

/** Sets the direction of transitions
 * \param dx = 1 : left to right; dx = -1 : right to left
 * \param dy = 1 : top to bottom; dy = -1 : bottom to top
 */
void TransitionImage::setDirection(int dx, int dy)
{
	directionX = dx > 0 ? 1 : dx < 0 ? -1 : 0;
	directionY = dy > 0 ? 1 : dy < 0 ? -1 : 0;
}

/** Sets all transition parameters at once (dur = -1 keeps the current duration) **/
void TransitionImage::setTransition(TransitionType type, int dx, int dy, int dur)
{
	setType(type);
	setDirection(dx, dy);
	setDuration(dur);
}

/** Starts the transition with current parameter set
 * \param paused if true, the transition starts paused and can be
 * 			controlled with stepTransition()/continueTransiton()
 *
 * \returns OK if the transition has started, ERR_RUNNING if it is already
 * running, ERR_MISSING_RESOURCE if source or destination image is not set
 */
TransitionImage::Result TransitionImage::startTransition(bool paused)
{
	if (running)
		return ERR_RUNNING;

	if (!fromImage || !toImage)
		return ERR_MISSING_RESOURCE;

	baseAlpha = alpha = 0;
	alphaScale = 1;
	running = true;
	start_time = maGetMilliSecondCount();
	duration = baseDuration;
	this->paused = paused;
	if (!paused)
		MAUtil::Environment::getEnvironment().addTimer(this, time_step, -1);

	return OK;
}

/** Pauses the transition **/
void TransitionImage::pauseTransition()
{
	if (!running || paused)
		return;

	paused = true;
	MAUtil::Environment::getEnvironment().removeTimer(this);
}

/** Sets the progress status of the transition. Must be paused
 * \param progress the new transition state ( 0.0 = start, 0.5 = middle, 1.0 = end)
 */
void TransitionImage::stepTransition(double step)
{
	if (!running || !paused)
		return;

	double oldalpha = alpha;

	alpha = step;
	if (alpha > 1.0)
		alpha = 1.0;
	else if (alpha < 0.0)
		alpha = 0.0;

	if (alpha != oldalpha)
		requestRepaint();
}

/** Continues a paused transition.
 * \param reverse if true the transition is reversed and the original image restored
 */
void TransitionImage::continueTransiton(bool reverse)
{
	if (!running || !paused)
		return;

	paused = false;


	start_time = maGetMilliSecondCount();
	baseAlpha = alpha;
	alphaScale = reverse ? -alpha : 1-alpha;

	duration = (int)(baseDuration*fabs(alphaScale));

	if (duration > 0)
		MAUtil::Environment::getEnvironment().addTimer(this, time_step, -1);
	else if (reverse)
		abortTransition();
	else
		endTransition();
}

/** Aborts the running transition, if any, and restores the original image.
 * \param fireEvents if true calls imageTransitionAborted() method of registered listeners.
 */
void TransitionImage::abortTransition(bool fireEvents)
{
	MAUtil::Environment::getEnvironment().removeTimer(this);
	running = false;
	alpha = 0;
	requestRepaint();

	if (fireEvents)
	{
		Vector_each(ImageTransitionListener*, tl, transitionListeners)
		{
			(*tl)->imageTransitionAborted(fromImage, toImage);
		}
	}
}

/** Ends the running transition, if any, optionally overriding the
 * destination image.
 * \param newToRes new destination resource, overriding the original one
 * \param fireEvents if true calls imageTransitionComplete() method of registered listeners.
 */
void TransitionImage::endTransition(MAHandle newToRes, bool fireEvents)
{
	MAHandle oldFromImage = fromImage;

	if (newToRes)
		toImage = newToRes;
	fromImage = toImage;
	abortTransition(false);

	if (fireEvents)
	{
		Vector_each(ImageTransitionListener*, tl, transitionListeners)
		{
			(*tl)->imageTransitionCompleted(oldFromImage, toImage);
		}
	}
}

/** Draws the images at the current transition stage */
void TransitionImage::drawWidget()
{
	MARect r;
	MAPoint2d p;
	int tx, ty;
	int ox = (paddedBounds.width - imageWidth)>>1;
	int oy = (paddedBounds.height - imageHeight)>>1;

	MAExtent screenSize = maGetScrSize();
	int scrWidth = EXTENT_X(screenSize);
	//int scrHeight = EXTENT_Y(screenSize);

	switch (running ? transType : TT_NONE)
	{
		case TT_PUSH:
			tx = (int)(directionX*alpha*imageWidth) + ox;
			ty = (int)(directionY*alpha*imageHeight) + oy;
			p.x = (tx >= 0 ? tx : 0);
			p.y = (ty >= 0 ? ty : 0);
			r.left = tx >= 0 ? 0 : - tx;
			r.top = ty >= 0 ? 0 : - ty;
			r.width = imageWidth;// - abs(tx);
			r.height = imageHeight;// - abs(ty);

			if (directionX == -1) {
				if (p.x > 0) {
					Gfx_drawImageRegion(fromImage,&r, &p, TRANS_NONE);
				}
			} else {
				if ((p.x + r.width) < scrWidth) {
					Gfx_drawImageRegion(fromImage,&r, &p, TRANS_NONE);
				}
			}

			tx -= directionX*imageWidth;
			ty -= directionY*imageHeight;
			p.x = (tx >= 0 ? tx : 0);
			p.y = (ty >= 0 ? ty : 0);
			r.left = tx >= 0 ? 0 : - tx;
			r.top = ty >= 0 ? 0 : - ty;
			r.width = imageWidth;// - abs(tx);
			r.height = imageHeight;// - abs(ty);

			if (directionX == -1) {
				if ((p.x + r.width) < scrWidth) {
					Gfx_drawImageRegion(toImage,&r, &p, TRANS_NONE);
				}
			} else {
				if (p.x > 0) {
					Gfx_drawImageRegion(toImage,&r, &p, TRANS_NONE);
				}
			}
			break;

		case TT_SLIDE_IN:
			tx = (int)(-directionX*(1-alpha)*imageWidth);
			ty = (int)(-directionY*(1-alpha)*imageHeight);

			if (directionX && directionY)
				Gfx_drawImage(fromImage, ox, oy);
			else
			{
				r.left = tx >= 0 ? 0 : imageWidth + tx;
				r.top = ty >= 0 ? 0 : imageHeight + ty;
				p.x = r.left + ox;
				p.y = r.top + oy;
				r.width = tx > 0 ? tx : imageWidth - r.left;
				r.height = ty > 0 ? ty : imageHeight - r.top;

				Gfx_drawImageRegion(fromImage,&r, &p, TRANS_NONE);
			}

			p.x = (tx >= 0 ? tx : 0) + ox;
			p.y = (ty >= 0 ? ty : 0) + oy;
			r.left = tx >= 0 ? 0 : - tx;
			r.top = ty >= 0 ? 0 : - ty;
			r.width = imageWidth - abs(tx);
			r.height = imageHeight - abs(ty);

			Gfx_drawImageRegion(toImage,&r, &p, TRANS_NONE);
			break;

		case TT_SLIDE_OUT:
			tx = (int)(directionX*alpha*imageWidth);
			ty = (int)(directionY*alpha*imageHeight);
			if (directionX && directionY)
				Gfx_drawImage(toImage, ox, oy);
			else
			{
				r.left = tx >= 0 ? 0 : imageWidth + tx;
				r.top = ty >= 0 ? 0 : imageHeight + ty;
				p.x = r.left + ox;
				p.y = r.top + oy;
				r.width = tx > 0 ? tx : imageWidth - r.left;
				r.height = ty > 0 ? ty : imageHeight - r.top;

				Gfx_drawImageRegion(toImage,&r, &p, TRANS_NONE);
			}

			p.x = (tx >= 0 ? tx : 0) + ox;
			p.y = (ty >= 0 ? ty : 0) + oy;
			r.left = tx >= 0 ? 0 : - tx;
			r.top = ty >= 0 ? 0 : - ty;
			r.width = imageWidth - abs(tx);
			r.height = imageHeight - abs(ty);

			Gfx_drawImageRegion(fromImage,&r, &p, TRANS_NONE);
			break;

		case TT_WIPE:
			tx = (int)(directionX*alpha*imageWidth);
			ty = (int)(directionY*alpha*imageHeight);
			if (directionX && directionY)
				Gfx_drawImage(fromImage, ox, oy);
			else
			{
				r.left = tx >= 0 ? tx : 0;
				r.top = ty >= 0 ? ty : 0;
				p.x = r.left + ox;
				p.y = r.top + oy;
				r.width = tx > 0 ? imageWidth - r.left : imageWidth + tx;
				r.height = ty > 0 ? imageHeight - r.top : imageHeight + ty;

				Gfx_drawImageRegion(fromImage,&r, &p, TRANS_NONE);
			}

			r.left = tx >= 0 ? 0 : imageWidth + tx;
			r.top = ty >= 0 ? 0 : imageHeight + ty;
			p.x = r.left + ox;
			p.y = r.top + oy;
			r.width = directionX ? abs(tx) : imageWidth;
			r.height = directionY ? abs(ty) : imageHeight;

			Gfx_drawImageRegion(toImage, &r, &p, TRANS_NONE);
			break;

		case TT_WIPE_CENTER:
			tx = abs((int)(directionX*alpha/2*imageWidth));
			ty = abs((int)(directionY*alpha/2*imageHeight));

			r.left = 0;
			r.top = 0;
			p.x = r.left + ox;
			p.y = r.top + oy;
			r.width = imageWidth;
			r.height = imageHeight;
			if (directionX > 0 || directionY > 0)
				Gfx_drawImageRegion(fromImage,&r, &p, TRANS_NONE);
			else
				Gfx_drawImageRegion(toImage,&r, &p, TRANS_NONE);

			r.left = directionX > 0 ? imageWidth/2 - tx : tx;
			r.top = directionY > 0 ? imageHeight/2 - ty : ty;
			p.x = r.left + ox;
			p.y = r.top + oy;
			r.width = directionX > 0 ? 2*tx : imageWidth - 2*tx;
			r.height = directionY > 0 ? 2*ty : imageHeight - 2*ty;

			if (directionX > 0 || directionY > 0)
				Gfx_drawImageRegion(toImage, &r, &p, TRANS_NONE);
			else
				Gfx_drawImageRegion(fromImage,&r, &p, TRANS_NONE);

			break;

		default:
			MAHandle image = alpha < 0.5 ? fromImage : toImage;
			if (image)
				Gfx_drawImage(image, ox, oy);
			break;
	}

	// Draw the overlay
	/*if (overlay)
		Gfx_drawImage(overlay, overlayPos.x, overlayPos.y);*/
}

/** Advances the transition **/
void TransitionImage::runTimerEvent()
{
	double oldalpha = alpha;

	alpha = baseAlpha + updateAlpha()*alphaScale;
	if (alpha >= 1.0)
		endTransition();
	else if (alpha <= 0.0)
		abortTransition();
	else if (alpha != oldalpha)
		requestRepaint();
}

/** Calculates new transition state **/
double TransitionImage::updateAlpha()
{
	double t = (double)(maGetMilliSecondCount() - start_time) / (double)duration;

	/** Sigmoid function, courtesy of ScreenTransition by Oscar Lindberg **/
	if (t < 0.0)
		return 0.0;
	else if (t < 0.5)
		return 2*t*t;
	else if (t < 1.0)
	{
		float tm1 = (t-1.0);
		return 1.0-2*tm1*tm1;
	}

	return 1.0;
}
