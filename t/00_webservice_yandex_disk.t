use warnings;
use strict;

use Test::More tests => 3;

BEGIN { use_ok('WebService::Yandex::Disk'); }

can_ok( 'WebService::Yandex::Disk', 'new' );

my $disk = WebService::Yandex::Disk->new();

isa_ok($disk, 'WebService::Yandex::Disk');
