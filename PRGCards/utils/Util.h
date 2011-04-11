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
void retrieveThumb(MobImage *img, Card *card, ImageCache *mImageCache);
void retrieveFront(MobImage *img, Card *card, int height, ImageCache *mImageCache);
void retrieveBack(MobImage *img, Card *card, int height, ImageCache *mImageCache);
void returnImage(MobImage *img, MAHandle i, int height);
void increase();
void decrease();
int getCount();
bool isNumeric(String isValid);
int intlen(float start);
bool validateEmailAddress(String email);
int getSoftKeyBarHeight();
int getMaxImageHeight();
String base64_encode(unsigned char const* bytes_to_encode, unsigned int in_len);
String base64_decode(String encoded_string);
static inline bool is_base64(unsigned char c);

//UI Components
extern Font *gFontGrey;
extern Font *gFontBlue;
extern Font *gFontBlack;
extern Font *gFontWhite;
extern Font *gFontWhiteBold;
extern Font *gFontBlackBold;
extern Font *gFontBlueBold;
extern WidgetSkin *gSkinHeaderImage;
extern WidgetSkin *gSkinEditBox;
extern WidgetSkin *gSkinButton;
extern WidgetSkin *gSkinBack;
extern WidgetSkin *gSkinList;
extern WidgetSkin *gSkinAlbum;
extern WidgetSkin *gSkinText;
extern WidgetSkin *gSkinKeyboard;
extern int scrWidth;
extern int scrHeight;
extern int mCount;
extern Image *image;
extern Widget *softKeys;
extern Screen *orig;
extern Screen *origAlbum;
extern Screen *origMenu;

static const String base64_chars =  "ABCDEFGHIJKLMNOPQRSTUVWXYZ"  //  0 to 25
									"abcdefghijklmnopqrstuvwxyz"  // 26 to 51
									"0123456789"				  // 52 to 61
									"+"							  // 62
									"/";						  // 63

