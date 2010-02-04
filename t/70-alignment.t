#########
# Author:        rdf
# Last Modified: $Date: 2007/02/20 14:31:54 $ $Author: rmp $
# Id:            $Id: 70-alignment.t,v 1.2 2007/02/20 14:31:54 rmp Exp $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/70-alignment.t,v $
# $HeadURL$
#
package alignment;
use strict;
use warnings;
use Test::More tests => 4;
use t::FileStub;

our $VERSION  = do { my @r = (q$Revision: 1.2 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das       = t::FileStub->new({
				  'dsn'      => 'foo',
				  'filedata' => 't/alignment.xml',
				 });
my $alignment = $das->alignment();
my $results   = (values %{$alignment})[0];

#Some simple test to see if the response is being parsed corretly.  These are not complete.
is(scalar @{$results}, 1, 'Whole-response-mode gave correct number of features returned');
is(scalar @{$results->[0]->{alignobject}}, 2, 'Got expected number of alignment objects');
is(scalar @{$results->[0]->{block}}, 1, 'Got expected number of alignment blocks');
is(scalar $results->[0]->{block}->[0]->{segment}->[0]->{cigar}, '515M', 'Got cigar string');

1;
