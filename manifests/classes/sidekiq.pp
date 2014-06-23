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
  }

	file { '/etc/profile.d/sidekiq.sh':
		content => inline_template("REDIS_URL='http://puppet:6379/'")
	}

}