//URL info
//static String URL = "http://www.mytcg.net/_phone/"; //live index
static String URL = "http://prg.mytcg.net/_phone/"; //dev index
//Get user details
static String USER = URL+"?userdetails=1";
//get products in category
static String PRODUCTS = URL+"?categoryproducts=1";
//Get user categories
static String ALBUMS = URL+"?usercategories=1";
//Get user sub categories
static String SUBCATEGORIES = URL+"?usersubcategories=1";
//GET Cards in album
static String CARDS = URL+"?cardsincategory=";
//send the app to a friend
static String TRADE = URL+"?tradecard=1&trademethod=username&detail=";
//List all the categories
//Check if there is an update available
static String UPDATE = URL+"?update=" + version_number;
//select a card to play, return a list of its stats
static String REGISTER = URL+"?registeruser=1";
//constants
static const char* delim = ",";
static const char* concat = ":";
static const char* newline = "#";
static const char* innerDelim = "$";
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
static const char* previouslbl = "Previous";
static const char* confirm = "Confirm";
static const char* success = "Success";
static const char* login = "Log In";
static const char* reg = "Register";
static const char* apply = "Apply";
static const char* cancellbl = "Cancel";
static const char* logout = "Log Out";
static const char* log_out = "Do you want to log out from Game Cards?";
static const char* coming_soon = "Coming soon...";
static const char* exit = "Exit";
static const char* userlbl = "Username:";
static const char* passlbl = "Password:";
static const char* emaillbl = "Email:";
static const char* cellLbl = "Cell:";
static const char* notelbl = "Note:";
static const char* namelbl = "Name:";
static const char* surnamelbl = "Surname:";
static const char* genderlbl = "Gender:";
static const char* agelbl = "Age:";
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
static const char* auctionlbl = "Auctions";
static const char* shoplbl = "Shop";
static const char* details = "Details";
static const char* ballbl = "My Balance";
static const char* proflbl = "My Profile";
static const char* loggingin = "Please wait, logging in...";
static const char* checking_user = "Checking user...";
static const char* cell_too_short = "Your cell needs to be at least 10 numbers long";
static const char* enter_cell = "Please enter a cell number";
static const char* enter_name = "Please enter your name";
static const char* enter_surname = "Please enter your surname";
static const char* enter_gender = "Please enter your gender";
static const char* enter_age = "Please enter your age";
static const char* registering = "Attempting to register user...";
static const char* valid_email = "Please enter a valid email address";
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
static const char* no_user = "Ensure that you have entered your number.";
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
static const char* xml_album = "album";
static const char* xml_albumname = "albumname";
static const char* xml_albumid = "albumid";
static const char* xml_albumdone = "usercategories";
static const char* xml_hascards = "hascards";
static const char* category = "category";
static const char* seconds = "seconds";
//special album ids
static const char* album_newcards = "-3";
static const char* album_mycards = "-2";
//share
static const char* share = "Share";
static const char* messagelbl = "Message:";
static const char* message_start = "Go to http://prg.mytcg.net/ to download the Paul Roos Mobile Application.";
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
static const char* xml_updated = "updated";
static const char* xml_stat = "stat";
static const char* xml_desc = "desc";
static const char* xml_ival = "ival";
static const char* xml_card = "card";
static const char* xml_note = "note";
static const char* xml_result = "result";
static const char* acceptlbl = "Accept Card";
static const char* rejectlbl = "Reject Card";
static const char* showall = "showall";
//<USERDETAILS>
static const char* xml_username = "username";
static const char* xml_email = "email";
static const char* xml_handle = "name";
static const char* xml_credits = "credits";
static const char* xml_error = "error";
static const char* xml_status = "status";
//File info
static String FILE_PREFIX = "prg_";
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
static const char* trade_method = "trademethod";
//Shop
static const char* not_enough_credits = "You do not have enough credits to make that purchase.";
static const char* sure_you_want_to_purchase = "Are you sure you want to purchase a ";
static const char* priceFor = " for ";
static const char* purchaseComplete = "Purchase successful! The cards have been added to your album, and you received the following premium card:";
static const char* purchase = "Purchase";
static const char* categoryid = "categoryId";
static const char* purchasing = "Purchasing...";
static const char* buyout_failed = "Buyout failed.";
static const char* buyout_success = "Buyout success.";
static const char* xml_product_done = "categoryproducts";
static const char* xml_productid = "productid";
static const char* xml_productname = "productname";
static const char* xml_producttype = "producttype";
static const char* xml_productprice = "productprice";
static const char* xml_productcurrency = "productcurrency";
static const char* xml_productnumcards = "productnumcards";
static const char* xml_productthumb = "productthumb";
static const char* xml_id = "id";
static const char* xml_count = "count";
static const char* xml_quality = "quality";
//Auctions
static const char* checking_auction_categories = "Checking for auction categories...";
static const char* opening_bid = "Opening bid";
static const char* buy_now_price = "Buy now price";
static const char* auction_duration = "Auction duration(days)";
static const char* auction_created = "Auction created!";
static const char* auction_failed = "Error creating auction.";
static const char* auction_created_successfully_result = "1";
static const char* my_auctions = "My Auctions";
static const char* all_auctions = "All Auctions";
static const char* bidOrBuy = "Bid or Buy";
static const char* checking_auctions = "Getting auctions...";
static const char* place_bid = "Place bid";
static const char* buy_now = "Buy now";
static const char* bid = "Bid";
static const char* sure_you_want_to_buy_now = "Are you sure you want to buy out the auction of ";
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
static const char* xml_buyout_success = "1";
static const char* xml_bid_success = "1";
//Play labels
static const char* play = "Play";
static const char* new_game = "New Game";
static const char* existing_game = "Continue Game";
static const char* category_id = "categoryid";
static const char* stat_id = "statid";
static const char* game_id = "gameid";
static const char* game_player_card_id = "gameplayercardid";
static const char* category_name = "categoryname";
static const char* playable_cards = "playablecards";
static const char* categories = "categories";
static const char* initialising_game = "Initialising new game...";
static const char* loading_game = "Loading game...";
static const char* select_card = "Please select a card to play";
static const char* select_stat = "Please select a stat to play";
static const char* options = "Options";
static const char* checking_games = "Checking games...";
static const char* leave_game = "Leave Game";
static const char* view_details = "View Game Details";
static const char* play_card = "Play Card";
static const char* xml_game = "game";
static const char* xml_games = "games";
static const char* xml_phase = "phase";
static const char* xml_game_id = "gameid";
static const char* xml_gameplayercard_id = "gameplayercard_id";
static const char* xml_game_description = "gamedescription";
static const char* xml_game_details = "gamedetails";
static const char* xml_turn = "turn";
static const char* xml_player_score = "playerscore";
static const char* xml_opponent_score = "opponentscore";
static const char* xml_progress = "progress";
static const char* xml_cardstats = "cardstats";
static const char* xml_stat_type = "stat_type";
static const char* xml_stat_description = "stat_description";
static const char* xml_cardstat_id = "cardstat_id";
static const char* xml_card_name = "card_name";
static const char* xml_results = "results";
static const char* xml_explanation = "explanation";
static const char* xml_outcome = "outcome";
static const char* noteslbl = "Notes";
static const char* sharelbl = "Share";
static const char* contactlbl = "Contact";
static const char* deletecardlbl = "Delete Card";
//update vars
static const char* update_imsi = "imsi";
static const char* update_imei = "imei";
static const char* update_os = "os";
static const char* update_make = "make";
static const char* update_model = "model";
static const char* update_touch = "touch";
static const char* update_width = "width";
static const char* update_height = "height";
//registration
static const char* name = "name";
static const char* surname = "surname";
static const char* cell = "cell";
static const char* gender = "gender";
static const char* age = "age";
static const char* xml_response = "response";
//the following game phase string need to match the descriptions in the mytcg_gamephase table
static const char* phase_card = "card";
static const char* phase_stat = "stat";
static const char* phase_result = "result";
static const char* phase_finished = "finished";
//contact labels
static const char* calllbl = "Call";
static const char* smslbl = "SMS";
static const char* sendlbl = "Send";
//certain card stat types are used to communicate (mobidex), they are listed here
//and they need to match with cardstattypes in the database
static const char* contact_email = "Email";
static const char* contact_number = "Mobile No";
static const char* contact_website = "Web Address";
//misc
static const char* updated_symbol = "*";

#endif	//_UTIL_H_