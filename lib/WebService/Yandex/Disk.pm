package WebService::Yandex::Disk;
# ABSTRACT: Perl interface to Yandex.Disk API

use strict;
use warnings;

sub new {
    my ($class) = @_;
    my $self = bless {}, $class;
    return $self;
}

1;
