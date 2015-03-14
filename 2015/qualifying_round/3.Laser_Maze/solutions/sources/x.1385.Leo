<?php
// Leo Jiang
set_time_limit(200);
ini_set('memory_limit','512M');

$file=file('IN3');
unset($file[0]);
$file=array_merge($file);
foreach($file as $k=>$v)
	$file[$k]=trim($v);
$out=array();

$sets=array();
while(count($file)>0){
	$t=explode(' ',$file[0]);
	$sets[]=array_slice($file,1,$t[0]);
	$file=array_slice($file,$t[0]+1);
}


function safe($set,$y,$x){
	for($i=$y-1;$i>=0;$i--){
		if($set[$i][$x]=='v')return false;
		if($set[$i][$x]!='.'&&$set[$i][$x]!='G')break;
	}
	for($i=$y+1;$i<count($set);$i++){
		if($set[$i][$x]=='^')return false;
		if($set[$i][$x]!='.'&&$set[$i][$x]!='G')break;
	}
	for($i=$x-1;$i>=0;$i--){
		if($set[$y][$i]=='>')return false;
		if($set[$y][$i]!='.'&&$set[$y][$i]!='G')break;
	}
	for($i=$x+1;$i<count($set[0]);$i++){
		if($set[$y][$i]=='<')return false;
		if($set[$y][$i]!='.'&&$set[$y][$i]!='G')break;
	}
	return true;
}

function turn($set){
	foreach($set as $k=>$v)
		foreach($v as $kk=>$vv){
			if($vv=='^')$set[$k][$kk]='>';
			elseif($vv=='>')$set[$k][$kk]='v';
			elseif($vv=='v')$set[$k][$kk]='<';
			elseif($vv=='<')$set[$k][$kk]='^';
		}
	return $set;
}

function r2($set,$xys,$moves){
	global $cache;
	
	$new=array();
	$turned=turn($set);
	foreach($xys as $xy){
		if(isset($set[$xy[0]][$xy[1]+1]))
			$new[]=array($xy[0],$xy[1]+1);
		if(isset($set[$xy[0]][$xy[1]-1]))
			$new[]=array($xy[0],$xy[1]-1);
		if(isset($set[$xy[0]+1][$xy[1]]))
			$new[]=array($xy[0]+1,$xy[1]);
		if(isset($set[$xy[0]-1][$xy[1]]))
			$new[]=array($xy[0]-1,$xy[1]);
	}
	foreach($new as $k=>$v){
		if(isset($cache[$v[0].'|'.$v[1].'|'.(($moves+1)%4)])){unset($new[$k]);continue;}
		if(!safe($turned,$v[0],$v[1])){unset($new[$k]);continue;}
		if($turned[$v[0]][$v[1]]=='G')return $moves+1;
		$cache[$v[0].'|'.$v[1].'|'.(($moves+1)%4)]=true;
	}
	if(!$new)return false;
	return r2($turned,$new,$moves+1);
}

$cache=array();
foreach($sets as $set){
	foreach($set as $k=>$v)
		$set[$k]=str_split($v);
	
	for($y=0;$y<count($set);$y++)
		for($x=0;$x<count($set[0]);$x++)
			if($set[$y][$x]=='S')
				break 2;
	
	$set[$y][$x]='.';
	//$t=r($set,$y,$x,0);
	$cache=array();
	$t=r2($set,array(array($y,$x)),0);
	if(!$t)
		$out[]='impossible';
	else
		$out[]=$t;
}


$str='';
foreach($out as $k=>$v)
	$str.='Case #'.($k+1).': '.$v."\n";
$str=trim($str);
$f=fopen('OUT3','w');
fwrite($f,$str);
fclose($f);