#include <mastdlib.h>

#include "Login.h"
#include "../utils/Util.h"
#include "AlbumLoadScreen.h"

static country countries[] =
{
	{ "7840", "Abkhazia", "" },
	{ "7940", "Abkhazia", "" },
	{ "99544", "Abkhazia", "" },
	{ "93", "Afghanistan", "AF" },
	{ "358", "Aland Islands", "AX" },
	{ "355", "Albania" ,"AL" },
	{ "213", "Algeria", "DZ" },
	{ "1684", "American Samoa", "AS" },
	{ "376", "Andorra", "AD" },
	{ "244", "Angola", "AO" },
	{ "1264", "Anguilla", "AI" },
	{ "1268", "Antigua and Barbuda", "AG" },
	{ "54", "Argentina", "AR" },
	{ "374", "Armenia", "AM" },
	{ "297", "Aruba", "AW" },
	{ "247", "Ascension" },
	{ "61", "Australia", "AU" },
	{ "672", "Australian External Territories" },
	{ "43", "Austria", "AT" },
	{ "994", "Azerbaijan", "AZ" },
	{ "1242", "Bahamas", "BS" },
	{ "973", "Bahrain", "BH" },
	{ "880", "Bangladesh", "BD" },
	{ "1246", "Barbados", "BB" },
	{ "1268", "Barbuda", "" },
	{ "375", "Belarus", "BY" },
	{ "32", "Belgium", "BE" },
	{ "501", "Belize", "BZ" },
	{ "229", "Benin", "BJ" },
	{ "1441", "Bermuda", "BM" },
	{ "975", "Bhutan", "BT" },
	{ "591", "Bolivia", "BO" },
	{ "5997", "Bonaire", "" },
	{ "387", "Bosnia and Herzegovina", "BA" },
	{ "267", "Botswana", "BW" },
	{ "55", "Brazil", "BR" },
	{ "246", "British Indian Ocean Territory","IO" },
	{ "1284", "British Virgin Islands", "" },
	{ "673", "Brunei Darussalam", "BN" },
	{ "359", "Bulgaria", "BG" },
	{ "226", "Burkina Faso", "BF" },
	{ "257", "Burundi", "BI" },
	{ "855", "Cambodia", "KH" },
	{ "257", "Cameroon", "CM" },
	{ "1", "Canada", "CA" },
	{ "238", "Cape Verde", "CV" },
	{ "5993", "Caribbean Netherlands", "BQ" },
	{ "5994", "Caribbean Netherlands", "BQ" },
	{ "5997", "Caribbean Netherlands", "BQ" },
	{ "1345", "Cayman Islands", "KY" },
	{ "236", "Central African Republic", "CF" },
	{ "235", "Chad", "TD" },
	{ "64", "Chatham Island (New Zealand)", "" },
	{ "56", "Chile", "CL" },
	{ "86", "China", "CN" },
	{ "61", "Christmas Island", "CX" },
	{ "61", "Cocos (Keeling) Islands", "CC" },
	{ "57", "Colombia", "CO" },
	{ "269", "Comoros" "KM" },
	{ "242", "Congo (Brazzaville)", "CG" },
	{ "243", "Congo, The Democratic Republic of the (Zaire)", "CD" },
	{ "682", "Cook Islands", "CK" },
	{ "506", "Costa Rica", "CR" },
	{ "225", "Côte d'Ivoire", "CI" },
	{ "385", "Croatia", "HR" },
	{ "53", "Cuba", "CU" },
	{ "5399", "Cuba (Guantanamo Bay)", "CU" },
	{ "5999", "Curaçao", "CW" },
	{ "357", "Cyprus", "CY" },
	{ "420", "Czech Republic", "CZ" },
	{ "45", "Denmark", "DK" },
	{ "246", "Diego Garcia", "" },
	{ "253", "Djibouti", "DJ" },
	{ "1767", "Dominica", "DM" },
	{ "1809", "Dominican Republic", "DO" },
	{ "1829", "Dominican Republic", "DO" },
	{ "1849", "Dominican Republic", "DO" },
	{ "670", "East Timor", "" },
	{ "56", "Easter Island", "" },
	{ "593", "Ecuador", "EC" },
	{ "20", "Egypt", "EG" },
	{ "503", "El Salvador", "SV" },
	{ "8812", "Ellipso (Mobile Satellite service)", "" },
	{ "8813", "Ellipso (Mobile Satellite service)", "" },
	{ "88213", "EMSAT (Mobile Satellite service)", "" },
	{ "240", "Equatorial Guinea", "GQ" },
	{ "291", "Eritrea", "ER" },
	{ "372", "Estonia", "EE" },
	{ "251", "Ethiopia", "ET" },
	{ "500", "Falkland Islands (Malvinas)", "FK" },
	{ "298", "Faroe Islands", "FO" },
	{ "679", "Fiji", "FJ" },
	{ "358", "Finland", "FI" },
	{ "33", "France", "FR" },
	{ "596", "French Antilles", "TF" },
	{ "594", "French Guiana", "GF" },
	{ "689", "French Polynesia", "PF" },
	{ "241", "Gabon", "GA" },
	{ "220", "Gambia", "GM" },
	{ "995", "Georgia", "GE" },
	{ "49", "Germany", "DE" },
	{ "233", "Ghana", "GH" },
	{ "350", "Gibraltar", "GI" },
	{ "881", "Global Mobile Satellite System (GMSS)", "" },
	{ "8818", "Globalstar (Mobile Satellite Service)", "" },
	{ "8819", "Globalstar (Mobile Satellite Service)", "" },
	{ "30", "Greece", "GR" },
	{ "299", "Greenland", "GL" },
	{ "1473", "Grenada", "GD" },
	{ "590", "Guadeloupe", "GP" },
	{ "1671", "Guam", "GU" },
	{ "502", "Guatemala", "GT" },
	{ "44", "Guernsey", "GG" },
	{ "224", "Guinea", "GN" },
	{ "245", "Guinea-Bissau", "GW" },
	{ "592", "Guyana", "GY" },
	{ "509", "Haiti", "HT" },
	{ "39066", "Holy See (Vatican City State)", "" },
	{ "379", "Holy See (Vatican City State)", "" },
	{ "504", "Honduras", "HN" },
	{ "852", "Hong Kong", "HK" },
	{ "36", "Hungary", "HU" },
	{ "354", "Iceland", "IS" },
	{ "8810", "ICO Global (Mobile Satellite Service)", "" },
	{ "8811", "ICO Global (Mobile Satellite Service)", "" },
	{ "91", "India", "IN" },
	{ "62", "Indonesia", "ID" },
	{ "870", "Inmarsat SNAC" },
	{ "800", "International Freephone Service", "" },
	{ "808", "International Shared Cost Service (ISCS)", "" },
	{ "98", "Iran", "IR" },
	{ "964", "Iraq", "IQ" },
	{ "353", "Ireland", "IE" },
	{ "8816", "Iridium (Mobile Satellite service)", "" },
	{ "8817", "Iridium (Mobile Satellite service)", "" },
	{ "44", "Isle of Man", "" },
	{ "972", "Israel", "IL" },
	{ "39", "Italy", "IT" },
	{ "1876", "Jamaica", "JM" },
	{ "81", "Japan", "JP" },
	{ "44", "Jersey", "JE" },
	{ "962", "Jordan", "JO" },
	{ "76", "Kazakhstan", "KZ" },
	{ "77", "Kazakhstan", "KZ" },
	{ "686", "Kiribati", "KI" },
	{ "850", "North Korea", "KP" },
	{ "82", "South Korea", "KR" },
	{ "965", "Kuwait", "KW" },
	{ "996", "Kyrgyzstan", "KG" },
	{ "856", "Laos", "LA" },
	{ "371", "Latvia", "LV" },
	{ "961", "Lebanon", "LB" },
	{ "266", "Lesotho", "LS" },
	{ "231", "Liberia", "LR" },
	{ "218", "Libya", "LY" },
	{ "423", "Liechtenstein", "LI" },
	{ "370", "Lithuania", "LT" },
	{ "352", "Luxembourg", "LU" },
	{ "853", "Macau", "MO" },
	{ "389", "Macedonia", "MK" },
	{ "261", "Madagascar", "MG" },
	{ "256", "Malawi", "MW" },
	{ "60", "Malaysia", "MY" },
	{ "960", "Maldives", "MV" },
	{ "223", "Mali", "ML" },
	{ "356", "Malta", "MT" },
	{ "692", "Marshall Islands", "MH" },
	{ "596", "Martinique", "MQ" },
	{ "222", "Mauritania", "MR" },
	{ "230", "Mauritius", "MU" },
	{ "262", "Mayotte", "YT" },
	{ "52", "Mexico", "MX" },
	{ "691", "Micronesia, Federated States of", "FM" },
	{ "1808", "Midway Island" },
	{ "373", "Moldova", "MD" },
	{ "377", "Monaco", "MC" },
	{ "976", "Mongolia", "MN" },
	{ "382", "Montenegro", "ME" },
	{ "1664", "Montserrat", "MS" },
	{ "212", "Morocco", "MA" },
	{ "258", "Mozambique", "MZ" },
	{ "95", "Myanmar", "MM" },
	{ "264", "Namibia", "NA" },
	{ "674", "Nauru", "NR" },
	{ "977", "Nepal", "NP" },
	{ "31", "Netherlands", "NL" },
	{ "1869", "Nevis", "" },
	{ "687", "New Caledonia", "NC" },
	{ "64", "New Zealand", "NZ" },
	{ "505", "Nicaragua", "NI" },
	{ "227", "Niger", "NE" },
	{ "234", "Nigeria", "NG" },
	{ "683", "Niue", "NU" },
	{ "672", "Norfolk Island", "NF" },
	{ "1670", "Northern Mariana Islands", "MP" },
	{ "47", "Norway", "NO" },
	{ "968", "Oman", "OM" },
	{ "92", "Pakistan", "PK" },
	{ "680", "Palau", "PW" },
	{ "970", "Palestinian territories", "PS" },
	{ "507", "Panama", "PA" },
	{ "675", "Papua New Guinea", "PG" },
	{ "595", "Paraguay", "PY" },
	{ "51", "Peru", "PE" },
	{ "63", "Philippines", "PH" },
	{ "48", "Poland", "PL" },
	{ "351", "Portugal", "PT" },
	{ "1787", "Puerto Rico", "PR" },
	{ "1939", "Puerto Rico", "PR" },
	{ "974", "Qatar", "QA" },
	{ "262", "Réunion", "RE" },
	{ "40", "Romania", "RO" },
	{ "7", "Russia", "RU" },
	{ "250", "Rwanda", "RW" },
	{ "5994", "Saba", "" },
	{ "590", "Saint Barthélemy", "BL" },
	{ "290", "+Saint Helena and Tristan da Cunha", "SH" },
	{ "1869", "Saint Kitts and Nevis", "KN" },
	{ "1758", "Saint Lucia", "LC" },
	{ "590", "Saint Martin (French)", "MF" },
	{ "508", "Saint Pierre and Miquelon", "PM" },
	{ "1784", "Saint Vincent and the Grenadines", "VC" },
	{ "685", "Samoa", "WS" },
	{ "378", "San Marino", "SM" },
	{ "239", "Sao Tomé and Príncipe", "ST" },
	{ "966", "Saudi Arabia", "SA" },
	{ "221", "Senegal", "SN" },
	{ "381", "Serbia", "RS" },
	{ "248", "Seychelles", "SC" },
	{ "232", "Sierra Leone", "SL" },
	{ "65", "Singapore", "SG" },
	{ "5993", "Sint Eustatius" },
	{ "1721", "Sint Maarten (Dutch)", "SX" },
	{ "421", "Slovakia", "SK" },
	{ "386", "Slovenia", "SI" },
	{ "677", "Solomon Islands", "SB" },
	{ "252", "Somalia", "SO" },
	{ "27", "South Africa", "ZA" },
	{ "500", "South Georgia and the South Sandwich Islands", "GS" },
	{ "211", "South Sudan", "SS" },
	{ "34", "Spain", "ES" },
	{ "94", "Sri Lanka", "LK" },
	{ "249", "Sudan", "SD" },
	{ "597", "Suriname", "SR" },
	{ "47", "Svalbard and Jan Mayen", "SJ" },
	{ "268", "Swaziland", "SZ" },
	{ "46", "Sweden", "SE" },
	{ "41", "Switzerland", "CH" },
	{ "963", "Syria", "SY" },
	{ "886", "Taiwan", "TW" },
	{ "992", "Tajikistan", "TJ" },
	{ "255", "Tanzania", "TZ" },
	{ "66", "Thailand", "TH" },
	{ "88216", "Thuraya (Mobile Satellite service)", "" },
	{ "228", "Togo", "TG" },
	{ "690", "Tokelau", "TK" },
	{ "676", "Tonga", "TO" },
	{ "1868", "Trinidad and Tobago", "TT" },
	{ "216", "Tunisia", "TN" },
	{ "90", "Turkey", "TR" },
	{ "993", "Turkmenistan", "TM" },
	{ "1649", "Turks and Caicos Islands", "TC" },
	{ "688", "Tuvalu", "TV" },
	{ "256", "Uganda", "UG" },
	{ "380", "Ukraine", "UA" },
	{ "971", "United Arab Emirates", "AE" },
	{ "44", "United Kingdom", "GB" },
	{ "1", "United States", "US" },
	{ "878", "Universal Personal Telecommunications", "" },
	{ "598", "Uruguay", "UY" },
	{ "998", "Uzbekistan", "UZ" },
	{ "678", "Vanuatu", "VU" },
	{ "58", "Venezuela", "VE" },
	{ "39066", "Vatican City State", "VA" },
	{ "379", "Vatican City State", "VA" },
	{ "84", "Vietnam", "VN" },
	{ "1340", "Virgin Islands, US", "VI" },
	{ "1808", "Wake Island" },
	{ "681", "Wallis and Futuna", "WF" },
	{ "967", "Yemen", "YE" },
	{ "260", "Zambia", "ZM" },
	{ "255", "Zanzibar", "" },
	{ "263", "Zimbabwe", "ZW" }
};

