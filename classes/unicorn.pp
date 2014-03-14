## unicorn.pp


class unicorn {
	service { 'unicorn':
		ensure => 'running',
		before => Package['unicorn'],
	}
	package{ 'unicorn':
		ensure => 'latest',
		notify  => Service['unicorn'],
	}
}


