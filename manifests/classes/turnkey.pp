## turnkey.pp

service { 'apache2':
  ensure => 'stopped',
  enable => false,
}

service { 'shellinabox':
  ensure => 'stopped',
  enable => false,
  require => Package['shellinabox'],
}

package { 'shellinabox':
  ensure => 'absent',
}

service { 'webmin':
  ensure => 'stopped',
  enable => false,
}

service { 'confconsole':
  ensure => 'stopped',
  enable => false,
}

