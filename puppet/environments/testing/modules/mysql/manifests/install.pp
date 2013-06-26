class mysql::install {

  file { "/etc/mysql/set_mysql_password.sh":
    ensure => present,
    source => "puppet:///modules/mysql/set_mysql_password.sh",
    owner => "mysql",
    group => "mysql",
    mode => 700,
  }


  exec { "set mysql passwd":
    command => "set_mysql_password.sh",
    path => "/etc/mysql",
    require => File["/etc/mysql/set_mysql_password.sh"],
  }

  # Bug with installing mysql
  # https://bugs.launchpad.net/ubuntu/+source/mysql-5.5/+bug/973951
  exec { "reinstall apparmor":
    command => "apt-get -y install --reinstall apparmor",
    path => ["/usr/bin", "/usr/local/sbin", "/usr/local/bin", "/usr/bin", "/sbin", "/bin", "/opt/vagrant_ruby/bin", "/usr/sbin", ]
  }



  package { [ $mysql::params::mysql_package_name, $mysql::params::mysql_client_name, $mysql::params::mysql_test_package ]:
    ensure => present,
    #require => [ User["mysql"],]
    require => [ User["mysql"], Exec["set mysql passwd"], Exec["reinstall apparmor"], ],
  }

  package { ["libmysql-ruby1.8", "libmysql-ruby"]:
    ensure => present
  }

  user { "mysql":
    ensure => present,
    comment => "MySQL user",
    gid => "mysql",
    shell => "/bin/false",
    require => Group["mysql"],
  }

  group { "mysql":
    ensure => present,
  }

}
