# ntp::service
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include ntp::service
class ntp::service inherits ntp {

  if $ntp::service_manage {
    service { $ntp::service_name:
      ensure => $ntp::service_ensure,
      enable => $ntp::service_enable ,
    }
  }

}
