#!/bin/bash -

/usr/bin/debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password foobar' 
/usr/bin/debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password foobar'
/usr/bin/debconf-set-selections <<< 'mysql-server  mysql-server/root_password password foobar' 
/usr/bin/debconf-set-selections <<< 'mysql-server  mysql-server/root_password_again password foobar'