Login::Login(Feed *feed, MainScreen *previous, int screen):mHttp(this) {
	this->feed = feed;
	this->previous = previous;
	this->screen = screen;
	lprintfln("Login::Memory Heap %d, Free Heap %d", heapTotalMemory(), heapFreeMemory());
	moved = 0;
	isBusy = false;
	termsMenu == NULL;

	response = "";
	temp = "";
	temp1 = "";

	layout = Util::createMainLayout("", "", "", true);

	layout->setDrawBackground(TRUE);
	listBox = (KineticListBox*) layout->getChildren()[0]->getChildren()[2];
	//Util::setPadding(listBox);
	notice = (Label*) layout->getChildren()[0]->getChildren()[1];
	notice->setMultiLine(true);

	switch (screen) {
		case S_LOGIN:
			drawLoginScreen();
			break;
		case S_REGISTER:
			drawRegisterScreen();
			break;
	}

	if (feed->getUnsuccessful() != "Success") {
		label->setCaption(feed->getUnsuccessful());
	}
	touch = "false";
	this->setMain(layout);
}

Login::~Login() {
	delete layout;
	error_msg = "";
	parentTag="";
	conCatenation="";
	value="";
	value1="";
	value2="";
	convertAsterisk="";
	underscore="";
	username="";
	credits="";
	encrypt="";
	error_msg="";
	email="";
	handle="";
	touch="";

	if (termsMenu != NULL) {
		delete termsMenu;
		termsMenu = NULL;
	}
}

