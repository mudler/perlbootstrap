# NAME

App::Perlbootstrap - a perl bootstrap application generator

# SYNOPSIS

    $ perlbootstrap new MyApp
    $ perlbootstrap list #template listing
    $ milla new MyApp
    $ perlbootstrap new --with Mojo MyApp #yes! after a milla or dzilla mint!

# DESCRIPTION

App::Perlbootstrap is a command line application bootstrap for your perl programs. Perl has a lot of framework for developing and that's awesome: but when you write a new perl program sometimes there are already-known patterns that could suits your needs and you find yourself copying some other code and refactor it for your purpose, perlbootstrap aims to have a suite of templates that can cover the most known patterns, so you will able to bootstrap an app in few seconds.

You can get further help:

    $ perlbootstrap help new
    $ perlbootstrap help list

# ARGUMENTS

- `new MyApp`

    generate MyApp and refactor using the default template (or you can specify one using --with)

- `list`

    list available templates

- `help`

    print POD help

# AUTHOR

mudler <mudler@dark-lab.net>

# COPYRIGHT

Copyright 2014- mudler

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

[App::Perlbootstrap::Command::New](https://metacpan.org/pod/App::Perlbootstrap::Command::New), [App::Perlbootstrap::Command::List](https://metacpan.org/pod/App::Perlbootstrap::Command::List)
