package App::Perlbootstrap::template::Mojo::Util;
use base 'Exporter';
use strict;
use warnings;
use MIME::Base64 qw(decode_base64 encode_base64);
our @EXPORT = ();
our @EXPORT_OK = ( qw(b64_decode b64_encode class_to_path info error warning), @EXPORT );

sub info {
    print "[info] - @_  \n";
}

sub error {
    print STDERR "[error] - @_  \n";
}

sub warning {
    print "[warning] - @_  \n";
}
sub b64_decode { decode_base64($_[0]) }
sub b64_encode { encode_base64($_[0], $_[1]) }
sub class_to_path { join '.', join('/', split /::|'/, shift), 'pm' }
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

L<App::Perlbootstrap::template::Mojo::Util> is a simple Exporter class for L<App::Perlbootstrap::template::Mojo>,  it exports by default, just for sake of example convenients functions for printing to console.

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

=head1 SEE ALSO

L<App::Perlbootstrap::template::Mojo>, L<Exporter>.

=cut
