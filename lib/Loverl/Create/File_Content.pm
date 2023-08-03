package Loverl::Create::File_Content;

# ABSTRACT: Will be used when preocessing file content

use v5.36;

sub file_content(){
    my %file_content = (
        "main.lua" => <<~EOF,
        function love.load()

        end

        function love.update(dt)
            
        end

        function love.draw()
            love.graphics.print("Hello World", 400, 300)
        end
        EOF
        "conf.lua" => <<~EOF,
        function love.conf(t)
            t.title = "Untitled"

            t.window.width = 1280
            t.window.height = 720
        end
        EOF
        "README.md" => <<~EOF,
        # New LÖVE2D Project
        EOF
        "LICENSE" => <<~EOF,
        Enter the project's licensing policy here
        EOF
        ".gitignore" => <<~EOF,
        # Compiled Lua sources
        luac.out

        # luarocks build files
        *.src.rock
        *.zip
        *.tar.gz

        # LÖVE2D build files
        *.love

        # Object files
        *.o
        *.os
        *.ko
        *.obj
        *.elf

        # Precompiled Headers
        *.gch
        *.pch

        # Libraries
        *.lib
        *.a
        *.la
        *.lo
        *.def
        *.exp

        # Shared objects (inc. Windows DLLs)
        *.dll
        *.so
        *.so.*
        *.dylib

        # Executables
        *.exe
        *.out
        *.app
        *.i*86
        *.x86_64
        *.hex

        .vscode
        .DS_Store
        EOF
    );

    return %file_content;
}

1;

=encoding utf8

=head1 DESCRIPTION

THe File Content Module is called by the Directory module write to to the proper files.
