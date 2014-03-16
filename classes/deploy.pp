## deploy

user { 'deploy':
  name   => 'deploy',
  shell  => '/bin/bash',
  ensure => 'present',
}
