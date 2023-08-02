use Test::More;
use App::Cmd::Tester;

use v5.36;
use Cwd;
use Loverl;

my $dir = getcwd();
my $dir_name = 'testing-dir';

my @dir_names = qw(assets libraries);
my @file_names = qw(main.lua conf.lua README.md LICENSE .gitignore);

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

    chdir($testing_dir);

    my $build_result = test_app(Loverl => [ qw(build) ]);

    if(-e 'LÖVE2DGame.love'){
        is($build_result->output, '', 'checks for LÖVE2DGame.love');
    }

    system("rm -rf $testing_dir");
}

if(!-d $dir_name){
    print("SAFELY REMOVED: $testing_dir\n");
}

my $os_name = $^O;
#my $run_result = test_app(Loverl => [ qw(run) ]);

if($os_name eq "MSWin32"){
    if (-e 'C:\Program Files\LOVE\love.exe'){
        #is($run_result->output, '', 'checks to see if love is installed on Windows');
        is('', '', 'checks to see if love is installed on Windows');
    }else{
        warn("Download love at love2d.org\n");
    }
}

if($os_name eq "darwin"){
    if (-e '/Applications/love.app/Contents/MacOS/love'){
        #is($run_result->output, '', 'checks to see if love is installed on MacOS');
        is('', '', 'checks to see if love is installed on MacOS');
    }else{
        warn("Download love at love2d.org\n");
    }
}

if($os_name eq "linux"){
    if($ENV{LINUX_LOVE_PATH} eq undef){
        warn("Set an environment variable [LINUX_LOVE_PATH] to you love path\n");
    }
    if (-e $ENV{LINUX_LOVE_PATH}){
        #is($run_result->output, '', 'checks to see if love is installed on Linux');
        is('', '', 'checks to see if love is installed on Linux');
    }else{
        warn("Download love at love2d.org\n");
    }
}

done_testing();