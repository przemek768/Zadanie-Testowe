<?php

function main($n, $weight, $first, $end, $cycle, $result){
    // print $n;
    // print_r ($weight);
    // print_r ($first);
    // print_r ($end);
    // print_r ($cycle);
    $min = 1000000000;

    for($i = 0; $i < $n; $i++){
        if(!empty($cycle[$i])){
            $minn = $min;
            $sum = 0;
            $current = $i;
            $cl = 0;
            for(;;){
                $minn = min($minn, $weight[$current]);
                $sum = $sum + $weight[$current];
                $current = $end[$current];
                $cycle[$current] = true;
                ++$cl;
                if($current == $i){
                    break;
                }
            }
            $result += min($sum + ($cl - 2) * $minn, $sum + $minn + ($cl + 1) * $min);
        }
        print_r($result);
    }
}

$n = 6;
$weight = [2400, 2000, 1200, 2400, 1600, 4000];
$first = [1, 4 ,5, 3, 6, 2];
$end = [5, 3, 2, 4, 6, 1];
$cycle = [];
$result = 0;

main($n, $weight, $first, $end, $cycle, $result);

?>