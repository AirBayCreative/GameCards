#ifndef MAAPI_DEFS_H
#define MAAPI_DEFS_H

/** \brief A hash of the abstract representation of the API described in this file.
 * Identifiers, declarations and definitions are included in the calculation of the hash,
 * but documentation is not.
 */
#define MAIDL_HASH ((int)0x959507e8)

#ifndef _WCHAR_DEFINED
#define _WCHAR_DEFINED
#ifdef MAPIP
#ifdef __cplusplus
typedef wchar_t wchar;
#else
typedef unsigned short wchar;
typedef wchar wchar_t;
#endif	//__cplusplus
#else	//MAPIP
typedef unsigned short wchar;
#endif	//MAPIP
#endif	//_WCHAR_DEFINED

#ifndef _SYSV_TYPES_DEFINED
#define _SYSV_TYPES_DEFINED
typedef unsigned short ushort;
typedef unsigned int uint;
#endif	//_SYSV_TYPES_DEFINED

typedef char* MAString;
typedef wchar* MAWString;
typedef void* MAAddress;
typedef int MAHandle;
typedef int MAExtent;
typedef unsigned char byte;
typedef unsigned long ulong;
typedef long long longlong;

/// Returns the height of an MAExtent.
#define  EXTENT_Y(e) ((short)(e))

/// Returns the width of an MAExtent.
#define  EXTENT_X(e) ((short)((e) >> 16))

/// Creates an MAExtent.
#define  EXTENT(x, y) ((MAExtent)((((int)(x)) << 16) | ((y) & 0xFFFF)))

/// The image is copied unchanged.
#define TRANS_NONE 0

/// The image is rotated clockwise by 90 degrees.
#define TRANS_ROT90 5

/// The image is rotated clockwise by 180 degrees.
#define TRANS_ROT180 3

/// The image is rotated clockwise by 270 degrees.
#define TRANS_ROT270 6

/// The image is reflected about its vertical center.
#define TRANS_MIRROR 2

/// The image is reflected about its vertical center, then rotated clockwise by 90 degrees.
#define TRANS_MIRROR_ROT90 7

/// The image is reflected about its vertical center, then rotated clockwise by 180 degrees.
#define TRANS_MIRROR_ROT180 1

/// The image is reflected about its vertical center, then rotated clockwise by 270 degrees.
#define TRANS_MIRROR_ROT270 4

/// This handle refers to the back buffer, which is initially black.
#define HANDLE_SCREEN 0

#define HANDLE_LOCAL 0

#define RES_OUT_OF_MEMORY -1
#define RES_BAD_INPUT -2
#define RES_OK 1

#define MAS_CREATE_IF_NECESSARY 1

/// Generic error.
#define STERR_GENERIC -2

/// The storage medium is full.
#define STERR_FULL -3

/// The store does not exist.
#define STERR_NONEXISTENT -5

/// Generic error.
#define CONNERR_GENERIC -2

/// The maximum number of open connections allowed has been reached.
#define CONNERR_MAX -3

/// DNS resolution error.
#define CONNERR_DNS -4

/// Internal error. Please report any occurrences.
#define CONNERR_INTERNAL -5

/** \brief The connection was closed by the remote peer.
*
* Happens when HTTP servers finish sending data.
*/
#define CONNERR_CLOSED -6

/// You attempted to write to a read-only connection.
#define CONNERR_READONLY -7

/// The OS does not trust you enough to let you open this connection.
#define CONNERR_FORBIDDEN -8

/// No operation has been started yet.
#define CONNERR_UNINITIALIZED -9

/// The Content-Length header could not be found.
#define CONNERR_CONLEN -10

/// You supplied a malformed URL.
#define CONNERR_URL -11

/// The protocol is not available.
/// If a Bluetooth function returns this, the Bluetooth chip is turned off.
#define CONNERR_UNAVAILABLE -12

/// You canceled the operation.
#define CONNERR_CANCELED -13

/// The server gave an invalid response.
#define CONNERR_PROTOCOL -14

/// The network connection could not be established.
#define CONNERR_NETWORK -15

/// The requested header could not be found.
#define CONNERR_NOHEADER -16

/// The requested object could not be found.
#define CONNERR_NOTFOUND -17

/// An error occurred during SSL negotiation.
#define CONNERR_SSL -18

/**
* If you wish to share the CONNERR codespace,
* use values below this for your own error codes.
*/
#define CONNERR_USER -1000000

