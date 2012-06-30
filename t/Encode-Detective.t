use strict;
use warnings;
use Test::More tests => 9;
use FindBin;

use Encode::Detective 'detect';

is (detect("\x82\xb7\x82\xb2\x82\xa2\x82\xcc\x82\xdd\x82\xc2"), "Shift_JIS",
   "Detect shift JIS");
is (detect("j\xc2\x92aimerais"), "UTF-8", 'detect UTF-8');
SKIP: {
    skip "Functionality tests to make sure it still works after changes, only needed for people altering the module's source codes", 7 unless -d "../.git";
read_file ('samples/kanjidic', 'EUC-JP');
read_file ('samples/big5', 'Big5');
read_file ('samples/fortune.6', 'EUC-KR');
read_file ('samples/tocru.htm', 'windows-1251');
read_file ('samples/hebrew-8088', 'windows-1255');
read_file ('samples/greek.html', 'ISO-8859-7');
TODO: {
    local $TODO = 'does not detect this one';
    read_file ('std620.htm', 'TIS-620');
}
}
exit;

sub read_file
{
    my ($file_name, $should_be_enc) = @_;
    open my $input, "<:raw", "$FindBin::Bin/$file_name" or die $!;
    my $text = '';
    while (<$input>) {
        $text .= $_;
    }
    close $input or die $!;
    my $enc = detect ($text);
    is ($enc, $should_be_enc, "Detect $should_be_enc in $file_name");
}
