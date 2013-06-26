class mysql::config {
  file { $mysql::params::mysql_service_config:
    ensure => present,
    source => "puppet:///modules/mysql/my.cnf",
    owner => "mysql",
    group => "mysql",
    require => Class["mysql::install"],
    notify => Class["mysql::service"],
  }

  file { $mysql::params::mysql_data_dir:
    group => "mysql",
    owner => "mysql",
    recurse => true,
    require => File["$mysql::params::mysql_service_config"],
  }
}