#define CONNOP_READ 1
#define CONNOP_WRITE 2
#define CONNOP_CONNECT 5
#define CONNOP_FINISH 11
#define CONNOP_ACCEPT 16

/// The maximum number of open connections allowed.
#define CONN_MAX 32

#define BTADDR_LEN 6

#define CONN_FAMILY_INET4 1
#define CONN_FAMILY_BT 2

#define HTTP_GET 1
#define HTTP_POST 2
#define HTTP_HEAD 3

#define MAK_UNKNOWN 0
#define MAK_FIRST 0
#define MAK_BACKSPACE 8
#define MAK_TAB 9
#define MAK_CLEAR 12
#define MAK_RETURN 13
#define MAK_PAUSE 19
#define MAK_ESCAPE 27
#define MAK_SPACE 32
#define MAK_EXCLAIM 33
#define MAK_QUOTEDBL 34
#define MAK_POUND 35
#define MAK_HASH 35
#define MAK_GRID 35
#define MAK_DOLLAR 36
#define MAK_AMPERSAND 38
#define MAK_QUOTE 39
#define MAK_LEFTPAREN 40
#define MAK_RIGHTPAREN 41
#define MAK_ASTERISK 42
#define MAK_STAR 42
#define MAK_PLUS 43
#define MAK_COMMA 44
#define MAK_MINUS 45
#define MAK_PERIOD 46
#define MAK_SLASH 47
#define MAK_0 48
#define MAK_1 49
#define MAK_2 50
#define MAK_3 51
#define MAK_4 52
#define MAK_5 53
#define MAK_6 54
#define MAK_7 55
#define MAK_8 56
#define MAK_9 57
#define MAK_COLON 58
#define MAK_SEMICOLON 59
#define MAK_LESS 60
#define MAK_EQUALS 61
#define MAK_GREATER 62
#define MAK_QUESTION 63
#define MAK_AT 64
#define MAK_LEFTBRACKET 91
#define MAK_BACKSLASH 92
#define MAK_RIGHTBRACKET 93
#define MAK_CARET 94
#define MAK_UNDERSCORE 95
#define MAK_BACKQUOTE 96
#define MAK_A 97
#define MAK_B 98
#define MAK_C 99
#define MAK_D 100
#define MAK_E 101
#define MAK_F 102
#define MAK_G 103
#define MAK_H 104
#define MAK_I 105
#define MAK_J 106
#define MAK_K 107
#define MAK_L 108
#define MAK_M 109
#define MAK_N 110
#define MAK_O 111
#define MAK_P 112
#define MAK_Q 113
#define MAK_R 114
#define MAK_S 115
#define MAK_T 116
#define MAK_U 117
#define MAK_V 118
#define MAK_W 119
#define MAK_X 120
#define MAK_Y 121
#define MAK_Z 122
#define MAK_DELETE 127
#define MAK_KP0 256
#define MAK_KP1 257
#define MAK_KP2 258
#define MAK_KP3 259
#define MAK_KP4 260
#define MAK_KP5 261
#define MAK_KP6 262
#define MAK_KP7 263
#define MAK_KP8 264
#define MAK_KP9 265
#define MAK_KP_PERIOD 266
#define MAK_KP_DIVIDE 267
#define MAK_KP_MULTIPLY 268
#define MAK_KP_MINUS 269
#define MAK_KP_PLUS 270
#define MAK_KP_ENTER 271
#define MAK_KP_EQUALS 272
#define MAK_UP 273
#define MAK_DOWN 274
#define MAK_RIGHT 275
#define MAK_LEFT 276
#define MAK_INSERT 277
#define MAK_HOME 278
#define MAK_END 279
#define MAK_PAGEUP 280
#define MAK_PAGEDOWN 281
#define MAK_FIRE 284
#define MAK_SOFTLEFT 285
#define MAK_SOFTRIGHT 286
#define MAK_PEN 291
#define MAK_BACK 292
#define MAK_MENU 293
#define MAK_RSHIFT 303
#define MAK_LSHIFT 304
#define MAK_RCTRL 305
#define MAK_LCTRL 306
#define MAK_RALT 307
#define MAK_LALT 308

