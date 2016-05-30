#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

my @words;
open (my $file, '<','text.txt');
foreach my $line (<$file>) {
#foreach my $line ( <STDIN> ) {
	$line =~ tr/.,:;!?"(){}//d;
#	push (@words, split(/\W/, $line));
	push (@words, split('',$line));
}

my @bigrams;
my %bigram_count;

for ( my $i = 0; $i < $#words; $i++ ) {
	$bigrams[ $i ] = $words[ $i ] . ' ' . $words[ $i + 1 ];
	$bigram_count{ $bigrams[ $i ] }++;
}

foreach my $key
		(sort {$bigram_count{$b} <=> $bigram_count{$a}}
		(keys %bigram_count)) {
	print "$bigram_count{$key} $key\n";
}
