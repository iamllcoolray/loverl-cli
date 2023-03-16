package Loverl::Command::run;

# ABSTRACT: Runs the LÖVE2D project through the Love application

use Loverl -command;
use v5.36;

sub command_names { qw(run --run -r) }

sub abstract { "runs the LÖVE2D project" }

sub description { "Runs the LÖVE2D project through the Love application." }

sub validate_args ( $self, $opt, $args ) {
    $self->usage_error(
        "Remove @$args\n
        run \"loverl run\""
    ) if @$args;
}

sub execute ( $self, $opt, $args ) {

}

1;

=encoding utf8

=head1 DESCRIPTION

Loverl's run command will run the LÖVE2D project through the Love application.

=head1 SYNOPSIS

    loverl run
