class base {
  #include sudo, ssh, puppet
  include ssh
}

node 'puppet.example.com' {
  include base
  include puppet::master
  include passenger
  # Here we configure the puppet master to use PuppetDB,
  # and tell it that the hostname is Ã¢ÂÂpuppetdbÃ¢ÂÂ
  class { 'puppetdb::master::config':
    puppetdb_server => 'db.example.com',
  }

  @@file { "/tmp/foo": content => "fjskfjs\n", tag => "foofile", }

}

node 'web.example.com' {
  include base
  include apache

  apache::vhost { 'web.example.com':
    port => 80,
    docroot => '/var/www/web.example.com',
    ssl => false,
    priority => 10,
    serveraliases => 'home.example.com',
  }

  apache::vhost { 'another.example.com':
    port => 80,
    docroot => '/var/www/another.example.com',
    ssl => false,
    priority => 10,
  }

}

node 'db.example.com' {
  include base
  include mysql
  # Here we install and configure postgres and the puppetdb
  # database instance, and tell postgres that it should
  # listen for connections to the hostname âpuppetdb-postgresâ
  class { 'puppetdb::database::postgresql':
    listen_addresses => '*',
  }

  # Here we install and configure PuppetDB, and tell it where to
  # find the postgres database.
  class { 'puppetdb::server':
    database_host => '127.0.0.1',
  }
  
  File <<| tag == 'foofile' |>>

}

# We try to be slick and avoid using .*
node /^mail[^\/]+\.example\.com/{
  include base
  include postfix
  include passenger
}

node 'mock.example.com' {
  include base
  include postfix
  include passenger
}
