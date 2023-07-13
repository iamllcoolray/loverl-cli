package Loverl::Create::File_Content;

use v5.36;

sub file_content(){
    my %file_content = (
        "main.lua" => <<~EOF,
        function love.load()

        end

        function love.update(dt)
            
        end

        function love.draw()
            
        end
        EOF
        "conf.lua" => <<~EOF,
        function love.conf(t)
            t.title = "Untitled"

            t.window.width = 1280
            t.window.height = 720
        end
        EOF
    );

    return %file_content;
}

1;

=encoding utf8

=head1 DESCRIPTION

Loverl's new command will initialize the LÖVE2D project directory.

=head1 SYNOPSIS

    loverl new [New Project Name]

        --git (or -g) initializes git
