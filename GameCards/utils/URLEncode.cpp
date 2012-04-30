/*
 * urlencode.c
 *
 *  Created on: 26 Oct 2010
 *      Author: sjp
 */



#include "URLEncode.h"
#include "snprintf.h"
#include "Convert.h"

/* URLEncodes string with uppercase values, as specified by oAuth */
String URLencode(const String& c)
{
    String escaped = "";
    String charCode = "";
    int max = c.length();
    for(int i=0; i<max; i++)
    {
    	/* I found this code on the net, and I'm afraid I can't remember where.  I've adapted it to allow for
    	 * Twitter's very specific requirements for URL encoding.  The following characters are always unencoded.
    	 * This differs from many other implementations.
    	 * Also, escaped values MUST be in upper case hex, so %2F is valid, and %2f is not.  This is because a URLEncoded string
    	 * is hashed, and obviously %2f will hash to a different value.
    	 * SJP
    	 */
    	//"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.~"
        if ( (48 <= c[i] && c[i] <= 57) ||//0-9 - SJP:  This is someone else's Yoda coding, but I've not got a problem with it.
             (65 <= c[i] && c[i] <= 90) ||//abc...xyz
             (97 <= c[i] && c[i] <= 122) || //ABC...XYZ
             (c[i]=='~' || c[i]=='_' || c[i]=='.' || c[i]=='-')
        )
        {
        	//LOG("Appending char %c", c[i]);
            escaped.append( &c[i], 1);
        }
        else
        {
            char buffer[4];

            snprintf(buffer, 4, "%%%02X\0", c[i]);
            escaped.append(buffer, 3);
        }
    }
    return escaped;
};

String URLdecode(const String& c)
{
	String unescaped = "";
	String encoded  = "";
    int max = c.length();
    int i = 0;
    while(i < max)
    {
        if (c[i] != '%')
        {
            unescaped.append( &c[i++], 1);
        }
        else
        {
        	encoded.append(c.c_str() + i, 2);
        	int val = Convert::hexToInt(encoded.c_str());
        	char ec = (char) val;
        	const char* cc = (const char*)&ec;
        	unescaped.append(cc, 1);
        }
    }
    return unescaped;
};

