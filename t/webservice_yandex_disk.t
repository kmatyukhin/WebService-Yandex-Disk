use warnings;
use strict;

use Test::More tests => 2;

BEGIN { use_ok('WebService::Yandex::Disk'); }

can_ok( 'WebService::Yandex::Disk', 'new' );
