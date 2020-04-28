#!/usr/bin/env perl
#===============================================================================
#
#         FILE: test_pdl7.pl
#
#        USAGE: ./test_pdl7.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Liang Peng (...), pengliang@piesat
# ORGANIZATION: ...
#      VERSION: 1.0
#      CREATED: 10/22/2019 01:08:13 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use PDL;
use PDL::NiceSlice;

*PDL::t = sub {  my ( $self, $input ) = @_;
    $self .= $input->reshape($self->dims);return $self;};

my $h = pdl [[1,2,3],[4,5,6]];

# call new method via old instance
my $t = sequence(10,10,10);
$h(0:2,1)->t($t(4,3:4,5));
print $h,"\n";



