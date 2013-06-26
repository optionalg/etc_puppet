class mysql::install {
  package { [ $mysql::params::mysql_package_name, $mysql::params::mysql_client_name, $mysql::params::mysql_test_package ]:
    ensure => present,
    require => User["mysql"],  
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
