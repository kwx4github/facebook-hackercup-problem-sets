<?php
// Leo Jiang
set_time_limit(200);
ini_set('memory_limit','512M');

$file=file('IN2');
unset($file[0]);
$file=array_merge($file);
foreach($file as $k=>$v)
	$file[$k]=trim($v);
$out=array();

$sets=array();
while(count($file)>0){
	$sets[]=array_slice($file,0,$file[1]+2);
	$file=array_slice($file,$file[1]+2);
}

function sub($total,$foods){
	foreach($total as $k=>$v){
		$total[$k]=$v-$foods[$k];
		if($total[$k]<0)
			return false;
	}
	return $total;
}

function zero($total){
	foreach($total as $v)
		if($v)
			return false;
	return true;
}

function r($left,$foods){
	if(zero($left))return true;
	if(!$foods)return false;
	
	foreach($foods as $k=>$food){
		$t=sub($left,$food);
		if($t&&r($t,$foods))
			return true;
		if(!$t)
			unset($foods[$k]);
	}
	
	return false;
}

foreach($sets as $k=>$set){echo $k."\n";
	$total=explode(' ',$set[0]);
	$foods=array_slice($set,2);
	foreach($foods as $k=>$v)
		$foods[$k]=explode(' ',$v);
		
	if(r($total,$foods))
		$out[]='yes';
	else
		$out[]='no';
}


$str='';
foreach($out as $k=>$v)
	$str.='Case #'.($k+1).': '.$v."\n";
$f=fopen('OUT2','w');
fwrite($f,$str);
fclose($f);