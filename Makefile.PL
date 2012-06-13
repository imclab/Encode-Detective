use ExtUtils::MakeMaker;

my $pm = 'Detect.pm';

WriteMakefile (
    VERSION_FROM => $pm,
    ABSTRACT_FROM => $pm,
    LICENSE => 'mozilla',
    PM => {
        'Detect.pm' => '$(INST_LIBDIR)/Encode/Detect.pm',
        'Detector.pm' => '$(INST_LIBDIR)/Encode/Detect/Detector.pm',
    },
    AUTHOR => 'buggles',
);
