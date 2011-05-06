#########
# Author:        rmp
# Last Modified: $Date$ $Author$
# Id:            $Id$
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/60-features_chunked.t,v $
# $HeadURL$
#
package features_chunked;
use strict;
use warnings;
use Test::More tests => 1;
use t::FileStubChunked;

our $VERSION = do { my @r = (q$Revision$ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStubChunked->new({
					'dsn'      => 'http://foo/das/bar',
					'filedata' => 't/data/features.xml',
				       });
my $features = $das->features();
my $results  = (values %{$features})[0];

is(scalar @{$results}, 102, 'Chunked-response-mode gave number of features returned');

1;
