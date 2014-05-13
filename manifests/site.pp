## site.pp ##

import 'classes/*'

# Define filebucket 'main':
filebucket { 'main':
  server => 'copl03',
  path   => false,
}

# Make filebucket 'main' the default backup location for all File resources:
File { backup => 'main' }

node default {
  include rvm
  include apt
}

node 'copl01', 'copl02' {
  include nginx
  include unicorn
  include rvm
}

# Puppet Master
node 'copl03' {
  include '::mysql::server'
  class{ 'oomkiller': }

  vcsrepo { '/etc/puppetlabs/puppet':
    ensure       => present,
    provider     => git,
    source       => 'https://github.com/Oplerno/puppet.git',
  }
}

node 'puppet' {
}
