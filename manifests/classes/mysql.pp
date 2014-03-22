## mysql.pp

if $::hostname == ('cOPL03') {
  $my_ip = $::ipaddress
} else {
  $my_ip = $::ipaddress_eth1
}


class { 'mysql::server':
#  root_password      => $MYSQL_ROOT_PASSWD,
#  old_root_password  => $MYSQL_ROOT_PASSWD,
  override_options   => {
    'mysqld' => {
      'max_connections'                 => '1024',
      'bind-address'                    => $my_ip,
      'server-id'                       => $MYSQL_ID,
      'innodb_flush_log_at_trx_commit'  => 1,
      'sync_binlog'                     => 1,
      'log-bin'                         => 'mysql-bin',
      'report-host'                     => $::hostname,
    }
  }
}

$users = {
  'repl@%' => {
    ensure                    => 'present',
    password_hash             => $MYSQL_REPL_PASSWD_HASH,
  },
}

mysql_user { 'repl@%':
    ensure                    => 'present',
    password_hash             => $MYSQL_REPL_PASSWD_HASH,
}

$grants = {
  'repl@%/*.*' => {
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['REPLICATION SLAVE'],
    table      => '*.*',
    user       => 'repl@%',
  },
}

mysql_grant { 'repl@%/*.*':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['REPLICATION SLAVE'],
    table      => '*.*',
    user       => 'repl@%',
}

$databases = {
  'oplerno_production' => {
    ensure             => 'present',
    charset            => 'utf8',
  },
  'testing'            => {
    ensure             => 'present',
    charset            => 'utf8',
  },
}

mysql_database { 'oplerno_production':
    ensure             => 'present',
    charset            => 'utf8',
}
mysql_database { 'testing':
  ensure  => 'absent',
  charset => 'utf8',
}
