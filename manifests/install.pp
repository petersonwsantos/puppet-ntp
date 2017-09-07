# ntp::install
#
# Used for managing installation and configuration NTP Server.
#
# @author Peterson W. Santos
#
# @summary Contain all of the resources related to getting the software that the module manages
#
#
# @example
#   include ntp::install
class ntp::install inherits ntp {

  if $ntp::package_manage == true {
    package { $ntp::package_name:
      ensure => present,
    }
  }
}