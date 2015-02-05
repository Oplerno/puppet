# security.pp

package { 'libssl1.0.0':
  ensure   => 'latest',
  require  => Exec['apt-get update'],
  notify   => Service['nginx'],
}

package { 'libssl1.0.0-dbg':
  ensure   => 'latest',
  require  => Exec['apt-get update'],
  notify   => Service['nginx'],
}

package { 'libssl-dev':
  ensure   => 'latest',
  require  => Exec['apt-get update'],
  notify   => Service['nginx'],
}

package { 'openssl':
  ensure   => 'latest',
  require  => Exec['apt-get update'],
  notify   => Service['nginx'],
}

exec { 'apt-get update':
  command  => '/usr/bin/apt-get update',
  onlyif   => '/bin/sh -c \'[ ! -f /var/cache/apt/pkgcache.bin ] || /usr/bin/find /etc/apt/* -cnewer /var/cache/apt/pkgcache.bin | /bin/grep . > /dev/null\'',
}

