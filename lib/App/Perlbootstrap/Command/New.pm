package App::Perlbootstrap::Command::New;

use base qw(App::Perlbootstrap::Command);
use warnings;
use strict;
use App::Perlbootstrap::Utils;

=encoding utf-8

=head1 NAME

App::Perlbootstrap::Command::New - generate a new perl application project

=head1 SYNOPSIS

  $ perlbootstrap new --with mojo TestApplication

=head1 DESCRIPTION

generate a new perl application project.

=head1 ARGUMENTS

=over 4

=item C<-w|--with>

choose an application style.

=item C<--help>

it prints the POD help.

=back

=head1 AUTHOR

mudler E<lt>mudler@dark-lab.netE<gt>

=head1 COPYRIGHT

Copyright 2014- mudler

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO
L<App::witchcraft>, L<App::witchcraft::Command::Sync>

=cut

sub options {
    (   "w|with=s"  => "with",
    );
}

sub run {
    my $self = shift;
    my $AppName=shift;

}

1;
