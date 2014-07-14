package App::Perlbootstrap::Command::New;

use base qw(App::Perlbootstrap::Command);
use warnings;
use strict;
use App::Perlbootstrap::Utils
    qw(find_template info create_dir rel_dir copy catdir refactor);

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
L<App::Perlbootstrap>, L<App::Perlbootstrap::Command::Help>

=cut

sub options {
    ( "w|with=s" => "with", );
}

sub run {
    my $self    = shift;
    my $AppName = shift;
    my $with    = $self->{with} // "Mojo";
    $with = "App::Perlbootstrap::template::" . ucfirst($with)
        if ( $with !~ /::/ );
    info "Bootstrapping '$AppName'  with '$with':";
    my $template_dir = find_template($with);
    my $Appdir = rel_dir( catdir $AppName, "lib" );
    create_dir($Appdir);
    copy( $template_dir, $Appdir );
    info "Refactoring '$with' -> '$AppName'";
    refactor( $with, $AppName, $Appdir );

}

1;
