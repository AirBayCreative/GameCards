#ifndef _UTIL_H_
#define _UTIL_H_

#include <MAUI/Widget.h>
#include <MAUI/Label.h>
#include <MAUI/Layout.h>
#include <MAUI/Font.h>
#include <MAUI/Image.h>
#include <MAUI/ListBox.h>
#include <conprint.h>

#include "Card.h"
#include "Product.h"
#include "ImageCache.h"

using namespace MAUI;

#define PADDING 5
#define VIRTUAL_KEYBOARD_HEIGHT 135
#define VIRTUAL_KEYBOARD_HEIGHT_MULTIPLIER 0.33
#define VIRTUAL_KEYBOARD_WIDTH 240
//Version Var
static const char* version_number = "1.02";

void setPadding(Widget *w);
Label* createLabel(String str, int height=48);
Label* createEditLabel(String str, int height=48);
Label* createSubLabel(String str, int height=48);
Widget* createSoftKeyBar(int height, const char *left, const char *right);
Widget* createSoftKeyBar(int height, const char *left, const char *right, const char *centre);
Layout* createNoHeaderLayout();
Layout* createMainLayout(const char *left, const char *right, bool useKinetic = false);
Layout* createMainLayout(const char *left, const char *right, const char *centre, bool useKinetic = false);
Layout* createImageLayout(const char *left, bool useKinetic = false);
Layout* createImageLayout(const char *left, const char *right, const char *centre, bool useKinetic = false);
void updateSoftKeyLayout(const char *left, const char *right, const char *centre, Layout *mainLayout);
char* getData(const char* storefile);
void saveData(const char* storefile, const char *value);
void saveFile(const char* storefile, MAHandle data);
void bilinearScale(int *dst, int dwidth, int dheight, int dpitch, int *src, int swidth, int sheight, int spitch);
void nearestNeighbour(int *dst, int dwidth, int dheight, int dpitch, int *src, int swidth, int sheight, int spitch);
void retrieveThumb(Image *img, Card *card, ImageCache *mImageCache);
void retrieveProductThumb(Image *img, Product *product, ImageCache *mImageCache);
void retrieveFront(Image *img, Card *card, int height, ImageCache *mImageCache);
void retrieveBack(Image *img, Card *card, int height, ImageCache *mImageCache);
void returnImage(Image *img, MAHandle i, int height);
void increase();
void decrease();
int getCount();

//UI Components
extern Font *gFontGrey;
extern Font *gFontBlue;
extern Font *gFontBlack;
extern Font *gFontWhite;
extern WidgetSkin *gSkinEditBox;
extern WidgetSkin *gSkinButton;
extern WidgetSkin *gSkinBack;
extern WidgetSkin *gSkinList;
extern WidgetSkin *gSkinAlbum;
extern WidgetSkin *gSkinText;
extern int scrWidth;
extern int scrHeight;
extern int mCount;
extern Image *image;
extern Widget *softKeys;
extern Screen *orig;

static const String base64_chars =  "ABCDEFGHIJKLMNOPQRSTUVWXYZ"  //  0 to 25
									"abcdefghijklmnopqrstuvwxyz"  // 26 to 51
									"0123456789"				  // 52 to 61
									"+"							  // 62
									"/";						  // 63

//URL info
static String URL = "http://www.mytcg.net/_phone/";
//Get user details
static String USER = URL+"?userdetails=1";
//get products in category
static String PRODUCTS = URL+"?categoryproducts=1";
//Get user categories
static String ALBUMS = URL+"?usercategories=1";
//GET Cards in album
static String CARDS = URL+"?cardsincategory=";
//Trade Card in album
static String TRADE = URL+"?tradecard=1";
//List all the categories
static String ALLCATEGORIES = URL+"?allcategories=1";
//use for making a purchase
static String BUYPRODUCT = URL+"?buyproduct=";
//Check if there is an update available
static String UPDATE = URL+"?update=" + version_number;
//create an auction
static String CREATE_AUCTION = URL+"?createauction=1";
//get all auctions in a category
static String CATEGORY_AUCTION = URL+"?categoryauction=1";
//get all auctions for a user
static String USER_AUCTION = URL+"?userauction=1";
//constants
static const char* delim = ",";
static const char* concat = ":";
static const char* newline = "#";
static const char* demo = "Demo Deck";
static const char* demoid = "-1";
static const char* back = "Back";
static const char* download = "Download";
static const char* auction = "Auction";
static const char* empty = "Empty";
static const char* done = "Done";
static const char* flipit = "Flip";
static const char* zoomin = "Zoom";
static const char* select = "Select";
static const char* confirm = "Confirm";
static const char* success = "Success";
static const char* login = "Log In";
static const char* logout = "Log Out";
static const char* log_out = "Do you want to log out from Game Cards?";
static const char* coming_soon = "Coming soon...";
static const char* exit = "Exit";
static const char* userlbl = "Username:";
static const char* passlbl = "Password:";
static const char* emaillbl = "Email:";
static const char* phoneNumlbl = "Phone Number";
static const char* emaillblNoColon = "Email";
static const char* userlblNoColon = "Username";
static const char* continuelbl = "Continue";
static const char* selectFriendBy = "Select friend by:";
static const char* handlelbl = "Handle:";
static const char* albumlbl = "Albums";
static const char* tradelbl = "Trade";
static const char* sendToAuctionlbl = "Send card to auction";
static const char* sendToFriendlbl = "Send card to friend";
static const char* auctionlbl = "My Auctions";
static const char* shoplbl = "Shop";
static const char* details = "Details";
static const char* ballbl = "My Balance";
static const char* proflbl = "My Profile";
static const char* loggingin = "Please wait, logging in...";
static const char* avail_credits = "Available Credits:";
static const char* checking_albums = "Checking for new albums...";
static const char* checking_categories = "Checking for shop categories...";
static const char* choose_category = "Please choose a card category.";
static const char* checking_products = "Checking for products...";
static const char* checking_cards = "Checking for new cards...";
static const char* checking_info = "Checking for updated info...";
static const char* auth_user = "AUTH_USER";
static const char* auth_pw = "AUTH_PW";
static const char* truesz = "true";
static const char* falsesz = "false";
static const char* no_connect = "Unable to connect, try again later...";
static const char* no_user = "Ensure that you have entered your username and password.";
static const char* no_contact = "Ensure that you have entered\n your friend's ";
static const char* sure_you_want_to_send = "Are you sure you want to send your ";
static const char* friend_with = " to your friend with ";
static const char* sending_card_message = "Sending card...";
static const char* card_sent_message = "Card sent successfully.";
static const char* error_number_card_message = "Not a valid number.";
static const char* error_numeric_card_message = "Only use numbers.";
static const char* error_sending_card_message = "Error sending card.";
static const char* new_version_available = "There is a new version of the Game Cards app available, please download it before continuing.";