void Login::drawLoginScreen() {
	//listBox->setYOffset(0);
	moved = 0;
	screen = S_LOGIN;
	clearListBox();

	if ((strcmp(feed->getRegistered().c_str(), "1") == 0)) {
		Util::updateSoftKeyLayout("Log In", "Exit", "", layout);
	} else {
		Util::updateSoftKeyLayout("Log In", "Back", "", layout);
	}
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Username:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxLogin = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Username:");
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Password:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxPass = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Password:");
	editBoxPass->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 5, NULL, "", 0, Util::getDefaultFont());
	listBox->add(label);

	termsLink = new Label(0,0, scrWidth-(PADDING*2), DEFAULT_LABEL_HEIGHT, NULL, "Forgot password", 0, Util::getFontBlue());
	termsLink->setDrawBackground(false);
	termsLink->setPaddingLeft(PADDING);
	termsLink->addWidgetListener(this);
	listBox->add(termsLink);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "", 0, Util::getDefaultFont());
	listBox->add(label);
	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "", 0, Util::getDefaultFont());
	listBox->add(label);

	listBox->setSelectedIndex(1);
}

void Login::drawRegisterScreen() {
	isTerms = false;
	isCountry = false;

	listBox->setYOffset(0);
	moved = 0;
	screen = S_REGISTER;
	clearListBox();

	Util::updateSoftKeyLayout("Register", "Back", "", layout);
	notice->setCaption("");

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Username:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxLogin = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Username:");
	editBoxLogin->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Password:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxPass = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Password:");
	editBoxPass->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Full Name:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxFullname = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Full Name:");
	editBoxFullname->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Country:", 0, Util::getDefaultFont());
	listBox->add(label);

	countryLabel = Util::createDropDownLabel("");
	countryLabel->addWidgetListener(this);
	listBox->add(countryLabel);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "International Cell Number", 0, Util::getDefaultFont());
	listBox->add(label);

	numberLayout = new Layout(0, 0, scrWidth-(PADDING*2), DEFAULT_LABEL_HEIGHT, listBox, 2, 1);
	numberLayout->setHorizontalAlignment(Layout::HA_CENTER);
	numberLayout->setVerticalAlignment(Layout::VA_CENTER);
	numberLayout->setPaddingLeft(PADDING);
	label = new Label(0,0, 10, 24, NULL, "+", 0, Util::getDefaultFont());
	numberLayout->add(label);
	label =  new Label(0,0, scrWidth-(PADDING*3) - 10, DEFAULT_LABEL_HEIGHT, NULL, "", 0, Util::getFontWhite());
	label->setSkin(Util::getSkinEditBox());
	Util::setPadding(label);
	editBoxCell = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_NUMERIC, label, "", L"Cell Number:");
