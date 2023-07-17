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

sub opt_spec {
    return ( [ "git|g", "initializes git into the project" ], );
}

sub validate_args ( $self, $opt, $args ) {
    $self->usage_error(
        "Requires a project name\n
        run \"loverl new [New Project Name]\""
    ) unless @$args;
}

sub execute ( $self, $opt, $args ) {
    $project_dir->dir_name(@$args);
    $isVerbose = true if $self->app->global_options->{verbose};
    $project_dir->create_dir($isVerbose);
    print("test git\n")     if $opt->{git};
    
}

1;

=encoding utf8

=head1 DESCRIPTION

Loverl's new command will initialize the LÖVE2D project directory.

=head1 SYNOPSIS

    loverl new [New Project Name]

        --git (or -g) initializes git
