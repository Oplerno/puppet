## turnkey.pp

service { 'apache2':
  ensure => 'stopped',
  enable => false,
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

