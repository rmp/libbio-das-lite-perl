#########
# Author:        rmp
# Last Modified: $Date: 2007/02/20 14:31:54 $ $Author: rmp $
# Id:            $Id: FileStub.pm,v 1.1 2007/02/20 14:31:54 rmp Exp $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/t/FileStub.pm,v $
# $HeadURL$
#
package t::FileStub;
use base qw(Bio::Das::Lite);
use strict;
use warnings;
use English qw(-no_match_vars);

our $VERSION = do { my @r = (q$Revision: 1.1 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

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
