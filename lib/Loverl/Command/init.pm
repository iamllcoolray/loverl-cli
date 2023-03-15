package Loverl::Command::init;

# ABSTRACT: Initializes the LÖVE2D project directory

use Loverl -command;
use v5.36;

sub command_names { qw(init --init -i) }

sub abstract { "initializes the LÖVE2D project" }

sub description { "Initializes the LÖVE2D project directory." }

sub validate_args ( $self, $opt, $args ) {
    $self->usage_error(
"Invalid Command: Needs to include a project name and run \"loverl init [New Project Name]\""
    ) unless @$args;
}

sub execute ( $self, $opt, $args ) {

    print(@$args);
}

1;

=encoding utf8

=head1 DESCRIPTION

Loverl's init command will initialize the LÖVE2D project directory.

=head1 SYNOPSIS

    loverl init [New Project Name]