#define MAKB_LEFT 0x00001
#define MAKB_UP 0x00002
#define MAKB_RIGHT 0x00004
#define MAKB_DOWN 0x00008
#define MAKB_FIRE 0x00010
#define MAKB_SOFTLEFT 0x00020
#define MAKB_SOFTRIGHT 0x00040
#define MAKB_0 0x00080
#define MAKB_1 0x00100
#define MAKB_2 0x00200
#define MAKB_3 0x00400
#define MAKB_4 0x00800
#define MAKB_5 0x01000
#define MAKB_6 0x02000
#define MAKB_7 0x04000
#define MAKB_8 0x08000
#define MAKB_9 0x10000
#define MAKB_ASTERISK 0x20000
#define MAKB_STAR 0x20000
#define MAKB_HASH 0x40000
#define MAKB_POUND 0x40000
#define MAKB_GRID 0x40000
#define MAKB_CLEAR 0x80000

#define EVENT_BUFFER_SIZE 128

/// In milliseconds
#define EVENT_CLOSE_TIMEOUT 2000

/**
* This event is posted when the operating system sends MoSync a command to exit.
* Causes include the OS shutting down and OS-controlled user commands.
* \see maGetEvent()
*/
#define EVENT_TYPE_CLOSE 1

#define EVENT_TYPE_KEY_PRESSED 2
#define EVENT_TYPE_KEY_RELEASED 3

/// Connection
#define EVENT_TYPE_CONN 4

/// Bluetooth discovery
#define EVENT_TYPE_BT 5

#define EVENT_TYPE_POINTER_PRESSED 8
#define EVENT_TYPE_POINTER_RELEASED 9
#define EVENT_TYPE_POINTER_DRAGGED 10

/**
 * While MoSync doesn't have focus, no key events will arrive and the screen will not be updated.
 * If the keypad is locked, no application will have focus.
 * \see maLockKeypad
 */
#define EVENT_TYPE_FOCUS_LOST 13

#define EVENT_TYPE_FOCUS_GAINED 14

/// Has MAEvent::data point to an MALocation.
#define EVENT_TYPE_LOCATION 16

/// MAEvent::state is one of the \link #MA_LPS_AVAILABLE MA_LPS \endlink constants.
#define EVENT_TYPE_LOCATION_PROVIDER 17

/** \brief The size of the screen changed.
* Use maGetScrSize() to get the new size.
*
* If the screen is the current draw target, the clipping rectangle is removed.
* Use maSetClipRect() to reset it.
*/
#define EVENT_TYPE_SCREEN_CHANGED 21

/// Character input. Uses MAEvent::character.
#define EVENT_TYPE_CHAR 22

/** \brief The text box created by maTextBox() was just closed.
* Uses MAEvent::textboxResult and MAEvent::textboxLength.
*/
#define EVENT_TYPE_TEXTBOX 23

/// The MoSync Reference Environment, also known as the Emulator.
#define RUNTIME_MORE 1

/// Java ME
#define RUNTIME_JAVA 2

/// Symbian
#define RUNTIME_SYMBIAN 3

/// Windows CE, also known as Windows Mobile.
#define RUNTIME_WINCE 4

/// Caused by a MoSync Panic. MAPanicReport::code is the panic code.
#define REPORT_PANIC 1

/// Caused by a native exception. MAPanicReport::string describes the exception.
#define REPORT_EXCEPTION 2

/// Caused by a platform-specific error. MAPanicReport::code is valid.
#define REPORT_PLATFORM_CODE 3

/// Caused by a call to maPanic(). MAPanicReport::code and MAPanicReport::string are the
/// parameters from the call.
#define REPORT_USER_PANIC 4

/// Caused by the Close event timeout. Neither code or string are valid.
#define REPORT_TIMEOUT 5

#define MA_LOC_NONE 1
#define MA_LOC_INVALID 2
#define MA_LOC_UNQUALIFIED 3
#define MA_LOC_QUALIFIED 4

/**
* Availability status code: the location provider is available.
*/
#define MA_LPS_AVAILABLE 1

/**
* Availability status code: the location provider is temporarily unavailable.
* Temporary unavailability means that the method is unavailable due to reasons
* that can be expected to possibly change in the future and the provider to
* become available. An example is not being able to receive the signal because
* the signal used by the location method is currently being obstructed,
* e.g. when deep inside a building for satellite based methods.
* However, a very short transient obstruction of the signal should not cause
* the provider to toggle quickly between TEMPORARILY_UNAVAILABLE and AVAILABLE.
*/
#define MA_LPS_TEMPORARILY_UNAVAILABLE 2

