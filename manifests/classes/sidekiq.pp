## sidekiq.pp
class sidekiq {
  service { 'sidekiq':
    ensure  => 'running',
    enable  => 'true',
    require => File['/etc/init.d/sidekiq'],
  }

  user { 'sidekiq':
    ensure => 'present',
    name   => 'sidekiq',
    groups => ['sidekiq', 'deploy'],
    shell  => '/bin/true',
    require => Group['sidekiq'],
    before  => File['sidekiq'],
  }

  group { 'sidekiq':
    ensure => 'present',
  }
  
  file { 'sidekiq':
    ensure  => 'present',
    notify  => Service['sidekiq'],
    path    => '/etc/init.d/sidekiq',
    mode    => '0750',
    content => template('sidekiq/sidekiq.erb'),
    before  => Service['sidekiq'],
    owner   => 'sidekiq',
    group   => 'deploy',
    require => File['/etc/profile.d/sidekiq.sh'],
  }

	file { '/etc/profile.d/sidekiq.sh':
    notify  => Service['sidekiq'],
    before  => Service['sidekiq'],
    ensure  => 'present',
    mode    => '0750',
    owner   => 'sidekiq',
    group   => 'deploy',
    content => template('sidekiq/sidekiq.sh.erb')
  }

  file { '/var/lock/sidekiq':
    before  => Service['sidekiq'],
    owner   => 'sidekiq',
    group   => 'deploy',
    mode    => '0770',
  }
}
