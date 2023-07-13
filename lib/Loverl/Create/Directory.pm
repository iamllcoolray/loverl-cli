package Loverl::Create::Directory;

use v5.36;

use Cwd;
use Moose;

use Loverl::Create::File_Content;

has "dir_name" => (is => "rw", isa => "Str", default => "new-project");

my %file_content = Loverl::Create::File_Content::file_content();

my $dir = getcwd();

sub project_dir($self){
    my $project_dir = $dir . "/" . $self->dir_name;
    return $project_dir;
}

sub project_subdir($self, $dir_name){
    my $project_subdir = project_dir($self) . "/" . $dir_name;
    return $project_subdir;
}

sub create_file($self){
    my $FILE;

    foreach my $key (keys %file_content){
        open($FILE, ">>", project_dir($self) . "/$key") or die("Cannot open file: " . $!);
        my $value = $file_content{$key};
        print($FILE $value);
        close($FILE) or die("Cannot close file: ".$!);
    }
}

sub create_dir_verbose ($self) {
    if(-e $self->dir_name){
        print($dir . "/" . $self->dir_name . "/" . " already exists as a file.\n");
    }else{
        if(-d $self->dir_name){
            print($dir . "/" . $self->dir_name . "/" . " already exists.\n");
        }else{
            mkdir(project_dir($self)) or die("Can't create directory. " . $!);
            print("+ " . $dir . "/" . $self->dir_name . "/" . "\n");
            mkdir(project_subdir($self, "assets")) or die("Can't create directory. " . $!);
            print("+ " . $dir . "/" . $self->dir_name . "/assets/" . "\n");
            mkdir(project_subdir($self, "libraries")) or die("Can't create directory. " . $!);
            print("+ " . $dir . "/" . $self->dir_name . "/libraries/" . "\n");
            create_file($self);
            foreach my $key (keys %file_content){
                print("+ " . $dir . "/" . $self->dir_name . "/$key" . "\n");
            }
        }
    }
}

sub create_dir ($self) {
    if(-e $self->dir_name){
        print($dir . "/" . $self->dir_name . "/" . " already exists as a file.\n");
    }else{
        if(-d $self->dir_name){
            print($dir . "/" . $self->dir_name . "/" . " already exists.\n");
        }else{
            mkdir(project_dir($self)) or die("Can't create directory. " . $!);
            mkdir(project_subdir($self, "assets")) or die("Can't create directory. " . $!);
            mkdir(project_subdir($self, "libraries")) or die("Can't create directory. " . $!);
            create_file($self);
            print("+ " . $dir . "/" . $self->dir_name . "/" . "\n");
        }
    }
}

1;

=encoding utf8

=head1 DESCRIPTION

Loverl's new command will initialize the LÖVE2D project directory.

=head1 SYNOPSIS

    loverl new [New Project Name]

        --git (or -g) initializes git
