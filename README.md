# SYNOPSIS

    loverl [options]
        Options:
            new [New Project Name]
            build
            help
            version

## Options
new - Initializes a new LÖVE2D project directory.

Run - Runs the LÖVE2D project through the Love application.

build - Builds the LÖVE2D project into a build directory

help - Displays a help message on how to use Loverl.

version - Displays Loverl's version number.

# DESCRIPTION

Loverl is a LÖVE2D game development command-line interface.

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
