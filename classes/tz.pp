## tz.pp
package { "tzdata":
	ensure => installed
}

file { "/etc/localtime":
	require => Package["tzdata"],
	source => "file:///usr/share/zoneinfo/UTC"
}