/**
* Availability status code: the location provider is out of service.
* Being out of service means that the method is unavailable and the implementation
* is not able to expect that this situation would change in the near future.
* An example is when using a location method implemented in an external device and
* the external device is detached.
*/
#define MA_LPS_OUT_OF_SERVICE 3

/// The user is allowed to enter any text, including line breaks.
#define MA_TB_TYPE_ANY 0

/// The user is allowed to enter an e-mail address.
#define MA_TB_TYPE_EMAILADDR 1

/// The user is allowed to enter an integer value.
#define MA_TB_TYPE_NUMERIC 2

/// The user is allowed to enter a phone number.
#define MA_TB_TYPE_PHONENUMBER 3

/// The user is allowed to enter a URL.
#define MA_TB_TYPE_URL 4

/// The user is allowed to enter a real number value.
/// This extends #MA_TB_TYPE_NUMERIC by allowing a decimal point.
#define MA_TB_TYPE_DECIMAL 5

/// The user chose OK.
#define MA_TB_RES_OK 1

/// The user chose Cancel.
#define MA_TB_RES_CANCEL 2

/// Indicates that the text entered is confidential data that should be
/// obscured whenever possible.
/// This implies #MA_TB_FLAG_SENSITIVE.
#define MA_TB_FLAG_PASSWORD 0x1000

/// Indicates that editing is disallowed.
#define MA_TB_FLAG_UNEDITABLE 0x2000

/// Indicates that the text entered is sensitive data that the implementation
/// must never store into a dictionary or table for use in predictive, auto-completing,
/// or other accelerated input schemes. A credit card number is an example of sensitive data.
#define MA_TB_FLAG_SENSITIVE 0x4000

/// Indicates that the text entered does not consist of words that are likely
/// to be found in dictionaries typically used by predictive input schemes.
#define MA_TB_FLAG_NON_PREDICTIVE 0x8000

/// This flag is a hint to the implementation that during text editing,
/// the initial letter of each word should be capitalized.
#define MA_TB_FLAG_INITIAL_CAPS_WORD 0x10000

/// This flag is a hint to the implementation that during text editing,
/// the initial letter of each sentence should be capitalized.
#define MA_TB_FLAG_INITIAL_CAPS_SENTENCE 0x20000

#define IOCTL_UNAVAILABLE -1

/**
 * \brief A structure representing a two-dimensional point, with coordinates 'x' and 'y'.
 */
typedef struct MAPoint2d {
	int x;
	int y;
} MAPoint2d;

/**
 * \brief A structure representing a rectangle.
 * 
 * The x and y coordinate of the top-left corner are defined by 'left' and 'top'.
 * The dimensions of the rectangle are defined by 'width' and 'height'.
 */
typedef struct MARect {
	int left;
	int top;
	int width;
	int height;
} MARect;

/**
* \brief Parameters for the maCopyData() function.
*/
typedef struct MACopyData {
	MAHandle dst;
	int dstOffset;
	MAHandle src;
	int srcOffset;
	int size;
} MACopyData;

/**
* \brief An address for the TCP/IPv4 protocol.
*/
typedef struct MAConnAddrInet4 {
	int addr;
	int port;
} MAConnAddrInet4;

/**
* \brief A Bluetooth device address.
*/
typedef struct MABtAddr {
	byte a[BTADDR_LEN];
} MABtAddr;

/**
* \brief An address for the Bluetooth Serial Port protocol.
*/
typedef struct MAConnAddrBt {
	int port;
	MABtAddr addr;
} MAConnAddrBt;

/**
* \brief A connection address.
*/
typedef struct MAConnAddr {
	/// One of the CONN_FAMILY constants
	int family;
	union {

		MAConnAddrInet4 inet4;

		MAConnAddrBt bt;
	};
} MAConnAddr;

/**
* \brief Data for a connection event, including an indicator or success or failure.
*/
typedef struct MAConnEventData {
	/// The handle to the connection associated with the event.
	MAHandle handle;

	/// One of the \link #CONNOP_READ CONNOP \endlink constants.
	int opType;

	/// A success value \> 0 or a \link #CONNERR_GENERIC CONNERR \endlink code.
	int result;
} MAConnEventData;

#ifdef SYMBIAN
typedef struct _AS00001 {
	/**
	* In KEY events, this will be one of the \link #MAK_UNKNOWN MAK \endlink constants.
	*/
	int key;

	/**
	* In KEY events, this will be the native keycode.
	*/
	int nativeKey;
} _AS00001;
#endif

