package Loverl;

# ABSTRACT: Lover - A LÖVE2D game development command-line interface.

our $VERSION = '0.001';

use v5.36;

use App::Cmd::Setup -app;

sub global_opt_spec {
    return (
        [ "help|h",    "show help" ],
        [ "verbose|v", "show all logging processes" ],
    );
}

1;

=encoding utf8

=head1 SYNOPSIS

    loverl [options]
        Options:
            new [New Prject Name]
            build
            help
            version

=head2 Options
new - Initializes a new LÖVE2D project directory.
    
    --git (or -g)  Initializes git into the project.

Run - Runs the LÖVE2D project through the Love application.

build - Builds the LÖVE2D project into a build directory

help - Displays a help message on how to use Loverl.

version - Displays Loverl's version number.

=head1 DESCRIPTION

Loverl is a LÖVE2D game development command-line interface.

=head1 Setup

=head2 Installation

=head3 Through cpanm

    cpanm Loverl

=head3 Through the Project Directory

    cpanm --installdeps .
    perl Makefile.PL
    make
    make install
