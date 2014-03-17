## javascript.pp

exec { 'phantom_build':
  command => '/bin/tar -jxf phantomjs-1.9.7-linux-x86_64.tar.bz2 ; cd phantomjs-1.9.7-linux-x86_64/',
  cwd     => '/root/',
  creates => '/root/phantomjs-1.9.7-linux-x86_64/bin/phantomjs',
  require => Exec['phantomjs'],
}

exec { 'phantomjs':
  command =>'/usr/bin/wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2',
  cwd     => '/root/',
  creates => '/root/phantomjs-1.9.7-linux-x86_64.tar.bz2',
  before  => Exec['phantom_build'],
}

file { '/usr/bin/phantomjs':
  ensure => 'link',
  target => '/root/phantomjs-1.9.7-linux-x86_64/bin/phantomjs',
  require => Exec['phantom_build'],
}

package { 'libqt4-core':
  ensure => 'installed',
}

package { 'libqt4-webkit':
  ensure  => 'installed',
  require => Package['libqt4-core'],
  before  => Exec['phantom_build'],
}

