#!/usr/bin/php
<?php
function hamming($op1, $op2) {
    $ar1 = str_split($op1);
    $ar2 = str_split($op2);
    $diff = array_diff_assoc($ar1, $ar2);
    return count($ar1) - count($diff);
}

if ($argc < 4) {
    $msg = 'Too few arguments: ' . ($argc - 1) . "\nUSAGE: ${argv[0]} PASSWORD PASSWORD...\n";
    fwrite(STDERR, $msg);
    exit(1);
}

$passwords = array_slice($argv, 1);
$len = strlen($passwords[0]);
array_walk(
    $passwords,
    function (&$value, $key) use ($len, $passwords) {
        if (strlen($value) != $len) {
            $msg = "Passwords are of different length: '$value' and '${passwords[0]}'\n";
            fwrite(STDERR, $msg);
            exit(2);
        }
        $value = strtolower($value);
    }
);
