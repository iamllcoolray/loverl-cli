package Loverl;

# ABSTRACT: Lover - A LÖVE2D game development command-line interface.

our $VERSION = '0.001';

use v5.36;

use App::Cmd::Setup -app;
1;

=encoding utf8
=head1 SYNOPSIS
    loverl [options]
        Options:
            init [name]
            build
            help
            version
=head2 Options
init - Initializes the LÖVE2D project directory.
build - Builds the LÖVE2D project into a build directory.
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
