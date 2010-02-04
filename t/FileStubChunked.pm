#########
# Author:        rmp
# Last Modified: $Date: 2007/02/20 14:31:54 $ $Author: rmp $
# Id:            $Id: FileStubChunked.pm,v 1.1 2007/02/20 14:31:54 rmp Exp $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/FileStubChunked.pm,v $
# $HeadURL$
#
package t::FileStubChunked;
use strict;
use warnings;
use base qw(t::FileStub);

our $VERSION = do { my @r = (q$Revision: 1.1 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

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
