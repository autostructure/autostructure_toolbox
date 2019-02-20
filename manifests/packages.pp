# Packages to be installed on agent machine
class autostructure_toolbox::packages (
  Array[String] $packages,
  Array[String] $gem_packages,
) {

  package { 'dnf':
    ensure => installed,
  }

  package { $packages:
    ensure   => installed,
    provider => 'dnf',
    require  => Package['dnf'],
  }

  class { 'rbenv': }
  rbenv::plugin { [ 'rbenv/rbenv-vars', 'rbenv/ruby-build' ]: }
  rbenv::build { '2.5.1': global => true }
  rbenv::gem { $gem_packages: ruby_version => '2.5.1' }

  file { '/Rakefile':
    ensure => present,
    source => 'puppet:///modules/autostructure_toolbox/puppet-dev-tools-rakefile',
  }
}