#ifdef SYMBIAN
typedef struct _AS00002 {
	/**
	* One of the \link #MA_TB_RES_OK MA_TB_RES \endlink codes.
	*/
	int textboxResult;

	/**
	* The length, in characters, of the finished text.
	* Does not include the terminating zero.
	*/
	int textboxLength;
} _AS00002;
#endif

/**
* \brief An event; a message indicating that something has happened, e.g. that a key has been pressed.
*/
typedef struct MAEvent {
	/**
	* One of the \link #EVENT_TYPE_CLOSE EVENT_TYPE \endlink constants.
	*/
	int type;
	union {

#ifdef SYMBIAN
		_AS00001 ked;
#else
		struct {
			/**
			* In KEY events, this will be one of the \link #MAK_UNKNOWN MAK \endlink constants.
			*/
			int key;

			/**
			* In KEY events, this will be the native keycode.
			*/
			int nativeKey;
		};
#endif

		/**
		* In CHAR events, this is the Unicode character that was received.
		*/
		uint character;

		/**
		 * In POINTER events, this will be the location of the pointer.
		 */
		MAPoint2d point;

		/**
		* In \link #EVENT_TYPE_BT BT \endlink events, this will be a value \>= 0 or
		* one of the \link #CONNERR_GENERIC CONNERR \endlink constants.
		*/
		int state;

		/**
		* Valid only in CONN events.
		*/
		MAConnEventData conn;

#ifdef SYMBIAN
		_AS00002 textbox;
#else
		struct {
			/**
			* One of the \link #MA_TB_RES_OK MA_TB_RES \endlink codes.
			*/
			int textboxResult;

			/**
			* The length, in characters, of the finished text.
			* Does not include the terminating zero.
			*/
			int textboxLength;
		};
#endif

		/**
		* Used by custom events. See invididual event descriptions.
		*/
		void* data;
	};
} MAEvent;

/**
* \brief A MoSync Panic or other unrecoverable error.
*
* In MoSync Debug builds, when such an error occurs, the runtime writes
* an instance of this structure to a Store named "panic.report".
*
* The length of that instance may be greater than sizeof(MAPanicReport),
* because of the variable-length string that may appear at its end.
* The member \a string can, then, be longer than the one byte that is declared.
*
* To properly read an instance of this struct from a store, you should allocate a
* chunk of memory whose size is equal to the size of the store, then read the entire store
* into that chunk of memory. Then you should make a pointer of type MAPanicReport and point it
* to the chunk. Then you can read normally, using that pointer.
*
* \see maOpenStore()
* \see maPanic()
* \see malloc()
*/
typedef struct MAPanicReport {
	/// The type of MoSync runtime that wrote the report. A \link #RUNTIME_MORE RUNTIME \endlink constant.
	int runtimeId;

	/**
	* The type report. Specifies whether the members \a code and \a string are valid.
	* A \link #REPORT_PANIC REPORT \endlink constant.
	*/
	int reportType;

	/// The time the report was generated. The format is unix time. \see maTime()
	int time;

	/**
	* The value of the MoSync instruction pointer at the time the report was generated.
	* \< 0 if the MoSync core was inaccessible.
	*/
	int ip;

	int code;

	char string[1];
} MAPanicReport;

/** @name Bluetooth discovery
* These structures and functions are used for asynchronous device and service discovery.
* Only one operation may be active at a time.

* When a device or service is found, its information is stored in internal buffers
* for later retrieval by maBtGetNewDevice() or maBtGetNewService(), then a BT event is generated.
* A BT event is also generated when the operation is complete.

* A BT event contains the state of the Bluetooth Discovery operation.
* This is <0 (a \link #CONNERR_GENERIC CONNERR \endlink value) on failure,
* 0 while still working and
* ((number of devices/services found) + 1) when the discovery is complete.

* The reason for the (+1) is to distinguish "still working" from
* "discovery complete, zero found".

* The buffers are cleared when the respective operation is started, so any devices or services
* left over in the buffers from an earlier operation will be lost.
*/
/**@{*/
/**
* \brief Information about a Bluetooth device.
*/
typedef struct MABtDevice {
	///in (pointer), out (buffer)
	char* name;

	///in, the length of the buffer pointed to by a name.
	int nameBufSize;

	///out, the length of the name, excluding the terminating zero.
	int actualNameLength;

	///out
	MABtAddr address;
} MABtDevice;

