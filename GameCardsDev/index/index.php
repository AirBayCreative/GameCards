<?php
include('settings.php');

/*
this page handles requests from the handset

GETS
----
only authenticated users may use these 
1. userdetails=1					- send userdetails
2. cards=-1								- send all card details for this user
3. cards=CSV list					-	all cards except in CSV list
4. decks=1								- deck ids and names for this `
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

if ($_GET['addCreditsSMS']) {
	$user_id = $_REQUEST['user_id'];
	addCreditsSMS($user_id);
	exit;
}
if ($iUserID = $_GET['test']) {
			
}

function addCreditsSMS($iUserID,$amount=350){
  if(intval($iUserID) > 0){
    $sql = "UPDATE mytcg_user SET premium = IFNULL(premium,0) + ".$amount." WHERE user_id = ".$iUserID;
    myqu($sql);
    $sql = "INSERT INTO mytcg_transactionlog (user_id, description, date,
val, transactionlogtype_id) VALUES (".$iUserID.", 'Purchased ".$amount." credits via SMS', NOW(),".$amount.", 2)";
    myqu($sql);
    $sql = "INSERT INTO mytcg_notifications (user_id, notification,
notedate) VALUES (".$iUserID.",'Received ".$amount." credits via SMS purchase',now())";
    myqu($sql);
  }
}

function validip($ip){
  if (!empty($ip) && ip2long($ip)!=-1){
    $reserved_ips = array(
      array('0.0.0.0','2.255.255.255'), 
      array('10.0.0.0','10.255.255.255'),
      array('127.0.0.0','127.255.255.255'),
      array('169.254.0.0','169.254.255.255'),
      array('172.16.0.0','172.31.255.255'),
      array('192.0.2.0','192.0.2.255'),
      array('192.168.0.0','192.168.255.255'),
      array('255.255.255.0','255.255.255.255')
    );
   
    foreach ($reserved_ips as $r) {
      $min = ip2long($r[0]);
      $max = ip2long($r[1]);
      if ((ip2long($ip) >= $min) && (ip2long($ip) <= $max)) return false;
    }
    return true;
  } else {
    return false;
  }
}
 
function getip(){
  if (validip($_SERVER["HTTP_CLIENT_IP"])) {
    return $_SERVER["HTTP_CLIENT_IP"];
  }

  foreach (explode(",",$_SERVER["HTTP_X_FORWARDED_FOR"]) as $ip) {
    if (validip(trim($ip))) {
      return $ip;
    }
  }
 
  if (validip($_SERVER["HTTP_X_FORWARDED"])) {
    return $_SERVER["HTTP_X_FORWARDED"];
  } elseif (validip($_SERVER["HTTP_FORWARDED_FOR"])) {
    return $_SERVER["HTTP_FORWARDED_FOR"];
  } elseif (validip($_SERVER["HTTP_FORWARDED"])) {
    return $_SERVER["HTTP_FORWARDED"];
  } elseif (validip($_SERVER["HTTP_X_FORWARDED"])) {
    return $_SERVER["HTTP_X_FORWARDED"];
  } else {
    return $_SERVER["REMOTE_ADDR"];
  }
}

//before checking if the user is logged in,check if they are registering a new user
if ($_GET['registeruser']) {
	$username = $_REQUEST['username'];
	$password = $_REQUEST['password'];
	$email = $_REQUEST['email'];
	$referer = $_REQUEST['referer'];
	
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	
	$ip = getip();
	$sOP = registerUser($username, $password, $email, $referer, $iHeight, $iWidth, $root,$ip,$url);
	
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
/*$iUserID = 89;*/
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
	$aUpdate=myqu('SELECT datediff(now(), IFNULL(mobile_date_last_visit,SUBTIME(now(),"1 0:0:0.0"))) dif, datediff(now(), IFNULL(date_last_visit,SUBTIME(now(),"1 0:0:0.0"))) webdif 
					FROM mytcg_user where user_id = '.$iUserID);
	
	$iUpdate=$aUpdate[0];
	if (($iUpdate['dif'] >= 1) && ($iUpdate['webdif'] >= 1)) {
		myqui('INSERT mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
				SELECT '.$iUserID.', descript, now(), val, 1
				FROM mytcg_transactiondescription
				WHERE transactionid = 1');
				
		myqui('UPDATE mytcg_user SET gameswon=0, credits=(credits+25) WHERE user_id = '.$iUserID);
			
		myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, sysnote)
			VALUES ('.$iUserID.', "Recieved 25 credits for logging in. Want more? Go to the Credits Screen to find out...", now(), 1)');
	}
		
	myqui('UPDATE mytcg_user SET mobile_date_last_visit=now() WHERE user_id = '.$iUserID);
}

