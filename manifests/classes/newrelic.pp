# newrelic.pp
class { 'nrsysmond':
  license_key    => $NEW_RELIC_LICENSE_KEY,
}