/**
* \brief A Universally Unique Identifier.
*
* Common Bluetooth UUID values can be found in MAUtil/mauuid.h.
*/
typedef struct MAUUID {
	int i[4];
} MAUUID;

/**
* \brief Information about an MABtService object.
*/
typedef struct MABtServiceSize {
	/**
	* The buffer size neccesary to contain the full name,
	* or <0 if the service has no name.
	*/
	int nameBufSize;

	/**
	* The number of UUIDs associated with the service.
	*/
	int nUuids;
} MABtServiceSize;

/**
* \brief Information about a Bluetooth service.
*/
typedef struct MABtService {
	/**
	* The port number for the service.
	* \see maConnect()
	*/
	int port;

	/**
	* Pointer to a buffer that recieves the service's human-readable name.
	*/
	char* name;

	/**
	* The size of the buffer being pointed to by \a name.
	*/
	int nameBufSize;

	/**
	* Pointer to a buffer that recieves the UUIDs associated with the service.
	* The buffer must be large enough to contain the number of UUIDs reported
	* by the last call to maBtGetNextServiceSize().
	*/
	MAUUID* uuids;
} MABtService;

/**
* \brief A geographical location specified by latitude and longitude, horizontal and vertical accuracy, and altitude.
*
* Only if \a state equals #MA_LOC_QUALIFIED do the other members contain valid data.
*
* Coordinates are in the WGS84 datum.
*
* The horizontal accuracy is the RMS (root mean square) of east accuracy
* (latitudinal error in meters, 1-sigma standard deviation), north accuracy
* (longitudinal error in meters, 1-sigma).
*
* The vertical accuracy is in meters in vertical direction
* (orthogonal to ellipsoid surface, 1-sigma standard deviation).
*
* Accuracy values may be NaN, if accuracy is unknown.
*
* \see maLocationStart()
*/
typedef struct MALocation {
	/**
	* The validity of the coordinates.
	* One of the \link #MA_LOC_NONE MA_LOC \endlink constants.
	*/
	int state;

	double lat;

	double lon;

	double horzAcc;

	double vertAcc;

	float alt;
} MALocation;

/**
* \brief A structure containing information about the native framebuffer, including color format and resolution. 
* 
* The 'sizeInBytes' field is the amount of bytes that should be used to allocate the offscreen framebuffer (a backbuffer). 
*/
typedef struct MAFrameBufferInfo {
	int sizeInBytes;
	int bytesPerPixel;
	int bitsPerPixel;
	int redMask;
	int redShift;
	int redBits;
	int greenMask;
	int greenShift;
	int greenBits;
	int blueMask;
	int blueShift;
	int blueBits;
	int width;
	int height;
	int pitch;
	int supportsGfxSyscalls;
} MAFrameBufferInfo;

/**
* \brief The camera format, in pixels.
*/
typedef struct MA_CAMERA_FORMAT {
	int width;
	int height;
} MA_CAMERA_FORMAT;

#define maIOCtl_MAAPI_caselist \
maIOCtl_maReportCallStack_case(maReportCallStack) \
maIOCtl_maDumpCallStackEx_case(maDumpCallStackEx) \
maIOCtl_maProtectMemory_case(maProtectMemory) \
maIOCtl_maUnprotectMemory_case(maUnprotectMemory) \
maIOCtl_maSetMemoryProtection_case(maSetMemoryProtection) \
maIOCtl_maGetMemoryProtection_case(maGetMemoryProtection) \
maIOCtl_maGetBatteryCharge_case(maGetBatteryCharge) \
maIOCtl_maLockKeypad_case(maLockKeypad) \
maIOCtl_maUnlockKeypad_case(maUnlockKeypad) \
maIOCtl_maKeypadIsLocked_case(maKeypadIsLocked) \
maIOCtl_maWriteLog_case(maWriteLog) \
maIOCtl_maBtStartDeviceDiscovery_case(maBtStartDeviceDiscovery) \
maIOCtl_maBtGetNewDevice_case(maBtGetNewDevice) \
maIOCtl_maBtStartServiceDiscovery_case(maBtStartServiceDiscovery) \
maIOCtl_maBtGetNextServiceSize_case(maBtGetNextServiceSize) \
maIOCtl_maBtGetNewService_case(maBtGetNewService) \
maIOCtl_maBtCancelDiscovery_case(maBtCancelDiscovery) \
maIOCtl_maLocationStart_case(maLocationStart) \
maIOCtl_maLocationStop_case(maLocationStop) \
maIOCtl_maPlatformRequest_case(maPlatformRequest) \
maIOCtl_maSendTextSMS_case(maSendTextSMS) \
maIOCtl_maFrameBufferGetInfo_case(maFrameBufferGetInfo) \
maIOCtl_maFrameBufferInit_case(maFrameBufferInit) \
maIOCtl_maFrameBufferClose_case(maFrameBufferClose) \
maIOCtl_maAccept_case(maAccept) \
maIOCtl_maSendToBackground_case(maSendToBackground) \
maIOCtl_maBringToForeground_case(maBringToForeground) \
maIOCtl_maGetSystemProperty_case(maGetSystemProperty) \
maIOCtl_maCameraFormatNumber_case(maCameraFormatNumber) \
maIOCtl_maCameraFormat_case(maCameraFormat) \
maIOCtl_maCameraStart_case(maCameraStart) \
maIOCtl_maCameraStop_case(maCameraStop) \
maIOCtl_maCameraSnapshot_case(maCameraSnapshot) \
maIOCtl_maShowVirtualKeyboard_case(maShowVirtualKeyboard) \
maIOCtl_maTextBox_case(maTextBox) \

