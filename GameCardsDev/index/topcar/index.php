<?php
include('../functions.php');
include('settings.php');
/*
this page handles requests from the handset

GETS
----
only authenticated users may use these 
1. userdetails=1					- send userdetails
2. cards=-1								- send all card details for this user
3. cards=CSV list					-	all cards except in CSV list
4. decks=1								- deck ids and names for this user
5. cardsindeck=deck_id		- cards in this deck
6. image?????????
7. allcategories=1				- list all categories 
8. auction=1							-	details of auctions
*/

date_default_timezone_set('Africa/Johannesburg'); 

/*
$sCRLF="\r\n";
$sTab=chr(9);
*/

//constants
$sCRLF="";
$sTab="";

//new game constants
$ng_ai = "1";
$ng_pvp = "2";

$root = "../../";

//before checking if the user is logged in,check if they are registering a new user
if ($_GET['registeruser']) {
	$username = $_REQUEST['username'];
	$password = $_REQUEST['password'];
	$email = $_REQUEST['email'];

	$sOP = registerUser($username, $password, $email);
	
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

$sUsername = $_SERVER['HTTP_AUTH_USER'];
$sPassword = base64_decode($_SERVER['HTTP_AUTH_PW']);
$iUserID=0;

if(!$sUsername){
	$sUsername = $_POST['lusername'];
	$sPassword = $_POST['lpassword'];
}

/** first authorize our user */
$aUserAuth=myqu('SELECT user_id, password '
	.'FROM mytcg_user '
	.'WHERE username="'.$sUsername.'"');
$aPassword=explode(':',$aUserAuth[0]['password']);
$sCrypt=JUserHelper::getCryptedPassword($sPassword, $aPassword[1]);
$sPasswordCrypted=$sCrypt.':'.$aPassword[1];
$aTestPassword=explode(':',$sPasswordCrypted);

if ($aTestPassword[0]==$aPassword[0]){
	$iUserID=$aUserAuth[0]['user_id'];
}
$aValidUser=myqu(
								"SELECT user_id, username, password, date_last_visit, credits "
								."FROM mytcg_user "
								."WHERE username='".$sUsername."' "
								."AND is_active='1'"
);
$iUserID=$aValidUser[0]["user_id"];
$iMod=(intval($iUserID) % 10)+1;
$sPassword=substr(md5($iUserID),$iMod,10).md5($sPassword);
if ($sPassword!=$aValidUser[0]['password']){
	$iUserID=0;
}

//$iUserID = 24;
/** exit if user not validated, send bye bye xml to be nice */
if ($iUserID == 0){
	$sOP='<user>'.$sCRLF;
	//$sOP.=substr(md5('28'),9,10).md5('champion');
	$sOP.=$sTab.'<result>Invalid User Details</result>'.$sCRLF;	
	//$sOP.=$sTab.'<sPassword>'.$sPassword.'</sPassword>'.$sCRLF;	
	//$sOP.=$sTab.'<aValidUser>'.$aValidUser[0]['password'].'</aValidUser>'.$sCRLF;	
	//$sOP.=$sTab.'<sUsername>'.$sUsername.'</sUsername>'.$sCRLF;	
	$sOP.='</user>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;	
} else {
	$aUpdate=myqu('SELECT datediff(now(), mobile_date_last_visit) dif
					FROM mytcg_user where user_id = '.$iUserID);
	
	$iUpdate=$aUpdate[0];
	if ($iUpdate['dif'] >= 1) {
		myqui('INSERT mytcg_transactionlog (user_id, description, date, val)
				SELECT '.$iUserID.', descript, now(), val
				FROM mytcg_transactiondescription
				WHERE transactionid = 1');
				
		myqui('UPDATE mytcg_user SET gameswon=0, credits=(credits+50) WHERE user_id = '.$iUserID);
	}
		
	myqui('UPDATE mytcg_user SET mobile_date_last_visit=now() WHERE user_id = '.$iUserID);
}

if ($iTestVersion=$_GET['update']){
  
	if (!($iMSISDN=$_GET['msisdn'])) {
		$iMSISDN = '';
	}
	if (!($iIMSI=$_GET['imsi'])) {
		$iIMSI = '';
	}
	if (!($iIMEI=$_GET['imei'])) {
		$iIMEI = '';
	}
	if (!($iOs=$_GET['os'])) {
		$iOs = '';
	}
	if (!($iMake=$_GET['make'])) {
		$iMake = '';
	}
	if (!($iModel=$_GET['model'])) {
		$iModel = '';
	}
	if (!($iOsVer=$_GET['osver'])) {
		$iOsVer = '';
	}
	if (!($iTouch=$_GET['touch'])) {
		$iTouch = '';
	}
	if (!($iScreenWidth=$_GET['width'])) {
		$iScreenWidth = '';
	}
	if (!($iScreenHeight=$_GET['height'])) {
		$iScreenHeight = '';
	}
	
	$aChanged=myqu('SELECT * FROM mytcg_userphone WHERE msisdn="'.$iMSISDN.'" AND imsi="'.$iIMSI.'" AND imei="'.$iIMEI.'" AND os="'.$iOs.'" AND make="'.$iMake.'" AND model="'.$iModel.'" AND osver="'.$iOsVer.'" AND touch='.$iTouch.' AND width='.$iScreenWidth.' AND height='.$iScreenHeight.' AND version="'.$iTestVersion.'" AND user_id ='.$iUserID);
	$iUpdated = sizeof($aChanged);
	if ($iUpdated==0){
		$aUpdate=myqui('INSERT INTO mytcg_userphone (user_id, msisdn, imsi, imei, os, make, model, osver, touch, width, height, version) VALUES ('.$iUserID.',"'.$iMSISDN.'", "'.$iIMSI.'", "'.$iIMEI.'","'.$iOs.'","'.$iMake.'","'.$iModel.'","'.$iOsVer.'",'.$iTouch.','.$iScreenWidth.','.$iScreenHeight.',"'.$iTestVersion.'")');
	}
	
	$aVersion=myqu(
		'SELECT url FROM mytcg_version '
		.'WHERE os="'.$iOs.'" '
		.'AND version <> "'.$iTestVersion.'" '
	);
	#
	$iUpdate = sizeof($aVersion);
	$iVersion=$aVersion[0];
	if ($iUpdate > 0){
		echo ''.$iVersion['url'].'';
	}
	exit;
}

if ($iUserCardID = $_GET['createauction']){
	$iCardId=$_GET['cardid'];
	$iAuctionBid=$_GET['bid'];
	$iBuyNowPrice=$_GET['buynow'];
	$iDays=$_GET['days'];
	
	createAuction($iCardId, $iAuctionBid, $iBuyNowPrice, $iDays, $iUserID);
	exit;
}

if ($_GET['leaders']){
	leaders();
}

//BUY ITEMS IN CART
if ($_GET['buyproduct']){
	$timestamp = time();

	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	if (!($iFreebie=$_GET['freebie'])) {
		$iFreebie = -1;
	}
	$product = $_GET['buyproduct'];
	buyProduct($timestamp, $iHeight, $iWidth, $iFreebie, $iUserID, $product, $root);
	exit();
}

//BID ON AN AUCTION
if ($_GET['auctionbid']){
	$bid = $_GET['bid'];
	$username = $_GET['username'];
	auctionBid($bid, $username, $iUserID);
	exit;
}

//BUYOUT AN AUCTION
if ($_GET['buyauctionnow']){
	$auctionCardId = $_GET['auctioncardid'];
	buyAuctionNow($auctionCardId, $iUserID);
	exit;
}

//DO TRADE
if ($cardID = $_GET['tradecard']){
	//Friend detail type
  $tradeMethod = $_REQUEST['trademethod'];
  //Friend detail
  $receiveNumber = $_REQUEST['detail'];
  
  //Check if card still belongs to user and is available for trading
  $aCheckCard=myqu('SELECT usercard_id,usercardstatus_id '
		.'FROM mytcg_usercard '
		.'WHERE usercardstatus_id = 1 '
		.'AND card_id = '.$cardID.' '
		.'AND user_id = '.$iUserID);
  if (sizeof($aCheckCard) == 0){
    $sOP='<result>Card no longer in possession</result>'.$sCRLF;
    header('xml_length: '.strlen($sOP));
    echo $sOP;
    exit;
  }
	
	//check if the target user exists
	$query = 'SELECT user_id FROM mytcg_user WHERE ';
	if ($tradeMethod == 'username') {
		$query .= 'username = "'.$receiveNumber.'"';
	}
	else if ($tradeMethod == 'email') {
		$query .= 'email_address = "'.$receiveNumber.'"';
	}
	else if ($tradeMethod == 'phone_number') {
		$query .= 'msisdn = "'.$receiveNumber.'"';
	}
	
	$aCheckUser = myqu($query);
	if (sizeof($aCheckUser) == 0){
		$sOP='<result>User not found'.$query.'</result>'.$sCRLF;
    header('xml_length: '.strlen($sOP));
    echo $sOP;
    exit;
	}
  
  //usercardstatus_id = 4 = Received.
  myqui('UPDATE mytcg_usercard SET user_id = '.$aCheckUser[0]['user_id'].', usercardstatus_id = 4 '
		.' WHERE usercard_id = '.$aCheckCard[0]['usercard_id']);
  
  //SMS Notification of Trade completed
  
  /*if ($_REQUEST['sms']=="Yes"){
		$sms_string = "http://api.clickatell.com/http/sendmsg?user=mytcg&password=m9y7t5c3g!&api_id=3263957";
		$sms_string .= "&to={$receiveNumber}";
		$sms_string .= "&text={$sUsername} has sent you a {$sVoucher} Card".$smsMessage;
		$ch = curl_init(str_replace(" ","%20",$sms_string));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$ret = curl_exec($ch);
		curl_close($ch);
  }*/
  $sOP='<result>Card sent successfully</result>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//this saves a note for a user, per card
if ($iNote=$_GET['savenote']) {
	$cardId = $_GET['cardid'];

	myqui('INSERT INTO mytcg_usercardnote
		(user_id, card_id, usercardnotestatus_id, note, date_updated)
		VALUES
		('.$iUserID.', '.$cardId.', 1, "'.$iNote.'", now())
		ON DUPLICATE KEY UPDATE 
		note = "'.$iNote.'",
		date_updated = now()');
		
	$sOP='<result>Note saved successfully</result>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//Delete the cards from the user
//usercardstatus_id = 3 = Deleted
if ($iCard=$_GET['deletecard']){
	myqui('UPDATE mytcg_usercard 
			SET usercardstatus_id = 3
			WHERE card_id = '.$iCard.' 
			AND usercardstatus_id = 1
			AND user_id = '.$iUserID.' 
			AND usercard_id NOT IN ( 
					SELECT usercard_id 
					FROM mytcg_gameplayercard 
					WHERE gameplayer_id IN ( 
						SELECT gameplayer_id 
						FROM mytcg_gameplayer 
						WHERE user_id = '.$iUserID.') 
			GROUP BY card_id) 
	');
	
	$sOP = "<result>Complete!</result>";
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//Reject cards pending approval from the user
//usercardstatus_id = 3 = Deleted
//usercardstatus_id = 4 = Received
if ($iCard=$_GET['rejectcard']){
	myqui('UPDATE mytcg_usercard 
			SET usercardstatus_id = 3
			WHERE card_id = '.$iCard.' 
			AND usercardstatus_id = 4
			AND user_id = '.$iUserID.' 
			AND usercard_id NOT IN ( 
					SELECT usercard_id 
					FROM mytcg_gameplayercard 
					WHERE gameplayer_id IN ( 
						SELECT gameplayer_id 
						FROM mytcg_gameplayer 
						WHERE user_id = '.$iUserID.') 
			GROUP BY card_id) 
	');
	
	$sOP = "<result>Complete!</result>";
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//usercardstatus_id = 3 = Deleted
if ($iCard=$_GET['savecard']){
	myqui('UPDATE mytcg_usercard 
			SET usercardstatus_id = 1
			WHERE card_id = '.$iCard.' 
			AND usercardstatus_id = 4
			AND user_id = '.$iUserID.' ');
	
	$sOP = "<result>Complete!</result>";
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//updatestatus_id = 2 = deleted
//clear updates for given user
if ($_GET['clearupdates']) {
		myqui('UPDATE mytcg_updates 
			SET updatestatus_id = 2
			WHERE user_id = '.$iUserID.' 
			AND updatestatus_id = 1');
	exit;
}

//updatestatus_id = 1 = Normal
//gets all updates since last download
if ($_GET['getupdates']) {
	
	if (!($lastCheckSeconds = $_GET['seconds'])) {
		$lastCheckSeconds = "0";
	}
	$aUpdates=myqu('SELECT message, DATE(savedate) as date 
					FROM mytcg_update 
					WHERE updatestatus_id = 1 
					AND user_id = '.$iUserID.' 
					AND savedate > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND)) 
					ORDER BY date, update_id');
		
	$sOP='<updates>'.$sCRLF;
	
	$iCount=0;
	if ($aOneUpdate=$aUpdates[$iCount]) {
		$iDate = $aOneUpdate['date'];
		$sOP.=$sTab.'<date val="'.$iDate.'">'.$sCRLF; 
	}
	while ($aOneUpdate=$aUpdates[$iCount]){
		if ($iDate == $aOneUpdate['date']) {
			$sOP.=$sTab.$sTab.'<message>'.$aOneUpdate['message'].'</message>'.$sCRLF; 
		} else {
			$sOP.=$sTab.'</date>'.$sCRLF; 
			$sOP.=$sTab.'<date val="'.$iDate.'">'.$sCRLF; 
			$sOP.=$sTab.$sTab.'<message>'.$aOneUpdate['message'].'</message>'.$sCRLF; 
		}
	}
	$aMax=myqu('SELECT MAX(DATE(savedate)) as date 
					FROM mytcg_update 
					WHERE updatestatus_id = 1 
					AND user_id = '.$iUserID.' 
					AND savedate > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND)) ');
	if ($aDate=$aMax[0]) {
	$sOP.=$sTab.'<maxdate>'.$aDate['date'].'</maxdate>'.$sCRLF; 
	}
	$sOP.='</updates>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//redeem card, adds the relevant card to the user's album
if ($code=$_GET['redeemcode']) {
	$exists = myqu('SELECT *
		FROM mytcg_card
		WHERE redeem_code = "'.$code.'"');

	//returns 1 if one card matches the redeem code, or 0 if no cards match
	if (sizeof($exists) > 0) {
		myqui('INSERT INTO mytcg_usercard
			(user_id, card_id, usercardstatus_id, is_new)
			SELECT '.$iUserID.', card_id, 4, 1
			FROM mytcg_card
			WHERE redeem_code =  "'.$code.'"');
			
		$sOP = "<result>Card successfully redeemed.</result>";
	}
	else {
		$sOP = "<result>Invalid redeem code.</result>";
	}
	
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//this needs to get a list of all the cards in the category, 
//but only display partial info for the ones the user doesnt have
/*
cardsincategory = categoryid: gives that categories cards
cardsincategory = -1: gives all cards for that user
cardsincategory = -2: gives only the user owned cards/own cards
cardsincateogry = -3: gives only the new cards, where usercardstatus_id = 4

usercardstatus = 1: In Album
usercardstatus = 2: In Auction
usercardstatus = 3: Deleted
usercardstatus = 4: Newly Received
*/
if ($iCategory=$_GET['cardsincategory']){

	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	if (!($iShowAll=$_GET['showall'])) {
		$iShowAll = '1';
	}
	$lastCheckSeconds = "";
	if (!($lastCheckSeconds = $_GET['seconds'])) {
		$lastCheckSeconds = "0";
	}
	
	$sOP = cardsincategory($iCategory,$iHeight,$iWidth,$iShowAll,$lastCheckSeconds,$iUserID, -1,$root);
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** get list of cards on auction within a category */
if ($_GET['categoryauction']){
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	
	$categoryId = $_GET['category_id'];
	
	$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
		.'FROM mytcg_imageserver b '
		.'ORDER BY b.description DESC '
	);
	
	$auctionCards = array();
	
	$auctionCards = getAuctionCards($categoryId, $auctionCards, $iUserID);
	
	$sOP='<auctionsincategory>'.$sCRLF;
	$iCount=0;
	while ($aOneCard=$auctionCards[$iCount]){
		$sOP.='<auction>';
		$sOP.=$sTab.'<auctioncardid>'.$aOneCard['market_id'].'</auctioncardid>'.$sCRLF;
		$sOP.=$sTab.'<usercardid>'.$aOneCard['usercard_id'].'</usercardid>'.$sCRLF;
		$sOP.=$sTab.'<cardid>'.$aOneCard['card_id'].'</cardid>'.$sCRLF;
		$sOP.=$sTab.'<description>'.$aOneCard['description'].'</description>'.$sCRLF;
		$sOP.=$sTab.'<openingbid>'.$aOneCard['minimum_bid'].'</openingbid>'.$sCRLF;
		$sOP.=$sTab.'<buynowprice>'.$aOneCard['buy_now_price'].'</buynowprice>'.$sCRLF;
		$sOP.=$sTab.'<price>'.$aOneCard['price'].'</price>'.$sCRLF;
		$sOP.=$sTab.'<username>'.$aOneCard['username'].'</username>'.$sCRLF;
		$sOP.=$sTab.'<endDate>'.$aOneCard['end_date'].'</endDate>'.$sCRLF;
		$sOP.=$sTab.'<lastBidUser>'.$aOneCard['last_bid_username'].'</lastBidUser>'.$sCRLF;
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['thumbnail_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		$sOP.=$sTab.'<thumburl>'.$sFound.'cards/'.$aOneCard['image'].'_thumb.png</thumburl>'.$sCRLF;
		
		//before setting the front and back urls, make sure the card is resized for the height
		$iHeight = resizeCard($iHeight, $iWidth, $aOneCard['image'], $root);
		
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['front_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.'<fronturl>'.$sFound.$iHeight.'/cards/'.$aOneCard['image'].'_front.png</fronturl>'.$sCRLF;
		$sOP.=$sTab.'<frontflipurl>'.$sFound.$iHeight.'/cards/'.$aOneCard['image'].'_front_flip.png</frontflipurl>'.$sCRLF;
		

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.'<backurl>'.$sFound.$iHeight.'/cards/'.$aOneCard['image'].'_back.png</backurl>'.$sCRLF; 
		$sOP.=$sTab.'<backflipurl>'.$sFound.$iHeight.'/cards/'.$aOneCard['image'].'_back_flip.png</backflipurl>'.$sCRLF; 
		$sOP.='</auction>';
		$iCount++;
	}
	$sOP.='</auctionsincategory>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//get all the different payments
if ($_GET['getpayments']) {
	$payments=myqu('SELECT p.paymentid, p.thumbnailurl, 
		p.paymethodid, p.desc, p.val, p.creditam, p.cred
		FROM mytcg_payments p
		ORDER BY p.desc'
	);
	
	$op = '<payments>';
	$count = 0;
	while ($payment=$payments[$count]) {
		$op.='<payment>';
		$op.='<paymentid>'.$payment['paymentid'].'</paymentid>';
		$op.='<thumbnailurl>'.$payment['thumbnailurl'].'</thumbnailurl>';
		$op.='<paymethodid>'.$payment['paymethodid'].'</paymethodid>';
		$op.='<desc>'.$payment['desc'].'</desc>';
		$op.='<val>'.$payment['val'].'</val>';
		$op.='<creditam>'.$payment['creditam'].'</creditam>';
		$op.='<cred>'.$payment['cred'].'</cred>';
		$op.='</payment>';
		$count++;
	}
	$op .= '</payments>';
	header('xml_length: '.strlen($op));
	echo $op;
	exit;
}

// get list of cards on auction for the current user
if ($_GET['userauction']){
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	
	$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
		.'FROM mytcg_imageserver b '
		.'ORDER BY b.description DESC '
	);
	
	$aAuctionCards=myqu('SELECT AC.market_id, UC.usercard_id, UC.card_id, C.image, C.thumbnail_phone_imageserver_id, C.description, 
		AC.minimum_bid, AC.price buy_now_price, MAX(AB.price) price, U.username, 
		UB.username as last_bid_username, date_format(AC.date_expired, "%Y-%m-%d") as end_date 
		FROM mytcg_usercard UC 
		INNER JOIN mytcg_market AC 
		ON UC.usercard_id=AC.usercard_id 
		INNER JOIN mytcg_card C 
		ON UC.card_id=C.card_id 
		INNER JOIN mytcg_user U 
		ON UC.user_id=U.user_id 
		LEFT OUTER JOIN mytcg_marketcard AB 
		ON AC.market_id=AB.market_id 
		LEFT OUTER JOIN mytcg_user UB 
		ON AB.user_id=UB.user_id 
		WHERE AC.marketstatus_id="1" 
		AND U.user_id='.$iUserID.'
		AND datediff(now(), AC.date_expired) <= 0
		AND
		(AB.price = (select max(price) from mytcg_marketcard a where a.market_id = AC.market_id group by market_id)
		OR ISNULL(AB.price))
		GROUP BY UC.usercard_id 
		ORDER BY C.description, price, AC.minimum_bid');
	
	$sOP='<auctionsincategory>'.$sCRLF;
	$iCount=0;
	while ($aOneCard=$aAuctionCards[$iCount]){
		$sOP.='<auction>';
		$sOP.=$sTab.'<auctioncardid>'.$aOneCard['market_id'].'</auctioncardid>'.$sCRLF;
		$sOP.=$sTab.'<usercardid>'.$aOneCard['usercard_id'].'</usercardid>'.$sCRLF;
		$sOP.=$sTab.'<cardid>'.$aOneCard['card_id'].'</cardid>'.$sCRLF;
		$sOP.=$sTab.'<description>'.$aOneCard['description'].'</description>'.$sCRLF;
		$sOP.=$sTab.'<openingbid>'.$aOneCard['minimum_bid'].'</openingbid>'.$sCRLF;
		$sOP.=$sTab.'<buynowprice>'.$aOneCard['buy_now_price'].'</buynowprice>'.$sCRLF;
		$sOP.=$sTab.'<price>'.$aOneCard['price'].'</price>'.$sCRLF;
		$sOP.=$sTab.'<username>'.$aOneCard['username'].'</username>'.$sCRLF;
		$sOP.=$sTab.'<endDate>'.$aOneCard['end_date'].'</endDate>'.$sCRLF;
		$sOP.=$sTab.'<lastBidUser>'.$aOneCard['last_bid_username'].'</lastBidUser>'.$sCRLF;
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['thumbnail_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		$sOP.=$sTab.'<thumburl>'.$sFound.'cards/'.$aOneCard['image'].'_thumb.png</thumburl>'.$sCRLF;
		$sOP.='</auction>';
		$iCount++;
	}
	$sOP.='</auctionsincategory>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** give details on auctions */
if ($_GET['auction']){
	$aAuctionCards=myqu('SELECT B.auctioncard_id '
		.'FROM mytcg_usercard A '
		.'INNER JOIN mytcg_auctioncard B '
		.'ON A.usercard_id=B.usercard_id '
		.'WHERE A.is_on_auction="1" '
		.'AND A.joomla_user_id="'.$iUserID.'" '
		.'UNION SELECT DISTINCT auctioncard_id '
		.'FROM mytcg_auctionbid '
		.' WHERE joomla_user_id="'.$iUserID.'"'
	);
	$iCount=0;
	$aCards=array();
	while ($sAuctionCard=$aAuctionCards[$iCount]['auctioncard_id']){
		$aCards[$iCount]=$sAuctionCard;
		$iCount++;
	}
	$sCards=implode(',',$aCards);
	$aAuctionCards=myqu('SELECT A.datetime_start, A.datetime_end, A.opening_bid, '
		.'B.card_id, C.image_id, A.auctioncard_id '
		.'FROM mytcg_auctioncard A '
		.'INNER JOIN mytcg_usercard B '
		.'ON A.usercard_id=B.usercard_id '
		.'INNER JOIN mytcg_card C '
		.'ON B.card_id=C.card_id '
		.'WHERE A.auctioncard_id IN ('.$sCards.')'
	);
	$sOP='<auction>'.$sCRLF;
	$iCount=0;
	while ($aDetails=$aAuctionCards[$iCount]){
		$aBid=myqu('SELECT MAX(price)AS price, timestamp '
			.'FROM mytcg_auctionbid '
			.'WHERE auctioncard_id="'.$aCards[$iCount].'"');
			
		$sOP.=$sTab.'<auctioncard_'.$iCount.' val="'.$aDetails['auctioncard_id'].'">'.$sCRLF;
		$sOP.=$sTab.$sTab.'<card_id="'.$aDetails['card_id'].'" />'.$sCRLF;
		$sOP.=$sTab.$sTab.'<image_id="'.$aDetails['image_id'].'" />'.$sCRLF;
		$sOP.=$sTab.$sTab.'<datetime_start="'.$aDetails['datetime_start'].'" />'.$sCRLF;
		$sOP.=$sTab.$sTab.'<datetime_end="'.$aDetails['datetime_end'].'" />'.$sCRLF;
		$sOP.=$sTab.$sTab.'<opening_bid="'.$aDetails['opening_bid'].'" />'.$sCRLF;
		$sOP.=$sTab.$sTab.'<price="'.$aBid[0]['price'].'" />'.$sCRLF;
		$sOP.=$sTab.$sTab.'<currentbiddatetime="'.$aBid[0]['timestamp'].'" />'.$sCRLF;
		
		$sOP.=$sTab.'</auctioncard_'.$iCount.'>'.$sCRLF;
		
		$iCount++;
	}
	$sOP.='</auction>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** returns all the categories the user has enough cards to play with */
if ($_GET['playablecategories']){
	$aCategories=myqu('SELECT c.category_id, (case when count(uc.card_id) > 4 then 4 else count(uc.card_id) end) as card_count, cx.category_parent_id
		FROM mytcg_card c
		INNER JOIN mytcg_usercard uc
		ON uc.card_id = c.card_id
		INNER JOIN mytcg_category_x cx
		ON cx.category_child_id = c.category_id
		WHERE uc.user_id = '.$iUserID.' 
		GROUP BY c.category_id');
	
	$results = array();
	$iCount=0;
	while ($aCategory=$aCategories[$iCount]) {
		if ($aCategory['category_parent_id'] == '') {
			if ($bCategory=$results[$aCategory['category_id']]) {
				$bCategory['card_count'] = $bCategory['card_count'] + $aCategory['card_count'];
				$results[$aCategory['category_id']] = $bCategory;
			}
			else {
				$results[$aCategory['category_id']] = $aCategory;
			}
		}
		else {
			$results = getSecondLastParent($aCategory['category_parent_id'],$aCategory['category_id'], $aCategory, $results);
		}
		$iCount++;
	}
	
	$sOP='<categories>'.$sCRLF;
	foreach ($results as $category) {
    if ($category['card_count'] >= 5) {
			$catName=myqu('SELECT description FROM mytcg_category WHERE category_id = '.$category['category_id']);
			$sOP.=$sTab.'<categoryid>'.trim($category['category_id']).'</categoryid>'.$sCRLF;
			$sOP.=$sTab.'<categoryname>'.trim($catName[0]['description']).'</categoryname>'.$sCRLF;
			$sOP.=$sTab.'<playablecards>'.trim($category['card_count']).'</playablecards>'.$sCRLF;
		}
	}
	$sOP.='</categories>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** load the phase of the game, then send an unplayed cards list, a selected cards stats, or results accordingly */
if ($_GET['loadgame']) {
	$gameId = $_GET['gameid'];

	//sizes first
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '0';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '0';
	}
	
	$sOP = loadGame($gameId, $iUserID, $iHeight, $iWidth, $root);
	
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** load the phase of the game, then send an unplayed cards list, a selected cards stats, or results accordingly */
if ($_GET['continuegame']) {
	$gameId = $_GET['gameid'];
	$lastMove = base64_decode($_GET['lastmove']);
	
	$sOP = '';
	
	//sizes first
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	
	//continue the game, if needed selecting a stat for the ai
	continueGame($gameId, $iUserID, $iHeight, $iWidth);
	
	//we need to check if a move has been made since the last move the user saw.
	$lastMoveQuery = myqu('SELECT date, gamelog_id, categorystat_id 
		FROM mytcg_gamelog 
		WHERE game_id = '.$gameId.' 
		ORDER BY gamelog_id DESC 
		LIMIT 1');
	$newLastMove = $lastMoveQuery[0]['date'];
	if ($lastMove != $newLastMove) {
		$sOP = '<game><phase>oppmove</phase><categorystat_id>'.$lastMoveQuery[0]['categorystat_id'].'</categorystat_id><lastmove>'.$lastMoveQuery[0]['date'].'</lastmove></game>';
	}
	
	if ($sOP == '') {
		//load the game for the user
		$sOP = loadGame($gameId, $iUserID, $iHeight, $iWidth, $root);
	}
	
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** for when a user selects a stat. Compares to the corresponding stat on the opponents card and returns results */
if ($_GET['selectstat']) {
	//sizes first
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}

	$cardStatId = $_GET['statid'];
	$gameId = $_GET['gameid'];
	
	//select your opponent's id
	$opponentIdQuery = myqu('SELECT user_id 
		FROM mytcg_gameplayer 
		WHERE user_id != '.$iUserID.' 
		AND game_id = '.$gameId);
	$oppId = $opponentIdQuery[0]['user_id'];
	
	//select the category stat id
	$categoryStatQuery = myqu('SELECT categorystat_id 
		FROM mytcg_cardstat
		WHERE cardstat_id = '.$cardStatId);
	$categoryStatId = $categoryStatQuery[0]['categorystat_id'];
	
	//build xml with scores and explanation and send it back
	selectStat($iUserID, $oppId, $gameId, $categoryStatId);
	
	sleep(3);
	
	//continue the game, updating result phase to select stat, and if needed selecting a stat for the ai
	//continueGame($gameId, $iUserID, $iHeight, $iWidth);
	
	//load the game for the user
	$sOP = loadGame($gameId, $iUserID, $iHeight, $iWidth, $root);
	
	//send xml with results back to the user
	header('xml_length: '.strlen($sOP));
	echo $sOP;
}

/** declines a specific game, and goes through the steps required to make a new one */
if ($_GET['declinegame']) {
	//thing is, if the user declined a game, he didnt specify an opponent, or ai. so after declining, we dont need to go through the whole create process, we can skip some
	$gameId = $_GET['gameid'];
	$categoryId = $_GET['categoryid'];
	
	//we are gonna need the open status id
	$openStatusQuery = myqu("SELECT gamestatus_id 
		FROM mytcg_gamestatus gs 
		WHERE lower(gs.description) = 'open'");
	$openId = $openStatusQuery[0]['gamestatus_id'];
	
	//we are going to need the closed status id
	$closedStatusQuery = myqu("SELECT gamestatus_id 
		FROM mytcg_gamestatus gs 
		WHERE lower(gs.description) = 'closed'");
	$closedId = $closedStatusQuery[0]['gamestatus_id'];
	
	//we are going to need the declined phase id
	$declinedPhaseQuery = myqu("SELECT gamephase_id, description 
		FROM mytcg_gamephase 
		WHERE description = 'declined'");
	$declinedId = $declinedPhaseQuery[0]['gamephase_id'];
	
	//set the status to closed, and the phase to declined
	myqu('UPDATE mytcg_game SET gamephase_id = '.$declinedId.', gamestatus_id = '.$closedId);
	
	//get phones screen sizes
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '0';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '0';
	}
	
	$newGame = false;
	
	//check if there are games looking for the user, or open games.
	$gameQuery = myqu('SELECT g.game_id, g.friend, u.username 
		FROM mytcg_game g 
		INNER JOIN mytcg_gameplayer gp 
		ON gp.game_id = g.game_id 
		INNER JOIN mytcg_user u
		ON u.user_id = gp.user_id 
		WHERE g.category_id = '.$categoryId.' 
		AND g.gamestatus_id = '.$openId.' 
		AND gp.user_id != '.$iUserID.' 
		AND g.friend = "'.$sUsername.'"');
	
	//if we find one, we send back data to the front end so the user can confirm whether they want to play against that person or not
	if (sizeof($gameQuery) > 0) {
		$creator = $openGameQuery[0]['username'];
		$sOP='<game>'.$sCRLF;
		$sOP.=$sTab.'<gameid>'.$gameId.'</gameid>'.$sCRLF;
		$sOP.='<creator>'.$sCRLF;
		$sOP.=$creator.$sCRLF;
		$sOP.='</creator>'.$sCRLF;
		$sOP.='<phase>confirm</phase>'.$sCRLF;
		$sOP.='</game>'.$sCRLF;
		header('xml_length: '.strlen($sOP));
		echo $sOP;
		
		exit;
	}
	else {
		//if there were no games aimed at the user, we check if there are any normal open games
		$gameQuery = myqu('SELECT g.game_id, g.friend, u.username 
			FROM mytcg_game g 
			INNER JOIN mytcg_gameplayer gp 
			ON gp.game_id = g.game_id 
			INNER JOIN mytcg_user u
			ON u.user_id = gp.user_id 
			WHERE g.category_id = '.$categoryId.' 
			AND g.gamestatus_id = '.$openId.' 
			AND gp.user_id != '.$iUserID.' 
			AND g.friend = ""');
		
		//if there was one, set it up and create the game
		if (sizeof($gameQuery) > 0) {
			$gameId = $gameQuery[0]['game_id'];
			myqu('UPDATE mytcg_game 
				SET gamestatus_id = '.$incompleteId.', 
				gamephase_id = 2 
				WHERE game_id = '.$gameId);
		}
		else {
			//otherwise we create a new game, waiting for someone to join
			$gameIdQuery = myqu('SELECT (CASE WHEN MAX(game_id) IS NULL THEN 0 ELSE MAX(game_id) END) + 1 AS game_id 
				FROM mytcg_game');
			$gameId = $gameIdQuery[0]['game_id'];
			myqu('INSERT INTO mytcg_game (game_id, gamestatus_id, gamephase_id, category_id, date_start, friend) 
				SELECT '.$gameId.', '.$openId.', 
				(SELECT gamephase_id FROM mytcg_gamephase WHERE lower(description) = "lfm"), '.$categoryId.', now(), "" 
				FROM DUAL');
			$newGame = true;
		}
	}
	
	//add the player to the game
	myqu('INSERT INTO mytcg_gameplayer (game_id, user_id, is_active, gameplayerstatus_id)
		VALUES ('.$gameId.', '.$iUserID.', 0, 1)');
	
	if (!$newGame) {
		initialiseGame($iUserID, $gameId);
	}
	
	//return xml with the gameId to the phone
	$sOP='<game>'.$sCRLF;
	$sOP.=$sTab.'<gameid>'.$gameId.'</gameid>'.$sCRLF;
	//if a new game was created, for pvp, we need to return the url of the gc card, for display purposes
	if ($newGame) {
		$height = resizeGCCard($iHeight, $iWidth, $root);
		$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
		$sOP.=$sTab.'<gcurl>'.$imageUrlQuery[0]['description'].$height.'/cards/gc.png</gcurl>'.$sCRLF;
		$sOP.=$sTab.'<gcurlflip>'.$imageUrlQuery[0]['description'].$height.'/cards/gcFlip.png</gcurlflip>'.$sCRLF;
	}
	$sOP.='</game>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	
	exit;
}

/** confirms that the user is up for the game, and initialises it */
if ($_GET['confirmgame']) {
	$gameId = $_GET['gameid'];
	
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '0';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '0';
	}
	
	//we are going to need the incomplete status id
	$incompleteStatusQuery = myqu("SELECT gamestatus_id 
		FROM mytcg_gamestatus gs 
		WHERE lower(gs.description) = 'incomplete'");
	$incompleteId = $incompleteStatusQuery[0]['gamestatus_id'];
	
	myqu('UPDATE mytcg_game 
				SET gamestatus_id = '.$incompleteId.', 
				gamephase_id = 2 
				WHERE game_id = '.$gameId);
	
	//add the player to the game
	myqu('INSERT INTO mytcg_gameplayer (game_id, user_id, is_active, gameplayerstatus_id)
		VALUES ('.$gameId.', '.$iUserID.', 0, 1)');
	
	initialiseGame($iUserID, $gameId);
	
	//return xml with the gameId to the phone
	$sOP='<game>'.$sCRLF;
	$sOP.=$sTab.'<gameid>'.$gameId.'</gameid>'.$sCRLF;
	$sOP.=$sTab.'<phase>stat</phase>'.$sCRLF;
	//if a new game was created, for pvp, we need to return the url of the gc card, for display purposes
	if ($newGame) {
		$height = resizeGCCard($iHeight, $iWidth, $root);
		$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
		$sOP.=$sTab.'<gcurl>'.$imageUrlQuery[0]['description'].$height.'/cards/gc.png</gcurl>'.$sCRLF;
		$sOP.=$sTab.'<gcurlflip>'.$imageUrlQuery[0]['description'].$height.'/cards/gcFlip.png</gcurlflip>'.$sCRLF;
	}
	$sOP.='</game>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	
	exit;
}

/** creates a new game, against AI, and returns the gameId */
if ($_GET['newgame']) {
	//we will use the admin as the ai user, if the user wants to play against ai
	$categoryId = $_GET['categoryid'];
	$newGameType = $_GET['newgametype'];
	
	//we need to check if the user wants to play against a specific person
	if (!($friend=$_GET['friend'])) {
		$friend = '';
	}
	else {
		$friend = base64_decode($friend);
	}
	
	//get phones screen sizes
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '0';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '0';
	}
	
	$gameId = "";
	$opponentId = "";
	$newGame = false;
	
	if ($newGameType == $ng_pvp) {
		//we are gonna need the open status id
		$openStatusQuery = myqu("SELECT gamestatus_id 
			FROM mytcg_gamestatus gs 
			WHERE lower(gs.description) = 'open'");
		$openId = $openStatusQuery[0]['gamestatus_id'];
		
		//we are also going to need the incomplete status id
		$incompleteStatusQuery = myqu("SELECT gamestatus_id 
			FROM mytcg_gamestatus gs 
			WHERE lower(gs.description) = 'incomplete'");
		$incompleteId = $incompleteStatusQuery[0]['gamestatus_id'];
		
		//and the closed status
		$closedStatusQuery = myqu("SELECT gamestatus_id 
			FROM mytcg_gamestatus gs 
			WHERE lower(gs.description) = 'closed'");
		$closedId = $closedStatusQuery[0]['gamestatus_id'];
		
		//we need to clear all the open games that are older than a minute, so we need all their ids
		$oldOpenGame = myqu('SELECT g.game_id 
			FROM mytcg_game g 
			WHERE TIME_TO_SEC(TIMEDIFF(now(), date_start)) > 60 
			AND (g.gamestatus_id = '.$openId.' 
			OR g.gamestatus_id = '.$closedId.')');
		
		foreach ($oldOpenGame as $game) {
			myqu('DELETE FROM mytcg_gameplayer WHERE game_id = '.$game['game_id']);
			myqu('DELETE FROM mytcg_game WHERE game_id = '.$game['game_id']);
		}
		
		//if the user specified a friend
		if ($friend != '') {
			//first we check if there is an open game whose creator is the friend the user wants to play against
			$gameQuery = myqu('SELECT g.game_id, g.friend, u.username 
				FROM mytcg_game g 
				INNER JOIN mytcg_gameplayer gp 
				ON gp.game_id = g.game_id 
				INNER JOIN mytcg_user u
				ON u.user_id = gp.user_id 
				WHERE g.category_id = '.$categoryId.' 
				AND g.gamestatus_id = '.$openId.' 
				AND gp.user_id != '.$iUserID.' 
				AND g.friend = "'.$sUsername.'" 
				AND u.username = "'.$friend.'"');
				
			//if there was one, set it up and create the game
			if (sizeof($gameQuery) > 0) {
				$gameId = $gameQuery[0]['game_id'];
				myqu('UPDATE mytcg_game 
					SET gamestatus_id = '.$incompleteId.', 
					gamephase_id = 2 
					WHERE game_id = '.$gameId);
			}
			else {
				//otherwise we create a new game, waiting for the friend to join
				$gameIdQuery = myqu('SELECT (CASE WHEN MAX(game_id) IS NULL THEN 0 ELSE MAX(game_id) END) + 1 AS game_id 
					FROM mytcg_game');
				$gameId = $gameIdQuery[0]['game_id'];
				myqu('INSERT INTO mytcg_game (game_id, gamestatus_id, gamephase_id, category_id, date_start, friend) 
					SELECT '.$gameId.', '.$openId.', 
					(SELECT gamephase_id FROM mytcg_gamephase WHERE lower(description) = "lfm"), '.$categoryId.', now(), "'.$friend.'" 
					FROM DUAL');
				$newGame = true;
			}
		}
		else {
			//if the user didnt specify a friend, we check if there an open game looking for him
			$gameQuery = myqu('SELECT g.game_id, g.friend, u.username 
				FROM mytcg_game g 
				INNER JOIN mytcg_gameplayer gp 
				ON gp.game_id = g.game_id 
				INNER JOIN mytcg_user u
				ON u.user_id = gp.user_id 
				WHERE g.category_id = '.$categoryId.' 
				AND g.gamestatus_id = '.$openId.' 
				AND gp.user_id != '.$iUserID.' 
				AND g.friend = "'.$sUsername.'"');
			
			//if we find one, we send back data to the front end so the user can confirm whether they want to play against that person or not
			if (sizeof($gameQuery) > 0) {
				$gameId = $gameQuery[0]['game_id'];
				$creator = $gameQuery[0]['username'];
			
				myqu('UPDATE mytcg_game 
					SET date_start = now() 
					WHERE game_id = '.$gameId);
			
				$sOP='<game>'.$sCRLF;
				$sOP.=$sTab.'<gameid>'.$gameId.'</gameid>'.$sCRLF;
				$sOP.='<creator>'.$sCRLF;
				$sOP.=$creator.$sCRLF;
				$sOP.='</creator>'.$sCRLF;
				$sOP.='<phase>confirm</phase>'.$sCRLF;
				$sOP.='</game>'.$sCRLF;
				header('xml_length: '.strlen($sOP));
				echo $sOP;
				
				exit;
			}
			else {
				//if there were no games aimed at the user, we check if there are any normal open games
				$gameQuery = myqu('SELECT g.game_id, g.friend, u.username 
					FROM mytcg_game g 
					INNER JOIN mytcg_gameplayer gp 
					ON gp.game_id = g.game_id 
					INNER JOIN mytcg_user u
					ON u.user_id = gp.user_id 
					WHERE g.category_id = '.$categoryId.' 
					AND g.gamestatus_id = '.$openId.' 
					AND gp.user_id != '.$iUserID.' 
					AND g.friend = ""');
				
				//if there was one, set it up and create the game
				if (sizeof($gameQuery) > 0) {
					$gameId = $gameQuery[0]['game_id'];
					myqu('UPDATE mytcg_game 
						SET gamestatus_id = '.$incompleteId.', 
						gamephase_id = 2 
						WHERE game_id = '.$gameId);
				}
				else {
					//otherwise we create a new game, waiting for someone to join
					$gameIdQuery = myqu('SELECT (CASE WHEN MAX(game_id) IS NULL THEN 0 ELSE MAX(game_id) END) + 1 AS game_id 
						FROM mytcg_game');
					$gameId = $gameIdQuery[0]['game_id'];
					myqu('INSERT INTO mytcg_game (game_id, gamestatus_id, gamephase_id, category_id, date_start, friend) 
						SELECT '.$gameId.', '.$openId.', 
						(SELECT gamephase_id FROM mytcg_gamephase WHERE lower(description) = "lfm"), '.$categoryId.', now(), "'.$friend.'" 
						FROM DUAL');
					$newGame = true;
				}
			}
		}
	}
	
	//check if the user wants to play against ai
	if ($newGameType == $ng_ai) {
		//create the game, get the game_id
		$gameIdQuery = myqu('SELECT (CASE WHEN MAX(game_id) IS NULL THEN 0 ELSE MAX(game_id) END) + 1 AS game_id
			FROM mytcg_game');
		$gameId = $gameIdQuery[0]['game_id'];
		myqu('INSERT INTO mytcg_game (game_id, gamestatus_id, gamephase_id, category_id, date_start) 
			SELECT '.$gameId.', (SELECT gamestatus_id FROM mytcg_gamestatus WHERE lower(description) = "incomplete"),
			(SELECT gamephase_id FROM mytcg_gamephase WHERE lower(description) = "stat"), '.$categoryId.', now()
			FROM DUAL');
		
		//get the admins userId
		$adminUserIdQuery = myqu('SELECT user_id 
			FROM mytcg_user 
			WHERE username = "admin"');
		$adminUserId = $adminUserIdQuery[0]['user_id'];
		
		//add the ai to the game
		myqu('INSERT INTO mytcg_gameplayer (game_id, user_id, is_active, gameplayerstatus_id)
			VALUES ('.$gameId.', '.$adminUserId.', 0, 2)');
	}
	
	//add the player to the game, the host goes first
	myqu('INSERT INTO mytcg_gameplayer (game_id, user_id, is_active, gameplayerstatus_id)
		VALUES ('.$gameId.', '.$iUserID.', '.($newGame?'1':(($newGameType == $ng_ai)?'1':'0')).', '.($newGame?(($newGameType == $ng_ai)?'1':'2'):'1').')');
			
	if (!$newGame) {
		initialiseGame($iUserID, $gameId);
	}
	
	//return xml with the gameId to the phone
	$sOP='<game>'.$sCRLF;
	$sOP.=$sTab.'<gameid>'.$gameId.'</gameid>'.$sCRLF;
	//if a new game was created, for pvp, we need to return the url of the gc card, for display purposes
	if ($newGame) {
		$height = resizeGCCard($iHeight, $iWidth, $root);
		$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
		$sOP.=$sTab.'<gcurl>'.$imageUrlQuery[0]['description'].$height.'/cards/gc.png</gcurl>'.$sCRLF;
		$sOP.=$sTab.'<gcurlflip>'.$imageUrlQuery[0]['description'].$height.'/cards/gcFlip.png</gcurlflip>'.$sCRLF;
	}
	$sOP.='</game>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	
	exit;
}

/** list incomplete games for the user */
if ($_GET['getusergames']){
	//we are gonna need the open status id
	$openStatusQuery = myqu("SELECT gamestatus_id 
		FROM mytcg_gamestatus gs 
		WHERE lower(gs.description) = 'open'");
	$openId = $openStatusQuery[0]['gamestatus_id'];
	
	//and the closed status
	$closedStatusQuery = myqu("SELECT gamestatus_id 
		FROM mytcg_gamestatus gs 
		WHERE lower(gs.description) = 'closed'");
	$closedId = $closedStatusQuery[0]['gamestatus_id'];
	
	//we need to clear all the open games that are older than a minute, so we need all their ids
	$oldOpenGame = myqu('SELECT g.game_id 
		FROM mytcg_game g 
		WHERE TIME_TO_SEC(TIMEDIFF(now(), date_start)) > 60 
		AND (g.gamestatus_id = '.$openId.' 
		OR g.gamestatus_id = '.$closedId.')');
	
	foreach ($oldOpenGame as $game) {
		myqu('DELETE FROM mytcg_gameplayer WHERE game_id = '.$game['game_id']);
		myqu('DELETE FROM mytcg_game WHERE game_id = '.$game['game_id']);
	}

	$aCategories=myqu('SELECT concat(c.description, DATE_FORMAT(g.date_start, "\n%Y-%m-%d %H:%i")) description, g.game_id
		FROM mytcg_game g 
		INNER JOIN mytcg_category c
		ON c.category_id = g.category_id
		INNER JOIN mytcg_gameplayer gp
		ON g.game_id = gp.game_id
		INNER JOIN mytcg_gamestatus gs
		ON gs.gamestatus_id = g.gamestatus_id
		INNER JOIN mytcg_gamephase gph
		ON gph.gamephase_id = g.gamephase_id
		WHERE gp.user_id = '.$iUserID.' 
		AND ((lower(gs.description) = "incomplete"
		AND (lower(gph.description) != "result"
		OR (lower(gph.description) = "result"
			AND gp.pending = 1)))
		OR (lower(gs.description) = "open"))
		ORDER BY g.game_id');
	$sOP='<games>'.$sCRLF;
	$iCount=0;
	while ($aCategory=$aCategories[$iCount]){
		$sOP.='<game>';
		$sOP.=$sTab.'<gameid>'.trim($aCategory['game_id']).'</gameid>'.$sCRLF;
		$sOP.=$sTab.'<gamedescription>'.trim($aCategory['description']).'</gamedescription>'.$sCRLF;
		$sOP.='</game>';
		$iCount++;
	}
	$sOP.='</games>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** get the details of a specific game, relevant to the user */
if ($_GET['viewgamedetails']){
	$gameId = $_GET['gameid'];
	$gameDetails=myqu('SELECT DISTINCT (CASE WHEN gp.is_active = "0" THEN "AI" ELSE "You" END) turn, gpc.playerDeck playerDeck, 
		gpcOpp.playerDeck oppDeck
		FROM mytcg_game g
		INNER JOIN mytcg_gameplayer gp
		ON g.game_id = gp.game_id
	\	INNER JOIN (SELECT COUNT(gpc.gameplayercard_id) playerDeck, gpc.gameplayer_id
		FROM mytcg_gameplayercard gpc
		GROUP BY gpc.gameplayer_id) gpc
		ON gp.gameplayer_id = gpc.gameplayer_id
		INNER JOIN mytcg_gameplayer gpOpp
		ON g.game_id = gpOpp.game_id
		INNER JOIN (SELECT COUNT(gpc.gameplayercard_id) playerDeck, gpc.gameplayer_id
		FROM mytcg_gameplayercard gpc
		GROUP BY gpc.gameplayer_id) gpcOpp
		ON gpOpp.gameplayer_id = gpcOpp.gameplayer_id
		WHERE g.game_id = '.$gameId.' 
		AND gp.user_id = '.$iUserID.'
		AND gpOpp.user_id != '.$iUserID);
	$gameDetailsResults = $gameDetails[0];
	$sOP='<gamedetails>'.$sCRLF;
	$sOP.=$sTab.'<turn>'.trim($gameDetailsResults['turn']).'</turn>'.$sCRLF;
	$sOP.=$sTab.'<opponentdeck>'.trim($gameDetailsResults['oppDeck']).'</opponentdeck>'.$sCRLF;
	$sOP.=$sTab.'<playerdeck>'.trim($gameDetailsResults['playerDeck']).'</playerdeck>'.$sCRLF;
	$sOP.='</gamedetails>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** get the log for a game */
if ($_GET['viewgamelog']){
	$gameId = $_GET['gameid'];
	$gameLogs=myqu('SELECT date, message 
		FROM mytcg_gamelog 
		WHERE game_id = '.$gameId.' 
		ORDER BY date DESC');
	$sOP='<logs>'.$sCRLF;
	foreach ($gameLogs as $log) {
		$sOP.='<log>'.$sCRLF;
		$sOP.=$sTab.'<date>'.trim($log['date']).'</date>'.$sCRLF;
		$sOP.=$sTab.'<description>'.trim($log['message']).'</description>'.$sCRLF;
		$sOP.='</log>'.$sCRLF;
	}
	$sOP.='</logs>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** returns a list of the top level categories that the user has cards in */
if ($_GET['usercategories']){
	$lastCheckSeconds = "";
	if (!($lastCheckSeconds = $_GET['seconds'])) {
		$lastCheckSeconds = "0";
	}

	//this gets the categories that the user has cards in, and their parents
	$aCategories=myqu('SELECT DISTINCT ca.category_id, ca.description, "true" hasCards, 
		CASE WHEN cx.category_parent_id IS NULL THEN "top" ELSE cx.category_parent_id END category_parent_id,
		(CASE WHEN (MAX(c.date_updated) > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
			THEN 1 ELSE 0 END) updated 
		FROM mytcg_card c
		INNER JOIN mytcg_usercard uc
		ON uc.card_id = c.card_id
		INNER JOIN mytcg_category ca
		ON ca.category_id = c.category_id
		INNER JOIN mytcg_usercardstatus ucs
		ON ucs.usercardstatus_id = uc.usercardstatus_id
		LEFT OUTER JOIN mytcg_category_x cx
		ON cx.category_child_id = ca.category_id
		WHERE LOWER(ucs.description) = LOWER("album")
		AND uc.user_id = '.$iUserID.' 
		AND cx.category_parent_id = '.$topcar.'
		GROUP BY ca.category_id
		ORDER BY ca.description');
	$topCats = array();
	$updated = array();
	
	$ids = '';
	foreach ($aCategories as $category) {
		if ($category['category_parent_id'] == 'top') {
			$topCats[sizeof($topCats)] = $category;
		}
		else {
			$ids.=(($ids=='')?$category['category_parent_id']:(','.$category['category_parent_id']));
		}
		
		if ($category['updated'] == 1) {
			$updated[$category['category_parent_id']] = 1;
			$updated[$category['category_id']] = 1;
		}
	}
	
	while ($ids != '') {
		$aCategories = myqu("SELECT DISTINCT ca.category_id, ca.description, 
			CASE WHEN count(card_id) > 0 THEN 'true' ELSE 'false' END hasCards,
			CASE WHEN cx.category_parent_id IS NULL THEN 'top' ELSE cx.category_parent_id END category_parent_id
			FROM mytcg_category ca
			LEFT OUTER JOIN mytcg_category_x cx
			ON cx.category_child_id = ca.category_id
			LEFT OUTER JOIN mytcg_card c
			ON c.category_id = ca.category_id
			WHERE ca.category_id IN ({$ids})
			GROUP BY ca.category_id");
		
		$ids = '';
		foreach ($aCategories as $category) {
			if ($category['category_parent_id'] == 'top') {
				$topCats[sizeof($topCats)] = $category;
			}
			else {
				$ids.=(($ids=='')?$category['category_parent_id']:(','.$category['category_parent_id']));
			}
			
			if (array_key_exists($category['category_id'],$updated)) {
				$updated[$category['category_parent_id']] = 1;
				$updated[$category['category_id']] = 1;
			}
		}
	}
	
	$sOP='<usercategories>'.$sCRLF;
	
	//check for user created cards
	//select count(*) from mytcg_card where user_id = id;
	$aMyCards=myqu('SELECT COUNT(*)  as cnt
			FROM mytcg_card
			WHERE user_id = '.$iUserID.' ');
	if ($aMine=$aMyCards[0]) {
		if ($aMine['cnt'] > 0) {
			$sOP.=$sTab.'<album>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumid>-2</albumid>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<hascards>true</hascards>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<updated>0</updated>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumname>My Cards</albumname>'.$sCRLF;
			$sOP.=$sTab.'</album>'.$sCRLF;
		}
	}
	
	//check for new cards
	//select count(*) from mytcg_usercard where usercardstatus_id = 4 and user_id = id;
	$aNewCards=myqu('SELECT COUNT(*) as cnt
			FROM mytcg_usercard
			WHERE user_id = '.$iUserID.' 
			AND usercardstatus_id = 4');
			
	if ($aCard=$aNewCards[0]) {
		if ($aCard['cnt'] > 0) {
			$sOP.=$sTab.'<album>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumid>-3</albumid>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<hascards>true</hascards>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<updated>1</updated>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumname>New Cards</albumname>'.$sCRLF;
			$sOP.=$sTab.'</album>'.$sCRLF;
		}
	}
	$iCount=0;
	while ($aCategory=$topCats[$iCount]){
		$sOP.=$sTab.'<album>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<albumid>'.trim($aCategory['category_id']).'</albumid>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<hascards>'.trim($aCategory['hasCards']).'</hascards>'.$sCRLF;
		
		if (array_key_exists($aCategory['category_id'],$updated)) {
			$sOP.=$sTab.$sTab.'<updated>1</updated>'.$sCRLF;
		}
		else {
			$sOP.=$sTab.$sTab.'<updated>0</updated>'.$sCRLF;
		}
		
		$sOP.=$sTab.$sTab.'<albumname>'.trim($aCategory['description']).'</albumname>'.$sCRLF;
		$sOP.=$sTab.'</album>'.$sCRLF;
		$iCount++;
	}
	$sOP.='</usercategories>'.$sCRLF;
	
	if ($iCount==1) {
		$sOP = subcategories($lastCheckSeconds, $aCategory['category_id'], $iUserID, $aMine, $aCard, $topcar);
	}
	
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** returns a list of the sub categories of a category that the user has cards in, 
		also skips a category if it has no cards and only one child, and checks its child instead. (recurring)*/
if ($_GET['usersubcategories']){
	$lastCheckSeconds = "";
	if (!($lastCheckSeconds = $_GET['seconds'])) {
		$lastCheckSeconds = "0";
	}

	$cat = $_GET['category'];
	//this gets the categories that the user has cards in, and their parents
	echo subcategories($lastCheckSeconds, $cat, $iUserID, '', '', $topcar);
	exit;
}

/** return a list of all categories */
if ($_GET['allcategories']) {
	/*$aCategories=myqu('SELECT C.category_id, C.description '
			.'FROM mytcg_category C, mytcg_category_x X '
			.'WHERE C.CATEGORY_ID = X.CATEGORY_CHILD_ID '
			.'AND X.CATEGORY_PARENT_ID is null '
			.'AND C.is_deleted is null '
			.'ORDER BY C.description'
		);*/
	$aCategories=myqu('SELECT c.category_id, c.description
		FROM mytcg_category c
		WHERE c.category_id NOT IN (SELECT DISTINCT category_child_id 
			FROM mytcg_category_x) ORDER BY c.description');	
	$sOP='<cardcategories>'.$sCRLF;
	$iCount=0;
	while ($aCategory=$aCategories[$iCount]){
		$sOP.=$sTab.'<albumid>'.trim($aCategory['category_id']).'</albumid>'.$sCRLF;
		$sOP.=$sTab.'<albumname>'.trim($aCategory['description']).'</albumname>'.$sCRLF;
		$iCount++;
	}	
	$sOP.='</cardcategories>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** return a list of categories with products in them */
if ($iFreebie=$_GET['productcategories']) {
	$aCategories=myqu('SELECT c.category_id, c.description
		FROM mytcg_category c
		WHERE c.category_id NOT IN (SELECT DISTINCT category_child_id 
			FROM mytcg_category_x) AND c.category_id = '.$cars.' ORDER BY c.description');
	$sOP='<cardcategories>'.$sCRLF;
	$iCount=0;
	while ($aCategory=$aCategories[$iCount]) {
		if (hasProducts($aCategory['category_id'], $iFreebie) == true) {
			$sOP.='<album>';
			$sOP.=$sTab.'<albumid>'.trim($aCategory['category_id']).'</albumid>'.$sCRLF;
			$sOP.=$sTab.'<albumname>'.trim($aCategory['description']).'</albumname>'.$sCRLF;
			$sOP.='</album>';
		}
		$iCount++;
	}
	$sOP.='</cardcategories>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** return a list of categories with auctions in them */
if ($_GET['auctioncategories']) {
		
		
	$aAuctionCards=myqu('SELECT count(*) as cnt 
		FROM mytcg_usercard UC 
		INNER JOIN mytcg_market AC 
		ON UC.usercard_id=AC.usercard_id 
		INNER JOIN mytcg_card C 
		ON UC.card_id=C.card_id 
		INNER JOIN mytcg_user U 
		ON UC.user_id=U.user_id 
		LEFT OUTER JOIN mytcg_marketcard AB 
		ON AC.market_id=AB.market_id 
		LEFT OUTER JOIN mytcg_user UB 
		ON AB.user_id=UB.user_id 
		WHERE AC.marketstatus_id="1" 
		AND datediff(now(), AC.date_expired) <= 0
		AND U.user_id='.$iUserID);
		
		
	$sOP='<cardcategories>'.$sCRLF;
	if ($aMine=$aAuctionCards[0]) {
		if ($aMine['cnt'] > 0) {
			$sOP.="<album>";
			$sOP.=$sTab.'<albumid>-2</albumid>'.$sCRLF;
			$sOP.=$sTab.'<albumname>My Auctions</albumname>'.$sCRLF;
			$sOP.="</album>";
		}
	}
		
	/*$aCategories=myqu('SELECT c.category_id, c.description
		FROM mytcg_category c
		WHERE c.category_id NOT IN (SELECT DISTINCT category_child_id 
			FROM mytcg_category_x) ORDER BY c.description');*/
			$aCategories=myqu('SELECT c.category_id, d.description
								FROM mytcg_card c
								INNER JOIN mytcg_category d
								on c.category_id = d.category_id
								INNER JOIN mytcg_usercard uc
								ON uc.card_id = c.card_id
								INNER JOIN mytcg_category_x x
								ON d.category_id = x.category_child_id
								INNER JOIN mytcg_market ac
								ON uc.usercard_id = ac.usercard_id
								WHERE ac.marketstatus_id = 1 
								AND datediff(now(), ac.date_expired) <= 0
								AND x.category_parent_id = '.$topcar.'
								AND uc.user_id <> '.$iUserID.'
								group by category_id');
	$iCount=0;
	while ($aCategory=$aCategories[$iCount]){
		$sOP.="<album>";
		$sOP.=$sTab.'<albumid>'.trim($aCategory['category_id']).'</albumid>'.$sCRLF;
		$sOP.=$sTab.'<albumname>'.trim($aCategory['description']).'</albumname>'.$sCRLF;
		$sOP.="</album>";
		$iCount++;
	}
	$sOP.='</cardcategories>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** return a list of products in a category */
if ($iFreebie = $_GET['categoryproducts']){
	$iCategoryId= $_REQUEST['categoryId'];

	$aProducts = array();
	$aProducts = getProducts($iCategoryId, $aProducts, $iFreebie);
	
	$sOP='<categoryproducts>'.$sCRLF;
	
	
	$aUserDetails=myqu('SELECT credits 
		FROM mytcg_user 
		WHERE user_id='.$iUserID);
	$sOP.=$sTab.'<credits>'.trim($aUserDetails[0]['credits']).'</credits>'.$sCRLF;
	
	$iCount=0;
	while ($aProduct=$aProducts[$iCount]){
		if ($aProduct['IN_STOCK'] > 0) {
			$sOP.=$sTab.'<product>'.$sCRLF;
			$sOP.=$sTab.'<productid>'.trim($aProduct['PRODUCT_ID']).'</productid>'.$sCRLF;
			$sOP.=$sTab.'<productname>'.trim($aProduct['DESCRIPTION']).'</productname>'.$sCRLF;
			$sOP.=$sTab.'<producttype>'.trim($aProduct['PACK_TYPE']).'</producttype>'.$sCRLF;
			$sOP.=$sTab.'<productprice>'.trim($aProduct['PRICE']).'</productprice>'.$sCRLF;
			$sOP.=$sTab.'<productnumcards>'.trim($aProduct['NO_OF_CARDS']).'</productnumcards>'.$sCRLF;
			$sOP.=$sTab.'<productthumb>'.trim($aProduct['IMAGEURL']).'</productthumb>'.$sCRLF;
			$sOP.=$sTab.'</product>'.$sCRLF;
		}
		$iCount++;
	}	
	$sOP.='</categoryproducts>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** give user details */
if ($_GET['userdetails']){
	global $iUserID;
	echo userdetails($iUserID);
	exit;
}

/** give user profile details */
if ($_GET['profiledetails']){
	$aProfileDetails=myqu('SELECT d.description, d.detail_id, d.credit_value, a.answer_id, a.answered, a.answer 
		FROM mytcg_user_answer a, mytcg_user_detail d 
		WHERE a.detail_id = d.detail_id 
		AND a.user_id="'.$iUserID.'"');
	$sOP='<profiledetails>'.$sCRLF;
	$iCount=0;
	while ($aProfileDetail=$aProfileDetails[$iCount]){
		$sOP.='<detail>'.$sCRLF;
		$sOP.=$sTab.'<answer_id>'.trim($aProfileDetail['answer_id']).'</answer_id>'.$sCRLF;
		$sOP.=$sTab.'<detail_id>'.trim($aProfileDetail['detail_id']).'</detail_id>'.$sCRLF;	
		$sOP.=$sTab.'<desc>'.trim($aProfileDetail['description']).'</desc>'.$sCRLF;	
		$sOP.=$sTab.'<answer>'.trim($aProfileDetail['answer']).'</answer>'.$sCRLF;
		$sOP.=$sTab.'<answered>'.trim($aProfileDetail['answered']).'</answered>'.$sCRLF;
		$sOP.=$sTab.'<creditvalue>'.trim($aProfileDetail['credit_value']).'</creditvalue>'.$sCRLF;
		$sOP.='</detail>'.$sCRLF;
		$iCount++;
	}
	
	$sOP.='</profiledetails>';
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}


if ($_GET['saveprofiledetail']) {
	$iAnswerID=$_GET['answer_id'];
	$iAnswer=$_GET['answer'];
	saveProfileDetail($iAnswerID, $iAnswer, $iUserID);
	exit;
}


/** give user transaction log details */
if ($_GET['creditlog']){
	$aTransactionDetails=myqu('SELECT transaction_id, description, date, val 
								FROM mytcg_transactionlog  
								WHERE user_id='.$iUserID.'
								ORDER BY date DESC
								LIMIT 0, 10');
		
	$aCredits=myqu('SELECT credits 
		FROM mytcg_user  
		WHERE user_id='.$iUserID);
		
	$iCredits = $aCredits[0];
	$sOP='<transactions>'.$sCRLF;
	$sOP.='<credits>'.trim($iCredits['credits']).'</credits>'.$sCRLF;
	$iCount=0;
	while ($aTransactionDetail=$aTransactionDetails[$iCount]){
		$sOP.='<transaction>'.$sCRLF;
		$sOP.=$sTab.'<id>'.trim($aTransactionDetail['transaction_id']).'</id>'.$sCRLF;
		$sOP.=$sTab.'<desc>'.trim($aTransactionDetail['description']).'</desc>'.$sCRLF;		
		$sOP.=$sTab.'<date>'.trim($aTransactionDetail['date']).'</date>'.$sCRLF;
		$sOP.=$sTab.'<value>'.trim($aTransactionDetail['val']).'</value>'.$sCRLF;
		$sOP.='</transaction>'.$sCRLF;
		$iCount++;
	}
	
	$sOP.='</transactions>';
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** give user deck list */
if ($_GET['getdecks']){
	$iCategoryID=$_GET['category_id'];
	$aDeckDetails=myqu('SELECT deck_id, description 
		FROM mytcg_deck 
		WHERE user_id="'.$iUserID.'" 
		AND category_id='.$iCategoryID);
	$sOP='<decks>'.$sCRLF;
	$iCount=0;
	while ($aDeckDetail=$aDeckDetails[$iCount]){
		$sOP.='<deck>'.$sCRLF;
		$sOP.=$sTab.'<deck_id>'.trim($aDeckDetail['deck_id']).'</deck_id>'.$sCRLF;
		$sOP.=$sTab.'<desc>'.trim($aDeckDetail['description']).'</desc>'.$sCRLF;	
		$sOP.='</deck>'.$sCRLF;
		$iCount++;
	}
	
	$sOP.='</decks>';
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}


if ($_GET['addtodeck']){
	$iDeckID=$_GET['deck_id'];
	$iUserCardID=$_GET['usercard_id'];
	
	myqui('UPDATE mytcg_usercard 
			SET deck_id = "'.$iDeckID.'",  
			WHERE usercard_id = "'.$iUserCardID.'"');
	
	$sOP = "<result>Card added to Deck!</result>";
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}


if ($_GET['removefromdeck']){
	$iUserCardID=$_GET['usercard_id'];
	
	myqui('UPDATE mytcg_usercard 
			SET deck_id = NULL,  
			WHERE usercard_id = "'.$iUserCardID.'"');
	
	$sOP = "<result>Card removed from Deck!</result>";
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}


/** give user deck list */
if ($_GET['getcardsindeck']){
	$iDeckID=$_GET['deck_id'];
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	$lastCheckSeconds = "";
	if (!($lastCheckSeconds = $_GET['seconds'])) {
		$lastCheckSeconds = "0";
	}
	
	$sOP = cardsincategory(0,$iHeight,$iWidth,1,$lastCheckSeconds,$iUserID,$iDeckID,$root);
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}


if ($_GET['createdeck']){
	$iDescription=$_GET['description'];
	$iCategoryID=$_GET['category_id'];
	myqui('INSERT INTO mytcg_deck (user_id, category_id, description) 
			VALUES('.$iUserID.','.$iCategoryID.',"'.$iDescription.'"');
	$sOP = "<result>Deck Created!</result>";
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}


if ($_GET['deletedeck']){
	$iDeckID=$_GET['deck_id'];
	myqui('UPDATE mytcg_usercard 
			SET deck_id = NULL,  
			WHERE deck_id = "'.$iDeckID.'"');
			
	
	myqui('DELETE FROM mytcg_deck 
			WHERE deck_id = '.$iDeckID);
	$sOP = "<result>Deck deleted!</result>";
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}


/** Searches on a string and returns a list of cards belonging to the user */
if ($searchstring=$_GET['search']) {
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	$lastCheckSeconds = "";
	if (!($lastCheckSeconds = $_GET['seconds'])) {
		$lastCheckSeconds = "0";
	}
	
	$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
		.'FROM mytcg_imageserver b '
		.'ORDER BY b.description DESC '
	);

	$sql = 'SELECT DISTINCT UC.card_id, Q.quantity, C.image, UC.usercard_id, '
		.'C.description, C.thumbnail_phone_imageserver_id, C.front_phone_imageserver_id, C.back_phone_imageserver_id, '
		.'(CASE WHEN (C.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) '
		.'	THEN 1 ELSE 0 END) updated, D.note, D.date_updated '
		.'FROM mytcg_usercard UC '
		.'INNER JOIN mytcg_card C ON (UC.card_id = C.card_id) '
		.'INNER JOIN mytcg_imageserver I ON (C.front_imageserver_id = imageserver_id) '
		.'LEFT JOIN mytcg_cardstat CS ON (C.card_id = CS.card_id) '
		.'LEFT OUTER JOIN '
		.'(SELECT note, date_updated, user_id, card_id '
		.'	FROM mytcg_usercardnote '
		.'	WHERE user_id = '.$iUserID.' '
		.'	AND usercardnotestatus_id = 1 '
		.') D '
		.'ON UC.card_id = D.card_id '
		.'LEFT OUTER JOIN '
		.'(SELECT count(*) quantity, card_id '
		.'FROM mytcg_usercard '
		.'WHERE user_id = '.$iUserID.' '
		.'AND usercardstatus_id=1 '
		.'GROUP BY card_id) Q '
		.'ON Q.card_id = UC.card_id '
		.'ON Q.card_id = UC.card_id '
		.'WHERE ( '
		.'	C.description LIKE \'%'.$searchstring.'%\' OR '
		.'	CS.description LIKE \'%'.$searchstring.'%\' '
		.') AND '
		.'UC.user_id = '.$iUserID.' '
		.'AND UC.usercardstatus_id=1 '
		.'GROUP BY C.card_id';
				
	$aCards = myqu($sql);
	
	$sOP='<cardsincategory>'.$sCRLF;
	$iCount=0;
	
	while ($aOneCard=$aCards[$iCount]){
		$sOP.=$sTab.'<card>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<cardid>'.$aOneCard['card_id'].'</cardid>'.$sCRLF;		
		$sOP.=$sTab.$sTab.'<description>'.$aOneCard['description'].'</description>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<quantity>'.$aOneCard['quantity'].'</quantity>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<updated>'.$aOneCard['updated'].'</updated>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<note>'.$aOneCard['note'].'</note>'.$sCRLF;
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['thumbnail_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		$sOP.=$sTab.$sTab.'<thumburl>'.$sFound.'cards/'.$aOneCard['image'].'_thumb.png</thumburl>'.$sCRLF;
		
		//before setting the front and back urls, make sure the card is resized for the height
		$iHeight = resizeCard($iHeight, $iWidth, $aOneCard['image'], $root);
		
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['front_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.$sTab.'<fronturl>'.$sFound.$iHeight.'/cards/'.$aOneCard['image'].'_front.png</fronturl>'.$sCRLF;

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.$sTab.'<backurl>'.$sFound.$iHeight.'/cards/'.$aOneCard['image'].'_back.png</backurl>'.$sCRLF; 

		$aStats=myqu('SELECT A.description as des, B.description as val, statvalue, 
		A.left, top, width, height, frontorback, 
		colour_r, colour_g, colour_b 
		FROM mytcg_cardstat A, mytcg_categorystat B 
		WHERE A.categorystat_id = B.categorystat_id 
		AND A.card_id = '.$aOneCard['card_id']);
		
		$iCountStat=0;
		$sOP.=$sTab.$sTab.'<stats>'.$sCRLF;
		While ($aOneStat=$aStats[$iCountStat]) {
			$sOP.=$sTab.$sTab.$sTab.'<stat desc="'.$aOneStat['val'].'" ival="'.$aOneStat['statvalue'].'"
				left="'.$aOneStat['left'].'" top="'.$aOneStat['top'].'" width="'.$aOneStat['width'].'" height="'.$aOneStat['height'].'" 
				frontorback="'.$aOneStat['frontorback'].'" red="'.$aOneStat['colour_r'].'" green="'.$aOneStat['colour_g'].'" blue="'.$aOneStat['colour_b'].'">'.$aOneStat['des'].'</stat>'.$sCRLF;
			$iCountStat++;
		}
		$sOP.=$sTab.$sTab.'</stats>'.$sCRLF;
		
		$iCount++;
		$sOP.=$sTab.'</card>'.$sCRLF;
	}
	$sOP.='</cardsincategory>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

?>
