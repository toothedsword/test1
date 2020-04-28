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

package Number;
use overload
	"-" => sub {my ($a,$b) = @_; return $a+$b};

package main;
$a = 1;
$b = 5 - $a;
print $b

