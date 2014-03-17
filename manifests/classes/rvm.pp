## rvm.pp

rvm_system_ruby {
  'ruby-1.9.3-p448':
    ensure => 'present',
    default_use => true;
}

rvm::system_user { deploy: ;  }
