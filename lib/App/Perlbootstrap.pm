package App::Perlbootstrap;

use strict;
use warnings;
use 5.008_005;
our $VERSION = '0.01';
use App::CLI;
use utf8;

1;
__END__

=encoding utf-8

=head1 NAME

App::Perlbootstrap - a perl bootstrap application generator

=head1 SYNOPSIS

  $ perlbootstrap new MyApp
  $ perlbootstrap list #template listing
  $ milla new MyApp
  $ perlbootstrap new --with Mojo MyApp #yes! after a milla or dzilla mint!

=head1 DESCRIPTION

App::Perlbootstrap is a command line application bootstrap for your perl programs. Perl has a lot of framework for developing and that's awesome: but when you write a new perl program sometimes there are already-known patterns that could suits your needs and you find yourself copying some other code and refactor it for your purpose, perlbootstrap aims to have a suite of templates that can cover the most known patterns, so you will able to bootstrap an app in few seconds.

You can get further help:

 $ perlbootstrap help new
 $ perlbootstrap help list


=head1 ARGUMENTS

=over 4

=item C<new MyApp>

generate MyApp and refactor using the default template (or you can specify one using --with)

=item C<list>

list available templates

=item C<help>

print POD help

=back

=head1 AUTHOR

mudler E<lt>mudler@dark-lab.netE<gt>

=head1 COPYRIGHT

Copyright 2014- mudler

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<App::Perlbootstrap::Command::New>, L<App::Perlbootstrap::Command::List>

=cut
