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
foreach my $arg (@ARGV) {
	if ( length($arg) != $len ) {
		die 'Passwords are of different length: ' .
			"'${ARGV[0]}' and '$arg'\n";
	}
}

sub similarity {
	my @op1 = split(//, shift);
	my @op2 = split(//, shift);
	my $i = 0;
	for (0 .. $#op1) {
		$i++ if $op1[$_] eq $op2[$_];
	}
	return $i;
}

# make 'em lowercase and convert to hash keys
my %passwords = map {$_ => 0} map(lc, @ARGV);

my ($passwd, $correct);
for (0 .. $#ARGV) {
	print "Enter password and number of correct letters.\n> ";
	$_ = <STDIN>;
	($passwd, $correct) = split /\W+/;
	$passwd = lc($passwd);
	$correct = int($correct);
}
