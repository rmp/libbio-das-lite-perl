#########
# Author:        rmp
# Last Modified: $Date: 2007/02/23 00:18:19 $ $Author: rmp $
# Id:            $Id: 01-general.t,v 1.42 2007/02/23 00:18:19 rmp Exp $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/01-general.t,v $
# $HeadURL$
#
package general;
use strict;
use warnings;
use Test::More tests => 7;
use Bio::Das::Lite;

our $VERSION = do { my @r = (q$Revision: 1.42 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

{
  my $das = Bio::Das::Lite->new();
  isa_ok($das, 'Bio::Das::Lite');
}

{
  my $rnd = 1+int rand 60;
  is(Bio::Das::Lite->new({'timeout'    => $rnd})->timeout(),      $rnd,   'get/set timeout');
  my $proxy = 'http://webcache.localnet:3128/';
  is(Bio::Das::Lite->new({'http_proxy' => $proxy})->http_proxy(), $proxy, 'get/set http_proxy');
}

{
  #########
  # test single http fetch (on a non-DAS page!)
  #
  my $str  = q();
  my $urls = {
	      'http://www.google.com/' => sub { $str .= $_[0]; return; }
	     };
  my $das  = Bio::Das::Lite->new();
  $das->_fetch($urls);
  ok($str =~ m|<html.*/html>|smix, 'plain http fetch');
}

{
  my $das      = Bio::Das::Lite->new({
				    'dsn'     => 'http://das.sanger.ac.uk/das/spectral36',
				    'timeout' => 30,
				   });
  my $f_by_id  = $das->features({'feature_id' => 'RP5-1119A7'});
  ok(ref($f_by_id) eq 'HASH',      'feature-by-id returned a list');

  my $key      = (keys %{$f_by_id})[0];

  ok(scalar @{$f_by_id->{$key}} <= 1,      'feature-by=id returned one or no elements');
  ok(ref($f_by_id->{$key}->[0]) eq 'HASH', 'feature-by-id element was a hash');
}

1;
