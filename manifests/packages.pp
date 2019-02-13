# Packages to be installed on agent machine
class autostructure_toolbox::packages (
  Array[String] $packages,
  Array[String] $gem_packages,
) {
  $packages = [ 'bison', 'bzip2', 'bzip2-dev', 'coreutils', 'dpkg-dev', 'dpkg', 'gdbm-dev', 'glib-dev', 'libc-dev', #lint:ignore:140chars
              'git-all', 'gcc', 'g++', 'openssh-client', 'autoconf', 'automake', 'patch', 'readline', 'readline-dev', 'zlib',
              'zlib-dev', 'libffi-dev', 'openssl-dev', 'libgcc', 'bash', 'wget', 'ca-certificates', 'libressl',
              'libressl-dev', 'libxml2-dev', 'libxslt-dev', 'linux-headers', 'make', 'ncurses-dev', 'procps', 'ruby', 'tar', 'xz', #lint:ignore:140chars
              'yaml-dev']

  $gem_packages = ['r10k', 'ra10ke', 'puppet:5.3.3', 'rubocop', 'puppetlabs_spec_helper', 'puppet-lint', 'onceover', 'rest-client'] #lint:ignore:140chars

  package { 'dnf':
    ensure => installed,
  }

  package { $packages:
    ensure   => installed,
    provider => 'dnf',
    require  => Package['dnf'],
  }

  package { $gem_packages:
    ensure   => installed,
    provider => 'gem',
  }

  file { '/Rakefile':
    ensure => present,
    source => 'puppet:///modules/autostructure_toolbox/puppet-dev-tools-rakefile.pp',
  }
}
