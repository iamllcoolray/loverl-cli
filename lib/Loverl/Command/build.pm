package Loverl::Command::build;

# ABSTRACT: Builds the LÖVE2D project into a build directory

use Loverl -command;
use v5.36;
use Carp;
use Archive::Zip;

my $zip = Archive::Zip->new();

sub command_names { qw(build --build -b) }

sub abstract { "builds the LÖVE2D project" }

sub description { "Builds the LÖVE2D project into a build directory." }

sub validate_args ( $self, $opt, $args ) {
    $self->usage_error(
        "Remove @$args\n
        run \"loverl build\""
    ) if @$args;
}

sub execute ( $self, $opt, $args ) {
    if(-e "main.lua"){
        if(-e "conf.lua"){
            $zip->addTree( '.', 'LÖVE2DGame' );
            $zip->writeToFileNamed('LÖVE2DGame.love');
        }else{
            croak("you are missing a conf.lua file");
        }
    }else{
        croak("you are missing a main.lua file");
    }
    print("test verbose") if $self->app->global_options->{verbose};
}

1;

=encoding utf8

=head1 DESCRIPTION

Loverl's build command will build the LÖVE2D project into a build directory.

=head1 SYNOPSIS

    loverl build
