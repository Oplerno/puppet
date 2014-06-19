## elasticsearch.pp

apt::source { 'elasticsearch':
  location  => 'http://packages.elasticsearch.org/elasticsearch/1.0/debian',
  release   => 'stable',
  repos     => 'main',
  before    => Class['elasticsearch'],
  require   => Package['openjdk-7-jre-headless'],
}

package { 'openjdk-7-jre-headless':
  ensure => 'installed',
}

if $::hostname == ("cOPL03") {
  $ec_ip = $::ipaddress
  $master = 'true'
} else {
  $ec_ip = $::ipaddress_eth1
  $master = 'false'
}



class { 'elasticsearch':
  version                  => '1.0.1',
  config                   => {
    'node'                 => {
      'name'               => "elasticsearch-$::hostname",
      'master'             => $master
    },
    'index'                => {
      'number_of_replicas' => '0',
      'number_of_shards'   => '5'
    },
    'network'              => {
      'host'               => $ec_ip
    }
  }
}

file { '/etc/environment':
  content => inline_template("ELASTICSEARCH_URL=http://$ec_ip:9200")
}

