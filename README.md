# Alien::m4

Find or build m4

# SYNOPSIS

From a Perl script

    use Alien::m4;
    use Env qw( @PATH );
    unshift @PATH, Alien::m4->bin_dir;  # m4 is now in your path

From Alien::Base Build.PL

    use Alien:Base::ModuleBuild;
    my $builder = Module::Build->new(
      ...
      alien_bin_requires => [ 'Alien::m4' ],
      ...
    );
    $builder->create_build_script;

# DESCRIPTION

This package can be used by other CPAN modules that require m4.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
