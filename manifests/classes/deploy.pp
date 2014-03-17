## deploy

user { 'deploy':
  ensure => 'present',
  name   => 'deploy',
  shell  => '/bin/bash',
}

file {'/home/deploy/.ssh':
  ensure => directory,
  owner  => 'deploy',
  mode   => '0600',
}

file { 'rvmrc':
  ensure  => present,
  content => inline_template('#!/bin/bash\r[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"'),
  name    => '/home/deploy/.bashrc.d/rvmrc',
  owner   => 'deploy',
  mode    => '0600',
}
