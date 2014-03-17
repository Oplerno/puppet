# mysql.pp

class { 'mysql::server':
  override_options => { 'mysqld' => { 'max_connections' => '1024', 'bind-address' => '0.0.0.0' } }
}

#mysql_user { 'root@%':
#  ensure                   => 'present',
#  password_hash            => '****',
#  max_connections_per_hour => '0',
#  max_queries_per_hour     => '0',
#  max_updates_per_hour     => '0',
#  max_user_connections     => '0',
#}
