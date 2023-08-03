package Loverl;

# ABSTRACT: A LÖVE2D game development command-line interface.

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
            new [New Project Name]
            build
            help
            version

=head2 Options
new - Initializes a new LÖVE2D project directory.

Run - Runs the LÖVE2D project through the Love application.

build - Builds the LÖVE2D project into a build directory

help - Displays a help message on how to use Loverl.

version - Displays Loverl's version number.

=head1 DESCRIPTION

Loverl is a LÖVE2D game development command-line interface.

=head1 Setup

Loverl uses Perl version 5.36 or later.

=head2 Installation

=head3 Using cpanm

    cpanm Loverl

=head3 Using the Project Directory

    cpanm --installdeps .
    perl Makefile.PL
    make
    make install

=head2 Git

    L<Git|https://git-scm.com/> should already be installed.

=head2 LÖVE2D

    L<LÖVE2D|https://love2d.org/> should already be installed.

=head3 love PATH on Linux

    The LINUX_LOVE_PATH environment variable should be set inorder to use the run command.
