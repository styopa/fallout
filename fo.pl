#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

if ($#ARGV < 1) {
	my $num = $#ARGV + 1;
	die "Too little arguments: $num\n" .
		"USAGE: $0 PASSWORD PASSWORD...\n"
}

my $len = length($ARGV[0]);
foreach my $passwd (@ARGV) {
	if ( length($passwd) != $len ) {
		die 'Passwords are of different length: ' .
			"'${ARGV[0]}' and '$arg'\n";
	}
}

my @passwords = map(lc, @ARGV);

for (0..$#ARGV) {
	
}
