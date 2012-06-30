# * ***** BEGIN LICENSE BLOCK *****
# Version: MPL 1.1/GPL 2.0/LGPL 2.1
#
# The contents of this file are subject to the Mozilla Public License Version
# 1.1 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
# for the specific language governing rights and limitations under the
# License.
#
# The Original Code is Encode::Detect wrapper
#
# The Initial Developer of the Original Code is
# Proofpoint, Inc.
# Portions created by the Initial Developer are Copyright (C) 2005
# the Initial Developer. All Rights Reserved.
#
# Contributor(s):
#
# Alternatively, the contents of this file may be used under the terms of
# either the GNU General Public License Version 2 or later (the "GPL"), or
# the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
# in which case the provisions of the GPL or the LGPL are applicable instead
# of those above. If you wish to allow use of your version of this file only
# under the terms of either the GPL or the LGPL, and not to allow others to
# use your version of this file under the terms of the MPL, indicate your
# decision by deleting the provisions above and replace them with the notice
# and other provisions required by the GPL or the LGPL. If you do not delete
# the provisions above, a recipient may use your version of this file under
# the terms of any one of the MPL, the GPL or the LGPL.
#
# ***** END LICENSE BLOCK *****

package Encode::Detective;
require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw/detect/;

use strict;
use warnings;

use XSLoader;
our $VERSION = 0.04;
XSLoader::load 'Encode::Detective', $VERSION;

1;

__END__

=head1 NAME

Encode::Detective - detect a data encoding

=head1 SYNOPSIS

  use Encode;
  require Encode::Detective 'detect';
  my $encoding = detect ($data);
  # Now $encoding contains a guess of the encoding of $data.

=head1 DESCRIPTION

This module guesses the character set of input data. It is similar to
L<Encode::Guess>, but does not require a list of expected encodings.

=head1 FUNCTIONS

=head2 detect

    my $encoding = detect ($data);

Given a set of bytes, C<$data>, this looks at the bytes, and guesses
what encoding they are encoded in using probabilities.

=head1 DETECTED ENCODINGS

The following encodings are detected:

=over

=item UTF-8

=item EUC-JP

=item Big5

=item Shift_JIS

=item EUC-KR

=item EUC-TW

Taiwanese encoding.

=item windows-1251

Cyrillic encoding.

=item windows-1255

Hebrew encoding.

=back

Character sets not detected

=over

=item mac roman

=item CP932

An extension of Shift-JIS, more common in practice than actual
Shift-JIS.

=back

=head1 TODO

The module needs more tests. Please send example files

=head1 BUGS

=head2 TIS-620

TIS-620 does not seem to be detected.

=head2 Documentation of detection

The documentation of detected encodings above is not complete.

=head1 HISTORY

This module is based on code of Firefox. When this module was created,
the C++ code for character set detection was available as a standalone
library. Now the code cannot be used as a standalone library, so this
has become a fork of the original Mozilla code.

Encode::Detective is a fork of L<Encode::Detect>. It removes almost
all of the interface of Encode::Detect except the single function
L</detect>. This fork was released to CPAN to improve the compilation
of the module on various systems.

=head1 SEE ALSO

=head2 edetect

The L<edetect> standalone script can guess the encodings of files.

=head2 Encode::Guess

L<Encode::Guess> is a Perl module which does something similar to
Encode::Detective.

=head2 Encode::Detect

The original version of this module.

=head1 AUTHORS

Encode::Detective is based on L<Encode::Detect> by John Gardiner Myers
<jgmyers@proofpoint.com>. It was forked by Ben Bullock <bkb@cpan.org>.

=head1 LICENCE

This Perl module may be used, copied, modified and redistributed under
the terms of the Mozilla Public License version 1.1, the GNU General
Public License, or the LGPL.

