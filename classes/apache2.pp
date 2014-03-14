## apache2.pp

service { "apache2":
	ensure => "stopped",
	enable => false,
}

service { "shellinabox":
	ensure => "stopped",
	enable => false,
}

service { "webmin":
	ensure => "stopped",
	enable => false,
}

service { "confconsole":
	ensure => "stopped",
	enable => false,
}

