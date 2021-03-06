use Test::Base;

plan eval { require YAML; 1 }
  ? (tests => 1 * blocks)
  : (skip_all => 'Requires YAML');

my ($block) = blocks;

eval { XXX($block->text) };

my $error = "$@";
$error =~ s/\\/\//g;

is $error, $block->xxx, $block->name;

sub fix {
    s/\bt\b/test/ if -e 'test';
    $_;
}

__DATA__
=== XXX Test
--- text eval
+{ foo => 'bar' }
--- xxx fix
---
foo: bar
...
  at t/xxx.t line 9
