#########
# Author:        Andy Jenkinson <andy.jenkinson@ebi.ac.uk>
# Last Modified: $Date: 2010/02/04 15:01:56 $ $Author: aj5 $
# Id:            $Id: 02-statuscodes.t,v 1.2 2010/02/04 15:01:56 aj5 Exp $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/02-statuscodes.t,v $
# $HeadURL$
#
use strict;
use warnings;
use Test::More tests => 6;
use Bio::Das::Lite;

our $VERSION = do { my @r = (q$Revision: 1.2 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

my @test = (
  ['http://www.ebi.ac.uk/das-srv/genomicdas/das/batman_WB',  200, 'OK', 'HTTP OK, X-DAS OK'],
  ['http://www.ebi.ac.uk/das-srv/genomicdas/das/BioDasLite', 401, 'Bad data source (data source unknown)', 'HTTP OK, X-DAS-Status error'],
  ['http://doesnotexist.com/das/BioDasLite',                 404, 'Not Found', 'HTTP error, no X-DAS-Status'],
);

my $das = Bio::Das::Lite->new();
for (@test) {
  $das->dsn($_->[0]);
  my $tmp = $das->stylesheet;
  $tmp = (keys %$tmp)[0];
  my $status = $das->statuscodes($tmp);
  is (substr($status, 0, 3), $_->[1], $_->[3].' (code)');
  is (substr($status, 4), $_->[2], $_->[3].' (message)');
}