#if defined(MA_PROF_SUPPORT_STYLUS)

#else
	editBoxCell->setInputMode(NativeEditBox::IM_NUMBERS);
#endif
	editBoxCell->setDrawBackground(false);
	numberLayout->add(label);
	numberLayout->addWidgetListener(this);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "Email:", 0, Util::getDefaultFont());
	listBox->add(label);

	label = Util::createEditLabel("");
	editBoxEmail = new NativeEditBox(0, 0, label->getWidth()-PADDING*2, label->getHeight()-PADDING*2, 64, MA_TB_TYPE_ANY, label, "", L"Email:");
	editBoxEmail->setDrawBackground(false);
	label->addWidgetListener(this);
	listBox->add(label);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "", 0, Util::getDefaultFont());
	listBox->add(label);

	termsLayout = new Layout(0, 0, scrWidth-(PADDING*2), DEFAULT_LABEL_HEIGHT, listBox, 2, 1);
	termsLayout->setHorizontalAlignment(Layout::HA_CENTER);
	termsLayout->setVerticalAlignment(Layout::VA_CENTER);
	//termsLayout->setSkin(Util::getSkinDropDownItem());
	//termsLayout->setDrawBackground(true);
	termsLayout->setPaddingLeft(PADDING);
	termsLayout->addWidgetListener(this);
	termsLink = new Label(0, 0, 0, 0, termsLayout, "Terms and conditions ", 0, Util::getFontBlue());
	termsLink->setAutoSizeX(true);
	termsLink->setAutoSizeY(true);
	termsLink->setDrawBackground(false);
	termsBox = new CheckBox(0, 0, 35, 35, termsLayout);
	termsBox->setDrawBackground(false);

	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "", 0, Util::getDefaultFont());
	listBox->add(label);
	label = new Label(0,0, scrWidth-PADDING*2, 24, NULL, "", 0, Util::getDefaultFont());
	listBox->add(label);

	listBox->setSelectedIndex(1);

	termsMenu = new MenuScreen(RES_BLANK);
	termsMenu->setMenuWidth(140);
	termsMenu->setMarginX(5);
	termsMenu->setMarginY(5);
	termsMenu->setDock(MenuScreen::MD_CENTER);
	termsMenu->setMenuFontSel(Util::getFontBlack());
	termsMenu->setMenuFontUnsel(Util::getFontWhite());
	termsMenu->setMenuSkin(Util::getSkinDropDownItem());
	termsMenu->addItem("View T's and C's");
	termsMenu->addItem("Accept");
	termsMenu->addItem("Reject");
	termsMenu->setListener(this);

	countryMenu = new MenuScreen(RES_BLANK);
	countryMenu->setMenuWidth(240<=scrWidth?240:scrWidth);
	countryMenu->setMarginX(5);
	countryMenu->setMarginY(5);
	countryMenu->setDock(MenuScreen::MD_CENTER);
	countryMenu->setListener(this);
	countryMenu->setMenuFontSel(Util::getFontBlack());
	countryMenu->setMenuFontUnsel(Util::getFontWhite());
	countryMenu->setMenuSkin(Util::getSkinDropDownItem());

	notice->setCaption("Loading countries...");

	String cName = "";
	int countryCount = sizeof(countries)/sizeof(country);
	for (int i = 0; i < countryCount; i++) {
		cName = "+";
		cName.append(countries[i].code, strlen(countries[i].code));
		cName.append("  ", 2);
		cName.append(countries[i].country, strlen(countries[i].country));
		countryMenu->addItem(cName.c_str());
	}

	char *url = NULL;
	//work out how long the url will be, the 10 is for the & and = symbols
	int urlLength = URL_PHONE.length() + 15;
	url = new char[urlLength];
	memset(url,'\0',urlLength);
	sprintf(url, "%s?checkcountry=1", URL_PHONE.c_str());
	mHttp = HttpConnection(this);
	int res = mHttp.create(url, HTTP_GET);
	if(res < 0) {
		notice->setCaption("Unable to connect, try again later...");
	} else {
		mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
		mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
		feed->addHttp();
		mHttp.finish();
	}
	delete url;
}

