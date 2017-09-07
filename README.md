
[![Build Status](https://travis-ci.org/petersonwsantos/puppet-ntp.svg?branch=master)](https://travis-ci.org/petersonwsantos/puppet-ntp)
[![GitHub release](https://img.shields.io/github/release/petersonwsantos/puppet-ntp.svg)](https://github.com/petersonwsantos/windows_desktop_packages/releases)
[![GitHub issues](https://img.shields.io/github/issues/petersonwsantos/puppet-ntp.svg)](https://github.com/petersonwsantos/windows_desktop_packages/issues)


Puppet Module - NTP
==============================

<img src="https://www.pivotaltracker.com/images/v7/logos/logo_main.png" width="120">

- **Project - Puppet Modules:** https://www.pivotaltracker.com/n/projects/2081967

- **Story:** https://www.pivotaltracker.com/story/show/149242901


## Description
The ntp module installs, configures, and manages the NTP service across a range of operating systems and distributions.

## Usage

All parameters for the ntp module are contained within the main `::ntp` class, so for any function of the module, set the options you want. See the common usages below for examples.

### Install and enable NTP

```puppet
include '::ntp'
```

### Change NTP servers

List of Stratum One Time Servers

[![List of Stratum One Time Servers](http://support.ntp.org/pub/TWiki/TWikiLogos/ntp_logo.png)](http://support.ntp.org/bin/view/Servers/StratumOneTimeServers)

```puppet
class { '::ntp':
  config_servers => [ 'ntp1.corp.com', 'ntp2.corp.com' ],
}
```

### Restrict who can connect

```puppet
class { '::ntp':
  config_servers  => [ 'ntp1.corp.com', 'ntp2.corp.com' ],
  config_restrict => ['127.0.0.1'],
}
```

### Install a client that can't be queried

```puppet
class { '::ntp':
  config_servers   => ['ntp1.corp.com', 'ntp2.corp.com'],
  config_restrict  => [
    'default ignore',
    '-6 default ignore',
    '127.0.0.1',
    '-6 ::1',
    'ntp1.corp.com nomodify notrap nopeer noquery',
    'ntp2.corp.com nomodify notrap nopeer noquery'
  ],
}
```

## Reference

### Classes

#### Public classes

* ntp: Main class, includes all other classes.

#### Private classes

* ntp::install: Handles the packages.
* ntp::config: Handles the configuration file.
* ntp::service: Handles the service.


### Hiera example

```yaml
---
ntp::package_ensure: present
ntp::package_manage: true
ntp::package_name: 
  - 'ntp'
ntp::service_name: ntpd
ntp::service_enable: true
ntp::service_ensure: running
ntp::service_manage: true
ntp::config_servers:
  - '0.pool.ntp.org'
  - '1.pool.ntp.org'
  - '2.pool.ntp.org'
  - '3.pool.ntp.org'
ntp::config_restrict:
  - 'default nomodify notrap nopeer noquery kod limited'
  - '-6 default kod nomodify notrap nopeer noquery'
  - '127.0.0.1'
  - '-6 ::1'

```

