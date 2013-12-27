#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;
$\ = "\n";

if ($#ARGV < 1) {
	my $num = $#ARGV + 1;
	die "Too little arguments: $num\n" .
		"USAGE: $0 PASSWORD PASSWORD..."
}

my $len = length($ARGV[0]);
foreach my $passwd (@ARGV) {
	if ( length($passwd) != $len ) {
		die 'Passwords are of different length: ' .
			"'${ARGV[0]}' and '$passwd'";
	}
}

my @passwords = map(lc, @ARGV);

for (0..$#ARGV) {
	
}
