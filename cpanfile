requires 'App::CLI';
requires 'App::CLI::Command';
requires 'App::CLI::Command::Help';
requires 'Carp::Always';
requires 'Encode';
requires 'File::Copy::Recursive';
requires 'File::Path';
requires 'Term::ANSIColor';
requires 'perl', '5.008_005';

on configure => sub {
    requires 'Module::Build::Tiny', '0.035';
    requires 'perl', '5.008005';
};

on test => sub {
    requires 'Test::More';
};