void Login::clearListBox() {
	for (int i = 0; i < listBox->getChildren().size(); i++) {
		tempWidgets.add(listBox->getChildren()[i]);
	}
	listBox->clear();

	for (int j = 0; j < tempWidgets.size(); j++) {
		tempWidgets[j]->setSelected(false);
		delete tempWidgets[j];
		tempWidgets[j] = NULL;
	}
	tempWidgets.clear();
}

void Login::selectionChanged(Widget *widget, bool selected) {
	if (numberLayout != NULL && widget == numberLayout) {
		widget = numberLayout->getChildren()[1];
		widget->setSelected(selected);
;	}

	if (widget->getChildren().size() > 0) {
		if(selected) {
			widget->getChildren()[0]->setSelected(true);
		} else {
			widget->getChildren()[0]->setSelected(false);
		}
	}

	if (termsLink != NULL && widget == termsLink) {
		termsLink->setFont(selected?Util::getFontWhite():Util::getFontBlue());
	}
	else if (termsLayout != NULL && widget == termsLayout) {
		termsLink->setFont(selected?Util::getFontWhite():Util::getFontBlue());
	}
}

void Login::pointerPressEvent(MAPoint2d point)
{
    locateItem(point);
}

void Login::pointerMoveEvent(MAPoint2d point)
{
    locateItem(point);
    moved++;
}

void Login::pointerReleaseEvent(MAPoint2d point)
{
	if (moved <= 8) {
		if (screen == S_REGISTER && editBoxEmail->isSelected()) {
			editBoxEmail->activate();
		}

		if (right) {
			keyPressEvent(MAK_SOFTRIGHT);
		} else if (left) {
			keyPressEvent(MAK_SOFTLEFT);
		} else if (list) {
			keyPressEvent(MAK_FIRE);
		}
	}
	else {
		moved = 0;
	}
}

