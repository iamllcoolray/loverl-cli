package Loverl::Command::build;

# ABSTRACT: Builds the LÖVE2D project into a build directory

use Loverl -command;
use v5.36;

sub command_names { qw(build --build -b) }

sub abstract { "builds the LÖVE2D project" }

sub description { "Builds the LÖVE2D project into a build directory." }

sub validate_args ( $self, $opt, $args ) {
    $self->usage_error(
        "Invalid Command: Remove @$args and run \"loverl build\"")
      if @$args;
}

sub execute ( $self, $opt, $args ) {

}

1;

=encoding utf8

=head1 DESCRIPTION

Loverl's build command will build the LÖVE2D project into a build directory.

=head1 SYNOPSIS

    loverl build
