use Test::More;
use App::Cmd::Tester;

use v5.36;
use Loverl;

my $os_name = $^O;
my $run_result = test_app(Loverl => [ qw(run) ]);

if($os_name eq "MSWin32"){
    if (-e 'C:\Program Files\LOVE\love.exe'){
        is($run_result->output, '', 'checks to see if love is installed on Windows');
    }else{
        warn("Download love at love2d.org\n");
    }
}

if($os_name eq "darwin"){
    if (-e '/Applications/love.app/Contents/MacOS/love'){
        is($run_result->output, '', 'checks to see if love is installed on MacOS');
    }else{
        warn("Download love at love2d.org\n");
    }
}

if($os_name eq "linux"){
    if($ENV{LINUX_LOVE_PATH} eq undef){
        warn("Set an environment variable [LINUX_LOVE_PATH] to you love path\n");
    }
    if (-e $ENV{LINUX_LOVE_PATH}){
        is($run_result->output, '', 'checks to see if love is installed on Linux');
    }else{
        warn("Download love at love2d.org\n");
    }
}

done_testing();