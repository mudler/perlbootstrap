package App::Perlbootstrap::Utils;
use warnings;
use strict;
use base qw(Exporter);
use Term::ANSIColor;
use Encode qw(encode_utf8);
our @EXPORT = qw(info error);

our @EXPORT_OK = ( @EXPORT, qw(warnings message) );

sub info {
    print color 'bold green';
    print  encode_utf8('☯ ☛  ');
    print  color 'bold white';
    print  "@_  \n";
    print  color 'reset';
}

sub error {

    print STDERR color 'bold red';
    print STDERR encode_utf8('☢☢☢ ☛  ');
    print STDERR color 'bold white';
    print STDERR "@_  \n";
    print STDERR color 'reset';

}

sub warning {
    print encode_utf8("⚑") . " - @_  \n";
}

sub message {
    print encode_utf8("✉") . " - @_  \n";
}
1;
