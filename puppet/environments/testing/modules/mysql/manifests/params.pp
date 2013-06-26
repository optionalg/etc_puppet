class mysql::params {

  # Use a case statement to iterate over value of $operatingsystem variable 

  case $operatingsystem {

    Solaris: {
      $mysql_package_name = 'cswmysql5'
      $mysql_service_config = '/opt/csw/mysql5/my.cnf'
      $mysql_service_name = 'cswmysql5'
      $mysql_service_name = 'mysql5client'
      $mysql_test_package = 'mysql5test'
      $mysql_data_dir = '/opt/csw/mysql5/var'
    }

    /(Ubuntu|Debian)/: {
      $mysql_package_name = 'mysql-server'
      $mysql_service_config = '/etc/mysql/my.cnf'
      $mysql_service_name = 'mysql'
      $mysql_client_name = 'mysql-client'
      $mysql_test_package = 'mysql-testsuite'
      $mysql_data_dir = '/var/lib/mysql'
    }

    /(RedHat|CentOS|Fedora)/: {
      $mysql_package_name = 'mysql'
      $mysql_service_config = '/etc/mysql/my.cnf'
      $mysql_service_name = 'mysqld'
      $mysql_client_name = 'MySQL-client'
      $mysql_test_package = 'MySQL-test'
      $mysql_data_dir = '/var/lib/mysql'
    }

  }

}
