use warnings;
use strict;
use ExtUtils::MakeMaker;
use File::Copy;

my $pm = 'lib/Encode/Detect.pm';
my @cxx_files = <src/*.cpp>;
my @o_files = map {s/\.cpp/.o/;$_} @cxx_files;
my $objects = join ' ', @o_files;

WriteMakefile (
    NAME => 'Encode::Detect',
    VERSION_FROM => $pm,
    ABSTRACT_FROM => $pm,
    LICENSE => 'mozilla',
    XSOPT => '-C++',
    AUTHOR => 'buggles',
    OBJECT => $objects,
    INC => "-I include",
);