//XML constants <ALBUM>
static const char* xml_albumname = "albumname";
static const char* xml_albumid = "albumid";
static const char* xml_albumdone = "usercategories";
//<CARD>
static const char* xml_cardid = "cardid";
static const char* xml_carddescription = "description";
static const char* xml_cardquantity = "quantity";
static const char* xml_thumburl = "thumburl";
static const char* xml_fronturl = "fronturl";
static const char* xml_backurl = "backurl";
static const char* xml_rate = "rate";
static const char* xml_value = "value";
static const char* xml_carddone = "cardsincategory";
static const char* xml_cardcategories = "cardcategories";
//<USERDETAILS>
static const char* xml_username = "username";
static const char* xml_email = "email";
static const char* xml_handle = "name";
static const char* xml_credits = "credits";
static const char* xml_error = "error";
static const char* xml_status = "status";
//File info
static const char* ALBUMEND = "-lst.sav";
static const char* FEED = "fd.sav";
static const char* ALBUM = "lb.sav";
//Trade card
static const char* trade_cardid = "cardid";
static const char* trade_by = "trade_by";
static const char* by_email = "email";
static const char* by_username = "username";
static const char* by_phone_number = "phone_number";
static const char* trade_by_detail = "detail";
//Shop
static const char* not_enough_credits = "You do not have enough credits to make that purchase.";
static const char* sure_you_want_to_purchase = "Are you sure you want to purchase a ";
static const char* priceFor = " for ";
static const char* purchaseComplete = "Purchase successful! The cards have been added to your album, and you received the following premium card:";
static const char* purchase = "Purchase";
static const char* categoryid = "categoryId";
static const char* purchasing = "Purchasing...";
static const char* xml_product_done = "categoryproducts";
static const char* xml_productid = "productid";
static const char* xml_productname = "productname";
static const char* xml_productdesc = "productdesc";
static const char* xml_productprice = "productprice";
static const char* xml_productcurrency = "productcurrency";
static const char* xml_productnumcards = "productnumcards";
static const char* xml_productthumb = "productthumb";
static const char* xml_id = "id";
static const char* xml_count = "count";
static const char* xml_quality = "quality";
static const char* xml_urlfront = "urlfront";
static const char* xml_urlback = "urlback";
static const char* xml_card = "card";
//Auctions
static const char* opening_bid = "Opening bid";
static const char* buy_now_price = "Buy now price";
static const char* auction_duration = "Auction duration(days)";
static const char* auction_created = "Auction created!";
static const char* auction_failed = "Error creating auction.";
static const char* auction_created_successfully_result = "1";
static const char* my_auctions = "My Auctions";
static const char* all_auctions = "All Auctions";
static const char* bidOrBuy = "Bid/Buy Now";
static const char* checking_auctions = "Getting auctions...";
static const char* xml_opening = "bid";
static const char* xml_buyout = "buynow";
static const char* xml_days = "days";
static const char* xml_opening_bid = "openingbid";
static const char* xml_price = "price";
static const char* xml_user_card_id = "usercardid";
static const char* xml_auction_card_id = "auctioncardid";
static const char* xml_buy_now_price = "buynowprice";
static const char* xml_auctionsdone = "auctionsincategory";
static const char* xml_end_date = "endDate";
static const char* xml_last_bid_user = "lastBidUser";

#endif	//_UTIL_H_