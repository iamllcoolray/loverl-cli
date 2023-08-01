use Test::More;
use App::Cmd::Tester;

use v5.36;
use Cwd;
use Loverl;

my $dir = getcwd();
my $dir_name = 'testing-dir';

my @dir_names = qw(assets libraries);
my @file_names = qw(main.lua conf.lua README.md LICENSE);

my $new_result = test_app(Loverl => [ qw(new testing-dir) ]);

my $testing_dir = $dir . '/' . $dir_name . '/';


if(-d $dir_name){
    print("CREATED: $testing_dir\n");
    isnt( $new_result->output, '', "creates a new LOVE2D project driectory: $dir_name" );
    for my $dirs (@dir_names){
        if(-d $testing_dir . $dirs){
            isnt( $new_result->output, '', "checks for $dirs directory" );
        }
    }
    for my $files (@file_names){
        if(-e $testing_dir . $files){
            isnt( $new_result->output, '', "checks for $files directory" );
        }
    }
    system("rm -rf $testing_dir");
}

if(!-d $dir_name){
    print("SAFELY REMOVED: $testing_dir\n");
}

done_testing();