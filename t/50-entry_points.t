#########
# Author:        rmp
# Last Modified: $Date$ $Author$
# Id:            $Id$
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/50-entry_points.t,v $
# $HeadURL$
#
package entry_points;
use strict;
use warnings;
use Test::More tests => 1;
use t::FileStub;

our $VERSION = do { my @r = (q$Revision$ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStub->new({
				 'dsn'      => 'foo',
				 'filedata' => 't/data/entry_points.xml',
				});
my $ep       = $das->entry_points();
my $results  = (values %{$ep})[0];

is(scalar @{$results->[0]->{'segment'}}, 22, 'Correct number of segments returned');

1;
