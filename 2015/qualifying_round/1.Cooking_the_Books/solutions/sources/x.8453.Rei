<?php
   	
	$file = file("a.in");
	$case = trim($file[0]);

	for ($i=1; $i <= $case; $i++) { 
		echo "Case #{$i}: ";
		$n = trim($file[$i]);
		$num  = array_map('intval', str_split($n));
		$num1 = array_map('intval', str_split($n));
		$max = max($num);
		$min = min($num);

		for ($k=0; $k < count($num); $k++) { 
			if ($num[$k] == $max && $num[$k] != 0) {
				$num[$k] = $num[0];
				$num[0] = $max;
			} elseif($num1[$k] == $min && $num[$k] != 0) {
				$num1[$k] = $num1[0];
				$num1[0] = $min;
			}
		}
		foreach ($num1 as $val) {
			echo $val;
		}
		echo " ";
		foreach ($num as $val) {
			echo $val;
		}
		echo "<br>";
	}

?>