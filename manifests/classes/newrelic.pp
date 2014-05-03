# newrelic.pp
class { 'newrelic_plugins::wikipedia_example_java':
  license_key   => $NEW_RELIC_LICENSE_KEY,
  install_path  => '/etc/puppetlabs/puppet/modules/',
  user          => 'newrelic'
}

user { 'newrelic':
  ensure     => present,
  managehome => true,
}
