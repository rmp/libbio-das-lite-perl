#########
# Author:        rmp
# Last Modified: $Date$ $Author$
# Id:            $Id$
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/FileStubCompat.pm,v $
# $HeadURL$
#
package t::FileStubCompat;
use base qw(Bio::DasLite);
use strict;
use warnings;
use English qw(-no_match_vars);

our $VERSION = do { my @r = (q$Revision$ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

sub new {
  my ($class, $ref) = @_;
  $ref ||= {};

  my $self = $class->SUPER::new($ref);

  $self->{'filedata'} = $ref->{'filedata'};
  return $self;
}

sub _fetch {
  my ($self, $url_ref, $headers) = @_;

  open my $fh, q(<), $self->{'filedata'} or die "Cannot open $self->{'filedata'}:[$ERRNO]\n";
  local $RS = undef;
  my $xml  = <$fh>;
  close $fh;

  for my $code_ref (values %{$url_ref}) {
    &{$code_ref}($xml);
  }
  return;
}

1;
