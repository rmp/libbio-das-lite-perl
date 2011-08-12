package queries;
use strict;
use warnings;
use Test::More;
use Bio::Das::Lite;

my $das = Bio::Das::Lite->new();

my $assert = sub {
  my ($type, $expected, $structure) = @_;
  my $ftype = 'feature';
  my $actual = $das->build_queries($structure, $ftype);
  is_deeply($actual, $expected, "Checking $type produces expected query string");
};

$assert->('one simple segment', ['segment=1:1,100'], '1:1,100');
$assert->('two simple segments', ['segment=1:1,100', 'segment=2:2043,21445'], ['1:1,100', '2:2043,21445']);
$assert->('complex single hash', ['segment=1:1,100;type=karyotype'], { 'segment' => '1:1,100', 'type' => 'karyotype'});
$assert->('complex single hash two types', ['segment=1:1,100;type=karyotype;type=other'], { 'segment' => '1:1,100', 'type' => ['karyotype', 'other']});
$assert->('complex multiple hashes', 
  [
    'segment=1:1,1000000;type=karyotype',
    'segment=2:1,1000000',
    'feature_id=OTTHUMG00000036084',
  ],
  [
    {'segment'  => '1:1,1000000','type' => 'karyotype',},
    {'segment'  => '2:1,1000000',},
    {'feature_id' => 'OTTHUMG00000036084',}
  ]
);

done_testing();
