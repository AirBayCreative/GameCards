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

//new game constants
$ng_ai = "1";
$ng_pvp = "2";

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
	$cards = array();
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
		
		$card;
		if ($cards[$iCardID] == null) {
			$card = array();
			$card['cardId'] = $iCardID;
			$card['quantity'] = 1;
		}
		else {
			$card = $cards[$iCardID];
			$card['quantity'] = $card['quantity']+1;
		}
		$cards[$iCardID] = $card;
  }
	
	//we can remove one of the products from stock though
	myqui("UPDATE mytcg_product SET in_stock=in_stock-1 WHERE product_id={$packID}");
	
	return $cards;
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
	$cards = array();
	
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
					
		//GIVE THE CARD TO THE USER
		$aCards=myqui("INSERT mytcg_usercard (user_id, card_id, usercardstatus_id)
			SELECT {$userID}, {$iCardID}, usercardstatus_id
			FROM mytcg_usercardstatus
			WHERE description = 'Album'");
		
		$card;
		if ($cards[$iCardID] == null) {
			$card = array();
			$card['cardId'] = $iCardID;
			$card['quantity'] = 1;
		}
		else {
			$card = $cards[$iCardID];
			$card['quantity'] = $card['quantity']+1;
		}
		$cards[$iCardID] = $card;
	}
	
	//we can remove one of the products from stock though
	myqui("UPDATE mytcg_product SET in_stock=in_stock-1 WHERE product_id={$packID}");
	
	return $cards;
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
		$iHeight = '350';
  }
  if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
  }
	if (!($iFreebie=$_GET['freebie'])) {
		$iFreebie = -1;
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
  $iCreditsQuery=myqu("SELECT credits, freebie FROM mytcg_user WHERE user_id='{$iUserID}'");
  $iCredits=$iCreditsQuery[0]['credits'];
	$hasFreebie=$iCreditsQuery[0]['freebie'];
  
  //Total order cost
  $itemCost = $aDetails[0]['price'];
  $bValid = ($iCredits >= $itemCost);
	
	$iFreebie = (($iFreebie > 0)&&($hasFreebie==0))?1:0;
  
	//echo '$bValid: '.$bValid.'$iFreebie: '.$iFreebie.' $iCredits: '.$iCredits.' $itemCost:'.$itemCost.' $iUserID:'.$iUserID;
	
  if ($bValid || $iFreebie > 0)
  {
		if ($iFreebie <= 0) {
			//PAY FOR PRODUCT
			$iCreditsAfterPurchase = $iCredits - $itemCost;
			$aCreditsLeft=myqui("UPDATE mytcg_user SET credits={$iCreditsAfterPurchase} WHERE user_id='{$iUserID}'");
		} else {
			myqui("UPDATE mytcg_user SET freebie = 1 WHERE user_id='{$iUserID}'");
		}
    
		$packCards = array();
    //RECEIVE ITEM
    if ($aDetails[0]['pack_type'] == "starter"){
      $packCards = openStarter($iUserID,$iProductID);
    }
    elseif($aDetails[0]['pack_type'] == "booster"){
      $packCards = openBooster($iUserID,$iProductID);
    }
		
		$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
			.'FROM mytcg_imageserver b '
			.'ORDER BY b.description DESC '
		);
		
		$sOP = '<cards>';
		foreach ($packCards as $card) {
		
			//get the card details
			$aCardDetails=myqu('SELECT c.card_id,c.description,c.front_phone_imageserver_id, c.value, c.ranking, 
				c.back_phone_imageserver_id, c.thumbnail_phone_imageserver_id,cq.description quality_name,c.image, n.note 
				FROM mytcg_card c 
				INNER JOIN mytcg_cardquality AS cq 
				ON (c.cardquality_id = cq.cardquality_id) 
				LEFT OUTER JOIN 
				(SELECT note, date_updated, user_id, card_id 
					FROM mytcg_usercardnote 
					WHERE user_id = '.$iUserID.' 
					AND usercardnotestatus_id = 1 
				) n 
				ON n.card_id = c.card_id 
				WHERE c.card_id='.$card['cardId']);
			
			$sOP.= $sTab.'<card>'.$sCRLF;
			$sOP.= $sTab.$sTab.'<cardid>'.$aCardDetails[0]['card_id'].'</cardid>'.$sCRLF;
			$sOP.= $sTab.$sTab.'<image_id>'.$aCardDetails[0]['image'].'</image_id>'.$sCRLF;
			$sOP.= $sTab.$sTab.'<description>'.$aCardDetails[0]['description'].'</description>'.$sCRLF;
			$sOP.= $sTab.$sTab.'<quality>'.$aCardDetails[0]['quality_name'].'</quality>'.$sCRLF;
			$sOP.= $sTab.$sTab.'<quantity>'.$card['quantity'].'</quantity>'.$sCRLF;
			$sOP.= $sTab.$sTab.'<ranking>'.$aCardDetails[0]['ranking'].'</ranking>'.$sCRLF;
			$sOP.= $sTab.$sTab.'<value>'.$aCardDetails[0]['value'].'</value>'.$sCRLF;
			
			//before setting the front and back urls, make sure the card is resized for the height
			$iHeight = resizeCard($iHeight, $iWidth, $aCardDetails[0]['image']);
			
			$sFound='';
			$iCountServer=0;
			while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
				if ($aOneServer['imageserver_id']==$aCardDetails[0]['thumbnail_phone_imageserver_id']){
					$sFound=$aOneServer['URL'];
				} else {
					$iCountServer++;
				}
			}
			
			$sOP.=$sTab.'<thumburl>'.$sFound.'/cards/'.$aCardDetails[0]['image'].'_thumb.png</thumburl>'.$sCRLF; 
			
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
			$sOP.=$sTab.'<frontflipurl>'.$sFound.$iHeight.'/cards/'.$aCardDetails[0]['image'].'_front_flip.png</frontflipurl>'.$sCRLF;

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
			$sOP.=$sTab.'<backflipurl>'.$sFound.$iHeight.'/cards/'.$aCardDetails[0]['image'].'_back_flip.png</backflipurl>'.$sCRLF; 
			
			$sOP.= $sTab.$sTab.'<note>'.$aCardDetails[0]['note'].'</note>'.$sCRLF;
			
			$sOP.= $sTab.'</card>'.$sCRLF;
		}
		$sOP .= '</cards>';
		header('xml_length: '.strlen($sOP));
		echo $sOP;
		exit;
  }
  $sOP = '<result>Insufficient funds.</result>';
  header('xml_length: '.strlen($sOP));
  echo $sOP;
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
		$query = "SELECT max(price) as price, user_id, date_of_transaction "
							."from mytcg_marketcard "
							."where market_id = ".$auctionCardId." "
							."group by price "
							."ORDER BY date_of_transaction DESC";
		$result = myqu($query);
		
		if ($aBid=$result[0]) {
			if ($aBid['user_id'] == $iUserID) {
				echo $sTab.'<result>You are already the highest bidder.</result>'.$sCRLF;
				exit;
			}
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
		
		$query = "select credits from mytcg_user where user_id = ".$iUserID;
		$result = myqu($query);
		$credits = $result[0]['credits'];
		
		
		echo $sTab.'<credits>'.$credits.'</credits><result>You are now the highest bidder.</result>'.$sCRLF;
	}
	else {
		echo $sTab.'<result>You do not have enough credits.</result>'.$sCRLF;
	}
  exit;
}

