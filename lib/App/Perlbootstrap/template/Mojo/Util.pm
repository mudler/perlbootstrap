package App::Perlbootstrap::template::Mojo::Util;
use base 'Exporter';
use App::Perlbootstrap::template::Mojo::Obj -strict;
our @EXPORT_OK = ( qw(info error warning), @EXPORT );

our @EXPORT = ();
sub info {
    print "[info] - @_  \n";
}

sub error {
    print STDERR "[error] - @_  \n";
}

sub warning {
    print "[warning] - @_  \n";
}

1;