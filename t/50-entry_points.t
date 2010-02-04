#########
# Author:        rmp
# Last Modified: $Date: 2007/02/20 14:31:54 $ $Author: rmp $
# Id:            $Id: 50-entry_points.t,v 1.41 2007/02/20 14:31:54 rmp Exp $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/50-entry_points.t,v $
# $HeadURL$
#
package entry_points;
use strict;
use warnings;
use Test::More tests => 1;
use t::FileStub;

our $VERSION = do { my @r = (q$Revision: 1.41 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStub->new({
				 'dsn'      => 'foo',
				 'filedata' => 't/entry_points.xml',
				});
my $ep       = $das->entry_points();
my $results  = (values %{$ep})[0];

is(scalar @{$results->[0]->{'segment'}}, 22, 'Correct number of segments returned');

1;
