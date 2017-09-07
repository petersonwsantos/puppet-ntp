# ntp::config
#
# Used for managing installation and configuration NTP Server
#
# @author Peterson W. Santos
#
# @summary The purpose of this class is configure the installed software  
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
