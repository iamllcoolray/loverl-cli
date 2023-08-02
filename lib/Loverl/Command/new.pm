package Loverl::Command::new;

# ABSTRACT: Initializes a new LÖVE2D project directory

use Loverl -command;
use Loverl::Create::Directory;
use v5.36;

use constant {true => 1, false => 0};

my $isVerbose = false;

my $project_dir = Loverl::Create::Directory->new();

sub command_names { qw(new --new -n) }

sub abstract { "initializes a new LÖVE2D project" }

sub description { "Initializes a new LÖVE2D project directory." }

sub validate_args ( $self, $opt, $args ) {
=begin
    $self->usage_error(
        "Requires a project name\n
        run \"loverl new [New Project Name]\""
    ) unless @$args;
=cut
}

sub execute ( $self, $opt, $args ) {
    $project_dir->dir_name(@$args);
    $isVerbose = true if $self->app->global_options->{verbose};
    $project_dir->create_dir($isVerbose);
    
}

1;

=encoding utf8

=head1 DESCRIPTION

Loverl's new command will initialize the LÖVE2D project directory.

=head1 SYNOPSIS

    loverl new

    or

    loverl new [New Project Name]
