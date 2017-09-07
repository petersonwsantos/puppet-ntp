# ntp::service
#
#
# Used for managing installation and configuration NTP Server.
#
# @author Peterson W. Santos
#
# @summary The purpose of this class is manage service os installed software.
#
# @example
#   include ntp::service
class ntp::service inherits ntp {

  if $ntp::service_manage == true {
    service { $ntp::service_name:
      ensure => $ntp::service_ensure,
      enable => $ntp::service_enable ,
    }
  }

}
