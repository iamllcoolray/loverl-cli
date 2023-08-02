package Loverl::Command::run;

# ABSTRACT: Runs the LÖVE2D project through the Love application

use Loverl -command;
use v5.36;

my $os_name = $^O;

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
    system('"C:\Program Files\LOVE\love.exe"') if $os_name eq "MSWin32";
    warn("Download love at love2d.org\n") if $os_name eq "MSWin32" and !-e 'C:\Program Files\LOVE\love.exe';

    system('"/Applications/love.app/Contents/MacOS/love"') if $os_name eq "darwin";
    warn("Download love at love2d.org\n") if $os_name eq "darwin" and !-e '/Applications/love.app/Contents/MacOS/love';

    system($ENV{LINUX_LOVE_PATH}) if $os_name eq "linux" and $ENV{LINUX_LOVE_PATH} ne undef;
    warn("Download love at love2d.org\n") if $os_name eq "linux" and $ENV{LINUX_LOVE_PATH} eq undef;
}

1;

=encoding utf8

=head1 DESCRIPTION

Loverl's run command will run the LÖVE2D project through the Love application.

=head1 SYNOPSIS

    loverl run
