class mysql::service {
  service { $mysql::params::mysql_service_name:
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enabled => true,
    require => Class["mysql::config"],
  }
}