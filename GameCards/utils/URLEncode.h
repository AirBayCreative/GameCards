/*
 * URLEncode.h
 *
 *  Created on: 21 Oct 2010
 *      Author: sjp
 *
  * This code is based on code at http://www.zedwood.com/article/111/cpp-urlencode-function
 */

#ifndef URLENCODE_H_
#define URLENCODE_H_


#include <MAUtil/String.h>

using namespace MAUtil;

#ifdef __cplusplus
extern "C" {
#endif

String URLencode(const String& c);
String URLdecode(const String& c);

#ifdef __cplusplus
}
#endif

#endif /* URLENCODE_H_ */
