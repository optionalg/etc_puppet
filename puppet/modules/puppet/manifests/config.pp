class puppet::config {

include puppet::params

  file { "/etc/puppet/puppet.conf":
    ensure => present,
    content => template("puppet/puppet.conf.erb"),
    owner => "puppet",
    group => "puppet",
    require => Class["puppet::install"],
    notify => Class["puppet::service"],
  }


  package { ["libmysql-ruby1.8", "libmysql-ruby"]:
    ensure => present
  }

  # Install rubygems
  #exec { "install rubygems":
  #  command => "apt-get -y install rubygems",
  #  require => [ Package["libmysql-ruby1.8", "libmysql-ruby"]],
  #}

  # Install rails
  package { 'rails':
    ensure => '3.1.12',
    provider => 'gem',
  }
  # Install activerecord
  package { 'activerecord':
    ensure => '3.1.12',
    provider => 'gem'
  }





}