void Login::locateItem(MAPoint2d point)
{
	touch = "true";
	/*if (feed->setTouch(touch.c_str())) {
		saveData(FEED, feed->getAll().c_str());
	}*/
	list = false;
	left = false;
	right = false;
	mid = false;

    Point listP, p;
    p.set(point.x, point.y);
    listP.set(point.x, point.y - (listBox->getYOffset()>>16));
    for(int i = 0; i < (listBox->getChildren()).size() &&
    	!layout->getChildren()[1]->contains(p); i++)
    {
        if(listBox->getChildren()[i]->contains(listP))
        {
        	if (moved < 1) listBox->setSelectedIndex(i);
        	list = true;
            return;
        }
    }
    for(int i = 0; i < (this->getMain()->getChildren()[1]->getChildren()).size(); i++)
	{
		if(this->getMain()->getChildren()[1]->getChildren()[i]->contains(p))
		{
			if (i == 0) {
				left = true;
			} else if (i == 1) {
				mid = true;
			} else if (i == 2) {
				right = true;
			}
			return;
		}
	}
}
void Login::show() {
	listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(true);
	Screen::show();
}

void Login::hide() {
    listBox->getChildren()[listBox->getSelectedIndex()]->setSelected(false);
	Screen::hide();
}

void Login::keyPressEvent(int keyCode) {
	error = false;
	int index = listBox->getSelectedIndex();
	switch(keyCode) {
		case MAK_FIRE:
			switch (screen) {
				case S_LOGIN:
					if (termsLink->isSelected()) {
						maPlatformRequest(URL_FORGOTPASSWORD.c_str());
					}
					break;
				case S_REGISTER:
					if (termsLayout->isSelected()) {
						isTerms = true;
						termsMenu->show();
					}
					else if (countryLabel->isSelected()) {
						isCountry = true;
						countryMenu->show();
					}
					break;
			}
			break;
		case MAK_SOFTLEFT:
			if (!isBusy) {
				switch (screen) {
					case S_LOGIN:
						if (editBoxLogin->getText()!="" & editBoxPass->getText()!="") {
							isBusy = true;
							response = "";
							notice->setCaption("Please wait, logging in...");
							conCatenation = editBoxPass->getText().c_str();
							value = Util::base64_encode(reinterpret_cast<const unsigned char*>(conCatenation.c_str()),conCatenation.length());
							feed->setEncrypt(value.c_str());
							feed->setUsername(editBoxLogin->getText().c_str());
							feed->setUnsuccessful("true");
							mHttp = HttpConnection(this);
							int urlLength = 71 + URLSIZE;
							char *url = new char[urlLength+1];
							memset(url,'\0',urlLength+1);
							sprintf(url, "%s?userdetails=1", URL_PHONE.c_str());
							int res = mHttp.create(url, HTTP_GET);

							if(res < 0) {
								notice->setCaption("Unable to connect, try again later...");
							} else {
								mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
								mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
								feed->addHttp();
								mHttp.finish();
							}
							conCatenation = "";
							value = "";
						} else {
							notice->setCaption("Ensure that you have entered your username and password.");
						}
						break;
					case S_REGISTER:
						notice->setCaption("");
						int countryIndex = countryMenu->getSelectedIndex();

						if (editBoxCell->getText().length() >= strlen(countries[countryIndex].code) + 5) {
							String enteredCode = editBoxCell->getText().substr(0, strlen(countries[countryIndex].code));
							if(strcmp(countries[countryIndex].code, enteredCode.c_str()) != 0){
								notice->setCaption("The number you entered does not match the international cellphone number code you have selected");
								return;
							}
						}
						else {
							 notice->setCaption("Please enter your cell number in the international format");
							 return;
						}

						if (editBoxLogin->getText().length() < 6) {
							notice->setCaption("Your username needs to be at least 6 characters long");
						}
						else if (editBoxPass->getText().length() < 6) {
							notice->setCaption("Your password needs to be at least 6 characters long");
						}
						else if (editBoxFullname->getText().length() < 1) {
							notice->setCaption("Please enter your name");
						}
						else if (editBoxCell->getText().length() < strlen(countries[countryIndex].code) + 5) {
							notice->setCaption("Please enter your cell number in the international format");
						}
						else if (editBoxEmail->getText().length() < 1) {
							notice->setCaption("You need to enter an email address");
						}
						else if (countryIndex == -1) {
							notice->setCaption("Please enter your cell number in the international format");
						}
						else if (!termsBox->isChecked()) {
							notice->setCaption("You need to accept the terms and conditions to register");
						}
						else {
							response = "";
							isBusy = true;
							notice->setCaption("Attempting to register user...");

							String encodedName = Util::base64_encode(reinterpret_cast<const unsigned char*>(editBoxFullname->getText().c_str()),
								editBoxFullname->getText().length());

							String encodedCountry = Util::base64_encode(reinterpret_cast<const unsigned char*>(countries[countryIndex].country),
								strlen(countries[countryIndex].country));

							String encodedNumber = Util::base64_encode(reinterpret_cast<const unsigned char*>(editBoxCell->getText().c_str()),
									editBoxCell->getText().length());

							char *url = NULL;
							//work out how long the url will be, the 10 is for the & and = symbols
							int urlLength = 0;
							urlLength = 100 + urlLength + encodedName.length()
									+ editBoxLogin->getText().length() + encodedNumber.length()
									+ editBoxPass->getText().length() + editBoxEmail->getText().length() + encodedCountry.length() + 10;
							url = new char[urlLength];
							memset(url,'\0',urlLength);
							sprintf(url, "%s?registeruser=1&name=%s&username=%s&cell=%s&password=%s&email=%s&country=%s", URL_PHONE.c_str(), encodedName.c_str(),
									editBoxLogin->getText().c_str(), encodedNumber.c_str(),
									editBoxPass->getText().c_str(), editBoxEmail->getText().c_str(), encodedCountry.c_str());
							mHttp = HttpConnection(this);
							int res = mHttp.create(url, HTTP_GET);
							if(res < 0) {
								notice->setCaption("Unable to connect, try again later...");
							} else {
								mHttp.setRequestHeader("AUTH_USER", feed->getUsername().c_str());
								mHttp.setRequestHeader("AUTH_PW", feed->getEncrypt().c_str());
								feed->addHttp();
								mHttp.finish();
							}
							delete url;
							encodedName = "";
						}
						break;
				}
			}
			break;
		case MAK_BACK:
		case MAK_SOFTRIGHT:
			if ((strcmp(feed->getRegistered().c_str(), "1") == 0)) {
				maExit(1);
			} else {
				disableEditBoxes();
				previous->show();
			}
			break;
		case MAK_UP:
			if (index == 3) {
				listBox->setSelectedIndex(0);
				listBox->setSelectedIndex(1);
			} else if (index-2 > 0) {
				listBox->setSelectedIndex(index-2);
			} else {
				listBox->setSelectedIndex(listBox->getChildren().size()-1);
				listBox->setSelectedIndex(listBox->getChildren().size()-3);
			}
			break;
		case MAK_DOWN:
			if (index+2 < listBox->getChildren().size()) {
				listBox->setSelectedIndex(index+2);
			} else {
				listBox->setSelectedIndex(0);
				listBox->setSelectedIndex(1);
			}
			break;
	}
}

