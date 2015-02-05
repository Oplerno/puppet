apt::source { 'debian-lts':
  location          => 'http://ftp.us.debian.org/debian',
  release           => 'squeeze-lts',
  repos             => 'main',
}

package { 'libc6':
  ensure => "latest",
}