if ($iTestVersion=$_GET['update']){
  
	if (!($iMSISDN=$_GET['msisdn'])) {
		$iMSISDN = 'unknown';
	}
	if (!($iIMSI=$_GET['imsi'])) {
		$iIMSI = 'unknown';
	}
	if (!($iIMEI=$_GET['imei'])) {
		$iIMEI = 'unknown';
	}
	if (!($iOs=$_GET['os'])) {
		$iOs = 'unknown';
	}
	if (!($iMake=$_GET['make'])) {
		$iMake = 'unknown';
	}
	if (!($iModel=$_GET['model'])) {
		$iModel = 'unknown';
	}
	if (!($iOsVer=$_GET['osver'])) {
		$iOsVer = 'unknown';
	}
	if (!($iTouch=$_GET['touch'])) {
		$iTouch = '0';
	}
	if (!($iScreenWidth=$_GET['width'])) {
		$iScreenWidth = '0';
	}
	if (!($iScreenHeight=$_GET['height'])) {
		$iScreenHeight = '0';
	}
	
	$qu = 'SELECT * FROM mytcg_userphone WHERE msisdn="'.$iMSISDN.'" AND imsi="'.$iIMSI.'" AND imei="'.$iIMEI.'" AND os="'.$iOs.'" AND make="'.$iMake.'" AND model="'.$iModel.'" AND osver="'.$iOsVer.'" AND touch='.$iTouch.' AND width='.$iScreenWidth.' AND height='.$iScreenHeight.' AND version="'.$iTestVersion.'" AND user_id ='.$iUserID;
	
	//echo $qu;
	
	$aChanged=myqu($qu);
	$iUpdated = sizeof($aChanged);
	if ($iUpdated==0){
		$aUpdate=myqui('INSERT INTO mytcg_userphone (user_id, msisdn, imsi, imei, os, make, model, osver, touch, width, height, version) VALUES ('.$iUserID.',"'.$iMSISDN.'", "'.$iIMSI.'", "'.$iIMEI.'","'.$iOs.'","'.$iMake.'","'.$iModel.'","'.$iOsVer.'",'.$iTouch.','.$iScreenWidth.','.$iScreenHeight.',"'.$iTestVersion.'")');
	}
	
	$aUpdate=myqu('SELECT datediff(now(), IFNULL(version_check_date,SUBTIME(now(),"1 0:0:0.0"))) dif 
					FROM mytcg_user where user_id = '.$iUserID);
	
	$iUpdate=$aUpdate[0];
	if ($iUpdate['dif'] >= 1) {
	
		myqui('UPDATE mytcg_user SET version_check_date=now(), apps_id = (select apps_id from mytcg_apps where apps_key = "'.$appkey.'") WHERE user_id = '.$iUserID);
		
		$aVersion=myqu(
			'SELECT v.url FROM mytcg_version v, mytcg_apps a '
			.'WHERE v.os="'.$iOs.'" '
			.'AND v.apps_id = a.apps_id '
			.'AND a.apps_key = "'.$appkey.'" '
			.'AND v.version <> "'.$iTestVersion.'" '
		);
		
		$iUpdate = sizeof($aVersion);
		$iVersion=$aVersion[0];
		if ($iUpdate > 0){
			echo ''.$iVersion['url'].'';
		}
	}
	exit;
}

if ($iUserCardID = $_GET['createauction']) {
	$iCardId=$_GET['cardid'];
	$iAuctionBid=$_GET['bid'];
	$iBuyNowPrice=$_GET['buynow'];
	$iDays=$_GET['days'];
	
	if (!($iAuctionType=$_GET['auctiontype'])) {
	
		$aCardType=myqu(
			'select pc.card_id, sum(p.price) as freemium, sum(p.premium) as premium 
			from mytcg_product p 
			inner join mytcg_productcard pc 
			on pc.product_id = p.product_id 
			where pc.card_id = "'.$iCardId.'" 
			group by pc.card_id'
		);
		
		if (sizeof($aCardType) > 0) {
			if ($aCardType[0]['freemium'] > 0 || $aCardType[0]['premium'] == 0) {
				$iAuctionType = '1';
			}
			else if ($aCardType[0]['premium'] > 0) {
				$iAuctionType = '2';
			}
		}
	
		//$iAuctionType = '1';
	}
	
	createAuction($iCardId, $iAuctionBid, $iBuyNowPrice, $iDays, $iUserID, $iAuctionType);
	exit;
}

if ($_GET['leaders']) {
	leaders();
	exit;
}

if ($id=$_GET['leaderboard']) {
	$userid = '';
	if ($_GET['friends']) {
		$userid = $iUserID;
	}
	leaderboard($id, $userid);
	exit;
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
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($iFreebie=$_GET['freebie'])) {
		$iFreebie = -1;
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
	}
	if (!($purchase=$_GET['purchase'])) {
		$purchase = '1';
	}
	$product = $_GET['buyproduct'];
	buyProduct($timestamp, $iHeight, $iWidth, $iFreebie, $iUserID, $product, $root, $iBBHeight, $jpg, $purchase);
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

//Friend Invite
if ($_GET['friendinvite']){
	//Friend detail type
  $tradeMethod = $_REQUEST['trademethod'];
  //Friend detail
  $receiveNumber = $_REQUEST['detail'];
  
  invite($tradeMethod, $receiveNumber, $iUserID, $invite);
  exit;
}

if ($_GET['friends']) {
	friends($iUserID);
	exit;
}

if ($_GET['notifications']) {
	notifications($iUserID);
	exit;
}
//DO TRADE
if ($cardID = $_GET['tradecard']){
	//Friend detail type
  $tradeMethod = $_REQUEST['trademethod'];
  //Friend detail
  $receiveNumber = $_REQUEST['detail'];
  //note to send user
  $sentNote = $_REQUEST['note'];
  
  tradeCard($tradeMethod, $receiveNumber, $iUserID, $cardID, $invite);
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
	

	//myqui('UPDATE mytcg_usercard set loaded = 1 where card_id = '.$iCard.' and user_id = '.$iUserID);
	
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
	//myqui('UPDATE mytcg_usercard set loaded = 1 where card_id = '.$iCard.' and user_id = '.$iUserID);
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
	myqui('UPDATE mytcg_usercard set loaded = 1 where card_id = '.$iCard.' and user_id = '.$iUserID);
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
		myqui('UPDATE mytcg_usercard set loaded = 1 where card_id = (SELECT card_id FROM mytcg_card WHERE redeem_code = '.$code.') and user_id = '.$iUserID);
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

if ($boosterid=$_GET['cardsinbooster']) {
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	if (!($iShowAll=$_GET['showall'])) {
		$iShowAll = '1';
	}
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
	}
	
	$sOP = getCardsInBooster($boosterid, $iHeight,$iWidth,$root,$iUserID, $iBBHeight, $jpg);
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

if ($iCategory=$_GET['cardsincategory']){

	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	if (!($iFriendID=$_GET['friendid'])) {
		$iFriendID = '0';
	}
	if (!($iShowAll=$_GET['showall'])) {
		$iShowAll = '1';
	}
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
	}
	$lastCheckSeconds = "";
	if (!($lastCheckSeconds = $_GET['seconds'])) {
		$lastCheckSeconds = "0";
	}
	
	$sOP = cardsincategory($iCategory,$iHeight,$iWidth,$iShowAll,$lastCheckSeconds,$iUserID, -1,$root, $iBBHeight, $jpg, $iFriendID);
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
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
	}
	
	$categoryId = $_GET['category_id'];
	
	$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
		.'FROM mytcg_imageserver b '
		.'ORDER BY b.description DESC '
	);
	
	$auctionCards = array();
	
	$auctionCards = getAuctionCards($categoryId, $auctionCards, $iUserID);
	
	$sOP='<auctionsincategory>'.$sCRLF;
	
	$aUserDetails=myqu('SELECT IFNULL(credits, 0) credits, IFNULL(premium, 0) premium 
		FROM mytcg_user 
		WHERE user_id='.$iUserID);
	$sOP.=$sTab.'<credits>'.trim($aUserDetails[0]['credits']).'</credits><premium>'.trim($aUserDetails[0]['premium']).'</premium>'.$sCRLF;
	
	$iCount=0;
	$ext = '.png';
	if ($jpg) {
		$ext = '.jpg';
	}
	while ($aOneCard=$auctionCards[$iCount]){
		$sOP.='<auction>';
		$sOP.=$sTab.'<auctioncardid>'.$aOneCard['market_id'].'</auctioncardid>'.$sCRLF;
		$sOP.=$sTab.'<usercardid>'.$aOneCard['usercard_id'].'</usercardid>'.$sCRLF;
		$sOP.=$sTab.'<cardid>'.$aOneCard['card_id'].'</cardid>'.$sCRLF;
		$sOP.=$sTab.'<description>'.$aOneCard['description'].' ('.$aOneCard['cnt'].')</description>'.$sCRLF;
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
		$sOP.=$sTab.'<thumburl>'.$sFound.'cards/'.$aOneCard['image'].'_thumb'.$ext.'</thumburl>'.$sCRLF;
		
		//before setting the front and back urls, make sure the card is resized for the height
		$iHeight = resizeCard($iHeight, $iWidth, $aOneCard['image'], $root, $iBBHeight, $jpg);
		
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['front_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$dir = '/cards/';
		if ($iBBHeight) {
			$dir = '/cardsbb/';
		}
		$sOP.=$sTab.'<fronturl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_front'.$ext.'</fronturl>'.$sCRLF;
		$sOP.=$sTab.'<frontflipurl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_front_flip'.$ext.'</frontflipurl>'.$sCRLF;
		

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.'<backurl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_back'.$ext.'</backurl>'.$sCRLF; 
		$sOP.=$sTab.'<backflipurl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_back_flip'.$ext.'</backflipurl>'.$sCRLF; 
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
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
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
	
	$ext = '.png';
	if ($jpg) {
		$ext = '.jpg';
	}
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
		$sOP.=$sTab.'<thumburl>'.$sFound.'cards/'.$aOneCard['image'].'_thumb'.$ext.'</thumburl>'.$sCRLF;
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
			$sOP.='<category>'.$sCRLF;
			$sOP.=$sTab.'<categoryid>'.trim($category['category_id']).'</categoryid>'.$sCRLF;
			$sOP.=$sTab.'<categoryname>'.trim($catName[0]['description']).'</categoryname>'.$sCRLF;
			$sOP.=$sTab.'<playablecards>'.trim($category['card_count']).'</playablecards>'.$sCRLF;
			$sOP.='</category>'.$sCRLF;
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
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
	}
	
	$sOP = loadGame($gameId, $iUserID, $iHeight, $iWidth, $root, $iBBHeight, $jpg);
	
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
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
	}
	
	//continue the game, if needed selecting a stat for the ai
	continueGame($gameId, $iUserID, $iHeight, $iWidth);
	
	//we need to check if a move has been made since the last move the user saw.
	$lastMoveQuery = myqu('SELECT date, gamelog_id, categorystat_id 
		FROM mytcg_gamelog 
		WHERE game_id = '.$gameId.' 
		AND categorystat_id != 0 
		ORDER BY gamelog_id DESC 
		LIMIT 1');
	$newLastMove = $lastMoveQuery[0]['date'];
	if ($lastMove != $newLastMove) {
		$sOP = '<game><lastmove>'.$lastMoveQuery[0]['date'].'</lastmove><categorystat_id>'.$lastMoveQuery[0]['categorystat_id'].'</categorystat_id><phase>oppmove</phase></game>';
	}
	
	if ($sOP == '') {
		//load the game for the user
		$sOP = loadGame($gameId, $iUserID, $iHeight, $iWidth, $root, $iBBHeight, $jpg);
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
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
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
	
	//load the game for the user
	$sOP = loadGame($gameId, $iUserID, $iHeight, $iWidth, $root, $iBBHeight, $jpg);
	
	//send xml with results back to the user
	header('xml_length: '.strlen($sOP));
	echo $sOP;
}

/** declines a specific game, and goes through the steps required to make a new one */
if ($_GET['declinegame']) {
	//thing is, if the user declined a game, he didnt specify an opponent, or ai. so after declining, we dont need to go through the whole create process, we can skip some
	$gameId = $_GET['gameid'];
	$categoryId = $_GET['categoryid'];
	if (!($deckId=$_GET['deckid'])) {
		$deckId = getDeck($iUserID, $categoryId);
	}
	
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
	myqu('UPDATE mytcg_game SET gamephase_id = '.$declinedId.', gamestatus_id = '.$closedId.' WHERE game_id = '.$gameId);
	
	//get phones screen sizes
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '0';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '0';
	}
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
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
			myqu('INSERT INTO mytcg_game (game_id, gamestatus_id, gamephase_id, category_id, date_start, friend, date_created) 
				SELECT '.$gameId.', '.$openId.', 
				(SELECT gamephase_id FROM mytcg_gamephase WHERE lower(description) = "lfm"), '.$categoryId.', now(), "", now() 
				FROM DUAL');
			$newGame = true;
		}
	}
	
	//add the player to the game
	myqu('INSERT INTO mytcg_gameplayer (game_id, user_id, is_active, gameplayerstatus_id, deck_id)
		VALUES ('.$gameId.', '.$iUserID.', 0, 1, '.$deckId.')');
	
	//setDeck($iUserID, $categoryId, $gameId);
	
	if (!$newGame) {
		initialiseGame($iUserID, $gameId);
	}
	
	//return xml with the gameId to the phone
	$sOP='<game>'.$sCRLF;
	$sOP.=$sTab.'<gameid>'.$gameId.'</gameid>'.$sCRLF;
	//if a new game was created, for pvp, we need to return the url of the gc card, for display purposes
	if ($newGame) {
		$height = resizeGCCard($iHeight, $iWidth, $root, $iBBHeight, $jpg);
		$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
		$dir = '/cards/';
		$ext = '.png';
		if ($iBBHeight) {
			$dir = '/cardsbb/';
		}
		if ($jpg) {
			$ext = '.jpg';
		}
		$sOP.=$sTab.'<gcurl>'.$imageUrlQuery[0]['description'].$height.$dir.'gc'.$ext.'</gcurl>'.$sCRLF;
		$sOP.=$sTab.'<gcurlflip>'.$imageUrlQuery[0]['description'].$height.$dir.'gcFlip'.$ext.'</gcurlflip>'.$sCRLF;
	}
	$sOP.='</game>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	
	exit;
}

/** confirms that the user is up for the game, and initialises it */
if ($_GET['confirmgame']) {
	$gameId = $_GET['gameid'];
	
	if (!($deckId=$_GET['deckid'])) {
		//if no deckId is sent through, we need to get one for the user, but we need to get the game categoryId first
		$gameCategoryQuery = myqu('SELECT category_id 
			FROM mytcg_game g 
			WHERE game_id = '.$gameId);
		$categoryId = $gameCategoryQuery[0]['category_id'];
		$deckId = getDeck($iUserID, $categoryId);
	}
	
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '0';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '0';
	}
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
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
	myqu('INSERT INTO mytcg_gameplayer (game_id, user_id, is_active, gameplayerstatus_id, deck_id)
		VALUES ('.$gameId.', '.$iUserID.', 0, 1, '.$deckId.')');
	
	$categoryQuery = myqu('SELECT category_id 
		FROM mytcg_game 
		WHERE game_id = '.$gameId);
	$categoryId = $categoryQuery[0]['category_id'];
	
	//setDeck($iUserID, $categoryId, $gameId);
	
	initialiseGame($iUserID, $gameId);
	
	//return xml with the gameId to the phone
	$sOP='<game>'.$sCRLF;
	$sOP.=$sTab.'<gameid>'.$gameId.'</gameid>'.$sCRLF;
	$sOP.=$sTab.'<phase>stat</phase>'.$sCRLF;
	//if a new game was created, for pvp, we need to return the url of the gc card, for display purposes
	if ($newGame) {
		$height = resizeGCCard($iHeight, $iWidth, $root, $iBBHeight, $jpg);
		$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
		$ext = '.png';
		$dir = '/cards/';
		if ($iBBHeight) {
			$dir = '/cardsbb/';
		}
		if ($jpg) {
			$ext = '.jpg';
		}
		$sOP.=$sTab.'<gcurl>'.$imageUrlQuery[0]['description'].$height.$dir.'gc'.$ext.'</gcurl>'.$sCRLF;
		$sOP.=$sTab.'<gcurlflip>'.$imageUrlQuery[0]['description'].$height.$dir.'gcFlip'.$ext.'</gcurlflip>'.$sCRLF;
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
	if (!($deckId=$_GET['deckid'])) {
		$deckId = getDeck($iUserID, $categoryId);
	}
	
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
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
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
			WHERE TIME_TO_SEC(TIMEDIFF(now(), date_start)) > 120 
			AND (g.gamestatus_id = '.$openId.' 
			OR g.gamestatus_id = '.$closedId.')');
		
		foreach ($oldOpenGame as $game) {
			myqu('DELETE FROM mytcg_gameplayer WHERE game_id = '.$game['game_id']);
			myqu('DELETE FROM mytcg_game WHERE game_id = '.$game['game_id']);
		}
		
		//if the user specified a friend
		if ($friend != '') {
		
			$aFriend=myqu("SELECT user_id, username FROM mytcg_user WHERE username = '{$friend}'");
			$friendid = 0;
			if (sizeof($aFriend) > 0) {
				$friendid = $aFriend[0]['user_id'];
					
				myqui('INSERT INTO mytcg_frienddetail (user_id, friend_id)
				VALUES ('.$friendid.', '.$iUserID.')');
			
				myqui('INSERT INTO mytcg_frienddetail (user_id, friend_id)
					VALUES ('.$iUserID.', '.$friendid.')');
			}
			
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
				myqu('INSERT INTO mytcg_game (game_id, gamestatus_id, gamephase_id, category_id, date_start, friend, date_created) 
					SELECT '.$gameId.', '.$openId.', 
					(SELECT gamephase_id FROM mytcg_gamephase WHERE lower(description) = "lfm"), '.$categoryId.', now(), "'.$friend.'", now() 
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
					myqu('INSERT INTO mytcg_game (game_id, gamestatus_id, gamephase_id, category_id, date_start, friend, date_created) 
						SELECT '.$gameId.', '.$openId.', 
						(SELECT gamephase_id FROM mytcg_gamephase WHERE lower(description) = "lfm"), '.$categoryId.', now(), "'.$friend.'", now() 
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
		myqu('INSERT INTO mytcg_game (game_id, gamestatus_id, gamephase_id, category_id, date_start, date_created) 
			SELECT '.$gameId.', (SELECT gamestatus_id FROM mytcg_gamestatus WHERE lower(description) = "incomplete"),
			(SELECT gamephase_id FROM mytcg_gamephase WHERE lower(description) = "stat"), '.$categoryId.', now(), now()
			FROM DUAL');
		
		//get the ai users
		$aiUserIdQuery = myqu('SELECT u.user_id 
			FROM mytcg_user u
			WHERE u.user_id = 1');
		$aiUserId = $aiUserIdQuery[0]['user_id'];
		
		//add the ai to the game
		myqu('INSERT INTO mytcg_gameplayer (game_id, user_id, is_active, gameplayerstatus_id, deck_id)
			VALUES ('.$gameId.', '.$aiUserId.', 0, 2, -1)');
	}
	
	//add the player to the game, the host goes first
	myqu('INSERT INTO mytcg_gameplayer (game_id, user_id, is_active, gameplayerstatus_id, deck_id)
		VALUES ('.$gameId.', '.$iUserID.', '.($newGame?'1':(($newGameType == $ng_ai)?'1':'0')).', '.($newGame?(($newGameType == $ng_ai)?'1':'2'):'1').', '.$deckId.')');
	
	//setDeck($iUserID, $categoryId, $gameId);
	
	if (!$newGame) {
		initialiseGame($iUserID, $gameId, ($newGameType == $ng_ai)?45:-1);
	}
	
	//return xml with the gameId to the phone
	$sOP='<game>'.$sCRLF;
	$sOP.=$sTab.'<gameid>'.$gameId.'</gameid>'.$sCRLF;
	//if a new game was created, for pvp, we need to return the url of the gc card, for display purposes
	if ($newGame) {
		$height = resizeGCCard($iHeight, $iWidth, $root, $iBBHeight, $jpg);
		$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
		$dir = '/cards/';
		$ext = '.png';
		if ($iBBHeight) {
			$dir = '/cardsbb/';
		}
		if ($jpg) {
			$ext = '.jpg';
		}
		$sOP.=$sTab.'<gcurl>'.$imageUrlQuery[0]['description'].$height.$dir.'gc'.$ext.'</gcurl>'.$sCRLF;
		$sOP.=$sTab.'<gcurlflip>'.$imageUrlQuery[0]['description'].$height.$dir.'gcFlip'.$ext.'</gcurlflip>'.$sCRLF;
	}
	$sOP.='</game>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	
	exit;
}

/** hosts a new game*/
if ($_GET['hostgame']) {
	//we will use the admin as the ai user, if the user wants to play against ai
	$categoryId = $_GET['categoryid'];
	$newGameType = $_GET['newgametype'];
	if (!($deckId=$_GET['deckid'])) {
		$deckId = getDeck($iUserID, $categoryId);
	}
	
	//get phones screen sizes
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '0';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '0';
	}
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
	}
	
	$gameId = "";
	$newGame = false;
	
	if ($newGameType == $ng_pvp) {
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
			WHERE TIME_TO_SEC(TIMEDIFF(now(), date_start)) > 120 
			AND (g.gamestatus_id = '.$openId.' 
			OR g.gamestatus_id = '.$closedId.')');
		
		foreach ($oldOpenGame as $game) {
			myqu('DELETE FROM mytcg_gameplayer WHERE game_id = '.$game['game_id']);
			myqu('DELETE FROM mytcg_game WHERE game_id = '.$game['game_id']);
		}

		//we create a new game, waiting for someone to join
		$gameIdQuery = myqu('SELECT (CASE WHEN MAX(game_id) IS NULL THEN 0 ELSE MAX(game_id) END) + 1 AS game_id 
			FROM mytcg_game');
		$gameId = $gameIdQuery[0]['game_id'];
		myqu('INSERT INTO mytcg_game (game_id, gamestatus_id, gamephase_id, category_id, lobby, date_start, friend, date_created) 
			SELECT '.$gameId.', '.$openId.', 
			(SELECT gamephase_id FROM mytcg_gamephase WHERE lower(description) = "lfm"), '.$categoryId.', 1, now(), "", now() 
			FROM DUAL');
		$newGame = true;
		
	}
	
	//add the player to the game, the host goes first
	myqu('INSERT INTO mytcg_gameplayer (game_id, user_id, is_active, gameplayerstatus_id, deck_id)
		VALUES ('.$gameId.', '.$iUserID.', '.($newGame?'1':(($newGameType == $ng_ai)?'1':'0')).', '.($newGame?(($newGameType == $ng_ai)?'1':'2'):'1').', '.$deckId.')');
	
	//return xml with the gameId to the phone
	$sOP='<game>'.$sCRLF;
	$sOP.=$sTab.'<gameid>'.$gameId.'</gameid>'.$sCRLF;
	//if a new game was created, for pvp, we need to return the url of the gc card, for display purposes
	if ($newGame) {
		$height = resizeGCCard($iHeight, $iWidth, $root, $iBBHeight, $jpg);
		$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
		$dir = '/cards/';
		$ext = '.png';
		if ($iBBHeight) {
			$dir = '/cardsbb/';
		}
		if ($jpg) {
			$ext = '.jpg';
		}
		$sOP.=$sTab.'<gcurl>'.$imageUrlQuery[0]['description'].$height.$dir.'gc'.$ext.'</gcurl>'.$sCRLF;
		$sOP.=$sTab.'<gcurlflip>'.$imageUrlQuery[0]['description'].$height.$dir.'gcFlip'.$ext.'</gcurlflip>'.$sCRLF;
	}
	$sOP.='</game>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	
	exit;
}

/** joins a hosted game */
if ($_GET['joingame']) {
	//we will use the admin as the ai user, if the user wants to play against ai
	$categoryId = $_GET['categoryid'];
	$newGameType = $_GET['newgametype'];
	$gameId = $_GET['gameid'];
	
	if (!($deckId=$_GET['deckid'])) {
		$deckId = getDeck($iUserID, $categoryId);
	}
	
	//get phones screen sizes
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '0';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '0';
	}
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
	}
	
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
			WHERE TIME_TO_SEC(TIMEDIFF(now(), date_start)) > 120 
			AND (g.gamestatus_id = '.$openId.' 
			OR g.gamestatus_id = '.$closedId.')');
		
		foreach ($oldOpenGame as $game) {
			myqu('DELETE FROM mytcg_gameplayer WHERE game_id = '.$game['game_id']);
			myqu('DELETE FROM mytcg_game WHERE game_id = '.$game['game_id']);
		}
		
		//check if the game is still available
		$gameQuery = myqu('SELECT g.game_id  
			FROM mytcg_game g, mytcg_gamephase gp  
			WHERE g.category_id = '.$categoryId.' 
			AND g.gamestatus_id = '.$openId.' 
			AND g.game_id = '.$gameId.' 
			AND gp.gamephase_id = g.gamephase_id 
			AND lower(gp.description) = "lfm"');
		
		//if it is, set it up and create the game
		if (sizeof($gameQuery) > 0) {
			myqu('UPDATE mytcg_game 
				SET gamestatus_id = '.$incompleteId.', 
				gamephase_id = 2 
				WHERE game_id = '.$gameId);
		}
		else {
			$sOP='<game>'.$sCRLF;
			$sOP.=$sTab.'<gameid>'.$gameId.'</gameid>'.$sCRLF;
			$sOP.='<phase>closed</phase>'.$sCRLF;
			$sOP.='</game>'.$sCRLF;
			header('xml_length: '.strlen($sOP));
			echo $sOP;
			
			exit;
		}
	}	
	//add the player to the game, the host goes first
	myqu('INSERT INTO mytcg_gameplayer (game_id, user_id, is_active, gameplayerstatus_id, deck_id)
		VALUES ('.$gameId.', '.$iUserID.', '.($newGame?'1':(($newGameType == $ng_ai)?'1':'0')).', '.($newGame?(($newGameType == $ng_ai)?'1':'2'):'1').', '.$deckId.')');
	
	//setDeck($iUserID, $categoryId, $gameId);
	
	if (!$newGame) {
		initialiseGame($iUserID, $gameId, ($newGameType == $ng_ai)?45:-1);
	}
	
	//return xml with the gameId to the phone
	$sOP='<game>'.$sCRLF;
	$sOP.=$sTab.'<gameid>'.$gameId.'</gameid>'.$sCRLF;
	//if a new game was created, for pvp, we need to return the url of the gc card, for display purposes
	if ($newGame) {
		$height = resizeGCCard($iHeight, $iWidth, $root, $iBBHeight, $jpg);
		$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
		$dir = '/cards/';
		$ext = '.png';
		if ($iBBHeight) {
			$dir = '/cardsbb/';
		}
		if ($jpg) {
			$ext = '.jpg';
		}
		$sOP.=$sTab.'<gcurl>'.$imageUrlQuery[0]['description'].$height.$dir.'gc'.$ext.'</gcurl>'.$sCRLF;
		$sOP.=$sTab.'<gcurlflip>'.$imageUrlQuery[0]['description'].$height.$dir.'gcFlip'.$ext.'</gcurlflip>'.$sCRLF;
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
		WHERE TIME_TO_SEC(TIMEDIFF(now(), date_start)) > 120 
		AND (g.gamestatus_id = '.$openId.' 
		OR g.gamestatus_id = '.$closedId.')');
	
	foreach ($oldOpenGame as $game) {
		myqu('DELETE FROM mytcg_gameplayer WHERE game_id = '.$game['game_id']);
		myqu('DELETE FROM mytcg_game WHERE game_id = '.$game['game_id']);
	}

	$aCategories=myqu('SELECT concat(concat(DATE_FORMAT(g.date_start, "%d %b %H:%i\n"), "VS "), uOpp.username) description, g.game_id
		FROM mytcg_game g 
		INNER JOIN mytcg_category c 
		ON c.category_id = g.category_id 
		INNER JOIN mytcg_gameplayer gp 
		ON g.game_id = gp.game_id 
		INNER JOIN mytcg_gamestatus gs 
		ON gs.gamestatus_id = g.gamestatus_id 
		INNER JOIN mytcg_gamephase gph 
		ON gph.gamephase_id = g.gamephase_id 
		INNER JOIN mytcg_gameplayer gpOpp 
		ON gpOpp.game_id = g.game_id 
		INNER JOIN mytcg_user uOpp 
		ON uOpp.user_id = gpOpp.user_id 
		WHERE gp.user_id = '.$iUserID.' 
		AND gpOpp.user_id != '.$iUserID.' 
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

/** get all open games for game lobby */
if ($_GET['getopengames']){
	$categoryId = $_GET['categoryid'];
	$aGames=myqu('SELECT concat(concat(DATE_FORMAT(g.date_start, "%d %b %H:%i\n"), "VS "), u.username) description, DATE_FORMAT(g.date_start, "%d %b %H:%i") date, g.game_id, u.username
		FROM mytcg_game g, mytcg_gamestatus gs, mytcg_gamephase gp, mytcg_gameplayer gpl, mytcg_user u 
		WHERE g.gamephase_id = gp.gamephase_id 
		AND g.gamestatus_id = gs.gamestatus_id 
		AND lower(gs.description) = "open" 
		AND lower(gp.description) = "lfm" 
		AND gpl.game_id = g.game_id 
		AND gpl.user_id = u.user_id 
		AND u.user_id != '.$iUserID.' 
		AND g.category_id = '.$categoryId.'
		ORDER BY g.date_start');
	$sOP='<games>'.$sCRLF;
	$iCount=0;
	while ($aGame=$aGames[$iCount]){
		$sOP.='<game>';
		$sOP.=$sTab.'<gameid>'.trim($aGame['game_id']).'</gameid>'.$sCRLF;
		$sOP.=$sTab.'<date>'.trim($aGame['date']).'</date>'.$sCRLF;
		$sOP.=$sTab.'<username>'.trim($aGame['username']).'</username>'.$sCRLF;
		$sOP.=$sTab.'<gamedescription>'.trim($aGame['description']).'</gamedescription>'.$sCRLF;
		$sOP.='</game>';
		$iCount++;
	}
	$sOP.='</games>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}


/** get the date of the latest notification */
if ($_GET['notedate']){
	$notificationsUrlQuery = myqu('SELECT notedate FROM mytcg_notifications WHERE user_id = '.$iUserID.' AND sysnote = 0 ORDER BY notedate DESC');
	$sOP.='<notedate>'.trim($notificationsUrlQuery[0]['notedate']).'</notedate>'.$sCRLF;
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
	if (!($iFriendID=$_GET['friendid'])) {
		$iFriendID = '0';
	}
	if($iFriendID == '0'){
		$userId = $iUserID;
	} else {
		$userId = $iFriendID;
	}
	if($iFriendID == '0'){
		$aLoad=myqu('SELECT count(*) as loaded 
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
			AND uc.user_id = '.$userId.'
			AND uc.loaded = 1');
			
		if ($aLoad[0]['loaded'] == 0) {
			$sOP = "<result></result>";
			header('xml_length: '.strlen($sOP));
			echo $sOP;
			exit;
		}
	}
	//this gets the categories that the user has cards in, and their parents
	$query = 'SELECT DISTINCT ca.category_id, ca.description, "true" hasCards, 
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
		AND uc.user_id = '.$userId.$usercategories.' 
		GROUP BY ca.category_id
		ORDER BY ca.description';
	/*echo $query;*/
	$aCategories=myqu($query);
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
			WHERE user_id = '.$userId.' ');
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
	if($iFriendID == '0'){
		//check for new cards
		//select count(*) from mytcg_usercard where usercardstatus_id = 4 and user_id = id;
		$aNewCards=myqu('SELECT COUNT(*) as cnt
				FROM mytcg_usercard
				WHERE user_id = '.$userId.' 
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
	
	if ($iCount==1 && $topCats[0]['hasCards'] != "true") {
		$sOP = subcategories($lastCheckSeconds, $topCats[0]['category_id'], $userId, $aMine, $aCard, $topcar,$iFriendID);
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
	if (!($iFriendID=$_GET['friendid'])) {
		$iFriendID = '0';
	}
	if($iFriendID == '0'){
		$userId = $iUserID;
	} else {
		$userId = $iFriendID;
	}
	$cat = $_GET['category'];
	//this gets the categories that the user has cards in, and their parents
	echo subcategories($lastCheckSeconds, $cat, $userId, '', '', $topcar, $iFriendID);
	exit;
}

/** return a list of all categories */
if ($_GET['allcategories']) {
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
			FROM mytcg_category_x WHERE category_parent_id IS NOT NULL) '.$productcategories.' ORDER BY c.description');
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
		
		
	$qu = 'SELECT count(*) as cnt 
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
		AND U.user_id='.$iUserID;
	$aAuctionCards=myqu($qu);
		
		
	$sOP='<cardcategories>'.$sCRLF;
	if ($aMine=$aAuctionCards[0]) {
		if ($aMine['cnt'] > 0) {
			$sOP.="<album>";
			$sOP.=$sTab.'<albumid>-2</albumid>'.$sCRLF;
			$sOP.=$sTab.'<albumname>My Auctions</albumname>'.$sCRLF;
			$sOP.="</album>";
		}
	}
		
	$qu = 'SELECT count(*) AS cnt
			FROM mytcg_market a, mytcg_usercard b, mytcg_card c
			WHERE datediff(now(), date_expired) <= 0
			AND a.usercard_id = b.usercard_id
			AND b.card_id = c.card_id
			AND a.user_id <> '.$iUserID.'
			AND c.card_id NOT IN (SELECT card_id
									FROM mytcg_usercard
									WHERE user_id = '.$iUserID.')';
	$aAuctionCards=myqu($qu);
		
	if ($aMine=$aAuctionCards[0]) {
		if ($aMine['cnt'] > 0) {
			$sOP.="<album>";
			$sOP.=$sTab.'<albumid>-3</albumid>'.$sCRLF;
			$sOP.=$sTab.'<albumname>Not Owned</albumname>'.$sCRLF;
			$sOP.="</album>";
		}
	}
	
	$qu = 'SELECT count(*) as cnt
			FROM mytcg_market a, mytcg_usercard b, mytcg_card c
			WHERE datediff(now(), date_expired) <= 0
			AND a.usercard_id = b.usercard_id
			AND b.card_id = c.card_id
			AND c.value > a.minimum_bid
			AND a.marketstatus_id = 1
			AND a.user_id <> '.$iUserID;
	$aAuctionCards=myqu($qu);
		
	if ($aMine=$aAuctionCards[0]) {
		if ($aMine['cnt'] > 0) {
			$sOP.="<album>";
			$sOP.=$sTab.'<albumid>-4</albumid>'.$sCRLF;
			$sOP.=$sTab.'<albumname>Good Deals</albumname>'.$sCRLF;
			$sOP.="</album>";
		}
	}
	
	$qu = 'SELECT c.category_id, d.description
								FROM mytcg_card c
								INNER JOIN mytcg_category d
								on c.category_id = d.category_id
								INNER JOIN mytcg_usercard uc
								ON uc.card_id = c.card_id
								INNER JOIN mytcg_market ac
								ON uc.usercard_id = ac.usercard_id
								INNER JOIN mytcg_category_x cx
								ON d.category_id = cx.category_child_id
								WHERE ac.marketstatus_id = 1 
								AND datediff(now(), ac.date_expired) <= 0
								 '.$usercategories.' 
								AND uc.user_id <> '.$iUserID.'
								group by category_id';
	/*echo $qu;*/
			$aCategories=myqu($qu);
	
	
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
	
	
	$aUserDetails=myqu('SELECT credits, IFNULL(premium, 0) premium
		FROM mytcg_user 
		WHERE user_id='.$iUserID);
	$sOP.=$sTab.'<credits>'.trim($aUserDetails[0]['credits']).'</credits><premium>'.trim($aUserDetails[0]['premium']).'</premium>'.$sCRLF;
	
	$iCount=0;
	while ($aProduct=$aProducts[$iCount]){
		if ($aProduct['IN_STOCK'] > 0) {
			$sOP.=$sTab.'<product>'.$sCRLF;
			$sOP.=$sTab.'<productid>'.trim($aProduct['PRODUCT_ID']).'</productid>'.$sCRLF;
			$sOP.=$sTab.'<productname>'.trim($aProduct['DESCRIPTION']).'</productname>'.$sCRLF;
			$sOP.=$sTab.'<producttype>'.trim($aProduct['PACK_TYPE']).'</producttype>'.$sCRLF;
			$sOP.=$sTab.'<productprice>'.trim($aProduct['PRICE']).'</productprice>'.$sCRLF;
			$sOP.=$sTab.'<productpremium>'.trim($aProduct['PREMIUM']).'</productpremium>'.$sCRLF;
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
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
	}
	
	global $iUserID;
	echo userdetails($iUserID,$iHeight,$iWidth,$root,$jpg);
	
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
	creditlog($iUserID, $transactionlogtypes);
}

/** give user deck list for a category */
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

/** give all the user decks */
if ($_GET['getalldecks']){
	$aDeckDetails=myqu('SELECT deck_id, description 
		FROM mytcg_deck 
		WHERE user_id='.$iUserID);
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

/** give all the user decks in a category */
if ($_GET['getcategorydecks']){
	$iCategoryId=$_GET['category_id'];
	
	//only returns complete decks
	$aDeckDetails=myqu('SELECT d.deck_id, d.description, c.cards 
		FROM mytcg_deck d
		INNER JOIN (SELECT uc.deck_id, count(uc.usercard_id) cards 
		FROM mytcg_usercard uc
		WHERE uc.user_id = '.$iUserID.'
		AND uc.deck_id IS NOT NULL
		GROUP BY uc.deck_id) c
		ON c.deck_id = d.deck_id
		WHERE d.user_id='.$iUserID.' 
		AND d.category_id = '.$iCategoryId.' 
		AND c.cards = 10');
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
	$iCardID=$_GET['card_id'];
	
	$cardQuery = myqu('SELECT usercard_id 
		FROM mytcg_usercard 
		WHERE user_id = '.$iUserID.' 
		AND card_id = '.$iCardID.' 
		AND deck_id IS NULL 
		AND usercardstatus_id = 1 
		LIMIT 1');
	
	$iUserCardID = $cardQuery[0]['usercard_id'];
	
	myqui('UPDATE mytcg_usercard 
			SET deck_id = '.$iDeckID.'  
			WHERE usercard_id = '.$iUserCardID);
	
	$sOP = "<result>Card added to Deck!</result>";
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

if ($_GET['removefromdeck']){
	$iCardID=$_GET['card_id'];
	$iDeckID=$_GET['deck_id'];
	
	myqui('UPDATE mytcg_usercard 
		SET deck_id = NULL 
		WHERE user_id = '.$iUserID.' 
		AND card_id = '.$iCardID.' 
		AND deck_id = '.$iDeckID);
	
	$sOP = "<result>Card removed from Deck!</result>";
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//this returns a list of cards in a category, 
if ($iCategory=$_GET['cardsincategorynotdeck']){

	$iDeckID=$_GET['deck_id'];

	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
	}
	$lastCheckSeconds = "";
	if (!($lastCheckSeconds = $_GET['seconds'])) {
		$lastCheckSeconds = "0";
	}
	
	$sOP = cardsincategorynotdeck($iCategory,$iHeight,$iWidth,$lastCheckSeconds,$iUserID,$iDeckID,$root,$iBBHeight, $jpg);
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
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
	}
	$lastCheckSeconds = "";
	if (!($lastCheckSeconds = $_GET['seconds'])) {
		$lastCheckSeconds = "0";
	}
	
	$aDeckCategory=myqu('SELECT category_id 
		FROM mytcg_deck 
		WHERE deck_id='.$iDeckID);
	
	$sOP = "<deck>";
	$sOP .= cardsincategory(0,$iHeight,$iWidth,1,$lastCheckSeconds,$iUserID,$iDeckID,$root,$iBBHeight,$jpg);
	$sOP .= "<category_id>".$aDeckCategory[0]["category_id"]."</category_id>";
	$sOP .= "</deck>";
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

if ($_GET['createdeck']){
	$iDescription=base64_decode($_GET['description']);
	$iCategoryID=$_GET['category_id'];
	$sOP = createDeck($iUserID,$iCategoryID,$iDescription);
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

if ($_GET['deletedeck']){
	$iDeckID=$_GET['deck_id'];
	myqui('UPDATE mytcg_usercard 
			SET deck_id = NULL  
			WHERE deck_id = '.$iDeckID);
	
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
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '1';
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
	
	$ext = '.png';
	if ($jpg) {
		$ext = '.jpg';
	}
	
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
		$sOP.=$sTab.$sTab.'<thumburl>'.$sFound.'cards/'.$aOneCard['image'].'_thumb'.$ext.'</thumburl>'.$sCRLF;
		
		//before setting the front and back urls, make sure the card is resized for the height
		$iHeight = resizeCard($iHeight, $iWidth, $aOneCard['image'], $root, $iBBHeight,$jpg);
		
		$dir = '/cards/';
		if ($iBBHeight) {
			$dir = '/cardsbb/';
		}
		
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['front_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.$sTab.'<fronturl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_front'.$ext.'</fronturl>'.$sCRLF;

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.$sTab.'<backurl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_back'.$ext.'</backurl>'.$sCRLF; 

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