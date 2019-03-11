# Packages to be installed on agent machine
class autostructure_toolbox::packages (
  Array[String] $packages,
  Array[String] $gem_packages,
  String        $facter_version,
) {

  # package { 'dnf':
  #   ensure => installed,
  # }

  # package { 'cmake':
  #   ensure   => '2.8.7',
  #   provider => 'dnf',
  #   require  => Package['dnf'],
  # }

  package { $packages:
    ensure   => installed,
    # provider => 'dnf',
    # require  => Package['dnf'],
  }

  package { $gem_packages:
    ensure   => 'installed',
    provider => gem,
  }

  class { '::rvm':
    gnupg_key_id => false,
  }

  rvm_system_ruby {
    'ruby-2.3.0':
    ensure      => 'present',
    default_use => true,
  }
  # class { '::ruby':
  #   version      => '2.4.1',
  #   gems_version => 'latest',
  # }


  # class { 'rbenv': }
  # rbenv::plugin { [ 'rbenv/rbenv-vars', 'rbenv/ruby-build' ]: }
  # rbenv::build { '2.5.1': global => true }
  # rbenv::gem { 'facter': version => $facter_version, ruby_version => '2.5.1' }
  # rbenv::gem { $gem_packages: ruby_version => '2.5.1' }

  file { '/Rakefile':
    ensure => present,
    source => 'puppet:///modules/autostructure_toolbox/puppet-dev-tools-rakefile',
  }
}
