#########
# Author:        rmp
# Last Modified: $Date$ $Author$
# Id:            $Id$
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/60-features.t,v $
# $HeadURL$
#
package features;
use strict;
use warnings;
use Test::More tests => 3;
use t::FileStub;

our $VERSION = do { my @r = (q$Revision$ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

{
  my $das      = t::FileStub->new({
				   'dsn'      => 'foo',
				   'filedata' => 't/data/features.xml',
				  });
  my $features = $das->features();
  my $results  = (values %{$features})[0];

  is(scalar @{$results}, 102, 'Whole-response-mode gave correct number of features returned');
}

{
  my $das      = t::FileStub->new({
				   'dsn'      => 'foo',
				   'filedata' => 't/data/feature-type-nl.xml',
				  });
  my $features = $das->features();
  my $f        = $features->{'foo/features'}->[0];

  is($f->{type_id},   'go-process-summary', 'bug from Nick Landridge 2011-05-05');
  is($f->{type_cvId}, 'BS:01021', 'bug from Nick Landridge 2011-05-05');
}

1;
