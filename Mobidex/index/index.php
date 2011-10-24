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
	
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	$ip = getip();
	$sOP = registerUser($username, $password, $email, $name, $cell, $iHeight, $iWidth, $root,$ip,$url);
	
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

/*$iUserID = 24;*/
/** exit if user not validated, send bye bye xml to be nice */
if ($iUserID == 0){
	$sOP='<user>'.$sCRLF;
	$sOP.=$sTab.'<result>Invalid User Details</result>'.$sCRLF;	
	$sOP.='</user>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;	
} else {
	$aUpdate=myqu('SELECT datediff(now(), IFNULL(mobile_date_last_visit,SUBTIME(now(),"1 0:0:0.0"))) dif, datediff(now(), IFNULL(date_last_visit,SUBTIME(now(),"1 0:0:0.0"))) webdif 
					FROM mytcg_user where user_id = '.$iUserID);
	
	$iUpdate=$aUpdate[0];
	if (($iUpdate['dif'] >= 1) && ($iUpdate['webdif'] >= 1)) {
		myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, sysnote)
			VALUES ('.$iUserID.', "If you are experiencing any difficulties please visit '.$url.'.", now(), 1)');
	}	
	myqui('UPDATE mytcg_user SET mobile_date_last_visit=now() WHERE user_id = '.$iUserID);
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
	
	$aUpdate=myqu('SELECT datediff(now(), IFNULL(version_check_date,SUBTIME(now(),"1 0:0:0.0"))) dif 
					FROM mytcg_user where user_id = '.$iUserID);
	
	$iUpdate=$aUpdate[0];
	if ($iUpdate['dif'] >= 1) {
		
		myqui('UPDATE mytcg_user SET version_check_date=now() WHERE user_id = '.$iUserID);
		
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
	}
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
  
  tradeCard($tradeMethod, $receiveNumber, $iUserID, $cardID, $sendNote);
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

/** get the date of the latest notification */
if ($_GET['notedate']){
	$notificationsUrlQuery = myqu('SELECT notedate FROM mytcg_notifications WHERE user_id = '.$iUserID.' AND sysnote = 0 ORDER BY notedate DESC');
	$sOP.='<notedate>'.trim($notificationsUrlQuery[0]['notedate']).'</notedate>'.$sCRLF;
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
	if (!($iBBHeight=$_GET['bbheight'])) {
		$iBBHeight = '0';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '0';
	}
	$lastCheckSeconds = "";
	if (!($lastCheckSeconds = $_GET['seconds'])) {
		$lastCheckSeconds = "0";
	}
	$sOP = cardsincategory($iCategory,$iHeight,$iWidth,$iShowAll,$lastCheckSeconds,$iUserID,$root, $iBBHeight, $jpg);
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
	
	$sOP.=usercategories($lastCheckSeconds,$iUserID);
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
	echo subcategories($lastCheckSeconds, $cat, $iUserID, '', '');
	exit;
	
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

/** give user details */
if ($_GET['userdetails']){
	if (!($iHeight=$_GET['height'])) {
		$iHeight = '350';
	}
	if (!($iWidth=$_GET['width'])) {
		$iWidth = '250';
	}
	if (!($jpg=$_GET['jpg'])) {
		$jpg = '0';
	}
	echo userdetails($iUserID,$iHeight,$iWidth,$root,$jpg);
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
		$jpg = '0';
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
		.'GROUP BY C.card_id '
		.'ORDER BY CS.top ASC';
				
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
?>
