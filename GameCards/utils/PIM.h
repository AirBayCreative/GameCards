/*
 * PIM.h
 *
 *  Created on: 29 Jul 2010
 *      Author: orac7
 */

#ifndef PIM_H_
#define PIM_H_
#include <MAUtil/String.h>
#include <MAUtil/Vector.h>
#include <maarg.h>
#include <IX_PIM.h>

using namespace MAUtil;

struct Contact
{
	WString name;
	Vector<WString> numbers;
};

class ContactListener
{
	public:
		virtual void contactReceived(Contact& contact);
};

class PIM
{
	public:
		PIM();
		~PIM();

		void addListener(ContactListener* listener);

		void getContacts();

	private:
		Vector<ContactListener*> mListeners;

		int lprintf(const char* fmt, ...);

		Contact c;
		WString mFamilyName;
		WString mGivenName;
		WString mOtherName;
		WString mPrefix;
		WString mSuffix;

		void processData(WString& data, int field, int index);
		void formatName(WString& data, int index);
		void getFormattedName(WString& formattedName);
};

#endif /* PIM_H_ */
