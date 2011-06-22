<?php
/*
* File: SimpleImage.php
* Author: Simon Jarvis
* Copyright: 2006 Simon Jarvis
* Date: 08/11/06
* Link: http://www.white-hat-web-design.co.uk/articles/php-image-resizing.php
* 
* This program is free software; you can redistribute it and/or 
* modify it under the terms of the GNU General Public License 
* as published by the Free Software Foundation; either version 2 
* of the License, or (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful, 
* but WITHOUT ANY WARRANTY; without even the implied warranty of 
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
* GNU General Public License for more details: 
* http://www.gnu.org/licenses/gpl.html
*
*/
 
class SimpleImage {
   
   var $image;
   var $image_type;
 
   function load($filename) {
      $image_info = getimagesize($filename);
      $this->image_type = $image_info[2];
      if( $this->image_type == IMAGETYPE_JPEG ) {
         $this->image = imagecreatefromjpeg($filename);
      } elseif( $this->image_type == IMAGETYPE_GIF ) {
         $this->image = imagecreatefromgif($filename);
      } elseif( $this->image_type == IMAGETYPE_PNG ) {
         $this->image = imagecreatefrompng($filename);
      }
   }
   function save($filename, $image_type=IMAGETYPE_PNG, $compression=75, $permissions=null) {
      if( $image_type == IMAGETYPE_JPEG ) {
         imagejpeg($this->image,$filename,$compression);
      } elseif( $image_type == IMAGETYPE_GIF ) {
         imagegif($this->image,$filename);         
      } elseif( $image_type == IMAGETYPE_PNG ) {
         imagepng($this->image,$filename,9,PNG_ALL_FILTERS);
      }
      if( $permissions != null) {
         chmod($filename,$permissions);
      }
   }
   function output($image_type=IMAGETYPE_JPEG) {
      if( $image_type == IMAGETYPE_JPEG ) {
         imagejpeg($this->image);
      } elseif( $image_type == IMAGETYPE_GIF ) {
         imagegif($this->image);         
      } elseif( $image_type == IMAGETYPE_PNG ) {
         imagepng($this->image);
      }   
   }
   function getWidth() {
      return imagesx($this->image);
   }
   function getHeight() {
      return imagesy($this->image);
   }
   
   function rotateImage($img) {
	  $width = imagesx($img);
	  $height = imagesy($img);
	  //switch($rotation) {
		//case 90: $newimg= @imagecreatetruecolor($height , $width );break;
		//case 180: $newimg= @imagecreatetruecolor($width , $height );break;
		//case 270: $newimg= @imagecreatetruecolor($height , $width );break;
		//case 0: return $img;break;
		//case 360: return $img;break;
	  //}
	  $newimg= @imagecreatetruecolor($height , $width );
	  if($newimg) { 
		for($i = 0;$i < $width ; $i++) { 
		  for($j = 0;$j < $height ; $j++) {
			$reference = imagecolorat($img,$i,$j);
			//switch($rotation) {
			  //case 90: if(!@imagesetpixel($newimg, ($height - 1) - $j, $i, $reference )){return false;}break;
			  //case 180: if(!@imagesetpixel($newimg, $width - $i, ($height - 1) - $j, $reference )){return false;}break;
			  //case 270: if(!@imagesetpixel($newimg, $j, $width - $i, $reference )){return false;}break;
			//}
			if(!@imagesetpixel($newimg, ($height - 1) - $j, $i, $reference )){return false;}/*break;*/
		  } 
		} return $newimg; 
	  } 
	  return false;
	}
	
   function rotateToHeight($cardheight, $screenheight) {
      $ratio = $cardheight / $this->getHeight();
      $cardwidth = $this->getWidth() * $ratio;
	  
	  if ($screenheight/2 < $cardwidth) {
		$cardwidth = $screenheight/2;
		$ratio = $cardwidth / $this->getWidth();
		$cardheight = $this->getHeight() * $ratio;
	  }
	  
	  $this->resize($cardwidth,$cardheight);
	  
	  
	  $rotated_image = $this->rotateImage($this->image);
	  $this->image = $rotated_image;
   }
   function resizeToHeight($height) {
      $ratio = $height / $this->getHeight();
      $width = $this->getWidth() * $ratio;
      $this->resize($width,$height);
   }
   function resizeToWidth($width) {
      $ratio = $width / $this->getWidth();
      $height = $this->getHeight() * $ratio;
      $this->resize($width,$height);
   }
   function scale($scale) {
      $width = $this->getWidth() * $scale/100;
      $height = $this->getHeight() * $scale/100; 
      $this->resize($width,$height);
   }
   function resize($width,$height) {
      $new_image = imagecreatetruecolor($width, $height);
      imagecopyresampled($new_image, $this->image, 0, 0, 0, 0, $width, $height, $this->getWidth(), $this->getHeight());
      $this->image = $new_image;   
   } 
}
?>