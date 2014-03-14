## site.pp ##

# Define filebucket 'main':
filebucket { 'main':
  server => 'copl03',
  path   => false,
}

# Make filebucket 'main' the default backup location for all File resources:
File { backup => 'main' }

node default {
#  include sudo
  include vim
}
