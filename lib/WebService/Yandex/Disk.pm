package WebService::Yandex::Disk;
# ABSTRACT: Perl interface to Yandex.Disk API

use strict;
use warnings;

sub new {
    my ($class) = @_;
    my $self = bless {}, $class;
    return $self;
}

sub authorize {
    print "To get Authorization code open the following URL and grant access to your account: "
        . "https://oauth.yandex.ru/authorize?response_type=code&client_id=eea49e123baf48089f9999eaae7c9e15\n"
        . "Enter the Authorization code and hit enter: ";
    my $code = <STDIN>;
    chomp $code;
    return $code;
}

1;
