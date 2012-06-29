use strict;
use warnings;
use Test::More tests => 2;

use Encode::Detective 'detect';

like (detect ("\x82\xb7\x82\xb2\x82\xa2\x82\xcc\x82\xdd\x82\xc2"), 
      qr/shift_jis/i);

like (detect ("j\xc2\x92aimerais"), qr/utf-8/i);

