package App::Perlbootstrap::Utils;
use warnings;
use strict;
use base qw(Exporter);
use Term::ANSIColor;
use Encode qw(decode_utf8);
use Cwd 'getcwd';
use File::Basename qw(dirname fileparse);
use File::Path qw(mkpath rmtree);
use File::Spec::Functions qw(catdir catfile splitdir);
use File::Copy::Recursive qw( rcopy dircopy rmove );
use File::Find;

use Carp qw(carp croak);
our @EXPORT = qw(info error);

our @EXPORT_OK = (
    @EXPORT,
    qw( search warnings message rel_dir create_dir write_file spurt rel_file find_template copy catdir refactor)
);
$File::Copy::Recursive::CPRFComp = 1;

sub refactor {
    my $ns      = shift;
    my $to      = shift;
    my $dir     = shift;
    my $TopName = ( split( /::/, $ns ) )[-1];
    my $Appdir  = catdir( $dir, $to );
    if ( !-d $Appdir ) {
        rmove( catdir( $dir, $TopName ), $Appdir );
        &message(
            "\t[rename] " . catdir( $dir, $TopName ) . " -> " . $Appdir );
    }
    else {
        rcopy( catdir( $dir, $TopName, '*' ), $Appdir );
        rmtree( catdir( $dir, $TopName ));
        &message( "\t[copy] " . catdir( $dir, $TopName ) . " -> " . $Appdir );
    }

    find(
        sub {
            return if !-f $_;
            &message("\t[refactor] $_");
            my $content=slurp($_);
            $content=~s/$ns/$to/g;
            spurt($content,$_);
        },
        $Appdir
    );

}

sub rel_dir { catdir( getcwd(), split '/', pop ) }

sub copy {
    my ( $dir, $location ) = @_;
    &info("Copying $dir into $location");
    rcopy( $dir, $location ) or die $! if ( -d $location );
}

sub find_template {
    my ($ns) = @_;
    my %modules;
    for my $directory (@INC) {
        next unless -d ( my $path = catdir $directory, split( /::|'/, $ns ) );
        return $path;
    }
    return undef;
}

sub search {
  my ( $ns) = @_;

  my %modules;
  for my $directory (@INC) {
    next unless -d (my $path = catdir $directory, split(/::|'/, $ns));

    # List "*.pm" files in directory
    opendir(my $dir, $path);
    for my $file (grep /\.pm$/, readdir $dir) {
      next if -d catfile splitdir($path), $file;
      $modules{"${ns}::" . fileparse $file, qr/\.pm/}++;
    }
  }

  return [keys %modules];
}

sub create_dir {
    my ($path) = @_;

    if ( -d $path ) { &message("\t[exist] $path"); }
    else {
        mkpath $path or croak qq{Can't make directory "$path": $!};
        &message("\t[mkdir] $path");
    }
}
sub rel_file { catfile( getcwd(), split '/', pop ) }

sub write_file {
    my ( $path, $data ) = @_;
    &create_dir( dirname $path);
    &spurt( $data, $path );
    &info("  [write] $path");
}

sub spurt {
    my ( $content, $path ) = @_;
    croak qq{Can't open file "$path": $!} unless open my $file, '>', $path;
    croak qq{Can't write to file "$path": $!}
        unless defined $file->syswrite($content);
    return $content;
}

sub slurp{
        my ( $path) = @_;
    croak qq{Can't open file "$path": $!} unless open my $file, '<', $path;
    croak qq{Can't read file "$path": $!}
        unless my @content= <$file>;
    return "@content";
}
sub info {
    print color 'bold green';
    print decode_utf8('☯  ☛ ');
    print color 'bold white';
    print "@_  \n";
    print color 'reset';
}

sub error {

    print STDERR color 'bold red';
    print STDERR decode_utf8('☢☢☢ ☛  ');
    print STDERR color 'bold white';
    print STDERR "@_  \n";
    print STDERR color 'reset';

}

sub warning {
    print color 'bold yellow';
    print decode_utf8("⚑  ☛ ");
    print color 'bold white';
    print "@_  \n";
    print color 'reset';
}

sub message {
    print color 'bold yellow';
    print decode_utf8("✉  ☛ ");
    print color 'bold white';
    print "@_  \n";
    print color 'reset';
}
1;