#define maIOCtl_maReportCallStack 1
#define maIOCtl_maReportCallStack_case(func) \
case 1: \
{ \
return func(); \
} \

#define maIOCtl_maDumpCallStackEx 2
#define maIOCtl_maDumpCallStackEx_case(func) \
case 2: \
{ \
const char* _str = GVS(a); \
int _data = b; \
return func(_str, _data); \
} \

#define maIOCtl_maProtectMemory 3
#define maIOCtl_maProtectMemory_case(func) \
case 3: \
{ \
const void* _start = GVMR(a, MAAddress); \
int _length = b; \
func(_start, _length); \
return 0; \
} \

#define maIOCtl_maUnprotectMemory 4
#define maIOCtl_maUnprotectMemory_case(func) \
case 4: \
{ \
const void* _start = GVMR(a, MAAddress); \
int _length = b; \
func(_start, _length); \
return 0; \
} \

#define maIOCtl_maSetMemoryProtection 5
#define maIOCtl_maSetMemoryProtection_case(func) \
case 5: \
{ \
int _enable = a; \
func(_enable); \
return 0; \
} \

#define maIOCtl_maGetMemoryProtection 6
#define maIOCtl_maGetMemoryProtection_case(func) \
case 6: \
{ \
return func(); \
} \

#define maIOCtl_maGetBatteryCharge 7
#define maIOCtl_maGetBatteryCharge_case(func) \
case 7: \
{ \
return func(); \
} \

#define maIOCtl_maLockKeypad 17
#define maIOCtl_maLockKeypad_case(func) \
case 17: \
{ \
return func(); \
} \

#define maIOCtl_maUnlockKeypad 18
#define maIOCtl_maUnlockKeypad_case(func) \
case 18: \
{ \
return func(); \
} \

#define maIOCtl_maKeypadIsLocked 19
#define maIOCtl_maKeypadIsLocked_case(func) \
case 19: \
{ \
return func(); \
} \

#define maIOCtl_maWriteLog 20
#define maIOCtl_maWriteLog_case(func) \
case 20: \
{ \
const void* _src = GVMR(a, MAAddress); \
int _size = b; \
return func(_src, _size); \
} \

#define maIOCtl_maBtStartDeviceDiscovery 21
#define maIOCtl_maBtStartDeviceDiscovery_case(func) \
case 21: \
{ \
int _names = a; \
return func(_names); \
} \

#define maIOCtl_maBtGetNewDevice 22
#define maIOCtl_maBtGetNewDevice_case(func) \
case 22: \
{ \
MABtDevice* _d = GVMR(a, MABtDevice); \
return func(_d); \
} \

#define maIOCtl_maBtStartServiceDiscovery 23
#define maIOCtl_maBtStartServiceDiscovery_case(func) \
case 23: \
{ \
const MABtAddr* _address = GVMR(a, MABtAddr); \
const MAUUID* _uuid = GVMR(b, MAUUID); \
return func(_address, _uuid); \
} \

#define maIOCtl_maBtGetNextServiceSize 24
#define maIOCtl_maBtGetNextServiceSize_case(func) \
case 24: \
{ \
MABtServiceSize* _dst = GVMR(a, MABtServiceSize); \
return func(_dst); \
} \