//BUYOUT AN AUCTION
if ($_GET['buyauctionnow']){
	$auctionCardId = $_GET['auctioncardid'];

  //SELECT USERS CURRENT CREDITS
	$query = "select credits from mytcg_user where user_id = ".$iUserID;
  $result = myqu($query);
  $credits = $result[0]['credits'];
	
	//Select details of the auction
	$query = "SELECT price, usercard_id FROM mytcg_market WHERE market_id = ".$auctionCardId;
  $result = myqu($query);
  $buyNowPrice = $result[0]['price'];
	$userCardId = $result[0]['usercard_id'];
  
	if ($credits >= $buyNowPrice) {
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
//cardsincategory 
function cardsincategory($iCategory,$iHeight,$iWidth,$iShowAll,$lastCheckSeconds,$iUserID,$iDeckID) {
	if (!($iHeight)) {
		$iHeight = '350';
	}
	if (!($iWidth)) {
		$iWidth = '250';
	}
	if (!($iDeckID)) {
		$iDeckID = -1;
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
		$aCards=myqu('SELECT A.card_id, count(*) quantity, B.image, A.usercard_id, B.value, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, B.ranking, D.description quality,
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated  
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON B.card_id=B.card_id 
					INNER JOIN mytcg_cardquality D
					ON B.cardquality_id=D.cardquality_id
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
					UNION 
					SELECT B.card_id, 0, B.image, 0, B.value, 
					B.description, "", "", "", B.ranking, D.description quality, 
					0, "", 0 
					FROM mytcg_card B 
					INNER JOIN mytcg_cardquality D
					ON B.cardquality_id=D.cardquality_id
					WHERE B.card_id NOT IN (SELECT uc.card_id from mytcg_usercard uc, mytcg_usercardstatus ucs 
						where uc.user_id = '.$iUserID.' and uc.usercardstatus_id = ucs.usercardstatus_id and ucs.usercardstatus_id=1) 
					GROUP BY B.card_id 
					ORDER BY description');
	} else if ($iCategory == -2) {
		$aCards=myqu('SELECT A.card_id, count(*) quantity, B.image, A.usercard_id,  B.value, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, B.ranking, D.description quality,
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated 
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON A.card_id=B.card_id 
					INNER JOIN mytcg_cardquality D
					ON B.cardquality_id=D.cardquality_id
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
	} else if ($iCategory == -3) {
		$aCards=myqu('SELECT A.card_id, count(*) quantity, B.image, A.usercard_id,  B.value, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, B.ranking, D.description quality,
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated  
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON A.card_id=B.card_id 
					INNER JOIN mytcg_cardquality D
					ON B.cardquality_id=D.cardquality_id
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
	} else if ($iShowAll == 0){
		$aCards=myqu('SELECT A.card_id, count(*) quantity, B.image, A.usercard_id,  B.value, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, B.ranking, D.description quality,
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated  
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON A.card_id=B.card_id 
					INNER JOIN mytcg_cardquality D
					ON B.cardquality_id=D.cardquality_id
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
	} else if($iDeckID > -1){
		$aCards=myqu('SELECT A.card_id, count(*) quantity, B.image, A.usercard_id,  B.value, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, B.ranking, D.description quality,
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated  
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON A.card_id=B.card_id 
					INNER JOIN mytcg_cardquality D
					ON B.cardquality_id=D.cardquality_id
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
					AND A.deck_id='.$iDeckID.' 
					AND C.usercardstatus_id=1 	
					GROUP BY B.card_id ');
	} else {
		$aCards=myqu('SELECT A.card_id, count(*) quantity, B.image, A.usercard_id,  B.value, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, B.ranking, D.description quality,
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated  
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON A.card_id=B.card_id 
					INNER JOIN mytcg_cardquality D
					ON B.cardquality_id=D.cardquality_id
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
					GROUP BY B.card_id 
					UNION 
					SELECT B.card_id, 0, B.image, 0,  B.value, 
					B.description, "", "", "", B.ranking, D.description quality, 
					0, "", 0 
					FROM mytcg_card B 
					INNER JOIN mytcg_cardquality D
					ON B.cardquality_id=D.cardquality_id
					WHERE (B.category_id='.$iCategory.' OR B.category_id IN (SELECT category_child_id FROM mytcg_category_x WHERE category_parent_id = '.$iCategory.')) 
					AND B.card_id NOT IN (SELECT uc.card_id from mytcg_usercard uc, mytcg_usercardstatus ucs 
						where uc.user_id = '.$iUserID.' and uc.usercardstatus_id = ucs.usercardstatus_id and ucs.usercardstatus_id=1) 
					GROUP BY B.card_id 
					ORDER BY description');
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
		$sOP.=$sTab.$sTab.'<ranking>'.$aOneCard['ranking'].'</ranking>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<quality>'.$aOneCard['quality'].'</quality>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<value>'.$aOneCard['value'].'</value>'.$sCRLF;
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
		$iHeight = resizeCard($iHeight, $iWidth, $aOneCard['image']);
		
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
		$sOP.=$sTab.$sTab.'<frontflipurl>'.$sFound.$iHeight.'/cards/'.$aOneCard['image'].'_front_flip.png</frontflipurl>'.$sCRLF;

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
		$sOP.=$sTab.$sTab.'<backflipurl>'.$sFound.$iHeight.'/cards/'.$aOneCard['image'].'_back_flip.png</backflipurl>'.$sCRLF; 

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
	return $sOP;
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
	
	$sOP = cardsincategory($iCategory,$iHeight,$iWidth,$iShowAll,$lastCheckSeconds,$iUserID, -1);
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
	
	if ($iWidth > 520) {
		//for now, max = 520
		$iWidth = 520;
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
	
	$iRotateHeight = ($iHeight-40<=0)?$iHeight:$iHeight-40;
	$iRotateWidth = ($iWidth-40<=0)?$iWidth:$iWidth-40;
	
	//Check and create new resized front image
	$filenameResized = $dir.$iImage.'_front.png';
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new SimpleImage();
		$image->load($filename);
		$image->resizeToHeight($iHeight);
		$image->save($filenameResized);
	}
	
	$filename = '../img/cards/'.$iImage.'_front.png';
	$filenameResized = $dir.$iImage.'_front_flip.png';
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new SimpleImage();
		$image->load($filename);
		$image->rotateToHeight($iRotateWidth, $iRotateHeight);
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
	
	$filename = '../img/cards/'.$iImage.'_back.png';
	$filenameResized = $dir.$iImage.'_back_flip.png';
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new SimpleImage();
		$image->load($filename);
		$image->rotateToHeight($iRotateWidth, $iRotateHeight);
		$image->save($filenameResized);
	}
	
	//we need to resize the gc.png image for this size, if it hasnt been done yet.
	$filename = '../img/cards/gc.png';
	$filenameResized = $dir.'gc.png';
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new SimpleImage();
		$image->load($filename);
		$image->resizeToHeight($iHeight - 60);
		$image->save($filenameResized);
	}
	
	$filename = '../img/cards/gc.png';
	$filenameResized = $dir.'gcFlip.png';
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new SimpleImage();
		$image->load($filename);
		$image->rotateToHeight($iRotateWidth, $iRotateHeight);
		$image->save($filenameResized);
	}
	
	return $iHeight;
}

function resizeGCCard($iHeight, $iWidth) {
	//we need to check if the width after scaling would be too wide for the screen.
	$filename = '../img/cards/gc.png';
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
		die('gc card image missing -> '.$filename);
	}
	
	//we want a maximum image size, so larger devices dont have to download huge images
	if ($iHeight > 520) {
		//for now, max = 520
		$iHeight = 520;
	}
	
	if ($iWidth > 520) {
		//for now, max = 520
		$iWidth = 520;
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
	
	$iRotateHeight = ($iHeight-40<=0)?$iHeight:$iHeight-40;
	$iRotateWidth = ($iWidth-40<=0)?$iWidth:$iWidth-40;
	
	//we need to resize the gc.png image for this size, if it hasnt been done yet.
	$filename = '../img/cards/gc.png';
	$filenameResized = $dir.'gc.png';
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new SimpleImage();
		$image->load($filename);
		$image->resizeToHeight($iHeight - 60);
		$image->save($filenameResized);
	}
	
	$filename = '../img/cards/gc.png';
	$filenameResized = $dir.'gcFlip.png';
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new SimpleImage();
		$image->load($filename);
		$image->rotateToHeight($iRotateWidth, $iRotateHeight);
		$image->save($filenameResized);
	}
	
	return $iHeight;
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
		$iHeight = resizeCard($iHeight, $iWidth, $aOneCard['image']);
		
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

//recurring function to get all cards on auction within a category and its children
function getAuctionCards($categoryId, $cards, $iUserID) {
	$aAuctionCards = myqu('SELECT ac.market_id, uc.usercard_id, c.card_id, c.description, ac.minimum_bid, 
		ac.price buy_now_price, c.thumbnail_phone_imageserver_id, c.back_phone_imageserver_id, c.front_phone_imageserver_id, 
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
		AND ac.user_id <> '.$iUserID.' 
		AND datediff(now(), ac.date_expired) <= 0
		AND
		(ab.price = (select max(price) from mytcg_marketcard a where a.market_id = ac.market_id group by market_id)
		OR ISNULL(ab.price))
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
		$cards = getAuctionCards($category['category_child_id'], $cards, $iUserID);
		$count++;
	}
	
	return $cards;
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
	
	$sOP = loadGame($gameId, $iUserID, $iHeight, $iWidth);
	
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
		$sOP = loadGame($gameId, $iUserID, $iHeight, $iWidth);
	}
	
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

//takes a game on the results and sets it to the select stat phase
function continueGame($gameId, $iUserID, $iHeight, $iWidth) {
	$gamePhaseQuery = myqu('SELECT g.gamephase_id, lower(gp.description) as description
		FROM mytcg_game g
		INNER JOIN mytcg_gamephase gp
		ON g.gamephase_id = gp.gamephase_id
		WHERE g.game_id = '.$gameId);
	
	$gamePhase = $gamePhaseQuery[0]['description'];
	
	if ($gamePhase == 'stat') {
		
		//if the player is playing against the ai, the ai needs to make a move, if the ai is the active user
		//get the admins userId
		$adminUserIdQuery = myqu('SELECT user_id 
			FROM mytcg_user 
			WHERE username = "admin"');
		$adminUserId = $adminUserIdQuery[0]['user_id'];
		
		$adminPlayerIdQuery = myqu('SELECT gameplayer_id, is_active  
			FROM mytcg_gameplayer 
			WHERE user_id = '.$adminUserId
			.' AND game_id = '.$gameId);
		if (sizeof($adminPlayerIdQuery) > 0) {
			//check that the ai is the active player
			$aiIsActive = $adminPlayerIdQuery[0]['is_active'];
			$aiPlayerId = $adminPlayerIdQuery[0]['gameplayer_id'];
			
			if ($aiIsActive == '1') {
				// we need to get the best stat for the ai to pick, so we need their top card first
				$adminTopCardQuery = myqu('SELECT min(pos), gameplayercard_id
					FROM mytcg_gameplayercard
					WHERE gameplayer_id = '.$aiPlayerId.'  
					AND gameplayercardstatus_id = 1 
					GROUP BY pos');
				$adminTopCard = $adminTopCardQuery[0]['gameplayercard_id'];
				
				//then get the best stat for them to pick
				$adminBestStatQuery = myqu('SELECT cs.cardstat_id, cs.categorystat_id, cs.description, cs.statvalue, ave.average, 
					cs.statvalue/ave.average picking_value, c.description card_name, ave.stat_type
					FROM mytcg_gameplayercard gpc
					INNER JOIN mytcg_usercard uc
					ON uc.usercard_id = gpc.usercard_id
					INNER JOIN mytcg_card c
					ON c.card_id= uc.card_id
					INNER JOIN mytcg_cardstat cs
					ON cs.card_id = c.card_id
					INNER JOIN (SELECT sum(cs.statvalue)/count(cs.statvalue) average, cs.categorystat_id, cats.description stat_type
					FROM mytcg_cardstat cs
					INNER JOIN mytcg_categorystat cats
					ON cats.categorystat_id = cs.categorystat_id
					GROUP BY cs.categorystat_id) ave
					ON ave.categorystat_id = cs.categorystat_id
					WHERE gpc.gameplayercard_id = '.$adminTopCard.'  
					ORDER BY picking_value DESC');
				
				//perform the stat selection
				selectStat($iUserID, $adminUserId, $gameId, $adminBestStatQuery[0]['categorystat_id']);
			}
		}
	}
}

//load a game and return relevant xml
function loadGame($gameId, $userId, $iHeight, $iWidth) {
	//get the game phase
	$gamePhaseQuery = myqu('SELECT g.gamephase_id, lower(gp.description) as description
		FROM mytcg_game g
		INNER JOIN mytcg_gamephase gp
		ON g.gamephase_id = gp.gamephase_id
		WHERE g.game_id = '.$gameId);
	
	$gamePhase = $gamePhaseQuery[0]['description'];
	
	//we will always return the phase
	$sOP='<game>'.$sCRLF;
	
	//depending on the phase, we build different xml
	if ($gamePhase == 'stat') {
		//for this phase we need to return a list of the stats for the users selected phase, if the user is the active player
		//so first we select the active user
		$activeUserQuery = myqu('SELECT is_active 
			FROM mytcg_gameplayer 
			WHERE user_id = '.$userId.' 
			AND game_id = '.$gameId);
		$isActive = $activeUserQuery[0]['is_active'];
		
		$sOP.='<active>'.$isActive.'</active>';
		
		//we need the date of the last move
		$lastMoveQuery = myqu('SELECT date, gamelog_id 
			FROM mytcg_gamelog 
			WHERE game_id = '.$gameId.' 
			ORDER BY gamelog_id DESC 
			LIMIT 1');
		$lastMove = $lastMoveQuery[0]['date'];
		
		$sOP.='<lastmove>'.$lastMove.'</lastmove>';
		
		//we need to get the amount of cards left in each deck
		$cardsQuery = myqu('SELECT count(gpc.gameplayercard_id) cards, gp.user_id 
			FROM mytcg_gameplayercard gpc
			INNER JOIN mytcg_gameplayer gp
			ON gp.gameplayer_id = gpc.gameplayer_id
			WHERE gp.game_id = '.$gameId.' 
			GROUP BY gp.gameplayer_id');
		
		$count = 0;
		while ($cards = $cardsQuery[$count]) {
			$count++;
			if ($cards['user_id'] == $userId) {
				$sOP.='<usercards>'.$cards['cards'].'</usercards>';
			}
			else {
				$sOP.='<oppcards>'.$cards['cards'].'</oppcards>';
			}
		}
		
		//we return the user's card regardless of whether they are active or not
		//we need to get the gameplayercard_id of the selected card
		$selectedGameCardIdQuery = myqu('SELECT MIN(gpc.pos) position, gpc.gameplayercard_id, c.image, 
			c.front_phone_imageserver_id, c.back_phone_imageserver_id, c.card_id
		FROM mytcg_gameplayer gp
		INNER JOIN mytcg_gameplayercard gpc
		ON gpc.gameplayer_id = gp.gameplayer_id
		INNER JOIN mytcg_gameplayercardstatus gpcs
		ON gpcs.gameplayercardstatus_id = gpc.gameplayercardstatus_id
		INNER JOIN mytcg_usercard uc
		ON gpc.usercard_id = uc.usercard_id
		INNER JOIN mytcg_card c
		ON uc.card_id = c.card_id
		WHERE lower(gpcs.description) = "normal"
		AND gp.game_id = '.$gameId.' 
		AND gp.user_id = '.$userId.' 
		GROUP BY gpc.pos');
		
		$selectedGameCardId = $selectedGameCardIdQuery[0]['gameplayercard_id'];
		
		$sOP.=$sTab.'<usercard>'.$sCRLF; 
		//the getCardStats function reutrns xml of the stats, but it needs the gameplayercard_id
		$sOP.=getCardStats($selectedGameCardId);
		$sOP.=$sTab.'<cardid>'.$selectedGameCardIdQuery[0]['card_id'].'</cardid>'.$sCRLF; 
		$sOP.=$sTab.'<gameplayercard_id>'.$selectedGameCardIdQuery[0]['gameplayercard_id'].'</gameplayercard_id>'.$sCRLF; 
		
		//if we are loading a game, then the card image url is not on the phone yet, so we need to send it through here
		//get the image server stuff
		$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
			.'FROM mytcg_imageserver b '
			.'ORDER BY b.description DESC '
		);
		
		//before setting the front and back urls, make sure the card is resized for the height
		$iHeight = resizeCard($iHeight, $iWidth, $selectedGameCardIdQuery[0]['image']);
		
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$selectedGameCardIdQuery[0]['front_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		
		$sOP.=$sTab.'<fronturl>'.$sFound.$iHeight.'/cards/'.$selectedGameCardIdQuery[0]['image'].'_front.png</fronturl>'.$sCRLF;
		$sOP.=$sTab.'<frontflipurl>'.$sFound.$iHeight.'/cards/'.$selectedGameCardIdQuery[0]['image'].'_front_flip.png</frontflipurl>'.$sCRLF;

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$selectedGameCardIdQuery[0]['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		
		$sOP.=$sTab.'<backurl>'.$sFound.$iHeight.'/cards/'.$selectedGameCardIdQuery[0]['image'].'_back.png</backurl>'.$sCRLF; 
		$sOP.=$sTab.'<backflipurl>'.$sFound.$iHeight.'/cards/'.$selectedGameCardIdQuery[0]['image'].'_back_flip.png</backflipurl>'.$sCRLF;
		$sOP.=$sTab.'</usercard>'.$sCRLF;
		
		//we return the opponent's card too
		//we need to get the gameplayercard_id of the selected card
		$selectedGameCardIdQuery = myqu('SELECT MIN(gpc.pos) position, gpc.gameplayercard_id, c.image, 
			c.front_phone_imageserver_id, c.back_phone_imageserver_id, c.card_id
		FROM mytcg_gameplayer gp
		INNER JOIN mytcg_gameplayercard gpc
		ON gpc.gameplayer_id = gp.gameplayer_id
		INNER JOIN mytcg_gameplayercardstatus gpcs
		ON gpcs.gameplayercardstatus_id = gpc.gameplayercardstatus_id
		INNER JOIN mytcg_usercard uc
		ON gpc.usercard_id = uc.usercard_id
		INNER JOIN mytcg_card c
		ON uc.card_id = c.card_id
		WHERE lower(gpcs.description) = "normal"
		AND gp.game_id = '.$gameId.' 
		AND gp.user_id != '.$userId.' 
		GROUP BY gpc.pos');
		
		$selectedGameCardId = $selectedGameCardIdQuery[0]['gameplayercard_id'];
		
		$sOP.=$sTab.'<oppcard>'.$sCRLF; 
		//the getCardStats function reutrns xml of the stats, but it needs the gameplayercard_id
		$sOP.=getCardStats($selectedGameCardId);
		$sOP.=$sTab.'<cardid>'.$selectedGameCardIdQuery[0]['card_id'].'</cardid>'.$sCRLF; 
		$sOP.=$sTab.'<gameplayercard_id>'.$selectedGameCardIdQuery[0]['gameplayercard_id'].'</gameplayercard_id>'.$sCRLF; 
		
		//if we are loading a game, then the card image url is not on the phone yet, so we need to send it through here
		//get the image server stuff
		$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
			.'FROM mytcg_imageserver b '
			.'ORDER BY b.description DESC '
		);
		
		//before setting the front and back urls, make sure the card is resized for the height
		$iHeight = resizeCard($iHeight, $iWidth, $selectedGameCardIdQuery[0]['image']);
		
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$selectedGameCardIdQuery[0]['front_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		
		$sOP.=$sTab.'<fronturl>'.$sFound.$iHeight.'/cards/'.$selectedGameCardIdQuery[0]['image'].'_front.png</fronturl>'.$sCRLF;
		$sOP.=$sTab.'<frontflipurl>'.$sFound.$iHeight.'/cards/'.$selectedGameCardIdQuery[0]['image'].'_front_flip.png</frontflipurl>'.$sCRLF;

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$selectedGameCardIdQuery[0]['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		
		$sOP.=$sTab.'<backurl>'.$sFound.$iHeight.'/cards/'.$selectedGameCardIdQuery[0]['image'].'_back.png</backurl>'.$sCRLF; 
		$sOP.=$sTab.'<backflipurl>'.$sFound.$iHeight.'/cards/'.$selectedGameCardIdQuery[0]['image'].'_back_flip.png</backflipurl>'.$sCRLF;
		$sOP.=$sTab.'</oppcard>'.$sCRLF;
		
		//we need to return the url for the gc.png card, which has hopefully been resized for the users's phone.
		$sOP.=$sTab.'<gcurl>'.$sFound.$iHeight.'/cards/gc.png</gcurl>'.$sCRLF;
		$sOP.=$sTab.'<gcurlflip>'.$sFound.$iHeight.'/cards/gcFlip.png</gcurlflip>'.$sCRLF;
	}
	else if ($gamePhase == 'result') {
		//results will load the last log from mytcg_gamelog, and set the user's pending off
		$lastResultQuery = myqu('SELECT message
			FROM mytcg_gamelog
			WHERE game_id = '.$gameId.' 
			ORDER BY gamelog_id desc');
		
		$sOP.='<explanation>'.$sCRLF;
		$sOP.=$lastResultQuery[0]['message'].$sCRLF;
		$sOP.='</explanation>'.$sCRLF;
		
		//we also need to turn off the pending for the user
		myqu('UPDATE mytcg_gameplayer SET pending = 0 WHERE user_id = '.$userId.' AND game_id = '.$gameId);
		
		//and if neither user is pending, end the game
		$pendingQuery = myqu('SELECT count(*) pending_users FROM mytcg_gameplayer WHERE game_id = '.$gameId);
		$pending = $pendingQuery[0]['pending_users'];
		if ($pending == 0) {
			//set the gamephase to incomplete
			myqu('UPDATE mytcg_game SET gamestatus_id = 2 WHERE game_id = '.$gameId);
		}
	}
	else if ($gamePhase == 'lfm') {
		//we need to return the url for the gc.png card
		$height = resizeGCCard($iHeight, $iWidth);
		$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
		$sOP.='<gcurl>'.$imageUrlQuery[0]['description'].$height.'/cards/gc.png</gcurl>'.$sCRLF;
		$sOP.='<gcurlflip>'.$imageUrlQuery[0]['description'].$height.'/cards/gcFlip.png</gcurlflip>'.$sCRLF;
		
		//we need to update the date_start field to show that the user is still looking for a game
		myqu('UPDATE mytcg_game SET date_start = now() WHERE game_id = '.$gameId);
	}
	
	$sOP.='<phase>'.$sCRLF;
	$sOP.=$gamePhase.$sCRLF;
	$sOP.='</phase>'.$sCRLF;
	$sOP.='</game>'.$sCRLF;
	
	return $sOP;
}

//get a list of stats assigned to a card
function getCardStats($gamePlayerCardId) {
	
	//select card stat details
	$cardStatDetails = myqu('SELECT c.description card_name, cst.description stat_type,
		cs.description stat_description, cs.cardstat_id, cs.left, 
		cs.top, cs.width, cs.height, cs.frontorback, cs.statvalue, 
		cs.colour_r, cs.colour_g, cs.colour_b, cst.categorystat_id 
		FROM mytcg_gameplayercard gpc
		INNER JOIN mytcg_usercard uc
		ON uc.usercard_id = gpc.usercard_id
		INNER JOIN mytcg_card c
		ON c.card_id = uc.card_id
		INNER JOIN mytcg_cardstat cs
		ON cs.card_id = c.card_id
		INNER JOIN mytcg_categorystat cst
		ON cst.categorystat_id = cs.categorystat_id
		WHERE gpc.gameplayercard_id = '.$gamePlayerCardId);
	
	//build xml of the user's card stats
	$sOP='<cardstats>'.$sCRLF;
	$iCount=0;
	while ($oneStat=$cardStatDetails[$iCount]){
		$sOP.=$sTab.'<cardstat left="'.$oneStat['left'].'" top="'.$oneStat['top'].'" 
			width="'.$oneStat['width'].'" height="'.$oneStat['height'].'" frontorback="'.$oneStat['frontorback'].'"
			red="'.$oneStat['colour_r'].'" green="'.$oneStat['colour_g'].'" blue="'.$oneStat['colour_b'].'" ival="'.$oneStat['statvalue'].'">';
		if ($iCount == 0) {
			$sOP.=$sTab.'<card_name>'.$oneStat['card_name'].'</card_name>'.$sCRLF;
		}
		
		$sOP.=$sTab.'<stat_type>'.$oneStat['stat_type'].'</stat_type>'.$sCRLF;
		$sOP.=$sTab.'<stat_description>'.$oneStat['stat_description'].'</stat_description>'.$sCRLF;		
		$sOP.=$sTab.'<cardstat_id>'.$oneStat['cardstat_id'].'</cardstat_id>'.$sCRLF;
		$sOP.=$sTab.'<categorystat_id>'.$oneStat['categorystat_id'].'</categorystat_id>'.$sCRLF;
		$sOP.=$sTab.'</cardstat>';
		$iCount++;
	}
	$sOP.='</cardstats>'.$sCRLF;
	return $sOP;
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
	$sOP = loadGame($gameId, $iUserID, $iHeight, $iWidth);
	
	//send xml with results back to the user
	header('xml_length: '.strlen($sOP));
	echo $sOP;
}

//given the user's id, opponent's id and selected stat type, we can find the outcome and continue the game accordingly
//and return the xml for the front end
function selectStat($userId, $oppUserId, $gameId, $statTypeId) {
	//get the opponent's user_id and player_id
	$oppPlayerIdQuery = myqu('SELECT gp.gameplayer_id, u.username 
		FROM mytcg_gameplayer gp 
		INNER JOIN mytcg_user u 
		ON u.user_id = gp.user_id 
		WHERE gp.user_id = '.$oppUserId
		.' AND gp.game_id = '.$gameId);
	$oppPlayerId = $oppPlayerIdQuery[0]['gameplayer_id'];
	$oppPlayerUsername = $oppPlayerIdQuery[0]['username'];
	
	//get the users player_id
	$userPlayerIdQuery = myqu('SELECT gp.gameplayer_id, u.username 
		FROM mytcg_gameplayer gp 
		INNER JOIN mytcg_user u 
		ON u.user_id = gp.user_id 
		WHERE gp.user_id = '.$userId
		.' AND gp.game_id = '.$gameId);
	$userPlayerId = $userPlayerIdQuery[0]['gameplayer_id'];
	$userPlayerUsername = $userPlayerIdQuery[0]['username'];
	
	//get stat value and typeId for user
	$cardStatDetails = myqu('SELECT gpc.pos position, gpc.gameplayercard_id, c.description card_name, cs.statvalue, cs.description statdescription
		FROM mytcg_gameplayercard gpc
		INNER JOIN mytcg_usercard uc
		ON uc.usercard_id = gpc.usercard_id
		INNER JOIN mytcg_card c
		ON c.card_id = uc.card_id
		INNER JOIN mytcg_cardstat cs
		ON cs.card_id = c.card_id
		INNER JOIN mytcg_gameplayercardstatus gpcs
		ON gpcs.gameplayercardstatus_id = gpc.gameplayercardstatus_id
		INNER JOIN mytcg_categorystat cats
		ON cats.categorystat_id = cs.categorystat_id
		WHERE lower(gpcs.description) = "normal"
		AND gpc.gameplayer_id = '.$userPlayerId.' 
		AND cs.categorystat_id = '.$statTypeId.' 
		ORDER BY gpc.pos ASC');
	$userCardId = $cardStatDetails[0]['gameplayercard_id'];
	$userStatValue = $cardStatDetails[0]['statvalue'];
	$userStatDescription = $cardStatDetails[0]['statdescription'];
	$userCardName = $cardStatDetails[0]['card_name'];
	
	//get selected card and statvalue for the opponent
	$oppCardDetails = myqu('SELECT gpc.pos position, gpc.gameplayercard_id, c.description card_name, cs.statvalue, cs.description statdescription, cats.description stattype
		FROM mytcg_gameplayercard gpc
		INNER JOIN mytcg_usercard uc
		ON uc.usercard_id = gpc.usercard_id
		INNER JOIN mytcg_card c
		ON c.card_id = uc.card_id
		INNER JOIN mytcg_cardstat cs
		ON cs.card_id = c.card_id
		INNER JOIN mytcg_gameplayercardstatus gpcs
		ON gpcs.gameplayercardstatus_id = gpc.gameplayercardstatus_id
		INNER JOIN mytcg_categorystat cats
		ON cats.categorystat_id = cs.categorystat_id
		WHERE lower(gpcs.description) = "normal"
		AND gpc.gameplayer_id = '.$oppPlayerId.' 
		AND cs.categorystat_id = '.$statTypeId.' 
		ORDER BY gpc.pos ASC');
	$oppCardId = $oppCardDetails[0]['gameplayercard_id'];
	$oppCardName = $oppCardDetails[0]['card_name'];
	$oppStatValue = $oppCardDetails[0]['statvalue'];
	$oppStatDescription = $oppCardDetails[0]['statdescription'];
	$statType = $oppCardDetails[0]['stattype'];
	
	//by default we set the gameplayerstatus_id to pending after a move, but if its an AI user, we must set it to waiting
	$oppStatusId = '1';
	//get the admins userId
	$adminUserIdQuery = myqu('SELECT user_id 
		FROM mytcg_user 
		WHERE username = "admin"');
	$adminUserId = $adminUserIdQuery[0]['user_id'];
	
	$adminPlayerId = myqu('SELECT gameplayer_id 
		FROM mytcg_gameplayer 
		WHERE user_id = '.$adminUserId
		.' AND game_id = '.$gameId);
	//check if the game is against AI
	if (sizeof($adminPlayerId) > 0) {
		$oppStatusId = '2';
	}
	
	$winnerId = 0;//the winner and loser ids will be set in the following if, and then the cards assigned afterwards.
	$loserId = 0;
	$exp = '';
	//give the player with the higher stat both cards
	//we can also build a string explaining what happened, that we will send back to the user, and save for the opponent
	//in addition, as per normal trumps rules, whoever wins gets to pick the next stat.
	if ($oppStatValue > $userStatValue) {
		//the opponent won, set the last result and active player
		$exp = $oppPlayerUsername.' won! Their '.$statType.' of '.$oppStatDescription.
			' beat '.$userPlayerUsername.'\\\'s '.$userCardName.' with a '.$statType.
			' of '.$userStatDescription.'.';
		myqu('UPDATE mytcg_gameplayer SET is_active = 1, gameplayerstatus_id = '.$oppStatusId.' WHERE gameplayer_id = '.$oppPlayerId);
		
		myqu('UPDATE mytcg_gameplayer SET is_active = 0, gameplayerstatus_id = 1 WHERE gameplayer_id = '.$userPlayerId);
		
		//set the winner and loser ids
		$winnerId = $oppPlayerId;
		$loserId = $userPlayerId;
	}
	else if ($oppStatValue < $userStatValue) {
		//the user won, set the last result and active player
		$exp = $userPlayerUsername.' won! Their '.$statType.' of '.$userStatDescription.
			' beat '.$oppPlayerUsername.'\\\'s '.$oppCardName.' with a '.$statType.
			' of '.$oppStatDescription.'.';
		myqu('UPDATE mytcg_gameplayer SET is_active = 0, gameplayerstatus_id = '.$oppStatusId.' WHERE gameplayer_id = '.$oppPlayerId);
		
		myqu('UPDATE mytcg_gameplayer SET is_active = 1, gameplayerstatus_id = 1 WHERE gameplayer_id = '.$userPlayerId);
		
		//set active player
		$winnerId = $userPlayerId;
		$loserId = $oppPlayerId;
	}
	else {
		//it was a draw
		$exp = 'Draw! Your opponent\\\'s '.$statType.' of '.$oppStatDescription.
			' equals your\\\'s!';
		myqu('UPDATE mytcg_gameplayer SET gameplayerstatus_id = 1 WHERE gameplayer_id = '.$userPlayerId);
		myqu('UPDATE mytcg_gameplayer SET gameplayerstatus_id = '.$oppStatusId.' WHERE gameplayer_id = '.$oppPlayerId);
			
		//in the case of a draw, the active player stays the same.
		//we need to set the card ids to 'pending'
		myqu('UPDATE mytcg_gameplayercard SET gameplayercardstatus_id = 2 WHERE gameplayercard_id IN ('.$oppCardId.','.$userCardId.')');
	}
	
	//add the log message, so players can see what happened.
	myqu('INSERT INTO mytcg_gamelog 
		(game_id, date, message, categorystat_id) 
		VALUES('.$gameId.', now(), \''.$exp.'\', '.$statTypeId.')');
	
	//if there was a winner, assign cards
	if ($winnerId != 0 && $loserId != 0) {
		//get the current max pos for the winner
		$posQuery = myqu('SELECT max(pos) + 1 pos
     FROM mytcg_gameplayercard
     WHERE gameplayer_id = '.$winnerId);
		$pos = $posQuery[0]['pos'];
		
		//get the cards that need to change ownership
		$cards = myqu('SELECT gameplayercard_id
			FROM mytcg_gameplayercard
			WHERE (gameplayercardstatus_id = 2
				AND (gameplayer_id = '.$winnerId.' 
					OR gameplayer_id = '.$loserId.' ))
			OR (pos = (SELECT min(pos)
					FROM mytcg_gameplayercard
					WHERE gameplayercardstatus_id = 1
					AND gameplayer_id = '.$loserId.')
				AND gameplayer_id = '.$loserId.')');
		
		//set their gameplayer_id's to the winner's
		$count = 0;
		while ($card=$cards[$count]) {
			//and repeat for each one
			myqu('UPDATE mytcg_gameplayercard
				SET pos = '.$pos.',
				gameplayer_id = '.$winnerId.',
				gameplayercardstatus_id = 1 
				WHERE gameplayercard_id = '.$card['gameplayercard_id']);
			$count++;
			$pos++;
		}
		
		//get the card that won the round
		$winningCardQuery = myqu('SELECT min(pos), gameplayercard_id
			FROM mytcg_gameplayercard
			WHERE gameplayer_id = '.$winnerId.' 
			AND gameplayercardstatus_id = 1 
			GROUP BY pos');
		$winningCardId = $winningCardQuery[0]['gameplayercard_id'];
		//and update its position
		myqu('UPDATE mytcg_gameplayercard
			SET pos = '.$pos.' 
			WHERE gameplayercard_id = '.$winningCardId);
	}
	
	//we need to check if the game is over. that is, if one of the players has no more playable cards.
	$gameOverQuery = myqu('SELECT count(gameplayercard_id) cards, gameplayer_id 
		FROM mytcg_gameplayercard 
		WHERE gameplayer_id in ('.$userPlayerId.', '.$oppPlayerId.') 
		AND gameplayercardstatus_id = 1 
		GROUP BY gameplayer_id');
	
	$draw = false; //if both have no playable cards, the game is a draw
	$over = true; //if either of then have no playable cards, the game is over
	$winnerId = 0;
	
	if (sizeof($gameOverQuery) == 0) {
		$draw = true;
	}
	else if (sizeof($gameOverQuery) == 1) {
		$winnerId = $gameOverQuery[0]['gameplayer_id'];
	}
	else {
		$over = false;
	}
	
	//if the game is over, we can set the phase to results, and add an entry to mytcg_gamelog
	if ($over) {
		$exp = '';
		if ($draw) {
			$exp = 'The game ended in a draw!';
		}
		else {
			$winnerName = '';
			if ($winnerId == $userPlayerId) {
				$winnerName = $userPlayerUsername;
			}
			else {
				$winnerName = $oppPlayerUsername;
			}
			$exp = $winnerName.' wins!';
		}
		
		//add the log message, so players can see the outcome
		myqu('INSERT INTO mytcg_gamelog 
			(game_id, date, message, categorystat_id) 
			VALUES('.$gameId.', now(), \''.$exp.'\', 0)');
		//and set the game phase to results
		$gamePhaseIdQuery = myqu('SELECT gamephase_id 
			FROM mytcg_gamephase 
			WHERE description = "result"');
		$resultStatus = $gamePhaseIdQuery[0]['gamephase_id'];
		myqu('UPDATE mytcg_game SET gamephase_id = '.$resultStatus.' WHERE game_id = '.$gameId);
		myqu('UPDATE mytcg_gameplayer SET pending = 1 WHERE game_id = '.$gameId);
	}
}

//given the user's id and game id, populate the mytcg_gameplayercard
function initialiseGame($iUserID, $gameId) {
	//we need to get both players' gameplayer_id, and the categoryId
	$userPlayerIdQuery = myqu('SELECT gp.gameplayer_id, g.category_id 
		FROM mytcg_gameplayer gp 
		INNER JOIN mytcg_game g 
		ON g.game_id = gp.game_id 
		WHERE gp.user_id = '.$iUserID.' 
		AND gp.game_id = '.$gameId);
	$userPlayerId = $userPlayerIdQuery[0]['gameplayer_id'];
	$categoryId = $userPlayerIdQuery[0]['category_id'];
	$oppPlayerIdQuery = myqu('SELECT gameplayer_id, user_id  
		FROM mytcg_gameplayer 
		WHERE user_id != '.$iUserID
		.' AND game_id = '.$gameId);
	$opponentId = $oppPlayerIdQuery[0]['user_id'];
	$oppPlayerId = $oppPlayerIdQuery[0]['gameplayer_id'];
	
	//create random deck for the players from their available cards.
	//first we will need a list of cards for the players in the category.
	$userCards = array();
	$oppCards = array();
	
	//this will require some recursion, as the category given is the second highest level,
	// and the cards are an unknown amount of subcategories deep.
	//$userCards = getAllUserCatCards($iUserID, $categoryId, $userCards);
	//$oppCards = getAllUserCatCards($opponentId, $categoryId, $oppCards);
	
	//we need to get a list of all the child categories of the one given
	$categories = getAllCatChildren($categoryId, $userCards);
	$categoryString = $categoryId;
	foreach ($categories as $category) {
		$categoryString.=','.$category['category_child_id'];
	}
	$userCardsQuery = myqu('SELECT c.card_id, uc.usercard_id
		FROM mytcg_usercard uc
		INNER JOIN mytcg_card c
		ON uc.card_id = c.card_id
		INNER JOIN mytcg_usercardstatus ucs
		ON ucs.usercardstatus_id = uc.usercardstatus_id
		WHERE c.category_id in ('.$categoryString.')
		AND uc.user_id = '.$iUserID.' 
		AND lower(ucs.description) = "album" 
		ORDER BY c.avgranking DESC, c.card_id');
	$oppCardsQuery = myqu('SELECT c.card_id, uc.usercard_id
		FROM mytcg_usercard uc
		INNER JOIN mytcg_card c
		ON uc.card_id = c.card_id
		INNER JOIN mytcg_usercardstatus ucs
		ON ucs.usercardstatus_id = uc.usercardstatus_id
		WHERE c.category_id in ('.$categoryString.')
		AND uc.user_id = '.$opponentId.' 
		AND lower(ucs.description) = "album" 
		ORDER BY c.avgranking DESC, c.card_id');
	
	$userCards = array();
	$oppCards = array();
	//we just need to make sure the users dont end up with more than 4 of a card in their decks
	$maxCardCopies = 2;
	$currentCard = 0;
	$cardCount = 0;
	foreach ($userCardsQuery as $card) {
		if ($card['card_id'] != $currentCard) {
			$currentCard = $card['card_id'];
			$cardCount = 0;
		}
		else {
			$cardCount++;
		}
		if ($cardCount < $maxCardCopies) {
			$userCards[sizeof($userCards)] = $card;
		}
	}
	
	$currentCard = 0;
	$cardCount = 0;
	foreach ($oppCardsQuery as $card) {
		if ($card['card_id'] != $currentCard) {
			$currentCard = $card['card_id'];
			$cardCount = 0;
		}
		else {
			$cardCount++;
		}
		if ($cardCount < $maxCardCopies) {
			$oppCards[sizeof($oppCards)] = $card;
		}
	}
	
	//the standard deck size is 20, but for now I am going to set it to 10, for testing
	//$deckSize = 10;
	$deckSize = sizeof($userCards) > sizeof($oppCards)? sizeof($oppCards):sizeof($userCards);
	$deckSize = $deckSize - ($deckSize % 5);
	$deckSize = $deckSize > 10?10:$deckSize;
	
	$userCards = array_slice($userCards, 0, $deckSize);
	$oppCards = array_slice($oppCards, 0, $deckSize);
	
	shuffle($userCards);
	shuffle($oppCards);
	
	//for now we will use a random selection of the cards
	//maybe later we will base it on rareity or use another method
	//$userKeys = array_rand($userCards, $deckSize);
	//$oppKeys = array_rand($oppCards, $deckSize);
	
	//insert created decks into player cards, all statuses normal
	$pos = 0;
	foreach ($userCards as $card) {
		myqu('INSERT INTO mytcg_gameplayercard 
			(gameplayer_id, usercard_id, gameplayercardstatus_id, pos) 
			SELECT '.$userPlayerId.', '.$card['usercard_id'].', gameplayercardstatus_id, '.$pos.' 
			FROM mytcg_gameplayercardstatus 
			WHERE lower(description) = "normal"');
		$pos++;
	}
	
	$pos = 0;
	foreach ($oppCards as $card) {
		myqu('INSERT INTO mytcg_gameplayercard 
			(gameplayer_id, usercard_id, gameplayercardstatus_id, pos) 
			SELECT '.$oppPlayerId.', '.$card['usercard_id'].', gameplayercardstatus_id, '.$pos.' 
			FROM mytcg_gameplayercardstatus 
			WHERE lower(description) = "normal"');
		$pos++;
	}
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
		$height = resizeGCCard($iHeight, $iWidth);
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
		$height = resizeGCCard($iHeight, $iWidth);
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
		$height = resizeGCCard($iHeight, $iWidth);
		$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
		$sOP.=$sTab.'<gcurl>'.$imageUrlQuery[0]['description'].$height.'/cards/gc.png</gcurl>'.$sCRLF;
		$sOP.=$sTab.'<gcurlflip>'.$imageUrlQuery[0]['description'].$height.'/cards/gcFlip.png</gcurlflip>'.$sCRLF;
	}
	$sOP.='</game>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	
	exit;
}

//recurring method used to get a list of all children of a category, as well as all their children etc
function getAllCatChildren($categoryId,$results) {
	$categories = myqu('SELECT cx.category_child_id
		FROM mytcg_category_x cx
		WHERE cx.category_parent_id = '.$categoryId);
		
	$count = 0;
	while ($category=$categories[$count]) {
		//and repeat for each one
		$results[sizeof($results)] = $category;
		$results = getAllCatChildren($category['category_child_id'], $results);
		$count++;
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
		INNER JOIN (SELECT COUNT(gpc.gameplayercard_id) playerDeck, gpc.gameplayer_id
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
		$sOP = subcategories($lastCheckSeconds, $aCategory['category_id'], $iUserID, $aMine, $aCard);
	}
	
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}


function subcategories($lastCheckSeconds, $cat, $iUserID, $aMine, $aCard) {
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
	
	if ($aMine['cnt'] > 0) {
		$sOP.=$sTab.'<album>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<albumid>-2</albumid>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<hascards>true</hascards>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<updated>0</updated>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<albumname>My Cards</albumname>'.$sCRLF;
		$sOP.=$sTab.'</album>'.$sCRLF;
	}
	if ($aCard['cnt'] > 0) {
		$sOP.=$sTab.'<album>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<albumid>-3</albumid>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<hascards>true</hascards>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<updated>1</updated>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<albumname>New Cards</albumname>'.$sCRLF;
		$sOP.=$sTab.'</album>'.$sCRLF;
	}
	
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
	//echo $sOP;
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
	echo subcategories($lastCheckSeconds, $cat, $iUserID, '', '');
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
			FROM mytcg_category_x) ORDER BY c.description');
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

//recurring function to check if a category has children with products
function hasProducts($categoryId, $iFreebie) {
	if ($iFreebie == 1) {
		$hasProdsQuery = myqu('SELECT count(*) prods 
			FROM mytcg_productcategory_x pc 
			INNER JOIN mytcg_product p
			ON p.product_id = pc.product_id
			WHERE p.in_stock > 0
			AND p.freebie = 1
			AND pc.category_id = '.$categoryId);
	} else {
		$hasProdsQuery = myqu('SELECT count(*) prods 
			FROM mytcg_productcategory_x pc 
			INNER JOIN mytcg_product p
			ON p.product_id = pc.product_id
			WHERE p.in_stock > 0
			AND pc.category_id = '.$categoryId);
	}
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
			if (hasProducts($category['category_id'], $iFreebie) == true) {
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

//recurring function to check if a category has children with auctions
function hasAuctions($categoryId, $iUserID) {
	$hasAuctionsQuery = myqu('SELECT count(*) auctions
		FROM mytcg_card c
		INNER JOIN mytcg_usercard uc
		ON uc.card_id = c.card_id
		INNER JOIN mytcg_market ac
		ON uc.usercard_id = ac.usercard_id
		WHERE ac.marketstatus_id = 1 
		AND uc.user_id <> '.$iUserID.' 
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
			if (hasAuctions($category['category_id'], $iUserID) == true) {
				return true;
			}
			$count++;
		}
	}
	return false;
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

//recurring function to get all products within a category and its children. it take an array and adds onto it
function getProducts($categoryId, $products, $iFreebie) {
	if ($iFreebie == 1) {
		$prodsQuery = myqu('SELECT DISTINCT P.PRODUCT_ID, P.DESCRIPTION, M.DESCRIPTION PACK_TYPE, 
			P.PRICE, CONCAT(I.DESCRIPTION , "products/" , P.IMAGE , "_thumb.png") IMAGEURL, 
			P.NO_OF_CARDS, (CASE WHEN SUM(P.IN_STOCK) IS NULL THEN 0 ELSE SUM(P.IN_STOCK) END) AS IN_STOCK 
			FROM mytcg_category C, mytcg_imageserver I, 
			mytcg_productcategory_x PC, 
			mytcg_producttype M, mytcg_product P 
			WHERE PC.CATEGORY_ID = C.CATEGORY_ID 
			AND P.freebie = 1
			AND P.PRODUCT_ID = PC.PRODUCT_ID 
			AND M.producttype_id = P.producttype_id 
			AND I.IMAGESERVER_ID = P.THUMBNAIL_IMAGESERVER_ID 
			AND C.CATEGORY_ID = '.$categoryId.' 
			GROUP BY P.PRODUCT_ID 
			ORDER BY P.DESCRIPTION');
	} else {
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
		}
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
		$products = getProducts($category['category_id'], $products, $iFreebie);
		$count++;
	}
	return $products;
}

/** give user details */
if ($_GET['userdetails']){
	global $iUserID;
	echo userdetails($iUserID);
	exit;
}

function userdetails($iUserID) {
	$aUserDetails=myqu('SELECT username, email_address, credits, freebie '
		.'FROM mytcg_user '
		.'WHERE user_id="'.$iUserID.'"');
	$sOP='<userdetails>'.$sCRLF;
	$sOP.=$sTab.'<username>'.trim($aUserDetails[0]['username']).'</username>'.$sCRLF;	
	$sOP.=$sTab.'<email>'.trim($aUserDetails[0]['email_address']).'</email>'.$sCRLF;
	$sOP.=$sTab.'<credits>'.trim($aUserDetails[0]['credits']).'</credits>'.$sCRLF;
	$sOP.=$sTab.'<freebie>'.trim($aUserDetails[0]['freebie']).'</freebie>'.$sCRLF;
	$sOP.=$sTab.'<status></status>'.$sCRLF;
	
	$aUserTransactions=myqu('SELECT description FROM mytcg_credits WHERE userid = '.$iUserID.' ORDER BY creditid DESC LIMIT 10');
	
	$sOP.='</userdetails>';
	header('xml_length: '.strlen($sOP));
	return $sOP;
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
	
	$aAnswered=myqu('SELECT answered
					FROM mytcg_user_answer 
					WHERE answer_id='.$iAnswerID);
										
	$aCredits=myqu('SELECT credit_value, description
					FROM mytcg_user_detail 
					WHERE detail_id = (SELECT detail_id
										FROM mytcg_user_answer
										WHERE answer_id='.$iAnswerID.')');
	$aCredit=$aCredits[0];
	$aAnswer=$aAnswered[0];
	if ($aAnswer['answered'] == 0) {
		myqui('INSERT mytcg_transactionlog (user_id, description, date, val)
				VALUES ('.$iUserID.', "Received '.$aCredit['credit_value'].' credits for answering '.$aCredit['description'].'", now(), '.$aCredit['credit_value'].')');
		
		myqui('UPDATE mytcg_user SET credits = credits + '.$aCredit['credit_value'].' WHERE user_id ='.$iUserID);
				
		$aCount=myqu('SELECT answer_id
					FROM mytcg_user_answer 
					WHERE answered=0
					AND user_id='.$iUserID);
		
		$iSize = sizeof($aCount);
		if ($iSize==1){
			myqui('INSERT mytcg_transactionlog (user_id, description, date, val)
					SELECT '.$iUserID.', descript, now(), val
					FROM mytcg_transactiondescription
					WHERE transactionid = 5');	
					
			myqui('UPDATE mytcg_user SET credits = credits + IFNULL((SELECT val FROM mytcg_transactiondescription WHERE transactionid = 5),0) WHERE user_id ='.$iUserID);
		}
	}
	
	myqui('UPDATE mytcg_user_answer 
			SET answer = "'.$iAnswer.'", 
			answered = 1 
			WHERE answer_id = "'.$iAnswerID.'"');
		
	myqui('update mytcg_user
			set credits = credits + IFNULL((select credit_value 
											from mytcg_user_detail 
											where detail_id = (select detail_id
																from mytcg_user_answer
																where answer_id='.$iAnswerID.'
																AND answered = 0)), 0)
			where user_id = '.$iUserID);
	
	$sOP = "<result>1</result>";
	header('xml_length: '.strlen($sOP));
	echo $sOP;
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

/** for logging credit changes */
function logtransaction($iDescription, $iValue, $iUserID) {
	myqui('INSERT INTO mytcg_transactionlog (user_id, description, value, date) 
			VALUES('.$iUserID.',"'.$iDescription.'",'.$iValue.',now())');
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
	
	$sOP = cardsincategory(0,$iHeight,$iWidth,1,$lastCheckSeconds,$iUserID,$iDeckID);
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
		$iHeight = resizeCard($iHeight, $iWidth, $aOneCard['image']);
		
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

// register user 
function registerUser ($username, $password, $email) {
	$sOP='';
	
	$aUserDetails=myqu("SELECT user_id, username FROM mytcg_user WHERE username = '{$username}'");
	if (sizeof($aUserDetails) > 0) {
		$userId = $aUserDetails[0]['user_id'];
		$aValidUser=myqu(
								"SELECT user_id, username, password, date_last_visit, credits "
								."FROM mytcg_user "
								."WHERE username='".$username."' "
								."AND is_active='1'"
		);
		$iUserID=$aValidUser[0]["user_id"];
		$iMod=(intval($iUserID) % 10)+1;
		$sPassword=substr(md5($iUserID),$iMod,10).md5($password);
		if ($sPassword!=$aValidUser[0]['password']){
			$iUserID=0;
		} else {
			echo userdetails($iUserID);
			exit;
		}
	}
	if ($iUserID==0) {
		
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
		
		myqu("INSERT INTO mytcg_user (username, email_address, is_active, date_register, credits) VALUES ('{$username}', '{$email}', 1, now(), 300)");
		
		
		$aUserDetails=myqu("SELECT user_id, username FROM mytcg_user WHERE username = '{$username}'");
		$iUserID = $aUserDetails[0]['user_id'];
		$iMod=(intval($iUserID) % 10)+1;
		$crypPass = substr(md5($iUserID),$iMod,10).md5($password);
		myqu("UPDATE mytcg_user SET password = '{$crypPass}' WHERE user_id = {$iUserID}");
		
		//create the empty data fields in mytcg_user_answer
		myqu("INSERT INTO mytcg_user_answer
			(detail_id, user_id)
			SELECT detail_id, {$iUserID}
			FROM mytcg_user_detail");
			
		myqui('INSERT mytcg_transactionlog (user_id, description, date, val)
			SELECT '.$iUserID.', descript, now(), val
			FROM mytcg_transactiondescription
			WHERE transactionid = 2');
		
		//return userdetails
		echo userdetails($iUserID);
		exit;
	}
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
	$sMysqlConnectString='dedi94.flk1.host-h.net,mytcg_dev,g4m3c4rd98,gamecard_dev';
	$aFileHandle=fopen('/usr/www/users/dmytcg/sqlq.log','a+');
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
  $sMysqlConnectString='dedi94.flk1.host-h.net,mytcg_dev,g4m3c4rd98,gamecard_dev';
  $aFileHandle=fopen('/usr/www/users/dmytcg/sqlq.log','a+');
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
