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

Encode::Detective - guess the encoding of text

=head1 SYNOPSIS

  use Encode;
  use Encode::Detective 'detect';
  my $encoding = detect ($data);
  # Now $encoding contains a guess of the encoding of $data.

=head1 DESCRIPTION

This module guesses the character set of input data. It is similar to
L<Encode::Guess>, but does not require a list of expected encodings.

=head1 FUNCTIONS

=head2 detect

    my $encoding = detect ($text);

Given some bytes of text, C<$text>, this guesses what encoding they
are in. If the encoding cannot be guessed, or if it seems to be ASCII,
the undefined value is returned. C<$encoding> can then be passed to
the C<decode> method of L<Encode>:

    use Encode 'decode';
    my $encoding = detect ($text);
    if ($encoding) {
        $text = decode ($encoding, $text);
    }

=head1 DETECTED ENCODINGS

The following encodings are detected:

=over

=item UTF-8

Unicode.

=item EUC-JP

Japanese Extended Unix Code.

=item Big5

Chinese encoding.

=item Shift_JIS

Japanese Microsoft encoding.

=item EUC-KR

Korean Extended Unix Code.

=item EUC-TW

Taiwanese encoding.

=item windows-1251

Cyrillic encoding.

=item windows-1255

Hebrew encoding.

=item windows-1252

French/European encoding.

=back

Character sets not detected:

=over

=item mac roman

=item CP932

An extension of Shift-JIS, more common in practice than actual
Shift-JIS.

=item TIS-620

Thai encoding.

=back

=head1 TODO

The module needs more tests. Please send example files

=head1 BUGS

=over

=item TIS-620

TIS-620 does not seem to be detected.

=item Documentation of detection

The documentation of detected encodings above is not complete.

=back

=head1 HISTORY

This module is based on a C++ library for character set detection from
Firefox, which used to be available as a standalone library. Now the
code cannot be used as a standalone library, so this has become a fork
of the original Mozilla code.

Encode::Detective is a fork of L<Encode::Detect>. It removes almost
all of the interface of Encode::Detect except the single function
L</detect>. This fork was released to CPAN to improve the compilation
of the module on various systems.

=head1 SEE ALSO

=head2 edetect

The L<edetect> standalone script can guess the encodings of files.

=head2 Online demonstration

L<LeMoDa.net offers an online detection service|http://www.lemoda.net/tools/encode-detective/>,
which also checks the HTTP response header and the meta tag of the
page.

=head2 Encode::Guess

L<Encode::Guess> is a Perl module which does something similar to
Encode::Detective.

=head2 Encode::Detect

L<Encode::Detect> is the original version of this module.

=head1 AUTHORS

Encode::Detective is based on L<Encode::Detect> by John Gardiner Myers
<jgmyers@proofpoint.com>. It was forked by Ben Bullock <bkb@cpan.org>.

=head1 LICENCE

This Perl module may be used, copied, modified and redistributed under
the terms of the Mozilla Public License version 1.1, the GNU General
Public License, or the LGPL.

