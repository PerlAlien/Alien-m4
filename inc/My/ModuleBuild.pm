package My::ModuleBuild;

use strict;
use warnings;
use base qw( Alien::Base::ModuleBuild );
use File::chdir;
use Capture::Tiny qw( capture_stderr );

sub alien_check_installed_version
{
  my($self) = @_;
  
  my @stdout;
  my $stderr = capture_stderr {
    @stdout = `m4 --version`;
  };
  if(defined $stdout[0] && $stdout[0] =~ /^m4/ && $stdout[0] =~ /([0-9\.]+)$/)
  {
    my $version = $1;
    my @version = split /\./, $version;
    
    # so says AutoConf:
    # GNU M4 1.4.6 or later is required; 1.4.16 or newer is recommended.
    # GNU M4 1.4.15 uses a buggy replacement strstr on some systems.
    # Glibc 2.9 - 2.12 and GNU M4 1.4.11 - 1.4.15 have another strstr bug.
    
    return unless $version[0] >= 1;
    
    if($version[0] == 1)
    {
      return unless $version[1] >= 4;
      
      if($version[1] == 4)
      {
        return unless $version[2] >= 6;
        return if $version[2] =~ /^(11|12|13|14|15)$/;
      }
    }
    
    return $version;
  }
  else
  {
    return;
  }
}

sub alien_check_built_version
{
  $CWD[-1] =~ /^m4-(.*)$/ ? $1 : 'unknown';
}

1;
