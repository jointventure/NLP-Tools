package ShortcutTrans; 

use strict; 
use warnings; 
use autodie;
use Moose;

has 'shortcut' => (is => 'rw', default => ' ');
has 'target_language' => (is => 'rw', default => 'ge');

my %translation_of = (
					'Bd.'		=> [ 'Band', 'volume', 'svazek' ],
					'Bsp.'      => [ 'Beispiel', 'example', 'příklad' ],
					'bzw.'	    => [ 'beziehungsweise', 'respectively', 'popřípadě' ],
					'd.h.'		=> [ 'das heißt', 'that is (i.e.)', 'to jest' ], 
					'ebd.'		=> [ 'ebenda', 'ibidem (ibid.)', 'tamtéž' ],
					'evtl.'		=> [ 'eventuell', 'possibly', 'eventuální'],
					'Hrsg.'		=> [ 'Herausgeber', 'editor (ed.)', 'vydavatel' ],
					'i.e.S.'	=> [ 'im engeren Sinne', 'in the narrower sense', 'v užším smyslu' ],
					'i.w.S.'	=> [ 'im weiteren Sinne', 'in the broader sense', 'v širším smyslu' ],
					'S.'		=> [ 'Seite', 'page', 'stránka' ],
					'u.a.'		=> [ 'unter anderem', 'inter alia', 'mezi jiným' ],
					'usw.'		=> [ 'und so weiter', 'and so on', 'a tak dále (atd.)' ],
					'vgl.'		=> [ 'vergleiche', 'compare (cp.)', 'srovnej' ],
					'z.B.'      => [ 'zum Beispiel', 'for example', 'například' ],
);

sub translate {
	my $self = shift;
	if (defined $translation_of{$self->shortcut()}) {
		if ($self->target_language() =~ /en/) {
			return $translation_of{$self->shortcut()}[1]
		}
		elsif ($self->target_language() =~ /cz/) {
			return $translation_of{$self->shortcut()}[2];
		}
		else {
			return $translation_of{$self->shortcut()}[0];
		}
	}
	else {
		return "short cut is not in lexicon";
	}
}

1;
__END__

=pod

=head1 NAME

ShortcutTrans::translate - A simple translater for short cuts

=head1 SYNOPSIS

use ShortcutTrans;
my $r = ShortcutTrans->new;
$r->{shortcut} = 'Bsp.';
$r->{target_language} = 'cz';
print $r->translate()."\n";

=head1 DESCRIPTION

This class contains a function that expects a german short cut and the target language for translation and returns either the long version in german or the translation in English or Czech. 

=head2 Languages

German (ge), Czech (cz), English (en)

=head1 AUTHOR

Lisa Dobs

=cut
