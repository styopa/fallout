#!/usr/bin/perl
# helps hack terminals in Fallout 3
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
foreach my $arg (@ARGV) {
	if ( length($arg) != $len ) {
		die 'Passwords are of different length: ' .
			"'${ARGV[0]}' and '$arg'";
	}
}

sub similarity {
	my $op1 = shift; # ref to array
	my @op2 = split(//, shift);
	my $i = 0;
	for (0 .. $#op2) {
		$i++ if $$op1[$_] eq $op2[$_];
	}
	return $i;
}

# make 'em lowercase and convert to hash keys
my %passwords = map {$_ => 0} map(lc, @ARGV);

my ($passwd, $correct);
for (0 .. $#ARGV) {
	{
		local $\ = '';
		print "Enter password and number of correct letters\n> ";
	}
	$_ = <STDIN>;
	($passwd, $correct) = split /\W+/;
	$passwd = lc($passwd);
	$correct = int($correct);
	unless (exists $passwords{$passwd}) {
		die "$passwd is not in the list of possible passwords";
	}
	my @entered = split(//, $passwd);
	delete $passwords{$passwd};
	foreach (%passwords) {
		#if ( similarity(
	}
}
