#!/usr/bin/php
<?php
# helps hack terminals in Fallout 3 and 4
# copyright 2018, Styopa Semenukha, GPL v3+
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

$n = count($passwords);
for ($i = 0; $i < $n; $i++) {
    echo "Enter password and number of correct letters\n> ";
    $line = fgets(STDIN);
    $input = preg_split('/\W+/', $line);
    $entered = strtolower($input[0]);
    $correct = intval($input[1]);

    $key = array_search($entered, $passwords, true);
    if ($key === false) {
        fwrite(STDERR, "$entered is not in the list of possible passwords\n");
        exit(3);
    } else {
        unset($passwords[$key]);
    }

    $passwords = array_filter(
        $passwords,
        function ($value) use ($entered, $correct) {
            return hamming($value, $entered) == $correct;
        }
    );

    $num = count($passwords);
    if ($num > 1) {
        echo 'Possible passwords: ' . implode(' ', $passwords) . "\n";
    } elseif ($num == 1) {
        echo "The password is: ${passwords[0]}\n";
        exit(0);
    } else {
        fwrite(STDERR, "No more passwords left\n");
        exit(4);
    }
}
