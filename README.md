# Alien::m4 [![Build Status](https://secure.travis-ci.org/Perl5-Alien/Alien-m4.png)](http://travis-ci.org/Perl5-Alien/Alien-m4) [![Build status](https://ci.appveyor.com/api/projects/status/9jynihn7ute6pf8m/branch/master?svg=true)](https://ci.appveyor.com/project/Perl5-Alien/Alien-m4/branch/master)

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
      alien_bin_requires => {
        'Alien::m4' => '0.07',
      },
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