//returns -1 if the country code wasnt found, otherwise it returns the index of the country
int Login::checkCountryCode() {
	int subStart = 0, numLength = editBoxCell->getText().length();
	if(editBoxCell->getText()[0] == '+') {
		subStart = 1;
		numLength-=1;
	}

	int found = -1;
	int countryIndex;
	int countryCount = sizeof(countries)/sizeof(country);
	for (countryIndex = 0; countryIndex < countryCount; countryIndex++) {
		int codeLength = strlen(countries[countryIndex].code);
		if (numLength >= codeLength + 5) {
			if (strcmp((editBoxCell->getText().substr(subStart, codeLength)).c_str(), countries[countryIndex].code) == 0) {
				found = 1;
				break;
			}
		}
	}

	if (found > 0) {
		return countryIndex;
	}
	else {
		return found;
	}
}

void Login::disableEditBoxes() {
	switch (screen) {
		case S_LOGIN:
			editBoxLogin->disableListener();
			editBoxPass->disableListener();
			break;
		case S_REGISTER:
			editBoxLogin->disableListener();
			editBoxPass->disableListener();
			editBoxFullname->disableListener();
			editBoxCell->disableListener();
			editBoxEmail->disableListener();
			break;
	}
}

void Login::httpFinished(MAUtil::HttpConnection* http, int result) {
	if (result == 200) {
		xmlConn = XmlConnection::XmlConnection();
		xmlConn.parse(http, this, this);
	} else {
		mHttp.close();
		notice->setCaption("Unable to connect, try again later...");
		isBusy = false;
		feed->remHttp();
	}
}

void Login::connReadFinished(Connection* conn, int result) {}

void Login::xcConnError(int code) {
	feed->remHttp();
	isBusy = false;
}

void Login::mtxEncoding(const char* ) {
}

void Login::mtxTagStart(const char* name, int len) {
	parentTag = name;
	if (!strcmp(name, "usercategories")) {
		album = new Albums();
	}
}

void Login::mtxTagAttr(const char* attrName, const char* attrValue) {
}

void Login::mtxTagData(const char* data, int len) {
	if(!strcmp(parentTag.c_str(), "username")) {
		username = data;
	} else if(!strcmp(parentTag.c_str(), "credits")) {
		credits = data;
	} else if(!strcmp(parentTag.c_str(), "email")) {
		email = data;
	} else if(!strcmp(parentTag.c_str(), "name")) {
		handle = data;
	} else if(!strcmp(parentTag.c_str(), "error")) {
		error_msg = data;
	} else if (!strcmp(parentTag.c_str(), "result")) {
		response += data;
	} else if (!strcmp(parentTag.c_str(), "usercategories")) {
		album->clearAll();
	} else if(!strcmp(parentTag.c_str(), "albumname")) {
		temp1 += data;
	} else if(!strcmp(parentTag.c_str(), "albumid")) {
		temp += data;
	} else if (!strcmp(parentTag.c_str(), "hascards")) {
		hasCards += data;
	} else if (!strcmp(parentTag.c_str(), "updated")) {
		updated += data;
	} else if (!strcmp(parentTag.c_str(), "country_code")) {
		temp += data;
	} else if (!strcmp(parentTag.c_str(), "country_name")) {
		temp1 += data;
	}
}

