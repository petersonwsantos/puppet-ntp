# ntp::config
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include ntp::config
class ntp::config  inherits ntp {

  file {'/etc/ntp.conf':
    ensure  => 'file',
    mode    => '0644',
    content => template('ntp/ntp.conf.erb'),
  }

}
