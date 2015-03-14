<?php

set_time_limit(600);
header("Content-Type:text/plain");
$fp = fopen("input_live", "r");
$t = trim(fgets($fp));
for ($i = 1; $i <= $t; $i++) {
    list($g_p, $g_c, $g_f) = explode(' ', trim(fgets($fp)));
    $n = trim(fgets($fp));
    $list = array();
    for ($j = 0; $j < $n; $j++) {
        $list[$j] = explode(' ', trim(fgets($fp)));
    }
    $length = pow(2, $n);
    for ($j = 0; $j < $length; $j++) {
        $sum_p = 0;
        $sum_c = 0;
        $sum_f = 0;
        $to_sum = str_split(decbin($j));
        foreach ($to_sum as $k => $v) {
            if ($v == '1') {
                $sum_p += $list[$k][0];
                $sum_c += $list[$k][1];
                $sum_f += $list[$k][2];
                if ($sum_p > $g_p || $sum_p > $g_p || $sum_p > $g_p) {
                    continue 2;
                }
                if ($sum_p == $g_p && $sum_p == $g_p && $sum_p == $g_p) {
                    echo "Case #$i: yes\n";
                    continue 3;
                }
            }
        }
    }
    echo "Case #$i: no\n";
}