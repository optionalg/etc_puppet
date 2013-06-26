class base {
  include sudo, ssh, puppet
}

node 'puppet.example.com' {
  include base
  include puppet::master
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
  inclue mysql
}

node 'mail.example.com' {
  include base
  include postfix
}
