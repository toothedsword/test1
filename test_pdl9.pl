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

use lib qw(./);

use strict;
use PDL;
use PDL::NiceSlice;
use FOO;
use v5.14;

my $a = sequence 10;
say $a;

say $a > 5;

my $id = which($a > 5);
say $id;

say $a->($id);

my $b = $a(1:3);
my $c = $a(;|);

say "b=$b";
say $c;

$a(1:2) .= -9;
$a(1:2)++;
say $a;

say $b;
say $c;

say "---------------------";



