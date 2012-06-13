use warnings;
use strict;
use ExtUtils::MakeMaker 6.48;
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
    clean => {
        FILES => $objects
    },
    MIN_PERL_VERSION => '5.008',
);

# Override the stupid default method of ExtUtils::MakeMaker.

package MY;

sub c_o {
    my $inherited = shift->SUPER::c_o(@_);
    $inherited =~ s/(\$\*\.cpp)/-o \$*.o $1/;
    return $inherited;
}

