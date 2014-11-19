package My::ModuleBuild;

use strict;
use warnings;
use base qw( Alien::Base::ModuleBuild );
use File::chdir;
use Capture::Tiny qw( capture_stderr );

sub new
{
  my($class, %args) = @_;
  
  $args{alien_name} = 'm4';
  $args{alien_build_commands} = [
    '%c --prefix=%s',
    'make',
  ];
  $args{alien_install_commands} = [
    'make install',
  ];
  $args{alien_repository} = {
    protocol => 'http',
    host     => 'ftp.gnu.org',
    location => '/gnu/m4/',
    pattern  => qr{^m4-latest\.tar\.gz$},
  };
  
  my $self = $class->SUPER::new(%args);
  
  $self;
}

sub alien_check_installed_version
{
  my($self) = @_;
  
  my @stdout;
  my $stderr = capture_stderr {
    @stdout = `m4 --version`;
  };
  if(defined $stdout[0] && $stdout[0] =~ /^m4/ && $stdout[0] =~ /([0-9\.]+)$/)
  {
    return $1;
  }
  else
  {
    return;
  }
}

sub alien_check_built_version
{
  $CWD[-1] =~ /^bison-(.*)$/ ? $1 : 'unknown';
}

1;
