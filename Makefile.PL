use warnings;
use strict;
use ExtUtils::MakeMaker 6.48;
use File::Copy;

my $pm = 'lib/Encode/Detective.pm';
my @cxx_files = (<src/*.cpp>, "run-detector.cpp");
my @o_files = map {s/\.cpp/.o/;$_} @cxx_files;
my $objects = join ' ', @o_files;

WriteMakefile (
    NAME => 'Encode::Detective',
    VERSION_FROM => $pm,
    ABSTRACT_FROM => $pm,
    LICENSE => 'mozilla',
    AUTHOR => 'buggles',
    OBJECT => "Detective.o $objects",
    INC => "-I include -I src",
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

