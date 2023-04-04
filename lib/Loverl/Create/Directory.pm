package Loverl::Create::Directory;

use v5.36;

use Cwd;
use Moose;

has "dir_name" => (is => "rw", isa => "Str", default => "new-project");

my $dir = getcwd();

sub project_dir($self){
    my $dir = getcwd();
    my $project_dir = $dir . "/" . $self->dir_name;
    return $project_dir;
}

sub create_dir ($self) {
    mkdir(project_dir($self)) or die("Can't create directory.");
}
1;

=encoding utf8

=head1 DESCRIPTION

Loverl's new command will initialize the LÖVE2D project directory.

=head1 SYNOPSIS

    loverl new [New Project Name]

        --git (or -g) initializes git
