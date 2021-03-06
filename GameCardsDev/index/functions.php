<?php
include('class.upload.php');
include('dbconnection.php');

define('ACHI_INC','1'); 
define('ACHI_TOT','2'); 

//i just made this for convenience
function resizeThumbs($root) {
	$iImage = 71;
	while ($iImage <= 108) {
		$filename = $root.'img/cards/'.$iImage.'_thumb.png';
		
		if(file_exists($filename)){
			$image = new Upload($filename);
			$image->image_resize = true;
			$image->image_ratio_x = true;
			$image->image_y = 64;
			$image->Process($root.'img/cards/');
		}
		$iImage++;
	}
}
function resizeCard($iHeight, $iWidth, $iImage, $root, $iBBHeight=0, $jpg=1) {

	//we need to check if the width after scaling would be too wide for the screen.
	$ext = '.png';
	$image_type=IMAGETYPE_PNG;
	
	if ($jpg) {
		$ext = '.jpg';
		$image_type=IMAGETYPE_JPEG;
	}
	
	$filename = $root.'img/cards/'.$iImage.'_front'.$ext;
	if (file_exists($filename)) {
		$image = new Upload($filename);
		$ratio = $iHeight / $image->image_src_y;
		if (($ratio * ($image->image_src_x)) > $iWidth) {
			$ratio = $iWidth / $image->image_src_x;
			$iHeight =  intval($ratio * $image->image_src_y);
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
	chmod($root.'img',0777);
	$dir = $root.'img/'.$iHeight;
	if (!is_dir($dir)){
		if (!mkdir($dir, 0777, true)) {
			die('Failed to create folders -> '.$dir);
		}
	}
	$dir .= "/cards";
	if ($iBBHeight) {
		$dir .= "bb";
	}
	if (!is_dir($dir)){
		if (!mkdir($dir, 0777, true)) {
			die('Failed to create folders -> '.$dir);
		}
	}
	$dir .= "/";
	
	$iRotateWidth = ($iWidth-40<=0)?$iWidth:$iWidth-40;
	$iRotateHeight = ($iHeight-40<=0)?$iHeight:$iHeight-40;
	$iBBRotateHeight =  ($iBBHeight-20<=0)?$iBBHeight:$iBBHeight-20;
	
	//Check and create new resized front image
	$filenameResized = $dir.$iImage.'_front'.$ext;
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new Upload($filename);
		$image->image_resize = true;
		$image->image_ratio_x = true;
		$image->image_y = $iHeight;
		$image->Process($dir);
	}
	
	$filename = $root.'img/cards/'.$iImage.'_front'.$ext;
	$filenameResized = $dir.$iImage.'_front_flip'.$ext;
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new Upload($filename);
		$image->image_resize = true;
		$image->file_new_name_body = $iImage.'_front_flip';
		if ($iBBHeight) {
			$ratio = $iRotateWidth / $image->image_src_y;
			$cardwidth = $image->image_src_x * $ratio;
			if ($iBBRotateHeight/2 < $cardwidth) {
				$cardwidth = $iBBRotateHeight/2;
				$ratio = $cardwidth / $image->image_src_x;
				$iRotateWidth = $image->image_src_y * $ratio;
			}
			$image->image_x = $cardwidth;
			$image->image_y = $iRotateWidth;
			
			$image->image_rotate = '90';
		} else {
			$ratio = $iRotateWidth / $image->image_src_y;
			$cardwidth = $image->image_src_x * $ratio;
			if ($iRotateHeight/2 < $cardwidth) {
				$cardwidth = $iRotateHeight/2;
				$ratio = $cardwidth / $image->image_src_x;
				$iRotateWidth = $image->image_src_y * $ratio;
			}
			$image->image_x = $cardwidth;
			$image->image_y = $iRotateWidth;
			
			$image->image_rotate = '90';
		}
		$image->Process($dir);
	}
	
	//Check and create new resized back image
	$filename = $root.'img/cards/'.$iImage.'_back'.$ext;
	$filenameResized = $dir.$iImage.'_back'.$ext;
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new Upload($filename);
		$image->image_resize = true;
		$image->image_ratio_x = true;
		$image->image_y = $iHeight;
		$image->Process($dir);
	}
	
	$filename = $root.'img/cards/'.$iImage.'_back'.$ext;
	$filenameResized = $dir.$iImage.'_back_flip'.$ext;
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new Upload($filename);
		$image->image_resize = true;
		$image->file_new_name_body = $iImage.'_back_flip';
		if ($iBBHeight) {
			$ratio = $iRotateWidth / $image->image_src_y;
			$cardwidth = $image->image_src_x * $ratio;
			if ($iBBRotateHeight/2 < $cardwidth) {
				$cardwidth = $iBBRotateHeight/2;
				$ratio = $cardwidth / $image->image_src_x;
				$iRotateWidth = $image->image_src_y * $ratio;
			}
			$image->image_x = $cardwidth;
			$image->image_y = $iRotateWidth;
			
			$image->image_rotate = '90';
		} else {
			$ratio = $iRotateWidth / $image->image_src_y;
			$cardwidth = $image->image_src_x * $ratio;
			if ($iRotateHeight/2 < $cardwidth) {
				$cardwidth = $iRotateHeight/2;
				$ratio = $cardwidth / $image->image_src_x;
				$iRotateWidth = $image->image_src_y * $ratio;
			}
			$image->image_x = $cardwidth;
			$image->image_y = $iRotateWidth;
			
			$image->image_rotate = '90';
		}
		$image->Process($dir);
	}
	
	//we need to resize the gc image for this size, if it hasnt been done yet.
	$filename = $root.'img/cards/gc'.$ext;
	$filenameResized = $dir.'gc'.$ext;
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new Upload($filename);
		$image->image_resize = true;
		$image->image_ratio_x = true;
		$image->image_y = $iHeight - 60;
		$image->Process($dir);
	}
	
	$filename = $root.'img/cards/gc'.$ext;
	$filenameResized = $dir.'gcFlip'.$ext;
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new Upload($filename);
		$image->image_resize = true;
		$image->file_new_name_body = 'gcFlip';
		if ($iBBHeight) {
			$ratio = $iRotateWidth / $image->image_src_y;
			$cardwidth = $image->image_src_x * $ratio;
			if ($iBBRotateHeight/2 < $cardwidth) {
				$cardwidth = $iBBRotateHeight/2;
				$ratio = $cardwidth / $image->image_src_x;
				$iRotateWidth = $image->image_src_y * $ratio;
			}
			$image->image_x = $cardwidth;
			$image->image_y = $iRotateWidth;
			
			$image->image_rotate = '90';
		} else {
			$ratio = $iRotateWidth / $image->image_src_y;
			$cardwidth = $image->image_src_x * $ratio;
			if ($iRotateHeight/2 < $cardwidth) {
				$cardwidth = $iRotateHeight/2;
				$ratio = $cardwidth / $image->image_src_x;
				$iRotateWidth = $image->image_src_y * $ratio;
			}
			$image->image_x = $cardwidth;
			$image->image_y = $iRotateWidth;
			
			$image->image_rotate = '90';
		}
		$image->Process($dir);
	}
	
	return $iHeight;
}

function resizeGCCard($iHeight, $iWidth, $root, $iBBHeight=0, $jpg=1) {
	//we need to check if the width after scaling would be too wide for the screen.
	$ext = '.png';
	$image_type=IMAGETYPE_PNG;
	
	if ($jpg) {
		$ext = '.jpg';
		$image_type=IMAGETYPE_JPEG;
	}
	
	$filename = $root.'img/cards/gc'.$ext;
	if (file_exists($filename)) {
		$image = new Upload($filename);
		$ratio = $iHeight / $image->image_src_y;
		if (($ratio * ($image->image_src_x)) > $iWidth) {
			$ratio = $iWidth / $image->image_src_x;
			$iHeight =  intval($ratio * $image->image_src_y);
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
	chmod($root.'img',0777);
	$dir = $root.'img/'.$iHeight;
	if (!is_dir($dir)){
		if (!mkdir($dir, 0777, true)) {
			die('Failed to create folders -> '.$dir);
		}
	}
	$dir .= "/cards";
	if ($iBBHeight) {
		$dir .= "bb";
	}
	if (!is_dir($dir)){
		if (!mkdir($dir, 0777, true)) {
			die('Failed to create folders -> '.$dir);
		}
	}
	$dir .= "/";
	
	$iRotateHeight = ($iHeight-40<=0)?$iHeight:$iHeight-40;
	$iRotateWidth = ($iWidth-40<=0)?$iWidth:$iWidth-40;
	$iBBRotateHeight =  ($iBBHeight-20<=0)?$iBBHeight:$iBBHeight-20;
	
	//we need to resize the gc image for this size, if it hasnt been done yet.
	$filename = $root.'img/cards/gc'.$ext;
	$filenameResized = $dir.'gc'.$ext;
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new Upload($filename);
		$image->image_resize = true;
		$image->image_ratio_x = true;
		$image->image_y = $iHeight - 60;
		$image->Process($dir);
	}
	
	$filename = $root.'img/cards/gc'.$ext;
	$filenameResized = $dir.'gcFlip'.$ext;
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new Upload($filename);
		$image->image_resize = true;
		$image->file_new_name_body = 'gcFlip';
		if ($iBBHeight) {
			$ratio = $iRotateWidth / $image->image_src_y;
			$cardwidth = $image->image_src_x * $ratio;
			if ($iBBRotateHeight/2 < $cardwidth) {
				$cardwidth = $iBBRotateHeight/2;
				$ratio = $cardwidth / $image->image_src_x;
				$iRotateWidth = $image->image_src_y * $ratio;
			}
			$image->image_x = $cardwidth;
			$image->image_y = $iRotateWidth;
			
			$image->image_rotate = '90';
		} else {
			$ratio = $iRotateWidth / $image->image_src_y;
			$cardwidth = $image->image_src_x * $ratio;
			if ($iRotateHeight/2 < $cardwidth) {
				$cardwidth = $iRotateHeight/2;
				$ratio = $cardwidth / $image->image_src_x;
				$iRotateWidth = $image->image_src_y * $ratio;
			}
			$image->image_x = $cardwidth;
			$image->image_y = $iRotateWidth;
			
			$image->image_rotate = '90';
		}
		$image->Process($dir);
	}
	
	return $iHeight;
}

function resizeLoadingCard($iHeight, $iWidth, $root, $iBBHeight=0, $jpg=1) {

	$ext = '.png';
	$image_type=IMAGETYPE_PNG;
	
	if ($jpg) {
		$ext = '.jpg';
		$image_type=IMAGETYPE_JPEG;
	}
	
	//we need to check if the width after scaling would be too wide for the screen.
	$filename = $root.'img/cards/loading'.$ext;
	if (file_exists($filename)) {
		$image = new Upload($filename);
		$ratio = $iHeight / $image->image_src_y;
		if (($ratio * ($image->image_src_x)) > $iWidth) {
			$ratio = $iWidth / $image->image_src_x;
			$iHeight =  intval($ratio * $image->image_src_y);
		}
	}
	else {
		die('loading card image missing -> '.$filename);
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
	chmod($root.'img',0777);
	$dir = $root.'img/'.$iHeight;
	if (!is_dir($dir)){
		if (!mkdir($dir, 0777, true)) {
			die('Failed to create folders -> '.$dir);
		}
	}
	$dir .= "/cards";
	if ($iBBHeight) {
		$dir .= "bb";
	}
	if (!is_dir($dir)){
		if (!mkdir($dir, 0777, true)) {
			die('Failed to create folders -> '.$dir);
		}
	}
	$dir .= "/";
	
	$iRotateHeight = ($iHeight-20<=0)?$iHeight:$iHeight-20;
	$iRotateWidth = ($iWidth-40<=0)?$iWidth:$iWidth-40;
	$iBBRotateHeight = ($iBBHeight-20<=0)?$iBBHeight:$iBBHeight-20;
	
	//we need to resize the loading image for this size, if it hasnt been done yet.
	$filename = $root.'img/cards/loading'.$ext;
	$filenameResized = $dir.'loading'.$ext;
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new Upload($filename);
		$image->image_resize = true;
		$image->image_ratio_x = true;
		$image->image_y = $iHeight - 60;
		$image->Process($dir);
	}
	
	$filename = $root.'img/cards/loading'.$ext;
	$filenameResized = $dir.'loadingFlip'.$ext;
	if((!file_exists($filenameResized)) && (file_exists($filename))){
		$image = new Upload($filename);
		$image->image_resize = true;
		$image->file_new_name_body = 'loadingFlip';
		if ($iBBHeight) {
			$ratio = $iRotateWidth / $image->image_src_y;
			$cardwidth = $image->image_src_x * $ratio;
			if ($iBBRotateHeight/2 < $cardwidth) {
				$cardwidth = $iBBRotateHeight/2;
				$ratio = $cardwidth / $image->image_src_x;
				$iRotateWidth = $image->image_src_y * $ratio;
			}
			$image->image_x = $cardwidth;
			$image->image_y = $iRotateWidth;
			
			$image->image_rotate = '90';
		} else {
			$ratio = $iRotateWidth / $image->image_src_y;
			$cardwidth = $image->image_src_x * $ratio;
			if ($iRotateHeight/2 < $cardwidth) {
				$cardwidth = $iRotateHeight/2;
				$ratio = $cardwidth / $image->image_src_x;
				$iRotateWidth = $image->image_src_y * $ratio;
			}
			$image->image_x = $cardwidth;
			$image->image_y = $iRotateWidth;
			
			$image->image_rotate = '90';
		}
		$image->Process($dir);
	}
	
	return $iHeight;
}

