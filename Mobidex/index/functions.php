<?php
include('class.upload.php');
include('dbconnection.php');

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
function resizeCard($iHeight, $iWidth, $iImage, $root, $iBBHeight=0, $jpg=0) {

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

function resizeGCCard($iHeight, $iWidth, $root, $iBBHeight=0, $jpg=0) {
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
		}  else {
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

function resizeLoadingCard($iHeight, $iWidth, $root, $iBBHeight=0, $jpg=0) {

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


function subcategories($lastCheckSeconds, $cat, $iUserID, $aMine, $aCard) {
	
	$aCategories=myqu('SELECT d.deck_id as category_id, d.description, "true" hasCards, 
		null as category_parent_id,
		(CASE WHEN (MAX(c.date_updated) > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
			THEN 1 ELSE 0 END) updated
		FROM mytcg_deck d 
		INNER JOIN mytcg_usercard uc 
		ON uc.deck_id = d.deck_id 
		INNER JOIN mytcg_card c 
		ON c.card_id = uc.card_id 
		AND uc.user_id = '.$iUserID.'
		GROUP BY d.deck_id');
	/*$aCategories=myqu('SELECT DISTINCT ca.category_id, ca.description, "true" hasCards, 
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
		ORDER BY ca.description');*/
		
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
	return $sOP;
}

function userdetails($iUserID,$iHeight,$iWidth,$root,$jpg=0,$iBBHeight=0) {
	$aUserDetails=myqu('SELECT username, email_address, name, credits '
		.'FROM mytcg_user '
		.'WHERE user_id="'.$iUserID.'"');
	$sOP='<userdetails>'.$sCRLF;
	$sOP.=$sTab.'<username>'.trim($aUserDetails[0]['username']).'</username>'.$sCRLF;	
	$sOP.=$sTab.'<email>'.trim($aUserDetails[0]['email_address']).'</email>'.$sCRLF;
	$sOP.=$sTab.'<name>'.trim($aUserDetails[0]['name']).'</name>'.$sCRLF;
	$sOP.=$sTab.'<credits>'.trim($aUserDetails[0]['credits']).'</credits>'.$sCRLF;
	$sOP.=$sTab.'<status></status>'.$sCRLF;
	
	$ext = '.png';
	if ($jpg) {
		$ext = '.jpg';
	}
	
	$dir = '/cards/';
	if ($iBBHeight) {
		$dir = '/cardsbb/';
	}
	
	//we need to return the url for the loading card
	$height = resizeLoadingCard($iHeight, $iWidth, $root, $iBBHeight, $jpg);
	$imageUrlQuery = myqu('SELECT description FROM mytcg_imageserver WHERE imageserver_id = 1');
	$sOP.='<loadingurl>'.$imageUrlQuery[0]['description'].$height.$dir.'loading'.$ext.'</loadingurl>'.$sCRLF;
	$sOP.='<loadingurlflip>'.$imageUrlQuery[0]['description'].$height.$dir.'loadingFlip'.$ext.'</loadingurlflip>'.$sCRLF;
	
	$sOP.='</userdetails>';
	header('xml_length: '.strlen($sOP));
	return $sOP;
}
function tradeCard($tradeMethod, $receiveNumber, $iUserID, $cardID, $sendNote) {
	//check if the target user exists
	$query = 'SELECT user_id FROM mytcg_user WHERE ';
	if ($tradeMethod == 'username') {
		$query .= 'username = "'.$receiveNumber.'"';
	}
	else if ($tradeMethod == 'email') {
		$query .= 'email_address = "'.$receiveNumber.'"';
	}
	else if ($tradeMethod == 'phone_number') {
		$query .= 'cell = "'.$receiveNumber.'" or mobile = "'.$receiveNumber.'"';
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
							WHERE user_id = '.$iUserID);
			$sOP='<result>User not found. '.$aCheckCard[0]['a'].'</result>'.$sCRLF;
		} else {
			$sOP='<result>User not found.</result>'.$sCRLF;
		}
		header('xml_length: '.strlen($sOP));
		echo $sOP;
		exit;
	}
	//usercardstatus_id = 4 = Received.
	myqui('INSERT INTO mytcg_usercard
		(user_id, card_id, usercardstatus_id, is_new) 
		VALUES ('.$aCheckUser[0]['user_id'].', '.$cardID.', 4, 1)');
	
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

// register user 
function registerUser($username, $password, $email, $name, $cell, $iHeight, $iWidth, $root, $country, $ip='', $url='www.mobidex.co.za') {
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
			$sOP.=usercategories(0,$iUserID);
			return $sOP;
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
			$sOP.='That email address is already registered.';
			$sOP.='</result>';
			return $sOP;
		}
		
		//check if the cell address is already in the database
		$aUserDetails=myqu('SELECT cell '
			.'FROM mytcg_user '
			.'WHERE cell="'.$cell.'"');
		if (sizeof($aUserDetails) > 0) {
			$sOP.='<result>';
			$sOP.='That cell number is already registered.';
			$sOP.='</result>';
			return $sOP;
		}
		
		myqu("INSERT INTO mytcg_user (username, email_address, is_active, date_register, credits, name, cell, country) VALUES ('{$username}', '{$email}', 1, now(), 0, '{$name}', '{$cell}', '{$country}')");
		
		$aUserDetails=myqu("SELECT user_id, username FROM mytcg_user WHERE username = '{$username}'");
		$iUserID = $aUserDetails[0]['user_id'];
		$iMod=(intval($iUserID) % 10)+1;
		$crypPass = substr(md5($iUserID),$iMod,10).md5($password);
		myqu("UPDATE mytcg_user SET password = '{$crypPass}' WHERE user_id = {$iUserID}");
		
		myqui('INSERT INTO mytcg_notifications (user_id, notification, notedate, sysnote)
			VALUES ('.$iUserID.', "Welcome and Thank you for joining Mobidex. Please visit '.$url.' for an even greater Mobidex experience.", now(), 1)');
		
		$aUserCards=myqu('SELECT * 
					FROM mytcg_tradecard
					WHERE detail = "'.$username.'"
					OR detail = "'.$email.'" 
					OR detail = "'.$cell.'"
					AND status_id = 0');
						
		$iCount=0;
		
		while ($aOneCard=$aUserCards[$iCount]){
			myqui('INSERT INTO mytcg_usercard
				(user_id, card_id, usercardstatus_id, is_new) 
				VALUES ('.$iUserID.', '.$aOneCard['card_id'].', 4, 1)');
				
			myqui('INSERT INTO mytcg_usercardnote
			(user_id, card_id, usercardnotestatus_id, note, date_updated)
			VALUES
			('.$iUserID.', '.$aOneCard['card_id'].', 1, "'.$aOneCard['note'].'", now())
			ON DUPLICATE KEY UPDATE 
			note = concat(note,"'.$aOneCard['note'].'"),
			date_updated = now()');
				
			$iCount++;
		}
		
		myqui('UPDATE mytcg_tradecard SET status_id = 1 WHERE detail = "'.$username.'" OR detail = "'.$email.'" OR detail = '.$cell.' AND status_id = 0');
		
		$sOP.=usercategories(0,$iUserID);
		return $sOP;
	}
}
function usercategories($lastCheckSeconds,$iUserID) {
	//this gets the categories that the user has cards in, and their parents
	$aCategories=myqu('SELECT d.deck_id as category_id, d.description, "true" hasCards, 
		"top" as category_parent_id,
		(CASE WHEN (MAX(c.date_updated) > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
			THEN 1 ELSE 0 END) updated
		FROM mytcg_deck d 
		LEFT OUTER JOIN mytcg_usercard uc 
		ON uc.deck_id = d.deck_id 
		LEFT OUTER JOIN mytcg_card c 
		ON c.card_id = uc.card_id 
		WHERE d.user_id = '.$iUserID.'
		GROUP BY d.deck_id');
	
	/*$aCategories=myqu('SELECT DISTINCT ca.category_id, ca.description, "true" hasCards, 
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
		GROUP BY ca.category_id ');*/
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
	
	$aAnyCard=myqu('SELECT COUNT(*) as cnt
			FROM mytcg_usercard
			WHERE usercardstatus_id = 1
			AND user_id = '.$iUserID);
			
	if ($aCard=$aAnyCard[0]) {
		if ($aCard['cnt'] > 0) {
			$sOP.=$sTab.'<album>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumid>-5</albumid>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<hascards>true</hascards>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<updated>0</updated>'.$sCRLF;
			$sOP.=$sTab.$sTab.'<albumname>All Cards</albumname>'.$sCRLF;
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


function notifications($iUserID) {
	$aTransactionDetails=myqu('SELECT notification_id, notification, notedate
								FROM mytcg_notifications  
								WHERE user_id='.$iUserID.'
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
function myqu($sQuery) {
	$conn = new dbconnection();
	return $conn->_myqu($sQuery);
}

function myqui($sQuery) {
	$conn = new dbconnection();
	$conn->_myqui($sQuery);
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
function cardsincategory($iCategory,$iHeight,$iWidth,$iShowAll,$lastCheckSeconds,$iUserID,$root,$iBBHeight=0, $jpg=0) {
	if (!($iHeight)) {
		$iHeight = '350';
	}
	if (!($iWidth)) {
		$iWidth = '250';
	}
	if (!($lastCheckSeconds)) {
		$lastCheckSeconds = "0";
	}
	
	if ($iCategory == -1) {
		$aCards=myqu('SELECT A.card_id, count(*) quantity, A.usercard_id, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, 
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated, B.cardorientation_id 
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
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated, B.cardorientation_id  
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
							THEN 1 ELSE 0 END) updated, D.note, D.date_updated, B.cardorientation_id  
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
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated, B.cardorientation_id 
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
	} else if ($iCategory == -5) {
			$aCards=myqu('SELECT A.card_id, count(*) quantity, A.usercard_id, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, 
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated, B.cardorientation_id  
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON A.card_id=B.card_id 
					INNER JOIN mytcg_usercardstatus C 
					ON C.usercardstatus_id=A.usercardstatus_id 
					LEFT OUTER JOIN 
					(SELECT note, date_updated, user_id, card_id
						FROM mytcg_usercardnote
						WHERE user_id = '.$iUserID. '
						AND usercardnotestatus_id = 1
					) D 
					ON A.user_id = D.user_id 
					AND A.card_id = D.card_id 
					WHERE A.user_id='.$iUserID. '
					AND C.usercardstatus_id=1 	
					GROUP BY B.card_id ');
	} else {
		$aCards=myqu('SELECT A.card_id, count(*) quantity, A.usercard_id, 
					B.description, B.thumbnail_phone_imageserver_id, B.front_phone_imageserver_id, B.back_phone_imageserver_id, 
					(CASE WHEN (B.date_updated > (DATE_ADD("1970-01-01 00:00:00", INTERVAL '.$lastCheckSeconds.' SECOND))) 
						THEN 1 ELSE 0 END) updated, D.note, D.date_updated, B.cardorientation_id  
					FROM mytcg_card B 
					INNER JOIN mytcg_usercard A 
					ON A.card_id=B.card_id 
					INNER JOIN mytcg_deck E
					ON E.deck_id = A.deck_id
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
					WHERE A.user_id= '.$iUserID.'
					AND (E.deck_id='.$iCategory.') 
					AND C.usercardstatus_id=1 	
					GROUP BY B.card_id ');
	}
	$sOP = buildCardListXML($aCards, $iHeight, $iWidth, $root, $iBBHeight, $jpg);
	
	return $sOP;
}
function createDeck($iUserID,$iDescription) {
	myqui('INSERT INTO mytcg_deck (user_id, description) 
		VALUES('.$iUserID.',"'.$iDescription.'")');
		
	$deckIdQuery = myqu('SELECT max(deck_id) deck_id 
		FROM mytcg_deck 
		WHERE user_id = '.$iUserID.' 
		AND description = "'.$iDescription.'"');
	$deckId = $deckIdQuery[0]['deck_id'];
	$sOP = '<created><deck_id>'.$deckId.'</deck_id><result>Deck Created!</result></created>';
	
	return $sOP;
}

function buildCardListXML($cardList,$iHeight,$iWidth,$root, $iBBHeight=0, $jpg=0) {

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
		$sOP.=$sTab.$sTab.'<cardorientation>'.$aOneCard['cardorientation_id'].'</cardorientation>'.$sCRLF;
		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['thumbnail_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
		$sOP.=$sTab.$sTab.'<thumburl>'.$sFound.'cards/'.$aOneCard['card_id'].'_thumb'.$ext.'</thumburl>'.$sCRLF;
		
		//before setting the front and back urls, make sure the card is resized for the height
		resizeCard($iHeight, $iWidth, $aOneCard['card_id'], $root, $iBBHeight, $jpg);
		
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
    
		$sOP.=$sTab.$sTab.'<fronturl>'.$sFound.$iHeight.$dir.$aOneCard['card_id'].'_front'.$ext.'</fronturl>'.$sCRLF;
		$sOP.=$sTab.$sTab.'<frontflipurl>'.$sFound.$iHeight.$dir.$aOneCard['card_id'].'_front_flip'.$ext.'</frontflipurl>'.$sCRLF;

		$sFound='';
		$iCountServer=0;
		while ((!$sFound)&&($aOneServer=$aServers[$iCountServer])){
			if ($aOneServer['imageserver_id']==$aOneCard['back_phone_imageserver_id']){
				$sFound=$aOneServer['URL'];
			} else {
				$iCountServer++;
			}
		}
    
		$sOP.=$sTab.$sTab.'<backurl>'.$sFound.$iHeight.$dir.$aOneCard['card_id'].'_back'.$ext.'</backurl>'.$sCRLF; 
		$sOP.=$sTab.$sTab.'<backflipurl>'.$sFound.$iHeight.$dir.$aOneCard['card_id'].'_back_flip'.$ext.'</backflipurl>'.$sCRLF; 

		$aStats=myqu('SELECT A.description as des, B.description as val, statvalue, 
		(CASE WHEN cardorientation_id = 2 THEN 250-(top+(height*1.5)) ELSE A.left END)-2 as "left", 
		(CASE WHEN cardorientation_id = 2 THEN A.left ELSE top END)-2 as "top", 
		(CASE WHEN cardorientation_id = 2 THEN height ELSE width END)+8 as "width", 
		(CASE WHEN cardorientation_id = 2 THEN width ELSE height END)+8 as "height", 
		frontorback, colour_r, colour_g, colour_b, C.cardorientation_id
		FROM mytcg_cardstat A, mytcg_categorystat B , mytcg_card C
		WHERE A.categorystat_id = B.categorystat_id 
		AND A.card_id = C.card_id
		AND A.description <> ""
		AND A.description is NOT NULL
		AND A.card_id = '.$aOneCard['card_id'].'
		ORDER BY frontorback, A.top ASC');
		
		$iCountStat=0;
		$sOP.=$sTab.$sTab.'<stats>'.$sCRLF;
		While ($aOneStat=$aStats[$iCountStat]) {
			$sOP.=$sTab.$sTab.$sTab.'<stat desc="'.$aOneStat['val'].'" ival="'.$aOneStat['statvalue'].'"
				left="'.intval($aOneStat['left']).'" top="'.$aOneStat['top'].'" width="'.$aOneStat['width'].'" height="'.$aOneStat['height'].'" 
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