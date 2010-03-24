#########
# Author:        rmp
# Last Modified: $Date$ $Author$
# Id:            $Id$
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/FileStubChunked.pm,v $
# $HeadURL$
#
package t::FileStubChunked;
use strict;
use warnings;
use base qw(t::FileStub);

our $VERSION = do { my @r = (q$Revision$ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

sub _fetch {
  my ($self, $url_ref, $headers) = @_;

  open my $fh, q(<), $self->{'filedata'};
  while(my $xml = <$fh>) {
    for my $code_ref (values %{$url_ref}) {
      &{$code_ref}($xml);
    }
  }
  close $fh;
  return;
}

1;
