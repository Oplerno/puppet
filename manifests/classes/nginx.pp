## nginx.pp

class { 'nginx': }

file { 'nginx.conf':
  ensure  => 'present',
  notify  => Service['nginx'],
  path    => '/etc/nginx/sites-available/oplerno',
  mode    => '0644',
  content => template('oplerno_nginx/nginx.erb'),
  before  => Service['nginx'],
}

file { '/etc/nginx/sites-enabled/oplerno':
  ensure  => 'link',
  target  => '/etc/nginx/sites-available/oplerno',
  require => File['nginx.conf'],
}

file { 'logon':
  ensure  => 'present',
  notify  => Service['nginx'],
  path    => '/etc/nginx/sites-available/logon',
  mode    => '0644',
  content => template('oplerno_nginx/logon.erb'),
  before  => Service['nginx'],
}

file { '/etc/nginx/sites-enabled/logon':
  ensure  => 'link',
  target  => '/etc/nginx/sites-available/logon',
  require => File['logon'],
}
