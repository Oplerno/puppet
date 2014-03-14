## unicorn.pp


class unicorn {
	service { 'unicorn':
		ensure => 'running',
		require => Package['unicorn'],
	}
	package{ 'unicorn':
		ensure => 'latest',
		notify  => Service['unicorn'],
	}
}


