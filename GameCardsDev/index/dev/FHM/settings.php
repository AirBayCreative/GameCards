<?php
//FHM category constant
include('../functions.php');
$topcar = "30";
$root = "../../";
$invite = 30;
$usercategories = " AND (cx.category_parent_id = 30 OR (cx.category_child_id = 30 AND cx.category_parent_id IS NULL)) ";
$productcategories = " AND c.category_id = 30 ";
$url = "dev.mytcg.net";
$appkey = "FHM";
$transactionlogtypes = "2";
?>