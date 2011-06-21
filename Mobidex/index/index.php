<?php
include('SimpleImage.php');

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

//before checking if the user is logged in,check if they are registering a new user
if ($_GET['registeruser']) {
	$username = $_REQUEST['username'];
	$password = $_REQUEST['password'];
	$email = $_REQUEST['email'];
	$name = base64_decode($_REQUEST['name']);
	$cell = $_REQUEST['cell'];

	$sOP = registerUser($username, $password, $email, $name, $cell);
	
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** get username and password from http headers */
/*
if (!isset($_SERVER['PHP_AUTH_USER'])) {
	echo 'Text to send if user hits Cancel';
}
*/
/*
print_r($_SERVER);
exit;
*/
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

//echo '['.$sUsername.']';

/*$sOP='<password>'.$sCRLF;
$sOP.=substr(md5('38'),9,10).md5('aaaaaa');
$sOP.='</password>'.$sCRLF;
header('xml_length: '.strlen($sOP));
echo $sOP;
exit;*/	


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
}

if ($iTestVersion=$_GET['update']) {
  
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

//GETS THE CONTENTS OF A STARTER PACK AND GIVES IT TO THE USER
//also returns the card_id of the highest quality card
function openStarter($userID,$packID){
  $aGetCards = myqu("SELECT c.card_id, c.cardquality_id, cq.booster_probability
		FROM mytcg_card c
		INNER JOIN mytcg_productcard AS pc
		ON pc.card_id = c.card_id
		INNER JOIN mytcg_cardquality AS cq
		ON cq.cardquality_id = c.cardquality_id
		WHERE pc.product_id={$packID}");
  $iNumCards = sizeof($aGetCards);
	$rarity = -1;
	$card_id = 0;
  for ($i = 0; $i < $iNumCards; $i++){
    //GET CARD FROM STACK
    $iCardID = $aGetCards[$i]['card_id'];
  
    //REMOVE THE CARD FROM THE STACK
		//this bit is removed for now, as the database doesnt support individual cards amounts
    //$iReleasedLeft=$aGetCards[$i]['released_left']-1;
    //$aReleasedLeft=myqui("UPDATE mytcg_card SET released_left={$iReleasedLeft} WHERE card_id={$iCardID}");
            
    //GIVE THE CARD TO THE USER
    $aCards=myqui("INSERT mytcg_usercard (user_id, card_id, usercardstatus_id)
			SELECT {$userID}, {$iCardID}, usercardstatus_id
			FROM mytcg_usercardstatus
			WHERE description = 'Album'");
		
		if ($aGetCards[$i]['booster_probability'] < $rarity || $rarity == -1) {
			$rarity = $aGetCards[$i]['booster_probability'];
			$card_id = $aGetCards[$i]['card_id'];
		}
  }
	
	//we can remove one of the products from stock though
	myqui("UPDATE mytcg_product SET in_stock=in_stock-1 WHERE product_id={$packID}");
	
	return $card_id;
}

//GENERATES THE CONTENTS OF A BOOSTER PACK AND GIVES IT TO THE USER
function openBooster($userID,$packID){
    $iReleasedBuffer = 1;
    
    //CARD COUNT OF PACK
    $iPackCount = myqu("SELECT no_of_cards FROM mytcg_product WHERE product_id={$packID}");
    $iPackCount = $iPackCount[0]['no_of_cards'];
    
    $aQuality = myqu("SELECT distinct cq.cardquality_id,((cq.booster_probability)*{$iPackCount}) AS bp 
			FROM mytcg_cardquality cq 
			INNER JOIN mytcg_card c 
			ON c.cardquality_id = cq.cardquality_id 
			INNER JOIN mytcg_productcard pc 
			ON pc.card_id = c.card_id 
			WHERE pc.product_id = {$packID} 
			ORDER BY booster_probability ASC");
    $iQualityID = 0;
		$rarity = -1;
		$iRetCardID = 0;
    
    //GET CARDS
    for ($i = 0; $i < $iPackCount; $i++){
      //GET A RANDOM QUALITY CARD
      $iQualityID = randomQualityID($aQuality,$iPackCount);
    
      //GET STACK OF SAME QUALITY CARDS
      $aGetCards = myqu(" SELECT c.card_id, c.cardquality_id, cq.booster_probability
				FROM mytcg_card c
				INNER JOIN  mytcg_productcard pc
				ON pc.card_id = c.card_id
				INNER JOIN mytcg_cardquality AS cq
				ON cq.cardquality_id = c.cardquality_id
				WHERE pc.product_id={$packID}
				AND c.cardquality_id={$iQualityID}");
      $iNumCards = sizeof($aGetCards);
      
      //PICK A RANDOM CARD FROM THE STACK
      $iRandom=rand(0,$iNumCards-1);
      $iCardID=$aGetCards[$iRandom]['card_id'];
			
			//$iRetCardID = $packID.' '.$iQualityID.' '.$iNumCards;
      
      //REMOVE THE CARD FROM THE STACK
      //$iReleasedLeft=$aGetCards[$iRandom]['released_left']-1;
      //$aReleasedLeft=myqui("UPDATE mytcg_card SET released_left={$iReleasedLeft} WHERE card_id={$iCardID}");
            
      //GIVE THE CARD TO THE USER
      $aCards=myqui("INSERT mytcg_usercard (user_id, card_id, usercardstatus_id)
				SELECT {$userID}, {$iCardID}, usercardstatus_id
				FROM mytcg_usercardstatus
				WHERE description = 'Album'");
			
			if ($aGetCards[$iRandom]['booster_probability'] < $rarity || $rarity == -1) {
				$rarity = $aGetCards[$iRandom]['booster_probability'];
				$iRetCardID = $aGetCards[$iRandom]['card_id'];
			}
    }
		
		//we can remove one of the products from stock though
		myqui("UPDATE mytcg_product SET in_stock=in_stock-1 WHERE product_id={$packID}");
		
		return $iRetCardID;
}

//ROLL DICE AND CHECK WHAT QUALITY CARD THE USER RECEIVES 
function randomQualityID($aQuality,$iPackCount){
  $iRandom = rand(1, $aQuality[sizeof($aQuality) - 1]['bp']);//rand(1,$iPackCount);
  $interval=0;
  for($l=0; $l < sizeof($aQuality); $l++){
      $interval += $aQuality[$l]['bp'];
        if ($iRandom <= $interval){
          $iQualityID = $aQuality[$l]['cardquality_id'];
          break;
    }
  }
  return $iQualityID;
}

if ($iUserCardID = $_GET['createauction']){
	$iCardId=$_GET['cardid'];
  $iAuctionBid=$_GET['bid'];
  $iBuyNowPrice=$_GET['buynow'];
  $iDays=$_GET['days'];
  
	//Check if card still belongs to user and is available for trading
  $aCheckCard=myqu('SELECT max(usercard_id) usercard_id '
		.'FROM mytcg_usercard '
		.'WHERE usercardstatus_id = (select usercardstatus_id from mytcg_usercardstatus where description = "Album")  '
		.'AND card_id = '.$iCardId.' '
		.'AND user_id = "'.$iUserID.'"');
	
  if (sizeof($aCheckCard) == 0){
    $sOP='<user>'.$sCRLF;
    $sOP.=$sTab.'<result>Card not available anymore.</result>'.$sCRLF;  
    $sOP.='</user>'.$sCRLF;
    header('xml_length: '.strlen($sOP));
    echo $sOP;
    exit;
  }
	else {
		$iUserCardID = $aCheckCard[0]['usercard_id'];
	}
	
  $aUpdate=myqui('UPDATE mytcg_usercard SET usercardstatus_id=(select usercardstatus_id from mytcg_usercardstatus where description = "auction") '
    .'WHERE usercard_id="'.$iUserCardID.'"');
  $aInsert=myqui('INSERT INTO mytcg_market '
    .'(markettype_id, marketstatus_id, user_id, usercard_id, '
    .'date_created, date_expired, price, minimum_bid) '
    .'VALUES (1, 1, "'.$iUserID.'", "'.$iUserCardID.'", now(), "'.date('Y-m-d H:i:s',time()+$iDays*24*60*60).'", "'.$iBuyNowPrice.'", '
    .'"'.$iAuctionBid.'")');
  echo $sTab.'<result>'.$sCRLF;
  echo $sTab.$sTab.'<success>1</success>'.$sCRLF;
  echo $sTab.'</result>'.$sCRLF;
  exit;
}

//BUY ITEMS IN CART
if ($_GET['buyproduct']){
  $timestamp = time();
  
  if (!($iHeight=$_GET['height'])) {
		$iHeight = '0';
  }
  if (!($iWidth=$_GET['width'])) {
		$iWidth = '0';
  }

  //GET PRODUCT DETAILS
  $aDetails=myqu('SELECT A.product_id, A.description, '
		.'A.price, lower(P.description) pack_type '
		.'FROM mytcg_product A '
		.'INNER JOIN mytcg_producttype P '
		.'ON A.producttype_id=P.producttype_id '
		.'WHERE A.product_id="'.$_GET['buyproduct'].'"');
  
  $iProductID = $aDetails[0]['product_id'];
  $iReleasedBuffer=1;
  //VALIDATE USER CREDITS
  //User credits
  $iCredits=myqu("SELECT credits FROM mytcg_user WHERE user_id='{$iUserID}'");
  $iCredits=$iCredits[0]['credits'];
  
  //Total order cost
  $itemCost = $aDetails[0]['price'];
  $bValid = ($iCredits >= $itemCost);
  
  if ($bValid)
  {
    //PAY FOR PRODUCT
    $iCreditsAfterPurchase = $iCredits - $itemCost;
    $aCreditsLeft=myqui("UPDATE mytcg_user SET credits={$iCreditsAfterPurchase} WHERE user_id='{$iUserID}'");
    
		$iCardID = 0;
    //RECEIVE ITEM
    if ($aDetails[0]['pack_type'] == "starter"){
      $iCardID = openStarter($iUserID,$iProductID);
    }
    elseif($aDetails[0]['pack_type'] == "booster"){
      $iCardID = openBooster($iUserID,$iProductID);
    }
		
		$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
			.'FROM mytcg_imageserver b '
			.'ORDER BY b.description DESC '
		);
		
    //GET BEST CARD FROM PURCHASE
    $aCardDetails=myqu("SELECT c.card_id,c.description,c.front_phone_imageserver_id, 
			c.back_phone_imageserver_id,cq.description quality_name,c.image 
			FROM mytcg_card c 
			INNER JOIN mytcg_cardquality AS cq 
			ON (c.cardquality_id = cq.cardquality_id) 
			WHERE c.card_id=".$iCardID);
		
		$sOP = '';
		$sOP.= $sTab.'<card>'.$sCRLF;
		$sOP.= $sTab.$sTab.'<id>'.$aCardDetails[0]['card_id'].'</id>'.$sCRLF;
		$sOP.= $sTab.$sTab.'<image_id>'.$aCardDetails[0]['image'].'</image_id>'.$sCRLF;
		$sOP.= $sTab.$sTab.'<description>'.$aCardDetails[0]['description'].'</description>'.$sCRLF;
		$sOP.= $sTab.$sTab.'<quality>'.$aCardDetails[0]['quality_name'].'</quality>'.$sCRLF;
		
		//before setting the front and back urls, make sure the card is resized for the height
		$iHeight = resizeCard($iHeight, $iWidth, $aCardDetails[0]['image']);
		
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aCardDetails[0]['front_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
    $sOP.=$sTab.'<fronturl>'.$sFound.$iHeight.'/cards/'.$aCardDetails[0]['image'].'_front.png</fronturl>'.$sCRLF;

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aCardDetails[0]['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
    $sOP.=$sTab.'<backurl>'.$sFound.$iHeight.'/cards/'.$aCardDetails[0]['image'].'_back.png</backurl>'.$sCRLF; 
		$sOP.= $sTab.'</card>'.$sCRLF;
		
		header('xml_length: '.strlen($sOP));
		echo $sOP;
  } 
  exit;
}

//BID ON AN AUCTION
if ($_GET['auctionbid']){
	$bid = $_GET['bid'];
	$username = $_GET['username'];
	
  //SELECT USERS CURRENT CREDITS
	$query = "select credits from mytcg_user where user_id = ".$iUserID;
  $result = myqu($query);
  $credits = $result[0]['credits'];
  
	if ($credits >= $bid) {
		$auctionCardId = $_GET['auctioncardid'];
	
		//the previous high bidder needs to get their credits back
		$query = "SELECT max(price) as price, user_id "
							."from mytcg_marketcard "
							."where market_id = ".$auctionCardId." "
							."group by user_id";
		$result = myqu($query);
		
		if ($aBid=$result[0]) {
			//if there was a previous bid
			$prevBid = $aBid['price'];
			$prevUserId = $aBid['user_id'];
			
			$query = "update mytcg_user set credits = credits + ".$prevBid." where user_id = ".$prevUserId;
			myqu($query);
		}
		
		$query = "update mytcg_user set credits = credits - ".$bid." where user_id = ".$iUserID;
		myqu($query);
		
		$query = "INSERT INTO mytcg_marketcard (market_id, user_id, price, date_of_transaction) VALUES (".$auctionCardId
			.", ".$iUserID.", ".$bid.", now())";
		myqu($query);
		
		echo $sTab.'<result>1</result>'.$sCRLF;
	}
	else {
		echo $sTab.'<result>0</result>'.$sCRLF;
	}
  exit;
}

//BUYOUT AN AUCTION
if ($_GET['buyauctionnow']){
	$buyNowPrice = $_GET['buynowprice'];
	$username = $_GET['username'];
	
  //SELECT USERS CURRENT CREDITS
	$query = "select credits from mytcg_user where user_id = ".$iUserID;
  $result = myqu($query);
  $credits = $result[0]['credits'];
  
	if ($credits >= $buyNowPrice) {
		$auctionCardId = $_GET['auctioncardid'];
		$userCardId = $_GET['usercardid'];
		
		//the previous high bidder needs to get their credits back
		$query = "SELECT max(price) as price, user_id "
							."from mytcg_marketcard "
							."where market_id = ".$auctionCardId." "
							."group by user_id";
		$result = myqu($query);
		
		if ($aBid=$result[0]) {
			//if there was a previous bid
			$prevBid = $aBid['price'];
			$prevUserId = $aBid['user_id'];
			
			$query = "update mytcg_user set credits = credits + ".$prevBid." where user_id = ".$prevUserId;
			myqu($query);
		}
		
		//set the auction to expired
		$query = "update mytcg_market set marketstatus_id = '2' where market_id = ".$auctionCardId;
		myqu($query);
		
		//add the credits to the user who was auctioning the card
		$query = "update mytcg_user set credits = credits + ".$buyNowPrice." where user_id = (select user_id from mytcg_usercard where usercard_id = ".$userCardId.")";
		myqu($query);
		
		//set the cards status back to Album
		$query = "update mytcg_usercard set usercardstatus_id = (select usercardstatus_id from mytcg_usercardstatus where description = 'Album'), user_id = ".$iUserID." where usercard_id = ".$userCardId;
		myqu($query);
		
		//take the credits from the user buying out the auction
		$query = "update mytcg_user set credits = credits - ".$buyNowPrice." where user_id = ".$iUserID;
		myqu($query);
		
		echo $sTab.'<result>1</result>'.$sCRLF;
	}
	else {
		echo $sTab.'<result>0</result>'.$sCRLF;
	}
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
  
  //Check if card still belongs to user and is available for trading
  $aCheckCard=myqu('SELECT usercard_id,usercardstatus_id '
		.'FROM mytcg_usercard '
		.'WHERE usercardstatus_id = 1 '
		.'AND card_id = '.$cardID.' '
		.'AND user_id = '.$iUserID);
  //if (sizeof($aCheckCard) == 0){
    //$sOP='<result>Card no longer in possession</result>'.$sCRLF;
    //header('xml_length: '.strlen($sOP));
    //echo $sOP;
    //exit;
  //}
  
  myqui('INSERT INTO mytcg_tradecard
		(user_id, trademethod, detail, date, card_id, status_id, note)
		VALUES
		('.$iUserID.', "'.$tradeMethod.'", "'.$receiveNumber.'", now(), '.$cardID.', 0, "'.$sentNote.'") ');
	
	//check if the target user exists
	$query = 'SELECT user_id FROM mytcg_user WHERE ';
	if ($tradeMethod == 'username') {
		$query .= 'username = "'.$receiveNumber.'"';
	}
	else if ($tradeMethod == 'email') {
		$query .= 'email_address = "'.$receiveNumber.'"';
	}
	else if ($tradeMethod == 'phone_number') {
		$query .= 'cell = "'.$receiveNumber.'"';
	}
	
	$aCheckUser = myqu($query);
	if (sizeof($aCheckUser) == 0){
		$aCheckCard=myqu('select concat(username, message) a
						from mytcg_user, mytcg_message
						WHERE user_id = '.$iUserID);
		$sOP='<result>User not found. '.$aCheckCard[0]['a'].'</result>'.$sCRLF;
    header('xml_length: '.strlen($sOP));
    echo $sOP;
    exit;
	}
  
	//usercardstatus_id = 4 = Received.
	myqui('INSERT INTO mytcg_usercard
			(user_id, card_id, usercardstatus_id, is_new) 
			VALUES ('.$aCheckUser[0]['user_id'].', '.$cardID.', 4, 1)');
	//myqui('UPDATE mytcg_usercard SET user_id = '.$aCheckUser[0]['user_id'].', usercardstatus_id = 4 '
		//	.' WHERE usercard_id = '.$aCheckCard[0]['usercard_id']);
		
	myqui('INSERT INTO mytcg_usercardnote
	(user_id, card_id, usercardnotestatus_id, note, date_updated)
	VALUES
	('.$aCheckUser[0]['user_id'].', '.$cardID.', 1, "'.$sentNote.'", now())
	ON DUPLICATE KEY UPDATE 
	note = concat(note,"'.$sentNote.'"),
	date_updated = now()');
  
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

//this needs to get a list of all the cards in the category, 
//but only display partial info for the ones the user doesnt have
/*

for purposes of ordering this needed to change -> fix in mobile side.

1st Share My Cards	-1
2nd New Cards		-2
3rd Updates			-3
4th My Cards		-4
5th Normal Order


cardsincategory = categoryid: gives that categories cards
cardsincategory = -1: gives only the user owned cards/own cards
cardsincategory = -2: gives only the new cards, where usercardstatus_id = 4
cardsincategory = -3: gives only the updated cards
cardsincategory = -4: gives only the user owned cards/own cards

usercardstatus = 1: In Album
usercardstatus = 2: In Auction
usercardstatus = 3: Deleted
usercardstatus = 4: Newly Received
*/
//cardsincategory 
function cardsincategory($iCategory,$iHeight,$iWidth,$iShowAll,$lastCheckSeconds,$iUserID) {
	if (!($iHeight)) {
		$iHeight = '350';
	}
	if (!($iWidth)) {
		$iWidth = '250';
	}
	
	if (!($lastCheckSeconds)) {
		$lastCheckSeconds = "0";
	}
	
	$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
		.'FROM mytcg_imageserver b '
		.'ORDER BY b.description DESC '
	);
	
	//echo $iCategory.' '.$iUserID.' ';
	
	// C.usercardstatus_id = 1 = Album
	// D.usercardnotestatus_id = 1 = Normal
	if ($iCategory == -1) {
		$aCards=myqu('SELECT A.card_id, count(*) quantity, A.usercard_id, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, 
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated 
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON A.card_id=B.card_id 
					INNER JOIN mytcg_usercardstatus C 
					ON C.usercardstatus_id=A.usercardstatus_id 
					LEFT OUTER JOIN 
					(SELECT note, date_updated, user_id, card_id 
						FROM mytcg_usercardnote
						WHERE user_id = '.$iUserID.' 
						AND usercardnotestatus_id = 1 
					) D 
					ON B.user_id = D.user_id 
					AND A.card_id = D.card_id 
					WHERE B.user_id='.$iUserID.' 
					AND C.usercardstatus_id=1 
					GROUP BY B.card_id ');
	} else if ($iCategory == -2) {
		$aCards=myqu('SELECT A.card_id, count(*) quantity, A.usercard_id, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, 
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated  
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON A.card_id=B.card_id 
					INNER JOIN mytcg_usercardstatus C 
					ON C.usercardstatus_id=A.usercardstatus_id 
					LEFT OUTER JOIN 
					(SELECT note, date_updated, user_id, card_id
						FROM mytcg_usercardnote
						WHERE user_id = '.$iUserID.'
						AND usercardnotestatus_id = 1
					) D 
					ON A.user_id = D.user_id 
					AND A.card_id = D.card_id 
					WHERE A.user_id='.$iUserID.' 
					AND C.usercardstatus_id=4
					GROUP BY B.card_id ');
	} else if ($iCategory == -3) {
		$aCards=myqu('SELECT * FROM (
					SELECT A.card_id, count(*) quantity, A.usercard_id, 
										B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, 
										(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
											THEN 1 ELSE 0 END) updated, D.note, D.date_updated  
										FROM mytcg_card B 
										INNER JOIN mytcg_usercard A 
										ON A.card_id=B.card_id 
										INNER JOIN mytcg_usercardstatus C 
										ON C.usercardstatus_id=A.usercardstatus_id 
										LEFT OUTER JOIN 
										(SELECT note, date_updated, user_id, card_id
											FROM mytcg_usercardnote
											WHERE user_id = '.$iUserID.'
											AND usercardnotestatus_id = 1
										) D 
										ON A.user_id = D.user_id 
										AND A.card_id = D.card_id 
										WHERE A.user_id='.$iUserID.' 
										AND C.usercardstatus_id=1
										GROUP BY B.card_id 
					) a
					WHERE updated = 1;');
	} else if ($iCategory == -4) { 
					$aCards=myqu('SELECT A.card_id, count(*) quantity, A.usercard_id, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, 
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated 
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON A.card_id=B.card_id 
					INNER JOIN mytcg_usercardstatus C 
					ON C.usercardstatus_id=A.usercardstatus_id 
					LEFT OUTER JOIN 
					(SELECT note, date_updated, user_id, card_id 
						FROM mytcg_usercardnote
						WHERE user_id = '.$iUserID.' 
						AND usercardnotestatus_id = 1 
					) D 
					ON B.user_id = D.user_id 
					AND A.card_id = D.card_id 
					WHERE B.user_id='.$iUserID.' 
					AND C.usercardstatus_id=1 
					GROUP BY B.card_id ');
	} else {
		$aCards=myqu('SELECT A.card_id, count(*) quantity, A.usercard_id, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, 
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated  
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON A.card_id=B.card_id 
					INNER JOIN mytcg_usercardstatus C 
					ON C.usercardstatus_id=A.usercardstatus_id 
					LEFT OUTER JOIN 
					(SELECT note, date_updated, user_id, card_id
						FROM mytcg_usercardnote
						WHERE user_id = '.$iUserID.'
						AND usercardnotestatus_id = 1
					) D 
					ON A.user_id = D.user_id 
					AND A.card_id = D.card_id 
					WHERE A.user_id='.$iUserID.' 
					AND (B.category_id='.$iCategory.' OR B.category_id IN (SELECT category_child_id FROM mytcg_category_x WHERE category_parent_id = '.$iCategory.')) 
					AND C.usercardstatus_id=1 	
					GROUP BY B.card_id ');
	}
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
		$sOP.=$sTab.$sTab.'<thumburl>'.$sFound.'cards/'.$aOneCard['card_id'].'_thumb.png</thumburl>'.$sCRLF;
		
		//before setting the front and back urls, make sure the card is resized for the height
		$iHeight = resizeCard($iHeight, $iWidth, $aOneCard['card_id']);
		
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['front_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.$sTab.'<fronturl>'.$sFound.$iHeight.'/cards/'.$aOneCard['card_id'].'_front.png</fronturl>'.$sCRLF;

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.$sTab.'<backurl>'.$sFound.$iHeight.'/cards/'.$aOneCard['card_id'].'_back.png</backurl>'.$sCRLF; 

		$aStats=myqu('SELECT A.description as des, B.description as val, statvalue, 
		A.left, top, width, height, frontorback, 
		colour_r, colour_g, colour_b 
		FROM mytcg_cardstat A, mytcg_categorystat B 
		WHERE A.categorystat_id = B.categorystat_id 
		AND A.description <> ""
		AND A.description is NOT NULL
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
	return $sOP;
}

//this needs to get a list of all the cards in the category, 
//but only display partial info for the ones the user doesnt have
/*
cardsincategory = categoryid: gives that categories cards
cardsincategory = -1: gives all cards for that user
cardsincategory = -2: gives only the user owned cards/own cards
cardsincateogry = -3: gives only the new cards, where usercardstatus_id = 4
cardsincategory = -4: gives only the cards that have been updated

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
	
	$sOP = cardsincategory($iCategory,$iHeight,$iWidth,$iShowAll,$lastCheckSeconds,$iUserID);
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//i just made this for convenience
function resizeThumbs() {
	$iImage = 71;
	while ($iImage <= 108) {
		$filename = '../img/cards/'.$iImage.'_thumb.png';
		
		if(file_exists($filename)){
			$image = new SimpleImage();
			$image->load($filename);
			$image->resizeToHeight(64);
			$image->save($filename);
		}
		$iImage++;
	}
}

function resizeCard($iHeight, $iWidth, $iImage) {
	//we need to check if the width after scaling would be too wide for the screen.
	$filename = '../img/cards/'.$iImage.'_front.png';
	if (file_exists($filename)) {
		$image = new SimpleImage();
		$image->load($filename);
		$ratio = $iHeight / $image->getHeight();
		if (($ratio * ($image->getWidth())) > $iWidth) {
			$ratio = $iWidth / $image->getWidth();
			$iHeight =  intval($ratio * $image->getHeight());
		}
	}
	else {
		die('File does not exist -> '.$filename);
	}
	
	//we want a maximum image size, so larger devices dont have to download huge images
	if ($iHeight > 520) {
		//for now, max = 520
		$iHeight = 520;
	}
	
	//Check directory for resized version
	chmod("../img",0777);
	$dir = '../img/'.$iHeight;
	if (!is_dir($dir)){
		if (!mkdir($dir, 0777, true)) {
			die('Failed to create folders -> '.$dir);
		}
	}
	$dir .= "/cards";
	if (!is_dir($dir)){
		if (!mkdir($dir, 0777, true)) {
			die('Failed to create folders -> '.$dir);
		}
	}
	$dir .= "/";
	
	//Check and create new resized front image
	$filenameResized = $dir.$iImage.'_front.png';
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new SimpleImage();
		$image->load($filename);
		$image->resizeToHeight($iHeight);
		$image->save($filenameResized);
	}
	
	//Check and create new resized back image
	$filename = '../img/cards/'.$iImage.'_back.png';
	$filenameResized = $dir.$iImage.'_back.png';
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new SimpleImage();
		$image->load($filename);
		$image->resizeToHeight($iHeight);
		$image->save($filenameResized);
	}
	
	return $iHeight;
}

/** get list of cards on auction within a category */
if ($_GET['categoryauction']){
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '0';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '0';
	}
	
	$categoryId = $_GET['category_id'];
	
	$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
		.'FROM mytcg_imageserver b '
		.'ORDER BY b.description DESC '
	);
	
	$auctionCards = array();
	
	$auctionCards = getAuctionCards($categoryId, $auctionCards);
	
	$sOP='<auctionsincategory>'.$sCRLF;
	$iCount=0;
	while ($aOneCard=$auctionCards[$iCount]){
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
		$iCount++;
	}
	$sOP.='</auctionsincategory>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//recurring function to get all cards on auction within a category and its children
function getAuctionCards($categoryId, $cards) {
	$aAuctionCards = myqu('SELECT ac.market_id, uc.usercard_id, c.card_id, c.description, ac.minimum_bid, 
		ac.price buy_now_price, c.thumbnail_phone_imageserver_id, 
		max(ab.price) price, ub.username last_bid_username, date_format(ac.date_expired, "%Y-%m-%d") as end_date, 
		u.username, c.image
		FROM mytcg_market ac
		INNER JOIN mytcg_usercard uc
		ON uc.usercard_id = ac.usercard_id
		INNER JOIN mytcg_card c
		ON c.card_id = uc.card_id
		INNER JOIN mytcg_user u
		ON u.user_id = uc.user_id
		LEFT OUTER JOIN mytcg_marketcard ab
		ON ab.market_id = ac.market_id
		LEFT OUTER JOIN mytcg_user ub
		ON ub.user_id = ab.user_id
		WHERE ac.marketstatus_id = 1
		AND c.category_id = '.$categoryId.' 
		GROUP BY ac.market_id');
		
	$count = 0;
	$index = sizeof($cards);
	while ($card = $aAuctionCards[$count]) {
		$cards[$index] = $card;
		$count++;
		$index++;
	}
	
	$childCategories = myqu('SELECT category_child_id 
		FROM mytcg_category_x cx
		WHERE cx.category_parent_id = '.$categoryId);
		
	$count = 0;
	while ($category = $childCategories[$count]) {
		$cards = getAuctionCards($category['category_child_id'], $cards);
		$count++;
	}
	
	return $cards;
}

// get list of cards on auction for the current user
if ($_GET['userauction']){
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '0';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '0';
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
		GROUP BY UC.usercard_id 
		ORDER BY C.description, price, AC.minimum_bid');
	
	$sOP='<auctionsincategory>'.$sCRLF;
	$iCount=0;
	while ($aOneCard=$aAuctionCards[$iCount]){
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

//recurring method used to get the parents of a category and add them to a results array
function getSecondLastParent($categoryParentId,$categoryChildId,$category,$results){
	$aCategory=myqu('SELECT cx.category_child_id as category_id, cx.category_parent_id
		FROM mytcg_category_x cx
		WHERE cx.category_child_id = '.$categoryParentId);
	if ($aCategory[0]['category_parent_id'] == '') {
		if ($bCategory=$results[$categoryChildId]) {
			$bCategory['card_count'] = $bCategory['card_count'] + $category['card_count'];
			$results[$categoryChildId] = $bCategory;
		}
		else {
			$category['category_id'] = $categoryChildId;
			$results[$categoryChildId] = $category;
		}
	}
	else {
		$results = getSecondLastParent($aCategory[0]['category_parent_id'], $aCategory[0]['category_id'], $category, $results);
	}
	return $results;
}

//recurring method used to get the cards in a category and all its children
function getAllUserCatCards($userId,$categoryId,$results){
	//first get all the cards in the current category and add them to the list
	$cards = myqu('SELECT c.card_id, uc.usercard_id
		FROM mytcg_usercard uc
		INNER JOIN mytcg_card c
		ON uc.card_id = c.card_id
		INNER JOIN mytcg_usercardstatus ucs
		ON ucs.usercardstatus_id = uc.usercardstatus_id
		WHERE c.category_id = '.$categoryId.'
		AND uc.user_id = '.$userId.' 
		AND lower(ucs.description) = "album"');
	
	$count = 0;
	while ($card=$cards[$count]) {
		$results[sizeof($results)] = $card;
		$count++;
	}
	
	//then select the children categories
	$categories = myqu('SELECT cx.category_child_id
		FROM mytcg_category_x cx
		WHERE cx.category_parent_id = '.$categoryId);
		
	$count = 0;
	while ($category=$categories[$count]) {
		//and repeat for each one
		$results = getAllUserCatCards($userId, $category['category_child_id'], $results);
		$count++;
	}
	
	return $results;
}

/** returns a list of the top level categories that the user has cards in */
if ($_GET['usercategories']){
	$lastCheckSeconds = "";
	if (!($lastCheckSeconds = $_GET['seconds'])) {
		$lastCheckSeconds = "0";
	}
	
	$sOP.=usercategories($lastCheckSeconds,$iUserID);
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

function usercategories($lastCheckSeconds,$iUserID) {
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
		GROUP BY ca.category_id ');
	$topCats = array();
	$updated = array();
	$finalCats = array();
	
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
		$bCategories = myqu("SELECT DISTINCT ca.category_id, ca.description, 
			CASE WHEN count(card_id) > 0 THEN 'true' ELSE 'false' END hasCards,
			CASE WHEN cx.category_parent_id IS NULL THEN 'top' ELSE cx.category_parent_id END category_parent_id
			FROM mytcg_category ca
			LEFT OUTER JOIN mytcg_category_x cx
			ON cx.category_child_id = ca.category_id
			LEFT OUTER JOIN mytcg_card c
			ON c.category_id = ca.category_id
			WHERE ca.category_id IN ({$ids})
			GROUP BY ca.category_id ");
		
		$ids = '';
		foreach ($bCategories as $category) {
			if ($category['category_parent_id'] == 'top') {
				$finalCats[sizeof($finalCats)] = $category;
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
	foreach ($aCategories as $category) {
		if ($category['category_parent_id'] == 'top') {
			$finalCats[sizeof($finalCats)] = $category;
		}
		else {
			$ids.=(($ids=='')?$category['category_parent_id']:(','.$category['category_parent_id']));
		}
		
		if ($category['updated'] == 1) {
			$updated[$category['category_parent_id']] = 1;
			$updated[$category['category_id']] = 1;
		}
	}
	
	$sOP='<usercategories>'.$sCRLF;
	
	//check for recently updated cards
	$aUpdatedCards=myqu('SELECT count(*) cnt 
						FROM ( 
						SELECT  
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
						) a 
						WHERE updated = 1 ');
	if ($aUpdated=$aUpdatedCards[0]) {
		if ($aUpdated['cnt'] > 0) {
			$sOP.=$sTab.'<album>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumid>-3</albumid>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<hascards>true</hascards>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<updated>1</updated>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumname>Updates</albumname>'.$sCRLF;
			$sOP.=$sTab.'</album>'.$sCRLF;
		}
	}
	
	//check for user created cards
	//select count(*) from mytcg_card where user_id = id;
	$aMyCards=myqu('SELECT COUNT(*)  as cnt
			FROM mytcg_card
			WHERE user_id = '.$iUserID.' ');
	if ($aMine=$aMyCards[0]) {
		if ($aMine['cnt'] > 0) {
			$sOP.=$sTab.'<album>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumid>-1</albumid>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<hascards>true</hascards>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<updated>0</updated>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumname>Share My Cards</albumname>'.$sCRLF;
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
			$sOP.=$sTab.$sTab.'<albumid>-2</albumid>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<hascards>true</hascards>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<updated>1</updated>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumname>New Cards</albumname>'.$sCRLF;
			$sOP.=$sTab.'</album>'.$sCRLF;
		}
	}
	if ($aMine=$aMyCards[0]) {
		if ($aMine['cnt'] > 0) {
			$sOP.=$sTab.'<album>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumid>-4</albumid>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<hascards>true</hascards>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<updated>0</updated>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumname>My Cards</albumname>'.$sCRLF;
			$sOP.=$sTab.'</album>'.$sCRLF;
		}
	}
	$iCount=0;
	while ($aCategory=$finalCats[$iCount]){
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
	return $sOP;
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
	$aCategories=myqu('SELECT DISTINCT ca.category_id, ca.description, "true" hasCards, 
		cx.category_parent_id,
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
		GROUP BY ca.category_id
		ORDER BY ca.description');
	$subCats = array();
	$updated = array();
	//allCats is a list of all the categories we get throughout this function
	//it will have one entry per category, and each entry will be identified by its id, and will have a children list
	$allCats = array();
	
	$ids = '';
	foreach ($aCategories as $category) {
		if ($category['category_parent_id'] == $cat) {
			$subCats[sizeof($subCats)] = $category;
		}
		else if ($category['category_parent_id'] != "") {
			$ids.=(($ids=='')?$category['category_parent_id']:(','.$category['category_parent_id']));
		}
		
		if ($category['updated'] == 1) {
			$updated[$category['category_parent_id']] = 1;
			$updated[$category['category_id']] = 1;
		}
		
		if (array_key_exists($category['category_parent_id'], $allCats)) {
			$tempObj = $allCats[$category['category_parent_id']];
			$tempArr = $tempObj['children'];
			$tempArr[sizeof($tempArr)] = $category;
			
			$tempObj['children'] = $tempArr;
			$allCats[$category['category_parent_id']] = $tempObj;
		}
		else {
			$tempArr = array();
			$newCat = array();
			$tempArr[0] = $category;
			$newCat['children'] = $tempArr;
			$allCats[$category['category_parent_id']] = $newCat;
		}
	}
	while (sizeof($subCats) == 0) {
		$aCategories = myqu('SELECT DISTINCT ca.category_id, ca.description, 
			CASE WHEN count(card_id) > 0 THEN "true" ELSE "false" END hasCards,
			cx.category_parent_id
			FROM mytcg_category ca
			LEFT OUTER JOIN mytcg_category_x cx
			ON cx.category_child_id = ca.category_id
			LEFT OUTER JOIN mytcg_card c
			ON c.category_id = ca.category_id
			WHERE ca.category_id IN ('.$ids.')
			GROUP BY ca.category_id');
		
		$ids = '';
		foreach ($aCategories as $category) {
			if ($category['category_parent_id'] == $cat) {
				$subCats[sizeof($subCats)] = $category;
			}
			else if ($category['category_parent_id'] != "") {
				$ids.=(($ids=='')?$category['category_parent_id']:(','.$category['category_parent_id']));
			}
			
			if (array_key_exists($category['category_id'],$updated)) {
				$updated[$category['category_parent_id']] = 1;
				$updated[$category['category_id']] = 1;
			}
			
			if (array_key_exists($category['category_parent_id'], $allCats)) {
				$tempObj = $allCats[$category['category_parent_id']];
				$tempArr = $tempObj['children'];
				$tempArr[sizeof($tempArr)] = $category;
				
				$tempObj['children'] = $tempArr;
				$allCats[$category['category_parent_id']] = $tempObj;
			}
			else {
				$tempArr = array();
				$newCat = array();
				$tempArr[0] = $category;
				$newCat['children'] = $tempArr;
				$allCats[$category['category_parent_id']] = $newCat;
			}
			
			if (array_key_exists($category['category_id'], $allCats)) {
				$allCats['category_id']['detail'] = $category;
			}
		}
	}
	
	//we now have a list of all categories, and all sub categories of the chosen category
	//if the category only has one child, we want to go deeper, until there are options, or cards
	while (sizeof($subCats) == 1 && !($subCats[0]['hasCards'] == 'true')) {
		$subCats = $allCats[($subCats[0]['category_id'])]['children'];
	}
	
	$sOP='<usercategories>'.$sCRLF;
	$iCount=0;
	while ($aCategory=$subCats[$iCount]){
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
		$sOP.=$sTab.$sTab.'</album>'.$sCRLF;
		$iCount++;
	}
	$sOP.='</usercategories>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
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
if ($_GET['productcategories']) {
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
		if (hasProducts($aCategory['category_id']) == true) {
			$sOP.=$sTab.'<albumid>'.trim($aCategory['category_id']).'</albumid>'.$sCRLF;
			$sOP.=$sTab.'<albumname>'.trim($aCategory['description']).'</albumname>'.$sCRLF;
		}
		$iCount++;
	}
	$sOP.='</cardcategories>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//recurring function to check if a category has children with products
function hasProducts($categoryId) {
	$hasProdsQuery = myqu('SELECT count(*) prods 
		FROM mytcg_productcategory_x pc 
		INNER JOIN mytcg_product p
		ON p.product_id = pc.product_id
		WHERE p.in_stock > 0
		AND pc.category_id = '.$categoryId);
	$prods = $hasProdsQuery[0]['prods'];
	
	if ($prods > 0) {
		return true;
	}
	else {
		$catChildrenQuery = myqu('SELECT C.category_id, C.description 
			FROM mytcg_category C, mytcg_category_x X 
			WHERE C.CATEGORY_ID = X.CATEGORY_CHILD_ID 
			AND X.CATEGORY_PARENT_ID = '.$categoryId.' 
			AND C.is_deleted is null 
			ORDER BY C.description');
		$count = 0;
		while ($category = $catChildrenQuery[$count]) {
			if (hasProducts($category['category_id']) == true) {
				return true;
			}
			$count++;
		}
	}
	return false;
}

/** return a list of categories with auctions in them */
if ($_GET['auctioncategories']) {
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
		if (hasAuctions($aCategory['category_id']) == true) {
			$sOP.=$sTab.'<albumid>'.trim($aCategory['category_id']).'</albumid>'.$sCRLF;
			$sOP.=$sTab.'<albumname>'.trim($aCategory['description']).'</albumname>'.$sCRLF;
		}
		$iCount++;
	}
	$sOP.='</cardcategories>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//recurring function to check if a category has children with auctions
function hasAuctions($categoryId) {
	$hasAuctionsQuery = myqu('SELECT count(*) auctions
		FROM mytcg_card c
		INNER JOIN mytcg_usercard uc
		ON uc.card_id = c.card_id
		INNER JOIN mytcg_market ac
		ON uc.usercard_id = ac.usercard_id
		WHERE ac.marketstatus_id = 1 
		AND	c.category_id = '.$categoryId);
	$auctions = $hasAuctionsQuery[0]['auctions'];
	
	if ($auctions > 0) {
		return true;
	}
	else {
		$catChildrenQuery = myqu('SELECT C.category_id, C.description 
			FROM mytcg_category C, mytcg_category_x X 
			WHERE C.CATEGORY_ID = X.CATEGORY_CHILD_ID 
			AND X.CATEGORY_PARENT_ID = '.$categoryId.' 
			AND C.is_deleted is null 
			ORDER BY C.description');
		$count = 0;
		while ($category = $catChildrenQuery[$count]) {
			if (hasAuctions($category['category_id']) == true) {
				return true;
			}
			$count++;
		}
	}
	return false;
}

/** return a list of products in a category */
if ($_GET['categoryproducts']){
	$iCategoryId= $_REQUEST['categoryId'];

	$aProducts = array();
	$aProducts = getProducts($iCategoryId, $aProducts);
	
	$sOP='<categoryproducts>'.$sCRLF;
	$iCount=0;
	while ($aProduct=$aProducts[$iCount]){
		if ($aProduct['IN_STOCK'] > 0) {
			$sOP.=$sTab.'<productid>'.trim($aProduct['PRODUCT_ID']).'</productid>'.$sCRLF;
			$sOP.=$sTab.'<productname>'.trim($aProduct['DESCRIPTION']).'</productname>'.$sCRLF;
			$sOP.=$sTab.'<producttype>'.trim($aProduct['PACK_TYPE']).'</producttype>'.$sCRLF;
			$sOP.=$sTab.'<productprice>'.trim($aProduct['PRICE']).'</productprice>'.$sCRLF;
			$sOP.=$sTab.'<productnumcards>'.trim($aProduct['NO_OF_CARDS']).'</productnumcards>'.$sCRLF;
			$sOP.=$sTab.'<productthumb>'.trim($aProduct['IMAGEURL']).'</productthumb>'.$sCRLF;
		}
		$iCount++;
	}	
	$sOP.='</categoryproducts>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//recurring function to get all products within a category and its children. it take an array and adds onto it
function getProducts($categoryId, $products) {
	$prodsQuery = myqu('SELECT DISTINCT P.PRODUCT_ID, P.DESCRIPTION, M.DESCRIPTION PACK_TYPE, 
		P.PRICE, CONCAT(I.DESCRIPTION , "products/" , P.IMAGE , "_thumb.png") IMAGEURL, 
		P.NO_OF_CARDS, (CASE WHEN SUM(P.IN_STOCK) IS NULL THEN 0 ELSE SUM(P.IN_STOCK) END) AS IN_STOCK 
		FROM mytcg_category C, mytcg_imageserver I, 
		mytcg_productcategory_x PC, 
		mytcg_producttype M, mytcg_product P 
		WHERE PC.CATEGORY_ID = C.CATEGORY_ID 
		AND P.PRODUCT_ID = PC.PRODUCT_ID 
		AND M.producttype_id = P.producttype_id 
		AND I.IMAGESERVER_ID = P.THUMBNAIL_IMAGESERVER_ID 
		AND C.CATEGORY_ID = '.$categoryId.' 
		GROUP BY P.PRODUCT_ID 
		ORDER BY P.DESCRIPTION');
	
	$count = 0;
	$index = sizeof($products);
	
	while ($product = $prodsQuery[$count]) {
		$products[$index] = $product;
		
		$count++;
		$index++;
	}
	
	$catChildrenQuery = myqu('SELECT C.category_id, C.description 
		FROM mytcg_category C, mytcg_category_x X 
		WHERE C.CATEGORY_ID = X.CATEGORY_CHILD_ID 
		AND X.CATEGORY_PARENT_ID = '.$categoryId.' 
		AND C.is_deleted is null 
		ORDER BY C.description');
	$count = 0;
	while ($category = $catChildrenQuery[$count]) {
		$products = getProducts($category['category_id'], $products);
		$count++;
	}
	return $products;
}

/** give user details */
if ($_GET['userdetails']){
	global $iUserID;
	$aUserDetails=myqu('SELECT username, email_address, name, credits '
		.'FROM mytcg_user '
		.'WHERE user_id="'.$iUserID.'"');
	$sOP='<userdetails>'.$sCRLF;
	$sOP.=$sTab.'<username>'.trim($aUserDetails[0]['username']).'</username>'.$sCRLF;	
	$sOP.=$sTab.'<email>'.trim($aUserDetails[0]['email_address']).'</email>'.$sCRLF;
	$sOP.=$sTab.'<name>'.trim($aUserDetails[0]['name']).'</name>'.$sCRLF;
	$sOP.=$sTab.'<credits>'.trim($aUserDetails[0]['credits']).'</credits>'.$sCRLF;
	$sOP.=$sTab.'<status></status>'.$sCRLF;
	$sOP.='</userdetails>';
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
	
	//the searchString is sent through in base64, we need to decode it
	$searchstring=base64_decode($searchstring);

	$sql = 'SELECT DISTINCT UC.card_id, Q.quantity, UC.usercard_id, '
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
		$sOP.=$sTab.$sTab.'<thumburl>'.$sFound.'cards/'.$aOneCard['card_id'].'_thumb.png</thumburl>'.$sCRLF;
		
		//before setting the front and back urls, make sure the card is resized for the height
		$iHeight = resizeCard($iHeight, $iWidth, $aOneCard['card_id']);
		
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['front_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.$sTab.'<fronturl>'.$sFound.$iHeight.'/cards/'.$aOneCard['card_id'].'_front.png</fronturl>'.$sCRLF;

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.$sTab.'<backurl>'.$sFound.$iHeight.'/cards/'.$aOneCard['card_id'].'_back.png</backurl>'.$sCRLF; 
		
		$aStats=myqu('SELECT A.description as des, B.description as val, statvalue, 
		A.left, top, width, height, frontorback, 
		colour_r, colour_g, colour_b 
		FROM mytcg_cardstat A, mytcg_categorystat B 
		WHERE A.categorystat_id = B.categorystat_id 
		AND A.description <> ""
		AND A.description is NOT NULL
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

// register user 
function registerUser ($username, $password, $email, $name, $cell) {
	$sOP='';
	
	//check if the username is untaken
	$aUserDetails=myqu('SELECT username '
		.'FROM mytcg_user '
		.'WHERE username="'.$username.'"');
	if (sizeof($aUserDetails) > 0) {
		$sOP.='<result>';
		$sOP.='That username already exists.';
		$sOP.='</result>';
		return $sOP;
	}
	
	//check if the email address is already in the database
	$aUserDetails=myqu('SELECT email_address '
		.'FROM mytcg_user '
		.'WHERE email_address="'.$email.'"');
	if (sizeof($aUserDetails) > 0) {
		$sOP.='<result>';
		$sOP.='That email address is already in use.';
		$sOP.='</result>';
		return $sOP;
	}
	
	myqu("INSERT INTO mytcg_user (username, email_address, is_active, date_register, credits, name, cell) VALUES ('{$username}', '{$email}', 1, now(), 300, '{$name}', '{$cell}')");
	
	$aUserDetails=myqu("SELECT user_id, username FROM mytcg_user WHERE username = '{$username}'");
	$userId = $aUserDetails[0]['user_id'];
	$iMod=(intval($userId) % 10)+1;
	$crypPass = substr(md5($userId),$iMod,10).md5($password);
	myqu("UPDATE mytcg_user SET password = '{$crypPass}' WHERE user_id = {$userId}");
						 
	$aUserCards=myqu('SELECT * 
						FROM mytcg_tradecard
						WHERE detail = "'.$username.'"
						OR detail = "'.$password.'" 
						OR detail = '.$cell.'
						AND status_id = 0
						 ');
						
	$iCount=0;
	
	while ($aOneCard=$aUserCards[$iCount]){
		$aCheckCard=myqu('SELECT usercard_id,usercardstatus_id '
			.'FROM mytcg_usercard '
			.'WHERE usercardstatus_id = 1 '
			.'AND card_id = '.$aOneCard['card_id'].' '
			.'AND user_id = '.$aOneCard['user_id']);
		
		myqui('INSERT INTO mytcg_usercard
			(user_id, card_id, usercardstatus_id, is_new) 
			VALUES ('.$userId.', '.$aOneCard['card_id'].', 4, 1)');
		//myqui('UPDATE mytcg_usercard SET user_id = '.$aCheckUser[0]['user_id'].', usercardstatus_id = 4 '
			//	.' WHERE usercard_id = '.$aCheckCard[0]['usercard_id']);
			
		myqui('INSERT INTO mytcg_usercardnote
		(user_id, card_id, usercardnotestatus_id, note, date_updated)
		VALUES
		('.$userId.', '.$aOneCard['card_id'].', 1, "'.$aOneCard['note'].'", now())
		ON DUPLICATE KEY UPDATE 
		note = concat(note,"'.$aOneCard['note'].'"),
		date_updated = now()');
			
		$iCount++;
	}
	
	myqui('UPDATE mytcg_tradecard SET status_id = 1 WHERE detail = "'.$username.'" OR detail = "'.$email.'" OR detail = '.$cell.' AND status_id = 0');
	
	/*$sOP.='<result>';
	$sOP.='User created successfully!';
	$sOP.='</result>';*/
	$sOP.=usercategories(0,$iUserID);
	return $sOP;
}

/** 
	SOME JOOMLA
	the JUserHelper class copied from libraries/joomla/user/helper.php
	stripped al unused functions
*/


class JUserHelper
{
	function getCryptedPassword($plaintext, $salt = '', $encryption = 'md5-hex', $show_encrypt = false)
	{
		// Get the salt to use.
		$salt = JUserHelper::getSalt($encryption, $salt, $plaintext);

		// Encrypt the password.
		switch ($encryption)
		{
			case 'plain' :
				return $plaintext;

			case 'sha' :
				$encrypted = base64_encode(mhash(MHASH_SHA1, $plaintext));
				return ($show_encrypt) ? '{SHA}'.$encrypted : $encrypted;

			case 'crypt' :
			case 'crypt-des' :
			case 'crypt-md5' :
			case 'crypt-blowfish' :
				return ($show_encrypt ? '{crypt}' : '').crypt($plaintext, $salt);

			case 'md5-base64' :
				$encrypted = base64_encode(mhash(MHASH_MD5, $plaintext));
				return ($show_encrypt) ? '{MD5}'.$encrypted : $encrypted;

			case 'ssha' :
				$encrypted = base64_encode(mhash(MHASH_SHA1, $plaintext.$salt).$salt);
				return ($show_encrypt) ? '{SSHA}'.$encrypted : $encrypted;

			case 'smd5' :
				$encrypted = base64_encode(mhash(MHASH_MD5, $plaintext.$salt).$salt);
				return ($show_encrypt) ? '{SMD5}'.$encrypted : $encrypted;

			case 'aprmd5' :
				$length = strlen($plaintext);
				$context = $plaintext.'$apr1$'.$salt;
				$binary = JUserHelper::_bin(md5($plaintext.$salt.$plaintext));

				for ($i = $length; $i > 0; $i -= 16) {
					$context .= substr($binary, 0, ($i > 16 ? 16 : $i));
				}
				for ($i = $length; $i > 0; $i >>= 1) {
					$context .= ($i & 1) ? chr(0) : $plaintext[0];
				}

				$binary = JUserHelper::_bin(md5($context));

				for ($i = 0; $i < 1000; $i ++) {
					$new = ($i & 1) ? $plaintext : substr($binary, 0, 16);
					if ($i % 3) {
						$new .= $salt;
					}
					if ($i % 7) {
						$new .= $plaintext;
					}
					$new .= ($i & 1) ? substr($binary, 0, 16) : $plaintext;
					$binary = JUserHelper::_bin(md5($new));
				}

				$p = array ();
				for ($i = 0; $i < 5; $i ++) {
					$k = $i +6;
					$j = $i +12;
					if ($j == 16) {
						$j = 5;
					}
					$p[] = JUserHelper::_toAPRMD5((ord($binary[$i]) << 16) | (ord($binary[$k]) << 8) | (ord($binary[$j])), 5);
				}

				return '$apr1$'.$salt.'$'.implode('', $p).JUserHelper::_toAPRMD5(ord($binary[11]), 3);

			case 'md5-hex' :
			default :
				$encrypted = ($salt) ? md5($plaintext.$salt) : md5($plaintext);
				return ($show_encrypt) ? '{MD5}'.$encrypted : $encrypted;
		}
	}


	function getSalt($encryption = 'md5-hex', $seed = '', $plaintext = '')
	{
		// Encrypt the password.
		switch ($encryption)
		{
			case 'crypt' :
			case 'crypt-des' :
				if ($seed) {
					return substr(preg_replace('|^{crypt}|i', '', $seed), 0, 2);
				} else {
					return substr(md5(mt_rand()), 0, 2);
				}
				break;

			case 'crypt-md5' :
				if ($seed) {
					return substr(preg_replace('|^{crypt}|i', '', $seed), 0, 12);
				} else {
					return '$1$'.substr(md5(mt_rand()), 0, 8).'$';
				}
				break;

			case 'crypt-blowfish' :
				if ($seed) {
					return substr(preg_replace('|^{crypt}|i', '', $seed), 0, 16);
				} else {
					return '$2$'.substr(md5(mt_rand()), 0, 12).'$';
				}
				break;

			case 'ssha' :
				if ($seed) {
					return substr(preg_replace('|^{SSHA}|', '', $seed), -20);
				} else {
					return mhash_keygen_s2k(MHASH_SHA1, $plaintext, substr(pack('h*', md5(mt_rand())), 0, 8), 4);
				}
				break;

			case 'smd5' :
				if ($seed) {
					return substr(preg_replace('|^{SMD5}|', '', $seed), -16);
				} else {
					return mhash_keygen_s2k(MHASH_MD5, $plaintext, substr(pack('h*', md5(mt_rand())), 0, 8), 4);
				}
				break;

			case 'aprmd5' :
				/* 64 characters that are valid for APRMD5 passwords. */
				$APRMD5 = './0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

				if ($seed) {
					return substr(preg_replace('/^\$apr1\$(.{8}).*/', '\\1', $seed), 0, 8);
				} else {
					$salt = '';
					for ($i = 0; $i < 8; $i ++) {
						$salt .= $APRMD5 {
							rand(0, 63)
							};
					}
					return $salt;
				}
				break;

			default :
				$salt = '';
				if ($seed) {
					$salt = $seed;
				}
				return $salt;
				break;
		}
	}

	function genRandomPassword($length = 8)
	{
		$salt = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		$len = strlen($salt);
		$makepass = '';

		$stat = @stat(__FILE__);
		if(empty($stat) || !is_array($stat)) $stat = array(php_uname());

		mt_srand(crc32(microtime() . implode('|', $stat)));

		for ($i = 0; $i < $length; $i ++) {
			$makepass .= $salt[mt_rand(0, $len -1)];
		}

		return $makepass;
	}

}/** end JUserHelper Class */

function myqu($sQuery){
	$sMysqlConnectString='dedi94.flk1.host-h.net,userdex_1,xyhMNjj8,dex_db1';
	$aFileHandle=fopen('/usr/www/users/dexmykurcq/sqlq.log','a+');
//	$sMysqlConnectString='localhost,root,i1m2p#i$(),gamecard';
//	$aFileHandle=fopen('/usr/local/www/mytcg/sqlq.log','a+');
	/** truncate long queries */
	$sQueryCut=substr($sQuery,0,1024);
	fwrite($aFileHandle,date('H:i:s',time()).' '.$_SERVER['REMOTE_ADDR']
		.' '.$sQueryCut."\n");
	$aString=explode(',',$sMysqlConnectString);
	$aLink=mysqli_connect($aString[0],$aString[1],$aString[2],$aString[3]);
	$aResult=@mysqli_query($aLink, $sQuery);
	if (mysqli_error($aLink)){
		fwrite($aFileHandle,mysqli_error($aLink)."\n");
	}
	fclose($aFileHandle);
	$aOutput=array();
	$f=0;
	while ($aRow=@mysqli_fetch_array($aResult,MYSQL_BOTH)){
		$aOutput[$f]=$aRow;
		++$f;
	}
	@mysqli_free_result($aResult);
	mysqli_close($aLink);
	return $aOutput;
}

function myqui($sQuery){
  $sMysqlConnectString='dedi94.flk1.host-h.net,userdex_1,xyhMNjj8,dex_db1';
  $aFileHandle=fopen('/usr/www/users/dexmykurcq/sqlq.log','a+');
  $sQueryCut=substr($sQuery,0,1024);
  fwrite($aFileHandle,date('H:i:s',time()).' '.$_SERVER['REMOTE_ADDR']
    .' '.$sQueryCut."\n");
  
  $aString=explode(',',$sMysqlConnectString);
  $aLink=mysqli_connect($aString[0],$aString[1],$aString[2],$aString[3]);
  $aResult=@mysqli_query($aLink, $sQuery);
  if (mysqli_error($aLink)){
    fwrite($aFileHandle,mysqli_error($aLink)."\n");
  }
  fclose($aFileHandle);
  @mysqli_free_result($aResult);
  mysqli_close($aLink);
}
?>
