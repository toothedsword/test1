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

my $a = sequence(5,5)/2;
say $a;

say $a > 5;

my $id = which($a > 5);
say $id;

say $a->($id;_);

my $ik = $a > 5;
say $ik;
say $a->($ik;?);

my $b = $a(1:3,1:4);
my $c = $a(1:3,1:4;|);

say $b;
say $c;

$a(1:2,0:3) .= -99;
$a(1:2,0:1)++;
say $a;

say $b;
say $c;
say $b(;_);

my $t = sequence(2,1,3,1);
say $t;
say $t(;-);
my $t = sequence 3, 4, 5;

$a = $t;
say $a;
say $b;
say $c;

$c = $a(:,0,:;-|);
say $c;

$a .= 0;
say $a;
say $c;

my $y = sequence 4,5;
my $g = $y(1:3,1:3);
$g .= $g+100;
say $y;
say $g;

my $a1 = sequence(4,3,2);
my $r = $a1(:,:,0;-);
my $g = $a1(:,:,1;-);

my $id = $r > 6 & $g > 11;
$r($id;?) .= -9;
$g($id;?) .= -19;

say $r;
say $g;
say $a1(:,:,:);

my $a1 = sequence(4,3);
my $b1 = sequence(4,3)+10;

say $a1;
say $b1;

my $a2 = sequence(3,3);
my $b2 = ones(4,3);
my $c2 = zeros(2,3);

say $a2;
say $b2;

my $c2 = $a2->glue(0,$b2)->glue(0,$c2);
print $c2,"\n";
print $_,"|" for $c2->dims;
print "\n";

say $a2->append($b2);

die;
my $t = sequence(4,3,2);
say $t;
say $t->mv(2,0)->sumover;

