## sidekiq.pp
class sidekiq {
  service { 'sidekiq':
    ensure  => 'running',
    enable  => 'true',
    require => File['/etc/init.d/sidekiq'],
  }
  
  file { 'sidekiq':
    ensure  => 'present',
    notify  => Service['sidekiq'],
    path    => '/etc/init.d/sidekiq',
    mode    => '0700',
    content => template('sidekiq/sidekiq.erb'),
    before  => Service['sidekiq'],
    owner   => 'root',
    group   => 'root',
    require => File['/etc/profile.d/sidekiq.sh'],
  }

	file { '/etc/profile.d/sidekiq.sh':
    notify  => Service['sidekiq'],
    before  => Service['sidekiq'],
    ensure  => 'present',
    mode    => '0700',
    owner   => 'root',
    group   => 'root',
    content => template('sidekiq/sidekiq.sh.erb')
  }
}
