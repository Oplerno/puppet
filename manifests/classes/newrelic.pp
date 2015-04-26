# newrelic.pp
class { 'nrsysmond':
  license_key    => $new_relic_license_key,
}
