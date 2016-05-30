#!/usr/bin/perl

use strict;
use warnings;
use Lingua::Stem::En;

# file erst downloaden?
# stopwords entfernen
my $source = 'bnc_freq_10000.txt';
my @words = ();

open (my $file, '<', $source);
while (<$file>) {
	if (! ($_ =~ /[[:punct:]]/ | /^[0-9]+/)) {
		push (@words,$_);
	}
}
close $file;

my $stemmed_words_ref = Lingua::Stem::En::stem({ -words 		=> 	\@words,
												 -locale 		=> 	'en',
					});

my @stemmed_words = @$stemmed_words_ref;

foreach my $item_stemmed (@stemmed_words) {
	print $item_stemmed, "\n";
	foreach my $item_raw (@words) {
		if ($item_raw =~ /^$item_stemmed/) {	
			print $item_raw, "\n";
		}
	}
}



#Werte der ersten Spalte in Liste schreiben,
#neue Liste mit gestemmten Wörtern,
#dann die Werte der Stem-Liste nehmen und in der originalen Inputliste suchen -> Derivate werden ausgegeben
