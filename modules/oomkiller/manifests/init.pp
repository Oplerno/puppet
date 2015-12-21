## init.pp

class oomkiller::install {
  File{
    owner   => root,
    group   => root,
    mode    => 755,
  }
  file { '/etc/cron.d/noOOMforSSHd':
    ensure  => $oomkiller::version,
    content => template('oomkiller/noOOMforSSHd.erb'),
    notify  => Service['cron'],
  }
  file { '/etc/sysctl.d/20-oom-tweaks.conf':
    ensure  => $oomkiller::version,
    content => template('oomkiller/oom-tweeks.conf.erb'),
    notify  => Service['cron'],
  }
}

class oomkiller::service {
  $ensure = $oomkiller::start ? {true => running, default => stopped}
  service{'cron':
    ensure  => $ensure,
    enable  => $oomkiller::enable,
  }
}

class oomkiller(
  $version = 'present',
  $enable  = true,
  $start   = true,
) {
class { 'oomkiller::install': } ->
  class { 'oomkiller::service': } ->
  Class['oomkiller']
}
