package App::Perlbootstrap::template::Mojo;

our $VERSION="0.001";

=encoding utf-8

=head1 NAME

App::Perlbootstrap::template::Mojo - Mojo template for App::Perlbootstrap

=head1 SYNOPSIS

  $ milla new MyApp #optional
  $ perlbootstrap new --with Mojo MyApp #yes! also after a milla or dzilla mint!

=head1 DESCRIPTION

This template represent a basic setup that's used by Mojolicious, it's a minimalistic approach to object orientation.

=head1 Classes

=over 4

=item L<App::Perlbootstrap::template::Mojo::Obj>

it represent a basic object where you can inherit by

=item L<App::Perlbootstrap::template::Mojo::Loader>

Load dynamically perl modules and search them in @INC

=item L<App::Perlbootstrap::template::Mojo::Exception>

Exception class

=item L<App::Perlbootstrap::template::Mojo::Util> (source, no POD)

A basic L<Exporter> class

=back

=head1 AUTHOR

mudler E<lt>mudler@dark-lab.netE<gt>

=head1 COPYRIGHT

Copyright 2014- mudler

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<App::Perlbootstrap::template::Mojo::Obj>, L<App::Perlbootstrap::template::Mojo::Exception>, L<App::Perlbootstrap::template::Mojo::Loader>

=cut



1;