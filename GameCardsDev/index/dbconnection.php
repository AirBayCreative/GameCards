<?php

class dbconnection {
	function _myqu($sQuery){
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
		$thread_id = mysqli_thread_id($aLink);
		mysqli_kill($aLink, $thread_id);
		mysqli_close($aLink);

		return $aOutput;
	}
	function _myqui($sQuery){
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
		$thread_id = mysqli_thread_id($aLink);
		mysqli_kill($aLink, $thread_id);
		mysqli_close($aLink);

	}
}

?>