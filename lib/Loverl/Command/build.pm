package Loverl::Command::build;

# ABSTRACT: Builds the LÖVE2D project into a build directory

use Loverl -command;
use v5.36;
use Carp;
use Archive::Zip;

my $zip = Archive::Zip->new();

sub command_names { qw(build --build -b) }

sub abstract { "builds the LÖVE2D project" }

sub description { "Builds the LÖVE2D project into a build directory." }

sub validate_args ( $self, $opt, $args ) {
    $self->usage_error(
        "Remove @$args\n
        run \"loverl build\""
    ) if @$args;
}

sub execute ( $self, $opt, $args ) {
    if(-e "main.lua"){
        if(-e "conf.lua"){
            if(-e "LÖVE2DGame.love"){
                system("rm -rf LÖVE2DGame.love");
                makeLoveFile();
            }else{
                makeLoveFile();
            }
        }else{
            croak("you are missing a conf.lua file");
        }
    }else{
        croak("you are missing a main.lua file");
    }
    print("test verbose") if $self->app->global_options->{verbose};
}

sub makeLoveFile(){
    $zip->addTree( '.', '/' );
    $zip->writeToFileNamed('LÖVE2DGame.love');
}

1;

=encoding utf8

=head1 DESCRIPTION

Loverl's build command will build the LÖVE2D project into a build directory.

=head1 SYNOPSIS

    cd path/to/love2d/game/project/folder

    loverl build

=head2 Requirements

Need main.lua and conf.lua to exist in order to use the command.
