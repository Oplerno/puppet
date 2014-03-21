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

node 'copl03' {
  include '::mysql::server'
  class{ 'oomkiller': }
}

node 'puppet' {
}
