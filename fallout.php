#!/usr/bin/php
<?php
function hamming($op1, $op2) {
    $ar1 = str_split($op1);
    $ar2 = str_split($op2);
    $diff = array_diff_assoc($ar1, $ar2);
    return count($ar1) - count($diff);
}

$passwords = array_slice($argv, 1);
array_walk(
    $passwords,
    function (&$value, $key) {
        $value = strtolower($value);
    }
);
