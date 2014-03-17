# vim.pp

package {'vim-common':
  ensure => present,
}

package {'vim':
  ensure => present,
}
