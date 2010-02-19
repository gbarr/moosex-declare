#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;

use MooseX::Declare;

BEGIN {
    class My::Meta::Role  extends Moose::Meta::Role { }
    class My::Meta::Class extends Moose::Meta::Class { }
}


role Fooable metaclass My::Meta::Role { has foo => (is => 'ro', default => 1) }

class FooBar1 with Fooable metaclass My::Meta::Class {}

my $foobar1 = FooBar1->new;

isa_ok(Fooable->meta, 'My::Meta::Role');
isa_ok(FooBar1->meta, 'My::Meta::Class');

