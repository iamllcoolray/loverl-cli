package Loverl::Command::run;

# ABSTRACT: Runs the LÖVE2D project through the Love application

use Loverl -command;
use Cwd;
use v5.36;
use Carp;

my $os_name = $^O;

my $project_dir = getcwd();

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
    if(-e "main.lua"){
        if(-e "conf.lua"){
            if ($os_name eq "MSWin32" and -e 'C:\Program Files\LOVE\love.exe'){
                system("\"C:\\Program Files\\LOVE\\love.exe\" " . $project_dir);
            }elsif ($os_name eq "darwin" and -e '/Applications/love.app/Contents/MacOS/love'){
                system("\"/Applications/love.app/Contents/MacOS/love\" " . $project_dir);
            }elsif ($os_name eq "linux" and $ENV{LINUX_LOVE_PATH} ne undef){
                system($ENV{LINUX_LOVE_PATH} . ' ' . $project_dir) 
            }else{
                croak("Download love at love2d.org\n")
            }
        }else{
            croak("you are missing a conf.lua file");
        }
    }else{
        croak("you are missing a main.lua file");
    }
}

1;

=encoding utf8

=head1 DESCRIPTION

Loverl's run command will run the LÖVE2D project through the Love application.

=head1 SYNOPSIS

    cd path/to/love2d/game/project/dir

    loverl run

=head2 Requirements

    Need main.lua and conf.lua to exist in order to use the command.
