use warnings;
use strict;
use ExtUtils::MakeMaker;
use File::Copy;

my $pm = 'lib/Encode/Detect.pm';
my @cxx_files = <src/*.cpp>;
my @o_files = map {s/\.cpp/.o/;$_} @cxx_files;
my $objects = join ' ', @o_files;

my $CC='g++';

WriteMakefile (
    NAME => 'Encode::Detect',
    VERSION_FROM => $pm,
    ABSTRACT_FROM => $pm,
    LICENSE => 'mozilla',
    XSOPT => '-C++',
    AUTHOR => 'buggles',
    OBJECT => "Detector.o $objects",
    INC => "-I include -I src",
    CC => $CC,
    LIBS => ['-lstdc++'],
);
package MY;
sub c_o {
    my $inherited = shift->SUPER::c_o(@_);
    $inherited =~ s/(\$\*\.cpp)/-o \$*.o $1/;
#    print "$inherited\n";
    return $inherited;
}

