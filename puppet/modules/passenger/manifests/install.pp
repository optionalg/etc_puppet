class passenger::install {

   package { ["rubygems"]:
      ensure => present,
   }

   package { [ $passenger::params::web_server ]:
       ensure => present,
       require => Package["rubygems"],
       alias => 'passenger_web_server',
   }


   exec { "install rack gem":
      command => "gem install rack",
      path => "/usr/bin",
      require => Package["passenger_web_server"],
   }


   exec { "install passenger gem":
      command => "gem install passenger",
      path => "/usr/bin",
      require => Package["passenger_web_server"],
   }

   package { [ "libcurl4-openssl-dev", "apache2-threaded-dev", "libapr1-dev", "build-essential"]:
     ensure => present,
     require => Package['passenger_web_server'],
   }


   exec { "install passenger module":
     command => "$passenger::params::module_type --auto",
     path => ["/usr/local/bin","/usr/local/sbin","/usr/local/bin","/usr/sbin","/usr/bin","/sbin","/bin"],
     require => Package["build-essential"],
   }

}