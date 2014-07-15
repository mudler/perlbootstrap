package App::Perlbootstrap::Command;
use App::Perlbootstrap;
use base qw(App::CLI::Command App::CLI);

use constant global_options => ( 'h|help' => 'help' );

sub alias {
    (   "n" => "new",

    );
}

sub invoke {
    my ( $pkg, $cmd, @args ) = @_;
    local *ARGV = [ $cmd, @args ];
    if ( @args > 0 or defined $cmd ) {
        my $ret = eval { $pkg->dispatch(); };
        if ($@) {
            warn $@;
        }
    }
    else {
        &global_help;
    }
}

sub global_help {
    print <<'END';

perlbootstrap
____________

help (--help for full)
    - show help message


perlbootstrap it's a bootstrapp application generator for perl frameworks

perlbootstrap  n | new <AppName> (--with Mojo)    -   generate a new "AppName" application

perlbootstrap   l | list    -   list available templates


You can inspect further doing "perlbootstrap help <command>"

END
}

1;
