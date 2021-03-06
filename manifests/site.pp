## site.pp ##

import 'classes/*'
import 'classes/security/*'

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
  include sidekiq
}

node 'copl03' {
  include '::mysql::server'
  class{ 'oomkiller': }

  vcsrepo { '/etc/puppetlabs/puppet':
    ensure   => latest,
    provider => git,
    source   => 'git@github.com:Oplerno/puppet.git',
    revision => 'master',
  }
}

node 'puppet' {
}
