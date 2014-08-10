use warnings;
use strict;

use Test::More tests => 8;

BEGIN { use_ok('WebService::Yandex::Disk'); }

can_ok('WebService::Yandex::Disk', 'new');

my $disk = WebService::Yandex::Disk->new();

isa_ok($disk, 'WebService::Yandex::Disk');

can_ok('WebService::Yandex::Disk', 'authorize');

authorize_test('1234');
authorize_test('5678');

sub authorize_test {
    my $expected_code = shift;

    # Save the output
    my $output;
    open my $stdout, '>', \$output;
    local *STDOUT = $stdout;

    # Fake the input
    open my $stdin, '<', \"$expected_code\n"
        or die "Cannot open STDIN to read from string: $!";
    local *STDIN = $stdin;

    my $code = $disk->authorize;

    like($output, qr[
        To\sget\sAuthorization\scode\sopen\sthe\sfollowing\sURL\s
        and\sgrant\saccess\sto\syour\saccount:\s
        https://oauth.yandex.ru/authorize\?response_type=code&client_id=[\da-f]{32}\n
        Enter\sthe\sAuthorization\scode\sand\shit\senter:\s]ix,
        'authorize output text');

    is($code, $expected_code, 'authorize return value');
}