void Login::mtxTagEnd(const char* name, int len) {
	if(!strcmp(name, "status")) {
		feed->setCredits(credits.c_str());
		feed->setHandle(handle.c_str());
		feed->setEmail(email.c_str());
		feed->setUnsuccessful("Success");
		feed->setTouch(touch.c_str());
		feed->setRegistered("1");
		int seconds = maLocalTime();
		int secondsLength = Util::intlen(seconds);
		char *secString = new char[secondsLength];
		memset(secString,'\0',secondsLength);
		sprintf(secString, "%d", "seconds");
		feed->setSeconds(secString);
		delete secString;
		username,error_msg= "";
		Util::saveData("fd.sav", feed->getAll().c_str());
		String albums = "";
		Util::getData("lb.sav", albums);
		feed->setAlbum(albums.c_str());
		albums = "";
		/*if (next != NULL) {
			delete next;
		}*/
		next = new AlbumLoadScreen(feed);
		next->show();
	} else if(!strcmp(name, "error")) {
		error = true;
		feed->setUnsuccessful(error_msg.c_str());
		notice->setCaption(error_msg.c_str());
	} else if (!strcmp(name, "result")) {
		isBusy = false;
		error = true;
		notice->setCaption(response);
	} else if(!strcmp(name, "album")) {
		album->addAlbum(temp.c_str(), temp1, (hasCards=="true"), (updated=="1"));
		temp1 = "";
		temp = "";
		hasCards = "";
		updated = "";
	} else if (!strcmp(name, "usercategories")) {
		this->feed->getAlbum()->setAll(album->getAll().c_str());
		Util::saveData("lb.sav", album->getAll().c_str());

		feed->setEncrypt(Util::base64_encode(reinterpret_cast<const unsigned char*>(editBoxPass->getText().c_str()), editBoxPass->getText().length()).c_str());
		feed->setUsername(editBoxLogin->getText().c_str());
		feed->setCredits("0");
		feed->setHandle("");
		feed->setEmail(editBoxEmail->getText().c_str());
		feed->setUnsuccessful("Success");
		feed->setTouch("");
		int seconds = maLocalTime();
		int secondsLength = Util::intlen(seconds);
		char *secString = new char[secondsLength];
		memset(secString,'\0',secondsLength);
		sprintf(secString, "%d", seconds);
		feed->setSeconds(secString);
		delete secString;
		username,error_msg= "";
		Util::saveData("fd.sav", feed->getAll().c_str());

		/*if (next != NULL) {
			delete next;
		}*/
		next = new AlbumLoadScreen(feed, album);
		next->show();
	} else if(!strcmp(name, "country_name")) {
		setCountry(temp.c_str());
		notice->setCaption("");
	}  else {
		if (!error) {
			if (notice != NULL) {
				notice->setCaption("");
			}
		}
	}
}
void Login::cleanup() {
	delete layout;

	parentTag = "";
	conCatenation = "";
	value = "";
	value1 = "";
	value2 = "";
	convertAsterisk = "";
	underscore = "";
	username = "";
	credits = "";
	encrypt = "";
	error_msg = "";
	email = "";
	handle = "";
	touch = "";
}

void Login::mtxParseError(int) {
}

void Login::mtxEmptyTagEnd() {
}

void Login::mtxTagStartEnd() {
}


void Login::menuOptionSelected(int index) {
	if (isTerms) {
		if (index == 0) {
			maPlatformRequest(URL_TERMS.c_str());
		}
		else if (index == 1) {
			termsBox->setChecked(true);
			this->show();
		}
		else if (index == 2) {
			termsBox->setChecked(false);
			this->show();
		}
	}
	else if (isCountry) {
		String cName = "+";
		cName.append(countries[index].code, strlen(countries[index].code));
		cName.append("  ", 2);
		cName.append(countries[index].country, strlen(countries[index].country));

		countryLabel->setCaption(cName.c_str());
		this->show();
	}

	isTerms = false;
	isCountry = false;
}

void Login::setCountry(const char *countryCode) {
	int countryCount = sizeof(countries)/sizeof(country);
	for (int i = 0; i < countryCount; i++) {
		if (strcmp(countries[i].countryCode, countryCode) == 0) {
			String cName = "+";
			cName.append(countries[i].code, strlen(countries[i].code));
			cName.append("  ", 2);
			cName.append(countries[i].country, strlen(countries[i].country));

			countryLabel->setCaption(cName.c_str());
			countryMenu->setSelectedIndex(i);
			return;
		}
	}
}
