#!/usr/bin/perl

use strict;
use warnings;

my %words;

map { $words{$_} = ( $_ =~ tr/[a-zA-Z]// ) } @ARGV;

print map { "$_ $words{$_}\n "}
	sort { $words{$b} <=> $words{$a} }
		grep { $words{$_} > 3 }
			keys %words;