#define maIOCtl_maBtGetNewService 25
#define maIOCtl_maBtGetNewService_case(func) \
case 25: \
{ \
MABtService* _dst = GVMR(a, MABtService); \
return func(_dst); \
} \

#define maIOCtl_maBtCancelDiscovery 26
#define maIOCtl_maBtCancelDiscovery_case(func) \
case 26: \
{ \
return func(); \
} \

#define maIOCtl_maLocationStart 29
#define maIOCtl_maLocationStart_case(func) \
case 29: \
{ \
return func(); \
} \

#define maIOCtl_maLocationStop 30
#define maIOCtl_maLocationStop_case(func) \
case 30: \
{ \
return func(); \
} \

#define maIOCtl_maPlatformRequest 31
#define maIOCtl_maPlatformRequest_case(func) \
case 31: \
{ \
const char* _url = GVS(a); \
return func(_url); \
} \

#define maIOCtl_maSendTextSMS 52
#define maIOCtl_maSendTextSMS_case(func) \
case 52: \
{ \
const char* _dst = GVS(a); \
const char* _msg = GVS(b); \
return func(_dst, _msg); \
} \

#define maIOCtl_maFrameBufferGetInfo 70
#define maIOCtl_maFrameBufferGetInfo_case(func) \
case 70: \
{ \
MAFrameBufferInfo* _info = GVMR(a, MAFrameBufferInfo); \
return func(_info); \
} \

#define maIOCtl_maFrameBufferInit 71
#define maIOCtl_maFrameBufferInit_case(func) \
case 71: \
{ \
const void* _data = GVMR(a, MAAddress); \
return func(_data); \
} \

#define maIOCtl_maFrameBufferClose 72
#define maIOCtl_maFrameBufferClose_case(func) \
case 72: \
{ \
return func(); \
} \

#define maIOCtl_maAccept 76
#define maIOCtl_maAccept_case(func) \
case 76: \
{ \
MAHandle _serv = (MAHandle)a; \
return func(_serv); \
} \

#define maIOCtl_maSendToBackground 77
#define maIOCtl_maSendToBackground_case(func) \
case 77: \
{ \
return func(); \
} \

#define maIOCtl_maBringToForeground 78
#define maIOCtl_maBringToForeground_case(func) \
case 78: \
{ \
return func(); \
} \

#define maIOCtl_maGetSystemProperty 80
#define maIOCtl_maGetSystemProperty_case(func) \
case 80: \
{ \
const char* _key = GVS(a); \
int _size = c; \
char* _buf = (MAString) SYSCALL_THIS->GetValidatedMemRange(b, _size); \
return func(_key, _buf, _size); \
} \

#define maIOCtl_maCameraFormatNumber 96
#define maIOCtl_maCameraFormatNumber_case(func) \
case 96: \
{ \
return func(); \
} \

#define maIOCtl_maCameraFormat 97
#define maIOCtl_maCameraFormat_case(func) \
case 97: \
{ \
int _index = a; \
MA_CAMERA_FORMAT* _fmt = GVMR(b, MA_CAMERA_FORMAT); \
return func(_index, _fmt); \
} \

#define maIOCtl_maCameraStart 98
#define maIOCtl_maCameraStart_case(func) \
case 98: \
{ \
return func(); \
} \

#define maIOCtl_maCameraStop 99
#define maIOCtl_maCameraStop_case(func) \
case 99: \
{ \
return func(); \
} \

#define maIOCtl_maCameraSnapshot 100
#define maIOCtl_maCameraSnapshot_case(func) \
case 100: \
{ \
int _formatIndex = a; \
MAHandle _placeholder = (MAHandle)b; \
return func(_formatIndex, _placeholder); \
} \

#define maIOCtl_maShowVirtualKeyboard 101
#define maIOCtl_maShowVirtualKeyboard_case(func) \
case 101: \
{ \
return func(); \
} \

#define maIOCtl_maTextBox 102
#define maIOCtl_maTextBox_case(func) \
case 102: \
{ \
const wchar* _title = GVWS(a); \
const wchar* _inText = GVWS(b); \
int _maxSize = SYSCALL_THIS->GetValidatedStackValue(0); \
int _constraints = SYSCALL_THIS->GetValidatedStackValue(4); \
wchar* _outText = (MAWString) SYSCALL_THIS->GetValidatedMemRange(c, _maxSize * sizeof(wchar)); \
return func(_title, _inText, _outText, _maxSize, _constraints); \
} \


#endif	//MAAPI_DEFS_H
