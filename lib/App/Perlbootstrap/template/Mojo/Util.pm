package App::Perlbootstrap::template::Mojo::Util;
use base 'Exporter';
use strict;
use utf8;
use Encode;
use Term::ANSIColor;
use warnings;
use MIME::Base64 qw(decode_base64 encode_base64);
our @EXPORT    = (qw(info error warning));
our @EXPORT_OK = (
    qw(b64_decode b64_encode class_to_path  dialog_yes_default dialog_no_default),
    @EXPORT
);

sub info {
    my @msg = @_;
    print color 'bold green';
    print encode_utf8('╠ ');
    print color 'bold white';
    print join( "\n", @msg ), "\n";
    print color 'reset';
}

sub error {
    my @msg = @_;
    print STDERR color 'bold red';
    print STDERR encode_utf8('☢☢☢ ☛  ');
    print STDERR color 'bold white';
    print STDERR join( "\n", @msg ), "\n";
    print STDERR color 'reset';
}

sub warning {
    my @msg = @_;
    print color 'bold yellow';
    print encode_utf8('☛ ');
    print color 'bold white';
    print join( "\n", @msg ), "\n";
    print color 'reset';
}

sub dialog_yes_default {
    my $msg = shift;
    local $|;
    &warning("$msg (Y/n)");
    my $a = <STDIN>;
    chomp $a;
    return 0 if ( $a =~ /n/ );
    return 1 if $a =~ /y/;
    return 1;    # default to Y
}

sub dialog_no_default {
    my $msg = shift;
    local $|;
    &warning("$msg (y/N)");
    my $a = <STDIN>;
    chomp $a;
    return 0 if ( $a =~ /n/ );
    return 1 if $a =~ /y/;
    return 0;    # default to Y
}

sub b64_decode    { decode_base64( $_[0] ) }
sub b64_encode    { encode_base64( $_[0], $_[1] ) }
sub class_to_path { join '.', join( '/', split /::|'/, shift ), 'pm' }
1;
__END__
=encoding utf8

=head1 NAME

App::Perlbootstrap::template::Mojo::Util - Minimal base Exporter module for App::Perlbootstrap::template::Mojo

=head1 SYNOPSIS

  package Cat;
  use App::Perlbootstrap::template::Mojo::Util qw(info);

  info "The bird has flown";

=head1 DESCRIPTION

L<App::Perlbootstrap::template::Mojo::Util> is a simple Exporter class for L<App::Perlbootstrap::template::Mojo>,  it exports by default, just for sake of example convenients functions for printing to console. The purpose of

=head1 FUNCTIONS

=head2 info

    info "Something"

print the output at the console

=head2 error

    error "Something bad happened!"

print the output to STDERR

=head2 warning

    warning "Something"

print the output at the console

=head2 dialog_yes_default

    dialog_yes_default "Something"

Asks the user a question, defaults to y

=head2 dialog_no_default

    dialog_no_default "Something"

Asks the user a question, defaults to n

=head2 b64_decode / b64_encode

    b64_decode "Something"

decode/encode in base 64

=head2 class_to_path

    class_to_path "some::module"

it returns the path (some/module.pm)

=head1 SEE ALSO

L<App::Perlbootstrap::template::Mojo>, L<Exporter> , L<Mojo::Utils>.

=cut
