/*
 * PIM.cpp
 *
 *  Created on: 29 Jul 2010
 *      Author: orac7
 */

#include "PIM.h"
#include <ma.h>
#include <maassert.h>
#include <conprint.h>
#include <MAUtil/Moblet.h>
#include <IX_PIM.h>
#include <mawstring.h>

PIM::PIM()
{}

PIM::~PIM()
{}

void PIM::addListener(ContactListener* listener)
{
	mListeners.add(listener);
}

void PIM::getContacts()
{
	char output[255];
	MA_PIM_ARGS args;

	MAHandle temp = maCreatePlaceholder();

	WString familyName;
	WString givenName;
	WString otherName;
	WString prefix;
	WString suffix;

	//lprintf("Starting PIM access");
	MAHandle contactList = maPimListOpen(MA_PIM_CONTACTS);
	if(contactList != 0)
	{
		MAHandle nextItem = maPimListNext(contactList);
		while(nextItem != 0)
		{
			//lprintf("Got a pim item");
			args.item = nextItem;
			args.buf = output;
			args.bufSize = sizeof(output);

			//Get the number of fields
			int nFields = maPimItemCount(nextItem);
			WString pimData;
			WString formattedName;
			pimData.reserve(50);

			//lprintf("Iterating through the fields");
			//Iterate through the fields
			for(int j=0; j<nFields; j++)
			{
				//lprintf("Iteration %d of %d", j, nFields);
				int field = maPimItemGetField(nextItem, j);
				int type = maPimFieldType(contactList, field);

				//lprintf("Field : %d, type %d", field, type);
				args.field = field;

				pimData.clear();

				//lprintf("Getting the number of values");
				int nValues = maPimItemFieldCount(nextItem, field);
				for(int k = 0; k < nValues; k++)
				{
					pimData.clear();
					//lprintf("Iteration %d of %d values", k, nValues);
					output[0] = 0;
					int attr = maPimItemGetAttributes(nextItem, field, k);
					int len = maPimItemGetValue(&args, k);

					switch(type)
					{
						case MA_PIM_TYPE_BINARY:
							break;
						case MA_PIM_TYPE_STRING:
							pimData.append((wchar*)output, wcslen((wchar*)output));
							//if(attr && MA_PIM_ATTR_MOBILE)
								processData(pimData, field, 0);
							break;
						case MA_PIM_TYPE_BOOLEAN:
						case MA_PIM_TYPE_INT:
							break;
						case MA_PIM_TYPE_DATE:
							break;
						case MA_PIM_TYPE_STRING_ARRAY:
							//lprintf("String array");
							int num = *(int*)output;
							//lprintf("There are %d values in this field", num);
							const wchar* ptr = (wchar*)(output + 4);
							for(int i=0; i<num; i++)
							{
								pimData.clear();
								pimData.append(ptr, wcslen(ptr));

								//lprintf("Processing data '%S'", pimData.c_str());
								processData(pimData, field, i);

								ptr += wcslen(ptr) + 1;

							}
							break;

					}
				}
			}
			maPimItemClose(nextItem);

			nextItem = maPimListNext(contactList);

			getFormattedName(c.name);

			Vector_each(ContactListener*, itr, mListeners)
				(*itr)->contactReceived(c);

			//lprintf("FORMATTED NAME: %S", c.name.c_str());

			mPrefix.clear();
			mGivenName.clear();
			mOtherName.clear();
			mFamilyName.clear();
			mSuffix.clear();

			c.name.clear();
			c.numbers.clear();
		}
		maPimListClose(contactList);
	}
}

void PIM::processData(WString& data, int field, int index)
{
	switch(field)
	{
		//Is this field the contact name?
		case MA_PIM_FIELD_CONTACT_NAME:
			//Format the name
			//lprintf("Formatting name '%S'", data.c_str());
			formatName(data, index);
			break;
		//Is this field the contact number
		case MA_PIM_FIELD_CONTACT_TEL:
			//lprintf("Contact number: %s", data.c_str());
			c.numbers.add(data);
			break;
	}
}

void PIM::formatName(WString& data, int index)
{
	//lprintf("Index number %d", index);
	switch(index)
	{
		case MA_PIM_CONTACT_NAME_FAMILY:
			//lprintf("Family Name: %S", data.c_str());
			mFamilyName.append(data.c_str(), data.length());
			break;
		case MA_PIM_CONTACT_NAME_GIVEN:
			//lprintf("Given Name: %S", data.c_str());
			mGivenName.append(data.c_str(), data.length());
			break;
		case MA_PIM_CONTACT_NAME_OTHER:
			//lprintf("Other Name: %S", data.c_str());
			mOtherName.append(data.c_str(), data.length());
			break;
		case MA_PIM_CONTACT_NAME_PREFIX:
			//lprintf("Prefix: %S", data.c_str());
			mPrefix.append(data.c_str(), data.length());
			break;
		case MA_PIM_CONTACT_NAME_SUFFIX:
			//lprintf("Suffix: %S", data.c_str());
			mSuffix.append(data.c_str(), data.length());
			break;
	}
}

void PIM::getFormattedName(WString& formattedName)
{
	//lprintf("%S %S %S %S %S", mPrefix.c_str(), mGivenName.c_str(), mOtherName.c_str(), mFamilyName.c_str(), mSuffix.c_str());
	WString tempStr;
	tempStr.reserve(50);
	//WString spacer = (const wchar*)" ";
	WString spacer = L" ";
	//const wchar* spacer = (const wchar*)' ';

	if(mPrefix.length() > 0)
		tempStr = mPrefix + spacer;
	if(mGivenName.length() > 0)
		tempStr += mGivenName + spacer;
	if(mOtherName.length() > 0)
		tempStr += mOtherName + spacer;
	if(mFamilyName.length() > 0)
		tempStr += mFamilyName + spacer;
	if(mSuffix.length() > 0)
		tempStr += mSuffix + spacer;

	//lprintf("%S", tempStr.c_str());
	formattedName.clear();
	formattedName.append(tempStr.c_str(), tempStr.length());
}

int PIM::lprintf(const char* fmt, ...)
{
	va_list args;
	char buf[2048];
	int len;
	static int lastWLres = 0;

	if(lastWLres < 0)
		return lastWLres;

	buf[0] = 0;

	va_start(args, fmt);
	len = vsprintf(buf, fmt, args);
	if(len > (int)sizeof(buf) - 2) {
		maPanic(0, "lprintfln buffer overrun!");
	}
	va_end(args);
	printf(buf);
	lastWLres = maWriteLog(buf, len);
	return len;
}

