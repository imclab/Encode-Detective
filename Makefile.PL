use warnings;
use strict;
use ExtUtils::MakeMaker 6.48;
use File::Copy;

my $pm = 'lib/Encode/Detective.pm';
my @cxx_files = (<src/*.cpp>, "run-detector.cpp");
my @o_files = map {s/\.cpp/.o/; $_} @cxx_files;
my $repo = 'https://github.com/benkasminbullock/Encode-Detective';

WriteMakefile (
    NAME => 'Encode::Detective',
    VERSION_FROM => $pm,
    ABSTRACT_FROM => $pm,
    LICENSE => 'mozilla',
    AUTHOR => 'Ben Bullock <bkb@cpan.org>',
    OBJECT => "Detective.o @o_files",
    INC => "-I include -I src",
    LIBS => ['-lstdc++'],
    MIN_PERL_VERSION => '5.008',
    META_MERGE => {
        resources => {
            repository => $repo,
            bugtracker => "$repo/issues",
        },
    },
);

# Override the stupid default method of ExtUtils::MakeMaker.

package MY;

sub c_o {
    my $inherited = shift->SUPER::c_o(@_);
    $inherited =~ s/(\$\*\.cpp)/-o \$*.o $1/;
    return $inherited;
}

