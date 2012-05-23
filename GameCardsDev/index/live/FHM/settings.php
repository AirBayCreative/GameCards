<?php
//FHM category constant
include('../functions.php');
$topcar = "51";
$root = "../../";
$invite = 51;
$usercategories = " AND (cx.category_parent_id = 51 OR (cx.category_child_id = 51 AND cx.category_parent_id IS NULL)) ";
$productcategories = " AND c.category_id = 51 ";
$url = "www.mytcg.net";
$appkey = "FHM";
$transactionlogtypes = "2";
?>