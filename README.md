# SYNOPSIS

    loverl [options]
        Options:
            new [New Project Name]
            build
            help
            version

## Options
new - Initializes a new L�VE2D project directory.

Run - Runs the L�VE2D project through the Love application.

build - Builds the L�VE2D project into a build directory

help - Displays a help message on how to use Loverl.

version - Displays Loverl's version number.

# DESCRIPTION

Loverl is a L�VE2D game development command-line interface.

# Setup

Loverl uses Perl version 5.36 or later.

## Installation

### Using cpanm

    cpanm Loverl

### Using the Project Directory

    cpanm --installdeps .
    perl Makefile.PL
    make
    make install

## Git

    L<Git|https://git-scm.com/> should already be installed.

## L�VE2D

    L<L�VE2D|https://love2d.org/> should already be installed.

### love PATH on Linux

    The LINUX_LOVE_PATH environment variable should be set inorder to use the run command.
