use strict;
use warnings;
use Test::More tests => 2;

use Encode::Detective 'detect';

is (detect("\x82\xb7\x82\xb2\x82\xa2\x82\xcc\x82\xdd\x82\xc2"), "Shift_JIS",
   "Test shift JIS");

is (detect("j\xc2\x92aimerais"), "UTF-8", 'detect');

