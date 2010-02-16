#########
# Author:        rmp
# Last Modified: $Date: 2010/02/04 15:01:56 $ $Author: aj5 $
# Id:            $Id: Makefile.PL,v 1.48 2010/02/04 15:01:56 aj5 Exp $
# Source:        $Source: /var/lib/cvsd/cvsroot/Bio-DasLite/Bio-DasLite/Makefile.PL,v $
# $HeadURL$
#
package Makefile;
use strict;
use warnings;
use 5.005;
use ExtUtils::MakeMaker;
use English qw(-no_match_vars);

our $VERSION = do { my @r = (q$Revision: 1.48 $ =~ /\d+/mxg); sprintf '%d.'.'%03d' x $#r, @r };

WriteMakefile(
	      'NAME'          => 'Bio::Das::Lite',
	      'AUTHOR'        => q(Roger Pettett <rpettett@cpan.org>),
	      'ABSTRACT_FROM' => 'lib/Bio/Das/Lite.pm',
	      'VERSION_FROM'  => 'lib/Bio/Das/Lite.pm',
	      'DISTNAME'      => 'Bio-Das-Lite',
	      'PREREQ_PM'     => {
                                  'WWW::Curl'         => '4.07',
				  'HTTP::Response'    => '1.49',
				  'SOAP::Lite'        => '0.69',
				  'English'           => '1.01',
				  'Carp'              => '1.02',
				  'Readonly'          => '1.03',
				 },
	      'dist'          => {
				  COMPRESS => 'gzip',
				  SUFFIX   => 'gz',
				 },
	      'LICENSE'       => 'perl',
	     );

print q(
******************************************************************************
** Some of the tests for this module need internet access                   **
** Also remember to set your http_proxy environment variable if you need to **
******************************************************************************
);

1;
