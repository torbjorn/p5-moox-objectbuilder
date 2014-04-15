#!/usr/bin/perl

use strict;
use warnings;
use utf8::all;
use Test::More tests => 3;
use Test::FailWarnings;
use Test::Output;

use t::lib::TestUtils;

my $org = 'Organization'->new(
    name       => 'Catholic Church',
    boss_name  => 'Francis',
    boss_title => 'Pope',
    boss_class => sub { print 'Hi there!'; return },
    hq_name    => 'Rome',
);

isa_ok( $org, 'Organization' );
stdout_is { $org->boss } 'Hi there!', 'class code executed';
ok( ! defined($org->boss), 'boss not built' );