//clears any actions that when limit is up
function updateAuctions() {
	//Select details of the auction
	$query = ('SELECT a.market_id, a.marketstatus_id, a.user_id owner, a.usercard_id, x.username ownername,
						IFNULL(b.price,0) price, IFNULL(b.user_id,-1) bidder, u.username, date_expired, d.description, 
						a.auctiontype_id, IFNULL(b.premium,0) premium
						FROM mytcg_market a 
						LEFT OUTER JOIN mytcg_marketcard b 
						ON a.market_id = b.market_id 
						LEFT OUTER JOIN mytcg_user u
						ON b.user_id = u.user_id
						INNER JOIN mytcg_user x
						ON a.user_id = x.user_id
						INNER JOIN mytcg_usercard c
						ON a.usercard_id = c.usercard_id
						INNER JOIN mytcg_card d
						ON c.card_id = d.card_id
						WHERE datediff(now(), date_expired) >= 1 
						AND marketstatus_id = 1
						AND (b.price = (select max(price) 
													from mytcg_marketcard c
													where c.market_id = a.market_id 
													group by market_id)
						OR ISNULL(b.price))');
	
	$auctions = myqu($query);
	
	$count = 0;
	foreach ($auctions as $auction) {
		//set the auction to expired
		$query = "update mytcg_market set marketstatus_id = '2' where market_id = ".$auction['market_id'];
		myqu($query);
		
		//add the credits to the user who was auctioning the card
		$query = "update mytcg_user set credits = credits + ".$auction['price'].", premium = IFNULL(premium, 0) + ".$auction['premium']." where user_id = ".$auction['owner'];
		myqu($query);
		
		//set the cards status back to Album
		if ($auction['bidder'] == -1) {
			myqui('UPDATE mytcg_usercard set loaded = 1 where usercard_id = '.$auction['usercard_id']);
			
			$query = "update mytcg_usercard set usercardstatus_id = (select usercardstatus_id from mytcg_usercardstatus where description = 'Album'), user_id = ".$auction['owner']." where usercard_id = ".$auction['usercard_id'];
			myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, notificationtype_id)
					VALUES ('.$auction['owner'].', "Auction ended on '.$auction['description'].' with no highest bidder.", now(), 1)');
		} else {
			$transactionType = $auction['auctiontype_id']==1?($auction['premium']>0?3:1):2;
			$notificationType = $auction['auctiontype_id']==1?2:3;
		
			myqui('UPDATE mytcg_usercard set loaded = 1 where usercard_id = '.$auction['usercard_id']);
		
			$query = "update mytcg_usercard set usercardstatus_id = (select usercardstatus_id from mytcg_usercardstatus where description = 'Received'), user_id = ".$auction['bidder']." where usercard_id = ".$auction['usercard_id'];
			
			myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
				VALUES ('.$auction['owner'].', "Received '.$auction['price'].' credits for auctioning '.$auction['description'].' to '.$auction['username'].'.", now(), '.$auction['price'].', '.$transactionType.')');
				
			myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, notificationtype_id)
				VALUES ('.$auction['owner'].', "Auctioned '.$auction['description'].' to '.$auction['username'].' for '.$auction['price'].' credits.", now(), '.$notificationType.')');
				
			myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
				VALUES ('.$auction['bidder'].', "Spent '.$auction['price'].' credits for winning the auction '.$auction['description'].' from '.$auction['ownername'].'.", now(), -'.$auction['price'].', '.$transactionType.')');
				
			myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, notificationtype_id)
				VALUES ('.$auction['bidder'].', "Won auction '.$auction['description'].' from '.$auction['ownername'].' for '.$auction['price'].' credits.", now(), , '.$notificationType.')');
		}
		
		myqu($query);
		
		$count++;
	}
}
//recurring function to get all cards on auction within a category and its children
function getAuctionCards($categoryId, $cards, $iUserID, $inClause="") {
	//Cards not owned
	if ($categoryId == -3) {
		$aAuctionCards = myqu('SELECT a.market_id, a.usercard_id, a.card_id, a.description, a.minimum_bid, 
					a.buy_now_price, a.thumbnail_phone_imageserver_id, a.back_phone_imageserver_id, a.front_phone_imageserver_id, 
					a.price, a.last_bid_username, a.end_date, 
					a.username, a.image, IFNULL(b.cnt, 0) cnt 
			FROM 
			(SELECT ac.market_id, uc.usercard_id, c.card_id, c.description, ac.minimum_bid, 
					ac.price buy_now_price, c.thumbnail_phone_imageserver_id, c.back_phone_imageserver_id, c.front_phone_imageserver_id, 
					(IFNULL(ab.price, 0) + IFNULL(ab.premium, 0)) price, ub.username last_bid_username, date_format(ac.date_expired, "%Y-%m-%d") as end_date, 
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
					AND ac.user_id <> '.$iUserID.'   '.$inClause.' 
					AND uc.card_id NOT IN (SELECT card_id FROM mytcg_usercard WHERE user_id = '.$iUserID.')
					AND datediff(now(), ac.date_expired) <= 0 
					AND (ab.marketcard_id = (select max(marketcard_id) from mytcg_marketcard a where a.market_id = ac.market_id group by market_id) 
							 OR ISNULL(ab.price)) 
					GROUP BY ac.market_id) a 
			LEFT OUTER JOIN 
			(SELECT card_id, count(*) cnt 
					FROM mytcg_usercard 
					WHERE user_id = '.$iUserID.' 
					AND usercardstatus_id = 1 
					GROUP BY card_id) b 
			ON a.card_id = b.card_id');
	} else if ($categoryId == -4) {
		$aAuctionCards = myqu('SELECT a.market_id, a.usercard_id, a.card_id, a.description, a.minimum_bid, 
					a.buy_now_price, a.thumbnail_phone_imageserver_id, a.back_phone_imageserver_id, a.front_phone_imageserver_id, 
					a.price, a.last_bid_username, a.end_date, 
					a.username, a.image, IFNULL(b.cnt, 0) cnt 
			FROM 
			(SELECT ac.market_id, uc.usercard_id, c.card_id, c.description, ac.minimum_bid, 
					ac.price buy_now_price, c.thumbnail_phone_imageserver_id, c.back_phone_imageserver_id, c.front_phone_imageserver_id, 
					(IFNULL(ab.price, 0) + IFNULL(ab.premium, 0)) price, ub.username last_bid_username, date_format(ac.date_expired, "%Y-%m-%d") as end_date, 
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
					AND ac.user_id <> '.$iUserID.'    '.$inClause.' 
					AND ac.minimum_bid < c.value
					AND datediff(now(), ac.date_expired) <= 0 
					AND (ab.marketcard_id = (select max(marketcard_id) from mytcg_marketcard a where a.market_id = ac.market_id group by market_id) 
							 OR ISNULL(ab.price)) 
					GROUP BY ac.market_id) a 
			LEFT OUTER JOIN 
			(SELECT card_id, count(*) cnt 
					FROM mytcg_usercard 
					WHERE user_id = '.$iUserID.' 
					AND usercardstatus_id = 1 
					GROUP BY card_id) b 
			ON a.card_id = b.card_id');
	} else {
		$aAuctionCards = myqu('SELECT a.market_id, a.usercard_id, a.card_id, a.description, a.minimum_bid, 
					a.buy_now_price, a.thumbnail_phone_imageserver_id, a.back_phone_imageserver_id, a.front_phone_imageserver_id, 
					a.price, a.last_bid_username, a.end_date, 
					a.username, a.image, IFNULL(b.cnt, 0) cnt 
			FROM 
			(SELECT ac.market_id, uc.usercard_id, c.card_id, c.description, ac.minimum_bid, 
					ac.price buy_now_price, c.thumbnail_phone_imageserver_id, c.back_phone_imageserver_id, c.front_phone_imageserver_id, 
					(IFNULL(ab.price, 0) + IFNULL(ab.premium, 0)) price, ub.username last_bid_username, date_format(ac.date_expired, "%Y-%m-%d") as end_date, 
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
					AND (ab.marketcard_id = (select max(marketcard_id) from mytcg_marketcard a where a.market_id = ac.market_id group by market_id) 
							 OR ISNULL(ab.price)) 
					GROUP BY ac.market_id) a 
			LEFT OUTER JOIN 
			(SELECT card_id, count(*) cnt 
					FROM mytcg_usercard 
					WHERE user_id = '.$iUserID.' 
					AND usercardstatus_id = 1 
					GROUP BY card_id) b 
			ON a.card_id = b.card_id');
	}
	
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
		//so we check if there is an ai user in the game
		$adminPlayerIdQuery = myqu('SELECT u.user_id, gp.gameplayer_id, gp.is_active 
			FROM mytcg_user u 
			INNER JOIN mytcg_gameplayer gp 
			ON gp.user_id = u.user_id 
			WHERE gp.game_id = '.$gameId.' 
			AND u.ai = 1');
		if (sizeof($adminPlayerIdQuery) > 0) {
			//check that the ai is the active player
			$aiIsActive = $adminPlayerIdQuery[0]['is_active'];
			$aiPlayerId = $adminPlayerIdQuery[0]['gameplayer_id'];
			$aiUserId = $adminPlayerIdQuery[0]['user_id'];
			
			if ($aiIsActive == '1') {
				// we need to get the best stat for the ai to pick, so we need their top card first
				$adminTopCardQuery = myqu('SELECT min(gpc.pos), gpc.gameplayercard_id, uc.card_id
					FROM mytcg_gameplayercard gpc
					INNER JOIN mytcg_usercard uc 
					ON uc.usercard_id = gpc.usercard_id
					WHERE gpc.gameplayer_id = '.$aiPlayerId.'  
					AND gpc.gameplayercardstatus_id = 1 
					GROUP BY gpc.pos');
				$adminTopCard = $adminTopCardQuery[0]['card_id'];
				
				$adminStat = chooseStat($adminTopCard);
				
				//perform the stat selection
				selectStat($iUserID, $aiUserId, $gameId, $adminStat);
			}
		}
	}
}


/*
  * CPU player choosing a stat
  */
function chooseStat($cardId, $difficultyId=1, $showCheat=false) {
     $pre = "mytcg";
     $sCRLF = "\r\n";
     $cheat = '';
     $id = $cardId;

     $cheat.= 'CARD '.$id.$sCRLF.'=========================='.$sCRLF;

     $probabilities = array();

     for($cat=1; $cat<=7; $cat++)
     {
         $cheat.= 'Stat '.$cat;

         $wins = 0;
         $losses = 0;
         $draws = 0;
         $total = 0;

         $sql = "SELECT *
                 FROM ".$pre."_cardstat CS
                 WHERE CS.categorystat_id = $cat
                 AND CS.card_id NOT IN ($id);";
         $cards = myqu($sql);

         if(count($cards) > 0)
         {
             $sql = "SELECT statvalue
                     FROM ".$pre."_cardstat CS
                     WHERE CS.categorystat_id = $cat
                     AND CS.card_id = $id;";
             $base = myqu($sql);
             $baseval = $base[0]['statvalue'];

             $cheat.= ' -> '.$baseval;

             foreach($cards as $card)
             {
                 if($baseval > $card['statvalue']){
                     $wins++;
                 }
                 elseif($baseval < $card['statvalue']){
                     $losses++;
                 }
                 else{
                     $draws++;
                 }
                 $total++;
             }
         }
         $cheat.= $sCRLF.'-------------------'.$sCRLF;
         $probabilities['win'][$cat] = round(($wins/$total)*100,2);
         $probabilities['lose'][$cat] = round(($losses/$total)*100,2);
         $probabilities['draw'][$cat] = round(($draws/$total)*100,2);
         $combined[$cat] = $probabilities['lose'][$cat] + $probabilities['draw'][$cat];

     }

     $cheat.= 'Probabilities
'.print_r($probabilities,true).'=========================='.$sCRLF;

     //sort stats according to lowest losing probability
     $statsinbestorder = $combined;
     asort($statsinbestorder);
     $i = 1;
     $beststat = array();
     foreach($statsinbestorder as $key=>$stat){
         $beststat[] = $key;
         if(++$i > 3) break;
     }

     $chosenstat = 0;
     switch($difficultyId){
         case '1':
             $difficultyLevel = 'Easy';
             $chosenstat = rand(0,2);
         break;
         case '2':
             $difficultyLevel = 'Normal';
             $chosenstat = rand(0,1);
         break;
         case '3':
             $difficultyLevel = 'Hard';
             $chosenstat = 0;
         break;
     }
     $chosenstat = $beststat[$chosenstat];

     $cheat.= 'BEST CHOICE = Stat '.$beststat[0].$sCRLF;
     $cheat.= '2nd CHOICE = Stat '.$beststat[1].$sCRLF;
     $cheat.= '3rd CHOICE = Stat '.$beststat[2].$sCRLF;
     $cheat.= '=========================='.$sCRLF;
     $cheat.= 'CPU Difficulty = '.$difficultyLevel.$sCRLF;
     $cheat.= 'CHOICE = Stat '.$chosenstat.$sCRLF;

     if($showCheat)
     {
         return $cheat;
     }
     else
     {
         return $chosenstat;
     }
}

//load a game and return relevant xml
function loadGame($gameId, $userId, $iHeight, $iWidth, $root, $iBBHeight=0, $jpg=1) {
	//get the game phase
	$gamePhaseQuery = myqu('SELECT g.gamephase_id, g.lobby, lower(gp.description) as description
		FROM mytcg_game g
		INNER JOIN mytcg_gamephase gp
		ON g.gamephase_id = gp.gamephase_id
		WHERE g.game_id = '.$gameId);
	
	$gamePhase = $gamePhaseQuery[0]['description'];
	$lobby = $gamePhaseQuery[0]['lobby'];
	
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
		$cardsQuery = myqu('SELECT count(gpc.gameplayercard_id) cards, gp.user_id, u.username 
			FROM mytcg_gameplayercard gpc
			INNER JOIN mytcg_gameplayer gp
			ON gp.gameplayer_id = gpc.gameplayer_id 
			INNER JOIN mytcg_user u 
			ON u.user_id = gp.user_id 
			WHERE gp.game_id = '.$gameId.' 
			GROUP BY gp.gameplayer_id');
		
		$count = 0;
		while ($cards = $cardsQuery[$count]) {
			$count++;
			if ($cards['user_id'] == $userId) {
				$sOP.='<usercards>'.$cards['cards'].'</usercards>';
				$sOP.='<username>'.$cards['username'].'</username>';
			}
			else {
				$sOP.='<oppcards>'.$cards['cards'].'</oppcards>';
				$sOP.='<oppname>'.$cards['username'].'</oppname>';
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
		$iHeight = resizeCard($iHeight, $iWidth, $selectedGameCardIdQuery[0]['image'], $root, $iBBHeight, jpg);
		
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$selectedGameCardIdQuery[0]['front_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		
		$dir = '/cards/';
		if ($iBBHeight) {
			$dir = '/cardsbb/';
		}
		$ext = '.png';
		if ($jpg) {
			$ext = '.jpg';
		}
		
		$sOP.=$sTab.'<fronturl>'.$sFound.$iHeight.$dir.$selectedGameCardIdQuery[0]['image'].'_front'.$ext.'</fronturl>'.$sCRLF;
		$sOP.=$sTab.'<frontflipurl>'.$sFound.$iHeight.$dir.$selectedGameCardIdQuery[0]['image'].'_front_flip'.$ext.'</frontflipurl>'.$sCRLF;

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$selectedGameCardIdQuery[0]['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		
		$sOP.=$sTab.'<backurl>'.$sFound.$iHeight.$dir.$selectedGameCardIdQuery[0]['image'].'_back'.$ext.'</backurl>'.$sCRLF; 
		$sOP.=$sTab.'<backflipurl>'.$sFound.$iHeight.$dir.$selectedGameCardIdQuery[0]['image'].'_back_flip'.$ext.'</backflipurl>'.$sCRLF;
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
		$iHeight = resizeCard($iHeight, $iWidth, $selectedGameCardIdQuery[0]['image'], $root, $iBBHeight, $jpg);
		
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$selectedGameCardIdQuery[0]['front_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		
		$sOP.=$sTab.'<fronturl>'.$sFound.$iHeight.$dir.$selectedGameCardIdQuery[0]['image'].'_front'.$ext.'</fronturl>'.$sCRLF;
		$sOP.=$sTab.'<frontflipurl>'.$sFound.$iHeight.$dir.$selectedGameCardIdQuery[0]['image'].'_front_flip'.$ext.'</frontflipurl>'.$sCRLF;

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$selectedGameCardIdQuery[0]['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		
		$sOP.=$sTab.'<backurl>'.$sFound.$iHeight.$dir.$selectedGameCardIdQuery[0]['image'].'_back'.$ext.'</backurl>'.$sCRLF; 
		$sOP.=$sTab.'<backflipurl>'.$sFound.$iHeight.$dir.$selectedGameCardIdQuery[0]['image'].'_back_flip'.$ext.'</backflipurl>'.$sCRLF;
		$sOP.=$sTab.'</oppcard>'.$sCRLF;
		
		//we need to return the url for the gc card, which has hopefully been resized for the users's phone.
		$sOP.=$sTab.'<gcurl>'.$sFound.$iHeight.$dir.'gc'.$ext.'</gcurl>'.$sCRLF;
		$sOP.=$sTab.'<gcurlflip>'.$sFound.$iHeight.$dir.'gcFlip'.$ext.'</gcurlflip>'.$sCRLF;
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
	else if ($gamePhase == 'lfm' && $lobby == '0') {
		//if the player has been waiting for a minute, and they didnt specify an opponent, we set them up against an ai player
		$gameDetailsQuery = myqu('SELECT TIME_TO_SEC(TIMEDIFF(now(), date_created)) duration, friend 
			FROM mytcg_game 
			WHERE game_id = '.$gameId);
		$friend = $gameDetailsQuery[0]['friend'];
		$duration = $gameDetailsQuery[0]['duration'];
		
		if ($friend == "" && $duration >= 20) {
			$incompleteStatusQuery = myqu("SELECT gamestatus_id 
				FROM mytcg_gamestatus gs 
				WHERE lower(gs.description) = 'incomplete'");
			$incompleteId = $incompleteStatusQuery[0]['gamestatus_id'];
		
			myqu('UPDATE mytcg_game 
				SET gamestatus_id = '.$incompleteId.', 
				gamephase_id = 2 
				WHERE game_id = '.$gameId);
			
			//get the ai users
			$aiUserIdQuery = myqu('SELECT u.user_id 
				FROM mytcg_user u 
				WHERE u.ai = 1 
				AND u.user_id != 1'); // 1 is the default ai, we want these ad hoc ai matches to use the other ones.
			$aiIndex = rand(0, sizeof($aiUserIdQuery) - 1);
			$aiUserId = $aiUserIdQuery[$aiIndex]['user_id'];
			
			//add the ai to the game
			myqu('INSERT INTO mytcg_gameplayer (game_id, user_id, is_active, gameplayerstatus_id, deck_id)
				VALUES ('.$gameId.', '.$aiUserId.', 0, 2, -1)');
			
			initialiseGame($userId, $gameId);
		}
		
		$dir = '/cards/';
		if ($iBBHeight) {
			$dir = '/cardsbb/';
		}
		
		$ext = '.png';
		if ($jpg) {
			$ext = '.jpg';
		}
		
		//we need to return the url for the gc card
		$height = resizeGCCard($iHeight, $iWidth, $root, $iBBHeight);
		$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
		$sOP.='<gcurl>'.$imageUrlQuery[0]['description'].$height.$dir.'gc'.$ext.'</gcurl>'.$sCRLF;
		$sOP.='<gcurlflip>'.$imageUrlQuery[0]['description'].$height.$dir.'gcFlip'.$ext.'</gcurlflip>'.$sCRLF;
		
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
	$aiUserIdQuery = myqu('SELECT u.user_id, gp.is_active, gp.gameplayer_id 
		FROM mytcg_user u 
		INNER JOIN mytcg_gameplayer gp 
		ON gp.user_id = u.user_id 
		WHERE gp.game_id = '.$gameId.' 
		AND u.ai = 1');

	//check if the game is against AI
	if (sizeof($aiUserIdQuery) > 0) {
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
		(game_id, date, message, categorystat_id, winner) 
		VALUES('.$gameId.', now(), \''.$exp.'\', '.$statTypeId.', '.(($winnerId == 0 && $loserId == 0)?'0':(($winnerId==$userPlayerId)?'1':'2')).')');
	
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
				
				$aUpdate=myqu('SELECT gameswon
					FROM mytcg_user where user_id = (SELECT user_id from mytcg_gameplayer where gameplayer_id = '.$winnerId.')');
			
				$iUpdate=$aUpdate[0];
				if ($iUpdate['gameswon'] < 3) {
					myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
					VALUES ((SELECT user_id from mytcg_gameplayer where gameplayer_id = '.$winnerId.'), "Received 50 credits for beating '.$oppPlayerUsername.'", now(), 50, 1)');
			
					myqui('UPDATE mytcg_user SET credits = credits + 50, gameswon = (gameswon+1) WHERE user_id =(SELECT user_id from mytcg_gameplayer where gameplayer_id = '.$winnerId.')');
				} else if ($iUpdate['gameswon'] == 3) {
					myqui('UPDATE mytcg_user SET gameswon = (gameswon+1) WHERE user_id =(SELECT user_id from mytcg_gameplayer where gameplayer_id = '.$winnerId.')');
				}
			}
			else {
				$winnerName = $oppPlayerUsername;
				
			}
			$aUpdate=myqu('SELECT gameswon, credits
					FROM mytcg_user where user_id = (SELECT user_id from mytcg_gameplayer where gameplayer_id = '.$winnerId.')');
			$qu = 'SELECT credits
					FROM mytcg_user where user_id = '.$iUserID;
			$aCredits=myqu($qu);
			
			$qu = 'SELECT count(*) as cnt
					FROM mytcg_gameplayer a, mytcg_game b
					WHERE a.game_id = b.game_id
					AND gamestatus_id = 2
					AND user_id = '.$iUserID;
			$aPlayed=myqu($qu);
			
			$qu = 'select rownum 
					from (select @rownum:=@rownum+1 rownum, credits, user_id 
							from mytcg_user, (select @rownum:=0) r 
							where user_id <> 1 order by credits DESC) a 
					where user_id = '.$iUserID;
			$aRich=myqu($qu);
			
			$qu = 'SELECT rownum
					FROM
					(SELECT @rownum:=@rownum+1 as rownum, count(*) val, user_id 
					FROM (SELECT c.user_id, c.username, b.gameplayer_id, b.game_id , count(d.gameplayercard_id) as cnt 
						FROM mytcg_game a 
						INNER JOIN mytcg_gameplayer b ON b.game_id = a.game_id 
						INNER JOIN mytcg_user c ON c.user_id = b.user_id 
						LEFT OUTER JOIN mytcg_gameplayercard d ON d.gameplayer_id = b.gameplayer_id 
						WHERE c.user_id <> 1 GROUP BY b.gameplayer_id) e, 
						(SELECT @rownum:=0) f
					WHERE e.cnt = 20 
					GROUP BY username 
					ORDER BY count(*) DESC) a
					WHERE user_id = '.$iUserID;
			
			$aWon=myqu($qu);
		
			$iUpdate=$aUpdate[0];
			if ($iUpdate['gameswon'] <= 3) {
				$exp = $winnerName.' wins! '.$winnerName.' received 50 credits for winning.'; 
						/*You have played '.$aPlayed[0]['cnt'].' game(s) in total. You are currently ranked number '.$aWon[0]['rownum'].' on Most Games Won.
						Current credits '.$aCredits[0][credits].'. You are currently ranked number '.$aRich[0]['rownum'].' on Richest User.';*/
			} else {
				$exp = $winnerName.' wins! '.$winnerName.' already won 3 games today and was just playing for fun.'; 
						/*You have played '.$aPlayed[0]['cnt'].' game(s) in total. You are currently ranked number '.$aWon[0]['rownum'].' on Most Games Won.
						Current credits '.$aCredits[0][credits].'. You are currently ranked number '.$aRich[0]['rownum'].' on Richest User.';*/
			}
		}
		
		//add the log message, so players can see the outcome
		myqu('INSERT INTO mytcg_gamelog 
			(game_id, date, message, categorystat_id) 
			VALUES('.$gameId.', now(), \''.$exp.'\', 0)');
		//and set the game phase to results
		$gamePhaseIdQuery = myqu('SELECT gamephase_id 
			FROM mytcg_gamephase 
			WHERE description = "result"');
		$resultPhase = $gamePhaseIdQuery[0]['gamephase_id'];
		//and set the game phase to results
		$gameStatusIdQuery = myqu('SELECT gamestatus_id 
			FROM mytcg_gamestatus 
			WHERE description = "complete"');
		$completeStatus = $gameStatusIdQuery[0]['gamestatus_id'];
		myqu('UPDATE mytcg_game SET gamephase_id = '.$resultPhase.', gamestatus_id = '.$completeStatus.' WHERE game_id = '.$gameId);
		myqu('UPDATE mytcg_gameplayer SET pending = 1 WHERE game_id = '.$gameId);
	}
}

//set a deck for the user, if they have one
function setDeck($iUserID, $categoryId, $gameId) {
	//we must check if the user has a deck selected, and if not, give them their top ten cards
	$userDecks = myqu('SELECT d.deck_id, COUNT(uc.card_id) cards, SUM(c.ranking) totalRank 
		FROM mytcg_deck d 
		INNER JOIN mytcg_usercard uc 
		ON uc.deck_id = d.deck_id 
		INNER JOIN mytcg_card c 
		ON c.card_id = uc.card_id 
		AND uc.user_id = '.$iUserID.' 
		AND d.category_id = '.$categoryId.'  
		GROUP BY d.deck_id 
		ORDER BY totalRank DESC');
	
	//when populating the gameplayercards, if the player's deck_id is -1, we give then their top 10 ranked cards
	$userDeck = -1;
	$count = 0;
	while ($count < sizeof($userDecks)) {
		if ($userDecks[$count]['cards'] == 10) {
			$userDeck = $userDecks[$count]['deck_id'];
			break;
		}
		$count++;
	}
	
	myqui('UPDATE mytcg_gameplayer SET deck_id = '.$userDeck.' WHERE game_id = '.$gameId.' AND user_id = '.$iUserID);
}

//get the most highly ranked deck for a user, if the have one. Return -1 if they dont
function getDeck($iUserID, $categoryId) {
	//we must check if the user has a deck selected, and if not, give them their top ten cards
	$userDecks = myqu('SELECT d.deck_id, COUNT(uc.card_id) cards, SUM(c.ranking) totalRank 
		FROM mytcg_deck d 
		INNER JOIN mytcg_usercard uc 
		ON uc.deck_id = d.deck_id 
		INNER JOIN mytcg_card c 
		ON c.card_id = uc.card_id 
		AND uc.user_id = '.$iUserID.' 
		AND d.category_id = '.$categoryId.'  
		GROUP BY d.deck_id 
		ORDER BY totalRank DESC');
	
	//when populating the gameplayercards, if the player's deck_id is -1, we give then their top 10 ranked cards
	$userDeck = -1;
	$count = 0;
	while ($count < sizeof($userDecks)) {
		if ($userDecks[$count]['cards'] == 10) {
			$userDeck = $userDecks[$count]['deck_id'];
			break;
		}
		$count++;
	}
	
	return $userDeck;
}

//given the user's id and game id, populate the mytcg_gameplayercard
function initialiseGame($iUserID, $gameId, $oppLimit=-1) {
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
	//we must check if the user has a deck selected, and if not, give them their top ten cards
	$userDeckQuery = myqu('SELECT deck_id 
		FROM mytcg_gameplayer 
		WHERE gameplayer_id = '.$userPlayerId);
	
	$userDeck = $userDeckQuery[0]['deck_id'];
	if ($userDeck != -1) {
		$userCards = myqu('SELECT uc.card_id, uc.usercard_id 
			FROM mytcg_usercard uc 
			INNER JOIN mytcg_card c 
			ON c.card_id = uc.card_id 
			WHERE uc.deck_id = '.$userDeck.' 
			ORDER BY c.ranking DESC');
	}
	
	$oppDeckQuery = myqu('SELECT deck_id 
		FROM mytcg_gameplayer 
		WHERE gameplayer_id = '.$oppPlayerId);
	
	$oppDeck = $oppDeckQuery[0]['deck_id'];
	$count = 0;
	if ($oppDeck != -1) {
		$oppCards = myqu('SELECT uc.card_id, uc.usercard_id 
			FROM mytcg_usercard uc 
			INNER JOIN mytcg_card c 
			ON c.card_id = uc.card_id 
			WHERE uc.deck_id = '.$oppDeck.' 
			ORDER BY c.ranking DESC');
	}
	
	if ($oppDeck == -1 || $userDeck == -1) {
		//we need to get a list of all the child categories of the one given
		$allCategories = array();
		$categories = getAllCatChildren($categoryId, $allCategories);
		$categoryString = $categoryId;
		foreach ($categories as $category) {
			$categoryString.=','.$category['category_child_id'];
		}
		
		$maxCardCopies = 1;
		if ($userDeck == -1) {
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
				
			//we just need to make sure the users dont end up with more than 1 of a card in their decks
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
		}
		
		if ($oppDeck == -1) {
			$oppLimitString = $oppLimit>-1?' AND c.ranking <= '.$oppLimit.' ':'';
			$oppCardsQuery = myqu('SELECT c.card_id, uc.usercard_id
				FROM mytcg_usercard uc
				INNER JOIN mytcg_card c
				ON uc.card_id = c.card_id
				INNER JOIN mytcg_usercardstatus ucs
				ON ucs.usercardstatus_id = uc.usercardstatus_id
				WHERE c.category_id in ('.$categoryString.')
				AND uc.user_id = '.$opponentId.' 
				AND lower(ucs.description) = "album" '.$oppLimitString.' 
				ORDER BY c.avgranking DESC, c.card_id');
			
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
function getAllUserCatCards($userId,$results,$deckSize){
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

function createAuction($iCardId, $iAuctionBid, $iBuyNowPrice, $iDays, $iUserID, $iAuctionType = '1') {
	$aCheckCard=myqu('SELECT max(usercard_id) usercard_id '
					.'FROM mytcg_usercard '
					.'WHERE usercardstatus_id = (select usercardstatus_id from mytcg_usercardstatus where description = "Album")  '
					.'AND card_id = '.$iCardId.' '
					.'AND user_id = "'.$iUserID.'"');

					
	echo sizeof($aCheckCard);
	if (sizeof($aCheckCard) == 0){
		$sOP='<user>'.$sCRLF;
		$sOP.=$sTab.'<result>Card not available anymore.</result>'.$sCRLF;  
		$sOP.='</user>'.$sCRLF;
		header('xml_length: '.strlen($sOP));
		echo $sOP;
		exit;
	} else {
		$iUserCardID = $aCheckCard[0]['usercard_id'];
	}
	
	$aCheckCredits=myqu('SELECT IFNULL(credits,0)+IFNULL(premium,0) credits, IFNULL(credits,0) free, IFNULL(premium,0) premium from mytcg_user
						WHERE user_id = '.$iUserID);
	
	$cost = $iAuctionBid;
	if ($iAuctionBid < $iBuyNowPrice) {
		$cost = $iBuyNowPrice;
	}
	$cost = $cost/10;
	if ($cost < 5) {
		$cost = 5;
	}
	
	//iAuctionType 1 = freemium, 2 = premium
	if ($iAuctionType == '2') {
		if ($aCheckCredits[0]['premium'] < $cost) {
			$sOP='<user>'.$sCRLF;
			$sOP.=$sTab.'<result>Not enough credits to create auction.</result>'.$sCRLF;  
			$sOP.='</user>'.$sCRLF;
			header('xml_length: '.strlen($sOP));
			echo $sOP;
			exit;
		} else {
			$getDesc=myqu('SELECT description from mytcg_card
							WHERE card_id = '.$iCardId);
			
			myqui('UPDATE mytcg_user set premium = premium - '.$cost.' WHERE user_id = '.$iUserID);
			
			myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
				VALUES ('.$iUserID.', "Spent '.$cost.' credits on creating auction for '.$getDesc[0]['description'].'.", now(), -'.$cost.', 2)');
		}
	}
	else {
		if ($aCheckCredits[0]['credits'] < $cost) {
			$sOP='<user>'.$sCRLF;
			$sOP.=$sTab.'<result>Not enough credits to create auction.</result>'.$sCRLF;  
			$sOP.='</user>'.$sCRLF;
			header('xml_length: '.strlen($sOP));
			echo $sOP;
			exit;
		} else {
			$getDesc=myqu('SELECT description from mytcg_card
							WHERE card_id = '.$iCardId);
			
			if ($aCheckCredits[0]['free'] < $cost) {
				$spent = $cost - $aCheckCredits[0]['free'];
				myqui('UPDATE mytcg_user set credits = credits - '.$aCheckCredits[0]['free'].' WHERE user_id = '.$iUserID);
				myqui('UPDATE mytcg_user set premium = premium - '.$spent.' WHERE user_id = '.$iUserID);
				
				myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
					VALUES ('.$iUserID.', "Spent '.$cost.' credits on creating auction for '.$getDesc[0]['description'].'.", now(), -'.$cost.', 3)');
			} else {
				myqui('UPDATE mytcg_user set credits = credits - '.$cost.' WHERE user_id = '.$iUserID);
				
				myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
					VALUES ('.$iUserID.', "Spent '.$cost.' credits on creating auction for '.$getDesc[0]['description'].'.", now(), -'.$cost.'), 1');
			}
		}
	}

	myqui('UPDATE mytcg_usercard set loaded = 1 where usercard_id = '.$iUserCardID);
	$aUpdate=myqui('UPDATE mytcg_usercard SET usercardstatus_id=(select usercardstatus_id from mytcg_usercardstatus where description = "auction") '
					.'WHERE usercard_id="'.$iUserCardID.'"');
	$aInsert=myqui('INSERT INTO mytcg_market '
					.'(markettype_id, marketstatus_id, user_id, usercard_id, '
					.'date_created, date_expired, price, minimum_bid, auctiontype_id) '
					.'VALUES (1, 1, "'.$iUserID.'", "'.$iUserCardID.'", now(), "'.date('Y-m-d H:i:s',time()+$iDays*24*60*60).'", "'.$iBuyNowPrice.'", '
					.'"'.$iAuctionBid.'", "'.$iAuctionType.'")');

	$sOP=$sTab.'<result><buyNowPrice>'.$iBuyNowPrice.'</buyNowPrice>'.$sCRLF;
	$sOP.=$sTab.$sTab.'<success>1</success>'.$sCRLF;
	$sOP.=$sTab.'</result>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

function auctionBid($bid, $username, $iUserID) {

	//SELECT USERS CURRENT CREDITS
	$query = "SELECT IFNULL(credits,0)+IFNULL(premium,0) credits, IFNULL(credits,0) free, IFNULL(premium,0) premium from mytcg_user
						WHERE user_id = ".$iUserID;
	$result = myqu($query);
	$credits = $result[0]['credits'];
	$free = $result[0]['free'];
	$premium = $result[0]['premium'];
	
	$auctionCardId = $_GET['auctioncardid'];
	
	//Select details of the auction
	$query = "SELECT price, auctiontype_id, usercard_id FROM mytcg_market WHERE market_id = ".$auctionCardId;
	$result = myqu($query);
	$auctionType = $result[0]['auctiontype_id'];
  
	if (($auctionType == 1 && $credits >= $bid) || ($auctionType == 2 && $premium >= $bid)) {
		$rest = "SELECT minimum_bid "
				."from mytcg_market "
				."where market_id = ".$auctionCardId;
		$testresult = myqu($rest);
		
		if ($aTest=$testresult[0]) {
			if ($aTest['minimum_bid'] > $bid) {
				echo $sTab.'<result>Placed bid must be higher than the minimum bid.</result>'.$sCRLF;
				exit;
			}
		}
		
		$rest = "select IFNULL(price,0)+IFNULL(premium,0) credits, IFNULL(price,0) free, IFNULL(premium,0) premium, user_id 
			from mytcg_marketcard mc
			inner join (select max(marketcard_id) marketcard_id from mytcg_marketcard where market_id = ".$auctionCardId.") max
			on max.marketcard_id = mc.marketcard_id";
		$testresult = myqu($rest);
		
		if ($aBid=$testresult[0]) {
			if ($aBid['user_id'] == $iUserID) {
				echo $sTab.'<result>You are already the highest bidder.</result>'.$sCRLF;
				exit;
			}
			/*TODO: ANDRE CONTINUE FROM HERE*/
			if ($aBid['credits'] > $bid) {
				echo $sTab.'<result>Placed bid must be higher than previous bid.</result>'.$sCRLF;
				exit;
			}
			//if there was a previous bid
			$prevBidFree = $aBid['price'];
			$prevBidPremium = $aBid['premium'];
			$prevUserId = $aBid['user_id'];
			
			$query = "update mytcg_user set credits = credits + ".$prevBidFree.", premium = IFNULL(premium,0) + ".$prevBidPremium." where user_id = ".$prevUserId;
			myqu($query);
		}
		
		if ($auctionType == 1) {
			if ($free >= $bid) {
				$query = "update mytcg_user set credits = credits - ".$bid." where user_id = ".$iUserID;
				myqu($query);
				
				$query = "INSERT INTO mytcg_marketcard (market_id, user_id, price, date_of_transaction) VALUES (".$auctionCardId
					.", ".$iUserID.", ".$bid.", now())";
				myqu($query);
			}
			else {
				$cost = $bid - $free;
				
				$query = "update mytcg_user set credits = 0, premium = premium - ".$cost." where user_id = ".$iUserID;
				myqu($query);
				
				$query = "INSERT INTO mytcg_marketcard (market_id, user_id, price, date_of_transaction, premium) VALUES (".$auctionCardId
					.", ".$iUserID.", ".$free.", now(), ".$cost.")";
				myqu($query);
			}
		}
		else if ($auctionType == 2) {
			$query = "update mytcg_user set premium = premium - ".$bid." where user_id = ".$iUserID;
			myqu($query);
			
			$query = "INSERT INTO mytcg_marketcard (market_id, user_id, price, date_of_transaction, premium) VALUES (".$auctionCardId
				.", ".$iUserID.", 0, now(), ".$bid.")";
			myqu($query);
		}
		
		$query = "select credits, premium from mytcg_user where user_id = ".$iUserID;
		$result = myqu($query);
		$credits = $result[0]['credits'];
		$premium = $result[0]['premium'];
		
		echo $sTab.'<premium>'.$premium.'</premium><credits>'.$credits.'</credits><result>You are now the highest bidder.</result>'.$sCRLF;
	}
	else {
		echo $sTab.'<result>You do not have enough credits.</result>'.$sCRLF;
	}
	exit;
}

function buyAuctionNow($auctionCardId, $iUserID) {

	//SELECT USERS CURRENT CREDITS
	$query = "select IFNULL(credits,0)+IFNULL(premium,0) credits, IFNULL(credits,0) free, IFNULL(premium,0) premium, username from mytcg_user where user_id = ".$iUserID;
	$result = myqu($query);
	$credits = $result[0]['credits'];
	$free = $result[0]['free'];
	$premium = $result[0]['premium'];
	$username = $result[0]['username'];

	//Select details of the auction
	$query = "SELECT price, auctiontype_id, usercard_id FROM mytcg_market WHERE market_id = ".$auctionCardId;
	$result = myqu($query);
	$buyNowPrice = $result[0]['price'];
	$userCardId = $result[0]['usercard_id'];
	$auctionType = $result[0]['auctiontype_id'];

	if ((($auctionType == 1 && $credits >= $buyNowPrice) || ($auctionType == 2 && $premium >= $buyNowPrice))&&($buyNowPrice != 0)) {
		$rest = "select IFNULL(price,0)+IFNULL(premium,0) credits, IFNULL(price,0) free, IFNULL(premium,0) premium, user_id 
			from mytcg_marketcard mc
			inner join (select max(marketcard_id) marketcard_id from mytcg_marketcard where market_id = ".$auctionCardId.") max
			on max.marketcard_id = mc.marketcard_id";
		$testresult = myqu($rest);
		
		if ($aBid=$testresult[0]) {
			//if there was a previous bid
			$prevBidFree = $aBid['price'];
			$prevBidPremium = $aBid['premium'];
			$prevUserId = $aBid['user_id'];
			
			$query = "update mytcg_user set credits = credits + ".$prevBidFree.", premium = IFNULL(premium,0) + ".$prevBidPremium." where user_id = ".$prevUserId;
			myqu($query);
		}

		//set the auction to expired
		$query = "update mytcg_market set marketstatus_id = '2' where market_id = ".$auctionCardId;
		myqu($query);

		$cost = 0;
		//add the credits to the user who was auctioning the card
		if ($auctionType == 1) {
			if ($free >= $buyNowPrice) {
				$query = "update mytcg_user set credits = credits + ".$buyNowPrice." where user_id = (select user_id from mytcg_usercard where usercard_id = ".$userCardId.")";
				myqu($query);
			}
			else {
				$cost = $buyNowPrice - $free;
				$query = "update mytcg_user set credits = credits + ".$free.", premium = IFNULL(premium, 0) + ".$cost." where user_id = (select user_id from mytcg_usercard where usercard_id = ".$userCardId.")";
				myqu($query);
			}
		}
		else if ($auctionType == 2) {
			$query = "update mytcg_user set premium = IFNULL(premium, 0) + ".$buyNowPrice." where user_id = (select user_id from mytcg_usercard where usercard_id = ".$userCardId.")";
			myqu($query);
		}
		
		$query = "SELECT user_id, username FROM mytcg_user WHERE user_id = (select user_id from mytcg_usercard where usercard_id = ".$userCardId.")";
		$result = myqu($query);
		$owner = $result[0]['username'];
		$ownerid = $result[0]['user_id'];
		
		$query = "SELECT description FROM mytcg_card WHERE card_id = (select card_id from mytcg_usercard where usercard_id = ".$userCardId.")";
		$result = myqu($query);
		$description = $result[0]['description'];

		//set the cards status back to Album
		myqui('UPDATE mytcg_usercard set loaded = 1 where usercard_id = '.$userCardId);
		$query = "update mytcg_usercard set usercardstatus_id = (select usercardstatus_id from mytcg_usercardstatus where description = 'Album'), user_id = ".$iUserID." where usercard_id = ".$userCardId;
		myqu($query);

		//take the credits from the user buying out the auction
		if ($auctionType == 1) {
			if ($cost > 0) {
				$query = "update mytcg_user set credits = 0, premium = IFNULL(premium, 0) - ".$cost." where user_id = ".$iUserID;
				myqu($query);
			}
			else {
				$query = "update mytcg_user set credits = credits - ".$buyNowPrice." where user_id = ".$iUserID;
				myqu($query);
			}
		}
		else if ($auctionType == 2) {
			$query = "update mytcg_user set premium = IFNULL(premium, 0) - ".$buyNowPrice." where user_id = ".$iUserID;
			myqu($query);
		}
		
		$transactionType = $auctionType==1?($cost > 0?3:1):2;
		
		myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
				VALUES ('.$ownerid.', "'.$username. ' bought '.$description.' for '.$buyNowPrice.' credits.", now(), '.$buyNowPrice.', '.$transactionType.')');
				
		myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
				VALUES ('.$iUserID.', "Bought '.$description.' for '.$buyNowPrice.' credits from '.$owner.'.", now(), -'.$buyNowPrice.', '.$transactionType.')');

		echo $sTab.'<result>1</result>'.$sCRLF;
	}
	else {
		echo $sTab.'<result>0</result>'.$sCRLF;
	}
	exit;
}

function buyProduct($timestamp, $iHeight, $iWidth, $iFreebie, $iUserID, $product, $root, $iBBHeight=0, $jpg=1, $purchase=1) {

  //GET PRODUCT DETAILS
  $aDetails=myqu('SELECT A.product_id, A.description, '
		.'IFNULL(A.price,0) price, IFNULL(A.premium,0) premium, lower(P.description) pack_type '
		.'FROM mytcg_product A '
		.'INNER JOIN mytcg_producttype P '
		.'ON A.producttype_id=P.producttype_id '
		.'WHERE A.product_id="'.$product.'"');
  
  $iProductID = $aDetails[0]['product_id'];
  $iReleasedBuffer=1;
  //VALIDATE USER CREDITS
  //User credits
  $iCreditsQuery=myqu("SELECT credits, freebie, premium FROM mytcg_user WHERE user_id='{$iUserID}'");
  $iCredits=$iCreditsQuery[0]['credits'];
  $hasFreebie=$iCreditsQuery[0]['freebie'];
  $iPremium=$iCreditsQuery[0]['premium'];
  
  //Total order cost
  $itemCost = $aDetails[0]['price'];
  $premiumCost = $aDetails[0]['premium'];
  if ($purchase == 1) {
	$bValid = (($iCredits >= $itemCost) && ($itemCost > 0));
  } else if ($purchase == 2) {
	$bValid = (($iPremium >= $premiumCost) && ($premiumCost > 0));
	if (!$bValid) {
		$bValid = (($iPremium >= $itemCost) && ($itemCost > 0));
	}
  } else if ($purchase == 3) {
	$bValid = ((($iPremium + $iCredits) >= $itemCost) && ($itemCost > 0));
  } else {
	$bValid = 1 == 2;
  }
	
	$iFreebie = (($iFreebie > 0)&&($hasFreebie==0))?1:0;
  
	//echo '$bValid: '.$bValid.'$iFreebie: '.$iFreebie.' $iCredits: '.$iCredits.' $itemCost:'.$itemCost.' $iUserID:'.$iUserID;
	
  if ($bValid || $iFreebie > 0)
  {
		if ($iFreebie <= 0) {
			//PAY FOR PRODUCT
			if ($purchase == 1) {
				$iCreditsAfterPurchase = $iCredits - $itemCost;
				$aCreditsLeft=myqui("UPDATE mytcg_user SET credits={$iCreditsAfterPurchase} WHERE user_id='{$iUserID}'");
				myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
						VALUES ('.$iUserID.', "Spent '.$itemCost.' credits on '.$aDetails[0]['description'].'.", now(), -'.$itemCost.', 1)');
			} else if ($purchase == 2) {
				if (($iPremium >= $premiumCost) && ($premiumCost > 0)) {
					$iCreditsAfterPurchase = $iPremium - $premiumCost;
					$aCreditsLeft=myqui("UPDATE mytcg_user SET premium={$iCreditsAfterPurchase} WHERE user_id='{$iUserID}'");
					myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
							VALUES ('.$iUserID.', "Spent '.$premiumCost.' credits on '.$aDetails[0]['description'].'.", now(), -'.$premiumCost.', 2)');
				} else if (($iPremium >= $itemCost) && ($itemCost > 0)) {
					$iCreditsAfterPurchase = $iPremium - $itemCost;
					$aCreditsLeft=myqui("UPDATE mytcg_user SET premium={$iCreditsAfterPurchase} WHERE user_id='{$iUserID}'");
					myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
							VALUES ('.$iUserID.', "Spent '.$itemCost.' credits on '.$aDetails[0]['description'].'.", now(), -'.$itemCost.', 2)');
				}
			} else if ($purchase == 3) {
				if ($iCredits < $itemCost) {
					$iCreditsAfterPurchase = $itemCost - $iCredits;
					if ($iCreditsAfterPurchase > 0) {
						$ipremiumCreditsAfterPurchase = $iPremium - $iCreditsAfterPurchase;
					}
				}
				$query = "UPDATE mytcg_user SET credits=0 WHERE user_id='{$iUserID}'";
				$aCreditsLeft=myqui($query);
				$aCreditsLeft=myqui("UPDATE mytcg_user SET premium={$ipremiumCreditsAfterPurchase} WHERE user_id='{$iUserID}'");
				myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
						VALUES ('.$iUserID.', "Spent '.$itemCost.' credits on '.$aDetails[0]['description'].'.", now(), -'.$itemCost.', 3)');
			}
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
		$aUserDetails=myqu('SELECT credits, premium 
		FROM mytcg_user 
		WHERE user_id='.$iUserID);
		$sOP.=$sTab.'<credits>'.trim($aUserDetails[0]['credits']).'</credits><premium>'.trim($aUserDetails[0]['premium']).'</premium>'.$sCRLF;
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
			$iHeight = resizeCard($iHeight, $iWidth, $aCardDetails[0]['image'], $root, $iBBHeight, $jpg);
			
			$sFound='';
			$iCountServer=0;
			while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
				if ($aOneServer['imageserver_id']==$aCardDetails[0]['thumbnail_phone_imageserver_id']){
					$sFound=$aOneServer['URL'];
				} else {
					$iCountServer++;
				}
			}
			
			$ext = '.png';
			if ($jpg) {
				$ext = '.jpg';
			}
			
			$sOP.=$sTab.'<thumburl>'.$sFound.'/cards/'.$aCardDetails[0]['image'].'_thumb'.$ext.'</thumburl>'.$sCRLF; 
			
			$sFound='';
			$iCountServer=0;
			while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
				if ($aOneServer['imageserver_id']==$aCardDetails[0]['front_phone_imageserver_id']){
					$sFound=$aOneServer['URL'];
				} else {
					$iCountServer++;
				}
			}
			
			$dir = '/cards/';
			if ($iBBHeight) {
				$dir = '/cardsbb/';
			}
			
			$sOP.=$sTab.'<fronturl>'.$sFound.$iHeight.$dir.$aCardDetails[0]['image'].'_front'.$ext.'</fronturl>'.$sCRLF;
			$sOP.=$sTab.'<frontflipurl>'.$sFound.$iHeight.$dir.$aCardDetails[0]['image'].'_front_flip'.$ext.'</frontflipurl>'.$sCRLF;

			$sFound='';
			$iCountServer=0;
			while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
				if ($aOneServer['imageserver_id']==$aCardDetails[0]['back_phone_imageserver_id']){
					$sFound=$aOneServer['URL'];
				} else {
					$iCountServer++;
				}
			}
			
			$sOP.=$sTab.'<backurl>'.$sFound.$iHeight.$dir.$aCardDetails[0]['image'].'_back'.$ext.'</backurl>'.$sCRLF; 
			$sOP.=$sTab.'<backflipurl>'.$sFound.$iHeight.$dir.$aCardDetails[0]['image'].'_back_flip'.$ext.'</backflipurl>'.$sCRLF; 
			
			$sOP.= $sTab.$sTab.'<note>'.$aCardDetails[0]['note'].'</note>'.$sCRLF;
			
			$sOP.= $sTab.'</card>'.$sCRLF;
		}
		$sOP .= '</cards>';
		header('xml_length: '.strlen($sOP));
		echo $sOP;
		exit;
  }
  
  $aUserDetails=myqu('SELECT credits, premium 
	FROM mytcg_user 
	WHERE user_id='.$iUserID);
	$sOP=$sTab.'<credits>'.trim($aUserDetails[0]['credits']).'</credits><premium>'.trim($aUserDetails[0]['premium']).'</premium>'.$sCRLF;
	$sOP.='<result>Insufficient funds.</result>';
  header('xml_length: '.strlen($sOP));
  echo $sOP;
  exit;
 }

function saveProfileDetail($iAnswerID, $iAnswer, $iUserID) {

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
		myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
				VALUES ('.$iUserID.', "Received '.$aCredit['credit_value'].' credits for answering '.$aCredit['description'].'", now(), '.$aCredit['credit_value'].', 1)');
		
		myqui('UPDATE mytcg_user SET credits = credits + '.$aCredit['credit_value'].' WHERE user_id ='.$iUserID);
				
		$aCount=myqu('SELECT answer_id
					FROM mytcg_user_answer 
					WHERE answered=0
					AND user_id='.$iUserID);
		
		$iSize = sizeof($aCount);
		if ($iSize==1){
			myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
					SELECT '.$iUserID.', descript, now(), val, 3 
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

function subcategories($lastCheckSeconds, $cat, $iUserID, $aMine, $aCard, $topcar, $iFriendID='0') {
	if($iFriendID=='0'){
		$aLoad=myqu('select count(*) loaded from mytcg_usercard where loaded = 1 and user_id = '.$iUserID);
			
		/*if ($aLoad[0]['loaded'] == 0) {
			$sOP = "<result></result>";
			header('xml_length: '.strlen($sOP));
			echo $sOP;
			exit;
		}*/
	}
	if ($topcar == -1) {
		$query = 'SELECT DISTINCT a.category_id, a.description, a.hasCards, IFNULL(a.category_parent_id, -1) category_parent_id, a.updated, a.total, IFNULL(b.collected, 0) collected
							FROM 
							(SELECT DISTINCT ca.category_id, ca.description, "true" hasCards, 
										cx.category_parent_id,
										(CASE WHEN (MAX(c.date_updated) > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
											THEN 1 ELSE 0 END) updated, count(distinct c.card_id) as total
										FROM mytcg_card c
										INNER JOIN mytcg_category ca
										ON ca.category_id = c.category_id
										LEFT OUTER JOIN mytcg_category_x cx
										ON cx.category_child_id = ca.category_id
										GROUP BY ca.category_id
										ORDER BY ca.description
							) a LEFT OUTER JOIN 
							(SELECT DISTINCT ca.category_id, ca.description, "true" hasCards, 
										cx.category_parent_id,
										(CASE WHEN (MAX(c.date_updated) > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
											THEN 1 ELSE 0 END) updated, count(distinct uc.card_id) as collected
										FROM mytcg_card c
										LEFT OUTER JOIN mytcg_usercard uc
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
										ORDER BY ca.description
							) b
							ON a.category_id = b.category_id';
		$aCategories=myqu($query);
	} else {
		$query = 'SELECT DISTINCT a.category_id, a.description, a.hasCards, a.category_parent_id, a.updated, a.total, IFNULL(b.collected, 0) collected
							FROM 
							(SELECT DISTINCT ca.category_id, ca.description, "true" hasCards, 
										cx.category_parent_id,
										(CASE WHEN (MAX(c.date_updated) > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
											THEN 1 ELSE 0 END) updated, count(distinct c.card_id) as total
										FROM mytcg_card c
										INNER JOIN mytcg_category ca
										ON ca.category_id = c.category_id
										LEFT OUTER JOIN mytcg_category_x cx
										ON cx.category_child_id = ca.category_id
										WHERE cx.category_parent_id = '.$topcar.'
										GROUP BY ca.category_id
										ORDER BY ca.description
							) a LEFT OUTER JOIN 
							(SELECT DISTINCT ca.category_id, ca.description, "true" hasCards, 
										cx.category_parent_id,
										(CASE WHEN (MAX(c.date_updated) > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
											THEN 1 ELSE 0 END) updated, count(distinct uc.card_id) as collected
										FROM mytcg_card c
										LEFT OUTER JOIN mytcg_usercard uc
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
										ORDER BY ca.description
							) b
							ON a.category_id = b.category_id';
		$aCategories=myqu($query);
	}
	
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
		$sOP.=$sTab.$sTab.'<albumname>My Cards ('.$aMine['cnt'].')</albumname>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<totalcards>'.$aMine['cnt'].'</totalcards>'.$sCRLF;
		$sOP.=$sTab.'</album>'.$sCRLF;
	}
	if ($aCard['cnt'] > 0) {
		$sOP.=$sTab.'<album>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<albumid>-3</albumid>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<hascards>true</hascards>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<updated>1</updated>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<albumname>New Cards ('.$aCard['cnt'].')</albumname>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<totalcards>'.$aCard['cnt'].'</totalcards>'.$sCRLF;
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
		
		$sOP.=$sTab.$sTab.'<albumname>'.trim($aCategory['description']).' ('.trim($aCategory['collected']).'/'.trim($aCategory['total']).')</albumname>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<totalcards>'.trim($aCategory['total']).'</totalcards>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<collected>'.trim($aCategory['collected']).'</collected>'.$sCRLF;
		$sOP.=$sTab.$sTab.'</album>'.$sCRLF;
		$iCount++;
	}
	$sOP.='</usercategories>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	return $sOP;
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
			IFNULL(P.PRICE,0) PRICE,IFNULL(P.PREMIUM,0) PREMIUM,CONCAT(I.DESCRIPTION , "products/" , P.IMAGE , "_thumb.png") IMAGEURL, 
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
			ORDER BY P.PRICE, P.PREMIUM');
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

function leaders() {
	$aLeaders=myqu('SELECT leaderboard_id, description 
					FROM mytcg_leaderboards
					WHERE active = 1');
		
	$sOP='<cardcategories>'.$sCRLF;
	$count = 0;
	foreach ($aLeaders as $leader) {
	
		$sOP.=$sTab.'<albumid>'.trim($leader['leaderboard_id']).'</albumid>'.$sCRLF;	
		$sOP.=$sTab.'<albumname>'.trim($leader['description']).'</albumname>'.$sCRLF;
		$count++;
	}
	
	$sOP.='</cardcategories>';
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

function leaderboard($id, $iUserID) {
	$aLeaders=myqu('SELECT leaderboard_id, description, lquery, fquery 
					FROM mytcg_leaderboards 
					WHERE active = 1 
					AND leaderboard_id= '.$id);
					
	$sOP='<leaderboard>'.$sCRLF;
	
	if (sizeof($aLeaders) > 0) {
		$query = $aLeaders[0]['lquery'];
		if ($iUserID != '') {
			$q = $aLeaders[0]['fquery'];
			$query = str_replace("__REPLACE__", $iUserID, $q);
		}
		$aQuery=myqu($query);
	
		$count = 0;
		foreach ($aQuery as $leader) {
			$sOP.=$sTab.'<leader>'.$sCRLF;	
			$sOP.=$sTab.'<val>'.trim($leader['val']).'</val>'.$sCRLF;	
			$sOP.=$sTab.'<usr>'.trim($leader['usr']).'</usr>'.$sCRLF;
			$sOP.=$sTab.'</leader>'.$sCRLF;	
			$count++;
		}
	}
	$sOP.='</leaderboard>';
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}
function friends($iUserID) {
	$aFriends=myqu('select a.user_id, a.username, a.credits, b.description
						from
					(
										select distinct a.username, a.user_id, a.credits, c.card_id, c.description, max(c.avgranking) avg
										from mytcg_user a, mytcg_frienddetail b, mytcg_card c, mytcg_usercard d
										where a.user_id = b.friend_id
										and d.user_id = a.user_id
										and c.card_id = d.card_id
										and b.user_id = '.$iUserID.'
										group by a.username
					) a, mytcg_usercard d, mytcg_card b
					where a.user_id = d.user_id
					and d.card_id = b.card_id
					and b.avgranking = a.avg
					group by username');
		
	$sOP='<friends>'.$sCRLF;
	$count = 0;
	foreach ($aFriends as $friend) {
		$sOP.=$sTab.'<friend>'.$sCRLF;	
		$sOP.=$sTab.'<user_id>'.trim($friend['user_id']).'</user_id>'.$sCRLF;
		$sOP.=$sTab.'<usr>Username : '.trim($friend['username']).'</usr>'.$sCRLF;
		$sOP.=$sTab.'<val>Credits : '.trim($friend['credits']).'</val>'.$sCRLF;
		$sOP.=$sTab.'<desc>Best Card : '.trim($friend['description']).'</desc>'.$sCRLF;
		$sOP.=$sTab.'</friend>'.$sCRLF;	
		$count++;
	}
	$sOP.='</friends>';
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

function userdetails($iUserID,$iHeight,$iWidth,$root,$jpg=1) {
	$aUserDetails=myqu('SELECT username, email_address, IFNULL(credits,0) credits, IFNULL(premium, 0) premium, freebie '
		.'FROM mytcg_user '
		.'WHERE user_id="'.$iUserID.'"');
	$sOP='<userdetails>'.$sCRLF;
	$sOP.=$sTab.'<username>'.trim($aUserDetails[0]['username']).'</username>'.$sCRLF;	
	$sOP.=$sTab.'<email>'.trim($aUserDetails[0]['email_address']).'</email>'.$sCRLF;
	$sOP.=$sTab.'<credits>'.trim($aUserDetails[0]['credits']).'</credits>'.$sCRLF;
	$sOP.=$sTab.'<premium>'.trim($aUserDetails[0]['premium']).'</premium>'.$sCRLF;
	$sOP.=$sTab.'<freebie>'.trim($aUserDetails[0]['freebie']).'</freebie>'.$sCRLF;
	$sOP.=$sTab.'<status></status>'.$sCRLF;
	
	$aUserTransactions=myqu('SELECT description FROM mytcg_credits WHERE userid = '.$iUserID.' ORDER BY creditid DESC LIMIT 10');
	
	$ext = '.png';
	if ($jpg) {
		$ext = '.jpg';
	}
	
	//we need to return the url for the loading card
	$height = resizeLoadingCard($iHeight, $iWidth, $root, $jpg);
	$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
	$sOP.='<loadingurl>'.$imageUrlQuery[0]['description'].$height.'/cards/loading'.$ext.'</loadingurl>'.$sCRLF;
	$sOP.='<loadingurlflip>'.$imageUrlQuery[0]['description'].$height.'/cards/loadingFlip'.$ext.'</loadingurlflip>'.$sCRLF;
	
	$sOP.='</userdetails>';
	header('xml_length: '.strlen($sOP));
	$query = 'UPDATE mytcg_usercard set loaded = 1 where usercardstatus_id = 1 and user_id = '.$iUserID;
	myqu($query);
	
	return $sOP;
}
function tradeCard($tradeMethod, $receiveNumber, $iUserID, $cardID, $messageID) {
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
	
	myqui('INSERT INTO mytcg_tradecard
		(user_id, trademethod, detail, date, card_id, status_id, note)
		VALUES
		('.$iUserID.', "'.$tradeMethod.'", "'.$receiveNumber.'", now(), '.$cardID.', 0, "'.$sentNote.'") ');
	
	$aCheckUser = myqu($query);
	if (sizeof($aCheckUser) == 0){
		if ($tradeMethod == 'phone_number') {
			$aCheckCard=myqu('select concat(username, message) a
							from mytcg_user, mytcg_message
							WHERE user_id = '.$iUserID.' 
							AND id = '.$messageID);
			$sOP='<result>User not found. '.$aCheckCard[0]['a'].'</result>'.$sCRLF;
		} else {
			$sOP='<result>User not found.</result>'.$sCRLF;
			}
		header('xml_length: '.strlen($sOP));
		echo $sOP;
		exit;
	}
		
	myqui('INSERT INTO mytcg_frienddetail (user_id, friend_id)
		VALUES ('.$iUserID.', '.$aCheckUser[0]['user_id'].')');
		
	myqui('INSERT INTO mytcg_frienddetail (user_id, friend_id)
		VALUES ('.$aCheckUser[0]['user_id'].', '.$iUserID.')');
  
  $sOP='<result>Card sending currently not supported.</result>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
	
  //usercardstatus_id = 4 = Received.
  myqui('UPDATE mytcg_usercard set loaded = 1 where usercard_id = '.$aCheckCard[0]['usercard_id']);
  myqui('UPDATE mytcg_usercard SET user_id = '.$aCheckUser[0]['user_id'].', usercardstatus_id = 4 '
		.' WHERE usercard_id = '.$aCheckCard[0]['usercard_id']);
		
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
function invite($tradeMethod, $receiveNumber, $iUserID, $messageID) {
	//check if the target user exists
	$query = 'SELECT user_id, username FROM mytcg_user WHERE ';
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
		if ($tradeMethod == 'phone_number') {
			$aCheckCard=myqu('select concat(username, message) a
							from mytcg_user, mytcg_message
							WHERE user_id = '.$iUserID.' 
							AND id = '.$messageID);
			$sOP='<result>User not found. '.$aCheckCard[0]['a'].'</result>'.$sCRLF;
		} else {
			$sOP='<result>User not found. Invite Sent.</result>'.$sCRLF;
		}
		
		if ($tradeMethod == 'email') {
			myqui('INSERT INTO mytcg_invite(user_id, email, sent)
				VALUES ('.$iUserID.', "'.$receiveNumber.'", 0)');
		}
		else if ($tradeMethod == 'phone_number') {
			myqui('INSERT INTO mytcg_invite(user_id, msisdn, sent)
				VALUES ('.$iUserID.', "'.$receiveNumber.'", 0)');
		}
		
		header('xml_length: '.strlen($sOP));
		echo $sOP;
		exit;
	}

	myqui('INSERT INTO mytcg_frienddetail (user_id, friend_id)
		VALUES ('.$iUserID.', '.$aCheckUser[0]['user_id'].')');
		
	myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, notificationtype_id)
		VALUES ('.$iUserID.', "You added '.$aCheckUser[0]['username'].' as a friend.", now(), 1)');
		
	myqui('INSERT INTO mytcg_frienddetail (user_id, friend_id)
		VALUES ('.$aCheckUser[0]['user_id'].', '.$iUserID.')');
	
	$aCheckCard=myqu('select username
						from mytcg_user
						WHERE user_id = '.$iUserID);
						
	myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, notificationtype_id)
		VALUES ('.$aCheckUser[0]['user_id'].', "'.$aCheckCard[0]['username'].' added you as a friend.", now(), 1)');

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
  
	$sOP='<result>Friend added successfully</result>'.$sCRLF;
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}
// register user 
function registerUser ($username, $password, $email, $referer,$iHeight,$iWidth,$root,$ip='',$url='www.mytcg.net') {
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
			echo userdetails($iUserID,$iHeight,$iWidth,$root);
			exit;
		}
	}
	$qu = "SELECT user_id, username FROM mytcg_user WHERE username = '{$referer}' or email_address = '{$referer}' or msisdn = '{$referer}'";
	//echo $qu;
	
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
		
		//check if the username is untaken
		/*$aIPDetails=myqu('SELECT username '
			.'FROM mytcg_user '
			.'WHERE ip="'.$ip.'"');
		if (sizeof($aIPDetails) > 0) {
			$sOP.='<result>';
			$sOP.=''.$aIPDetails[0]['username'].' has already registered from this device.';
			$sOP.='</result>';
			return $sOP;
		}*/
		
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
		
		
		$aReferer=myqu($qu);
		
		$refererid = 0;
		
		if (sizeof($aReferer) > 0 && strlen($referer) > 0) {
			$refererid = $aReferer[0]['user_id'];
			
			$aCountRefer=myqu("SELECT count(*) cnt FROM mytcg_transactionlog WHERE val = 10 and description like '%referring%' and user_id = '{$refererid}'");
			$iCount = $aCountRefer[0]['cnt'];
			if ($iCount <= 3) {
				$query = "update mytcg_user set credits = credits + 10 where user_id = ".$refererid;
				myqu($query);
					
				myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
					VALUES ('.$refererid.', "Received 10 credits for referring '.$username.'", now(), 10, 1)');
					
				myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, notificationtype_id)
					VALUES ('.$refererid.', "'.$username.' has joined the Game Cards experience from your referral.", now(), 1)');
			} else {
				myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, notificationtype_id)
					VALUES ('.$refererid.', "'.$username.' has joined the Game Cards experience from your referral.", now(), 1)');
			}
		}
		
		myqu("INSERT INTO mytcg_user (username, email_address, is_active, date_register, credits, gameswon, ip, loaded) VALUES ('{$username}', '{$email}', 1, now(), 300, 0, '{$ip}', 1)");
		
		$aUserDetails=myqu("SELECT user_id, username FROM mytcg_user WHERE username = '{$username}'");
		$iUserID = $aUserDetails[0]['user_id'];
		$iMod=(intval($iUserID) % 10)+1;
		$crypPass = substr(md5($iUserID),$iMod,10).md5($password);
		myqu("UPDATE mytcg_user SET password = '{$crypPass}' WHERE user_id = {$iUserID}");
		
		if (sizeof($aReferer) > 0 && strlen($referer) > 0) {
			myqui('INSERT INTO mytcg_frienddetail (user_id, friend_id)
				VALUES ('.$refererid.', '.$iUserID.')');
				
			myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, notificationtype_id)
				VALUES ('.$refererid.', "'.$username.' has been added to your friend list.", now(), 1)');
			
			myqui('INSERT INTO mytcg_frienddetail (user_id, friend_id)
				VALUES ('.$iUserID.', '.$refererid.')');
				
			myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, notificationtype_id)
				VALUES ('.$iUserID.', "'.$aReferer[0]['username'].' has been added to your friend list.", now(), 1)');
		}
		
		//create the empty data fields in mytcg_user_answer
		myqu("INSERT INTO mytcg_user_answer
			(detail_id, user_id)
			SELECT detail_id, {$iUserID}
			FROM mytcg_user_detail");
			
		//create empty achievements
		myqu("INSERT INTO mytcg_userachievementlevel 
			(user_id, achievementlevel_id)
			SELECT {$iUserID}, id
			FROM mytcg_achievementlevel");
			
		myqui('INSERT INTO mytcg_transactionlog (user_id, description, date, val, transactionlogtype_id)
			SELECT '.$iUserID.', descript, now(), val, 1 
			FROM mytcg_transactiondescription
			WHERE transactionid = 2');
			
		myqui('INSERT INTO mytcg_frienddetail (user_id, friend_id)
			VALUES ('.$iUserID.', '.$iUserID.')');
		
		myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, notificationtype_id)
			VALUES ('.$iUserID.', "Did you know, you can visit '.$url.' for a web based experience.", now(), 1)');
		
		//return userdetails
		echo userdetails($iUserID,$iHeight,$iWidth,$root);
		exit;
	}
}

function creditlog($iUserID, $transactionlogtypes) {
	$aTransactionDetails=myqu('SELECT transaction_id, description, date, val 
								FROM mytcg_transactionlog  
								WHERE user_id='.$iUserID.'
								AND transactionlogtype_id IN ('.$transactionlogtypes.')
								ORDER BY date DESC
								LIMIT 0, 10');
		
	$aCredits=myqu('SELECT IFNULL(credits, 0) credits, IFNULL(premium, 0) premium 
		FROM mytcg_user  
		WHERE user_id='.$iUserID);
		
	$iCredits = $aCredits[0];
	$sOP='<transactions>'.$sCRLF;
	$sOP.='<credits>'.trim($iCredits['credits']).'</credits><premium>'.trim($iCredits['premium']).'</premium>'.$sCRLF;
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

function notifications($iUserID, $notificationtypes) {
	$aTransactionDetails=myqu('SELECT notification_id, notification, notedate 
								FROM mytcg_notifications  
								WHERE user_id='.$iUserID.'
								AND notificationtype_id IN ('.$notificationtypes.') 
								ORDER BY notedate DESC
								LIMIT 0, 10');

	$sOP='<notifications>'.$sCRLF;
	$iCount=0;
	while ($aTransactionDetail=$aTransactionDetails[$iCount]){
		$sOP.='<note>'.$sCRLF;
		$sOP.=$sTab.'<id>'.trim($aTransactionDetail['notification_id']).'</id>'.$sCRLF;
		$sOP.=$sTab.'<desc>'.trim($aTransactionDetail['notification']).'</desc>'.$sCRLF;		
		$sOP.=$sTab.'<date>'.trim($aTransactionDetail['notedate']).'</date>'.$sCRLF;
		$sOP.='</note>'.$sCRLF;
		$iCount++;
	}
	
	$sOP.='</notifications>';
	header('xml_length: '.strlen($sOP));
	echo $sOP;
	exit;
}

/** for logging credit changes */
function logtransaction($iDescription, $iValue, $iUserID, $iTransactionTypeId) {
	myqui('INSERT INTO mytcg_transactionlog (user_id, description, val, date, transactionlogtype_id) 
			VALUES('.$iUserID.',"'.$iDescription.'",'.$iValue.',now(), '.$iTransactionTypeId.')');
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
	myqui('UPDATE mytcg_usercard set loaded = 1 where card_id = '.$iCardID.' and user_id = '.$userID);
    $aCards=myqui("INSERT INTO mytcg_usercard (user_id, card_id, usercardstatus_id)
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

function myqu($sQuery) {
	$conn = new dbconnection();
	return $conn->_myqu($sQuery);
}

function myqui($sQuery) {
	$conn = new dbconnection();
	$conn->_myqui($sQuery);
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
		myqui('UPDATE mytcg_usercard set loaded = 1 where card_id = '.$iCardID.' and user_id = '.$userID);
		$aCards=myqui("INSERT INTO mytcg_usercard (user_id, card_id, usercardstatus_id)
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
function cardsincategory($iCategory,$iHeight,$iWidth,$iShowAll,$lastCheckSeconds,$iUserID,$iDeckID, $root, $iBBHeight=0, $jpg=1, $iFriendID='0') {
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
	
	//echo $iCategory.' '.$iUserID.' ';
	
	// C.usercardstatus_id = 1 = Album
	// D.usercardnotestatus_id = 1 = Normal
	
	if ($iCategory == -1) {
		if($iFriendID=='0'){
			$aLoad=myqu('select count(*) loaded from mytcg_usercard where loaded = 1 and usercardstatus_id = 1 and user_id = '.$iUserID);
				
			/*if ($aLoad[0]['loaded'] == 0) {
				$sOP = "<result></result>";
				header('xml_length: '.strlen($sOP));
				echo $sOP;
				exit;
			}*/
		}
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
		if($iFriendID=='0'){
			$aLoad=myqu('select count(*) loaded from mytcg_usercard where loaded = 1 and usercardstatus_id = 1 and user_id = '.$iUserID);
				
			/*if ($aLoad[0]['loaded'] == 0) {
				$sOP = "<result></result>";
				header('xml_length: '.strlen($sOP));
				echo $sOP;
				exit;
			}*/
		}
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
		if($iFriendID=='0'){
			$aLoad=myqu('select count(*) loaded from mytcg_usercard where loaded = 1 and usercardstatus_id = 4 and user_id = '.$iUserID);
				
			/*if ($aLoad[0]['loaded'] == 0) {
				$sOP = "<result></result>";
				header('xml_length: '.strlen($sOP));
				echo $sOP;
				exit;
			}*/
		}
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
		if($iFriendID=='0'){
			$aLoad=myqu('select count(*) loaded from mytcg_usercard a, mytcg_card b where a.card_id = b.card_id and a.usercardstatus_id = 1 and loaded = 1 and a.user_id = '.$iUserID.' and category_id = '.$iCategory);
				
			/*if ($aLoad[0]['loaded'] == 0) {
				$sOP = "<result></result>";
				header('xml_length: '.strlen($sOP));
				echo $sOP;
				exit;
			}*/
		}
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
		if($iFriendID=='0'){
			$query = 'select count(*) loaded from mytcg_usercard a, mytcg_card b where a.card_id = b.card_id and a.usercardstatus_id = 1 and loaded = 1 and a.user_id = '.$iUserID.' and category_id = '.$iCategory;
			$aLoad=myqu($query);		
			$sOP.=$query;
			
			/*if ($aLoad[0]['loaded'] == 0) {
				$sOP = "<result></result>";
				header('xml_length: '.strlen($sOP));
				echo $sOP;
				exit;
			}*/
		}
		$qu = 'SELECT A.card_id, count(*) quantity, B.image, A.usercard_id,  B.value, 
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
					ORDER BY description';
		/*echo $qu;*/
		$aCards=myqu($qu);
	}
	
	$sOP = buildCardListXML($aCards, $iHeight, $iWidth, $root, $iBBHeight, $jpg, $iUserID, $iFriendID);
	
	return $sOP;
}

function cardsincategorynotdeck($iCategory,$iHeight,$iWidth,$lastCheckSeconds,$iUserID,$iDeckID,$root, $iBBHeight=0, $jpg=1) {
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
				AND B.playable = 1 
				AND (B.category_id='.$iCategory.' OR B.category_id IN (SELECT category_child_id FROM mytcg_category_x WHERE category_parent_id = '.$iCategory.')) 
				AND C.usercardstatus_id=1 
				AND B.card_id NOT IN (SELECT card_id FROM mytcg_usercard WHERE deck_id = '.$iDeckID.') 
				AND A.deck_id IS NULL 
				GROUP BY B.card_id ');
	
	$sOP = buildCardListXML($aCards, $iHeight, $iWidth, $root, $iBBHeight, $jpg);
	
	return $sOP;
}

function buildCardListXML($cardList,$iHeight,$iWidth,$root, $iBBHeight=0, $jpg=1, $iUserID, $iFriendID='0') {
	$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
		.'FROM mytcg_imageserver b '
		.'ORDER BY b.description DESC '
	);

	$sOP='<cardsincategory>'.$sCRLF;
	$iCount=0;
	
	$ext = '.png';
	if ($jpg) {
		$ext = '.jpg';
	}
	$ids = '';
	while ($aOneCard=$cardList[$iCount]){
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
		$ids.=(($ids=='')?$aOneCard['card_id']:(','.$aOneCard['card_id']));
		
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['thumbnail_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		$sOP.=$sTab.$sTab.'<thumburl>'.$sFound.'cards/'.$aOneCard['image'].'_thumb'.$ext.'</thumburl>'.$sCRLF;
		
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
    
		$sOP.=$sTab.$sTab.'<fronturl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_front'.$ext.'</fronturl>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<frontflipurl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_front_flip'.$ext.'</frontflipurl>'.$sCRLF;

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
		$sOP.=$sTab.$sTab.'<backflipurl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_back_flip'.$ext.'</backflipurl>'.$sCRLF; 

		$aStats=myqu('SELECT A.description as des, B.description as val, statvalue, A.selectable, 
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
				frontorback="'.$aOneStat['frontorback'].'" red="'.$aOneStat['colour_r'].'" green="'.$aOneStat['colour_g'].'" blue="'.$aOneStat['colour_b'].'" selectable="'.$aOneStat['selectable'].'">'.$aOneStat['des'].'</stat>'.$sCRLF;
			$iCountStat++;
		}
		$sOP.=$sTab.$sTab.'</stats>'.$sCRLF;
		
		$iCount++;
		$sOP.=$sTab.'</card>'.$sCRLF;
	}
	$sOP.='</cardsincategory>'.$sCRLF;
	
	if($iFriendID =='0'){
		$query = 'UPDATE mytcg_usercard set loaded = 0 where user_id = '.$iUserID.' and card_id in ('.$ids.')';
		myqu($query);
	}
	return $sOP;
}

function getCardsInBooster($boosterid, $iHeight,$iWidth,$root,$iUserID, $iBBHeight=0, $jpg=1) {
	
	$qu = 'SELECT A.card_id, count(*) quantity, B.image, A.usercard_id,  B.value, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, B.ranking, D.description quality,
					0 updated, D.note, D.date_updated  
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
					INNER JOIN 
					(SELECT c.card_id 
						FROM mytcg_product a, mytcg_productcard b, mytcg_card c, mytcg_cardquality d 
						WHERE a.product_id = b.product_id 
						AND c.card_id = b.card_id 
						AND d.cardquality_id = c.cardquality_id 
						AND a.product_id = '.$boosterid.'
					) E
					ON E.card_id = B.card_id
					WHERE A.user_id='.$iUserID.'
					AND C.usercardstatus_id=1 	
					GROUP BY B.card_id 
					UNION 
					SELECT B.card_id, 0, B.image, 0,  B.value, 
								B.description, B.thumbnail_phone_imageserver_id, "", "", B.ranking, D.description quality, 
								0, "", 0 
					FROM mytcg_card B 
					INNER JOIN mytcg_cardquality D
					ON B.cardquality_id=D.cardquality_id
					INNER JOIN 
					(SELECT c.card_id 
						FROM mytcg_product a, mytcg_productcard b, mytcg_card c, mytcg_cardquality d 
						WHERE a.product_id = b.product_id 
						AND c.card_id = b.card_id 
						AND d.cardquality_id = c.cardquality_id 
						AND a.product_id = '.$boosterid.'
					) E
					ON E.card_id = B.card_id
					WHERE B.card_id NOT IN (SELECT uc.card_id from mytcg_usercard uc, mytcg_usercardstatus ucs 
						where uc.user_id = '.$iUserID.' and uc.usercardstatus_id = ucs.usercardstatus_id and ucs.usercardstatus_id=1) 
					GROUP BY B.card_id 
					ORDER BY description';
					
	$cardList=myqu($qu);
	
	$aServers=myqu('SELECT b.imageserver_id, b.description as URL '
		.'FROM mytcg_imageserver b '
		.'ORDER BY b.description DESC '
	);

	$sOP='<cardsincategory>'.$sCRLF;
	$iCount=0;
	
	$ext = '.png';
	if ($jpg) {
		$ext = '.jpg';
	}
	
	while ($aOneCard=$cardList[$iCount]){
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
		$sOP.=$sTab.$sTab.'<thumburl>'.$sFound.'cards/'.$aOneCard['image'].'_thumb'.$ext.'</thumburl>'.$sCRLF;
		
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
    
		$sOP.=$sTab.$sTab.'<fronturl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_front'.$ext.'</fronturl>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<frontflipurl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_front_flip'.$ext.'</frontflipurl>'.$sCRLF;

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
		$sOP.=$sTab.$sTab.'<backflipurl>'.$sFound.$iHeight.$dir.$aOneCard['image'].'_back_flip'.$ext.'</backflipurl>'.$sCRLF; 

		$aStats=myqu('SELECT A.description as des, B.description as val, statvalue, A.selectable,  
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
				frontorback="'.$aOneStat['frontorback'].'" red="'.$aOneStat['colour_r'].'" green="'.$aOneStat['colour_g'].'" blue="'.$aOneStat['colour_b'].'" selectable="'.$aOneStat['selectable'].'">'.$aOneStat['des'].'</stat>'.$sCRLF;
			$iCountStat++;
		}
		$sOP.=$sTab.$sTab.'</stats>'.$sCRLF;
		
		$iCount++;
		$sOP.=$sTab.'</card>'.$sCRLF;
	}
	$sOP.='</cardsincategory>'.$sCRLF;
	
	return $sOP;
}

function createDeck($iUserID,$iCategoryID,$iDescription) {
	myqui('INSERT INTO mytcg_deck (user_id, category_id, description) 
		VALUES('.$iUserID.','.$iCategoryID.',"'.$iDescription.'")');
		
	$deckIdQuery = myqu('SELECT max(deck_id) deck_id 
		FROM mytcg_deck 
		WHERE user_id = '.$iUserID.' 
		AND category_id = '.$iCategoryID.' 
		AND description = "'.$iDescription.'"');
	$deckId = $deckIdQuery[0]['deck_id'];
	$sOP = '<created><deck_id>'.$deckId.'</deck_id><result>Deck Created!</result></created>';
	
	return $sOP;
}

function checkAchis($iUserID, $iAchiTypeId) {
	$achiQu = ('SELECT ual.id, ual.progress, al.target, a.calc_id, a.reset, a.query, a.name 
		FROM mytcg_userachievementlevel ual
		INNER JOIN mytcg_achievementlevel al
		ON al.id = ual.achievementlevel_id
		INNER JOIN mytcg_achievement a
		ON a.id = al.achievement_id
		WHERE ual.date_completed IS NULL
		AND ual.user_id = '.$iUserID.' 
		AND a.type_id = '.$iAchiTypeId);
	
	$achiQuery = myqu($achiQu);
	
	$count = 0;
	while ($aOneAchi=$achiQuery[$count]) {
		$count++;
		
		$userAchiId = $aOneAchi['id'];
		$reset = $aOneAchi['reset'];
		$target = $aOneAchi['target'];
		$progress = $aOneAchi['progress'];
		$query = $aOneAchi['query'];
		$name = $aOneAchi['name'];
		$query = str_replace("useridreplac", $iUserID, $query);
		
		$valQuery = myqu($query);
		$val = $valQuery[0]['val'];
		if ($aOneAchi['calc_id'] == ACHI_INC) {
			if ($val >= 0) {
				$updateQuery = "UPDATE mytcg_userachievementlevel SET date_updated = now(), progress = progress + ".$val." WHERE id = ".$userAchiId;
				myqu($updateQuery);
				
				$progress = $progress + $val;
			}
			else if ($reset == 1) {
				$updateQuery = "UPDATE mytcg_userachievementlevel SET date_updated = now(), progress = 0 WHERE id = ".$userAchiId;
				myqu($updateQuery);
				
				$progress = 0;
			}
		}
		else if ($aOneAchi['calc_id'] == ACHI_TOT) {
			$updateQuery = "UPDATE mytcg_userachievementlevel SET date_updated = now(), progress = ".$val." WHERE id = ".$userAchiId;
			myqu($updateQuery);
			
			$progress = $val;
		}
		
		if ($progress >= $target) {
			$updateQuery = "UPDATE mytcg_userachievementlevel SET date_completed = now() WHERE id = ".$userAchiId;
			myqu($updateQuery);
			
			myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, notificationtype_id)
					VALUES ('.$iUserID.', "Achievement earned! ('.$name.') Well Done!", now(), 1)');
		}
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

?>