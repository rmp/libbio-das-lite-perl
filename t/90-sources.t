#########
# Author:        rdf
# Last Modified: $Date$ $Author$
# Id:            $Id$
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/90-sources.t,v $
# $HeadURL$
#
package sources;
use strict;
use warnings;
use Test::More tests => 2;
use English qw(-no_match_vars);
use t::FileStub;

our $VERSION = do { my @r = (q$Revision$ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my $das      = t::FileStub->new({
				 'dsn'      => 'foo',
				 'filedata' => 't/source.xml',
				});
my $features = $das->sources();
my $results  = (values %{$features})[0];

is(scalar @{$results}, 1, q(Whole-response-mode gave correct number of sources returned));
is($results->[0]->{source}->[0]->{maintainer}->[0]->{maintainer_email}, 'dasmaster@example.com', q(Got maintainers email));


1;
