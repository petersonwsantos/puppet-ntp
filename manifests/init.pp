# NTP - Used for managing NTP
# 
#
# 
class ntp (
  String $package_ensure,
  Boolean $package_manage,
  Array[String] $package_name,
  Array[String] $config_servers,
  Boolean $service_enable,
  Enum['running', 'stopped'] $service_ensure,
  String $service_name,
  Boolean $service_manage,
  Array[String] $config_restrict,
  Array[String] $config_driftfile,
) {
  contain ntp::install
  contain ntp::config
  contain ntp::service

  Class['::ntp::install']
  -> Class['::ntp::config']
  ~> Class['::ntp::service']
}




