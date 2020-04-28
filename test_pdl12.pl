#!/usr/bin/env perl
# /**---------------------------------------------------------------------------
#
#         File: test_pdl12.pl
#
#        Usage: ./test_pdl12.pl  
#
#  Description: 
#
#      Options: ---
# Requirements: ---
#         Bugs: ---
#        Notes: ---
#       Author: Liang Peng (...), pengliang@piesat
# Organization: ...
#      Version: 1.0
#      Created: 10/24/2019 05:56:56 PM
#     Revision: ---
# ----------------------------------------------------------------------------*/

use v5.10;
use strict;
use warnings;
use utf8;
use Shell;

use PDL;
use PDL::NiceSlice;
use PDL::NetCDF;
use PDL::Image2D;
use PDL::Func;
use PDL::WMO;
use PDL::IO::HDF5;

use PDL::Graphics::PGPLOT;
use PDL::Graphics::PLPLOT;

my $t = '    a aa >>> aaa ';
my ($a,$b) = $t =~ /\s*(.*[^\s])\s*\>\>\>\s*(.*[^\s])\s*/;
say "|$a|";
say "|$b|";

my @t = qw(12 123 124 134);
say @t;
for my $t (@t) {
    $t =~ s/1//;
}
say @t;

if (0) {
    print "Input (y|yes) (n|not):";
    my $line = <STDIN>;
    if ($line eq "/n") {
        print "That was just a blank line!/n";
    } else {
        print "That line of input was: $line";
    }
}

my $d = ones(5,5);
$d(0,0) .= 2;
$d(2,2) .= 2;

say $d;
say $d->conv2d(ones(3,3),{Boundary => 'Reflect'});
say $d->conv2d(ones(3,3),{Boundary => 'Truncate'});
say $d->conv2d(ones(3,3),{Boundary => 'Replicate'});

*PDL::t = sub {  my ( $self, $input ) = @_;
   $self .= $input->reshape($self->dims);return $self;};

*PDL::smooth1 = sub {
    my ($self,$kernel) = @_;
    my $self01 = $self(;|);
    $self01($self <= -900;?) .= 0;
    $self01($self >  -900;?) .= 1;
    my $self_cv = $self->conv2d($kernel,{Boundary => 'Truncate'});
    my $self01_cv = $self01->conv2d($kernel,{Boundary => 'Truncate'});
    $self .= $self_cv/$kernel->nelem;
    return $self;
};

*PDL::smooth = sub { # {{{
    my ($self,$kernel) = @_;
    my $self01 = $self(;|);
    $self01($self <= -900;?) .= 0;
    $self01($self >  -900;?) .= 1;
    my $self_cv = $self->conv2d($kernel,{Boundary => 'Truncate'});
    my $self01_cv = $self01->conv2d($kernel,{Boundary => 'Truncate'});
    $self .= $self_cv/$kernel->nelem;
    return $self;
}; # }}}
*PDL::data_fusion_2d = sub { # {{{
    my ($v_grid,$v_real,$kernel) = @_;
    my $v_bias = zeros($v_grid->dims)-999;
    my $id = $v_real > -900;
    $v_bias($id;?) .= $v_real($id;?)-$v_grid($id;?);
    $v_bias->smooth($kernel);
    $v_grid .= $v_grid+$v_bias;
    return $v_grid;
}; # }}}
sub gen_kernel { #{{{
    my ($n) = @_;
    my $x = sequence($n)->dummy(1,$n);
    my $y = sequence($n)->dummy(0,$n);
    my $k = sqrt(($x-($n-1)/2)**2+($y-($n-1)/2)**2);
    $k .= max($k)-$k;
    return $k;
} #}}}

my $d = ones(9,9);
my $r = $d(;|);
$r(8,8) .= 1.5;
$r(4,4) .= 2;
$r(0,0) .= 1.5;

say '---------------';
my $k = gen_kernel(5);
say $d;
say $r;
say $k;
say $d(:,:)->data_fusion_2d($r,$k);

my $xi = sequence(10)->dummy(1,10)+0.5;
my $yi = sequence(10)->dummy(0,10)+0.5;
my $zi = $xi+$yi;
my $xo = pdl 2,3,4,5;
my $yo = pdl 3,4,5,6;




