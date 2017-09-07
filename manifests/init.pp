# ntp
#
# Used for managing installation and configuration NTP Server
#
# @author Peterson W. Santos
#
# @summary This is a init class
#
# @param [Boolean]     package_manage    | Manage package Default: value: true.
# @param Array[String] package_name      | Name package to install. Default value: ntp
# @param [Boolean]     service_manage    | Manage service. Default value: true 
# @param [Boolean]     service_enable    | Enable service. Default value: true
# @param Enum['running', 'stopped']
#                      service_ensure    | Status service. Default value: 'running'
# @param [String]      service_name      | Name ntp service. Default value? 'ntpd'
# @param Array[String] config_restrict   | Option restrict parameters. Default value: {}
# @param [Stdlib::Absolutepath]
#                      config_driftfile  | path for config_driftfile. Default value: '/var/lib/ntp/ntp.drift'
# @param Array[String] config_servers    | List of Stratum Time Servers. Default value: {}
#
# @example
#   include ntp
#
class ntp (
  Boolean                     $package_manage   ,
  Array[String]               $package_name     ,
  Boolean                     $service_manage   ,
  Boolean                     $service_enable   ,
  Enum['running', 'stopped']  $service_ensure   ,
  String                      $service_name     ,
  Array[String]               $config_restrict  ,
  Stdlib::Absolutepath        $config_driftfile = '/var/lib/ntp/drift',
  Array[String]               $config_servers   ,
) {

  contain ntp::install
  contain ntp::config
  contain ntp::service

  Class['::ntp::install']
  -> Class['::ntp::config']
  ~> Class['::ntp::service']
}