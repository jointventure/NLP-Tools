#!/usr/bin/perl
use strict;
use warnings;
open (my $file, '<', "input");
while(<$file>) {
	$_ =~ s/ +/ /g;
	$_ =~ s/^ *//g;
	$_ =~ s/ *$//g;
	print $_;
}
close $file;
