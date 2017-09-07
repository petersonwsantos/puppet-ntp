# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'vagrant-hosts'
require 'vagrant-auto_network'

Vagrant.configure("2") do |config|

  config.vm.define :ubuntu do |node1|
    node1.vm.box = "ubuntu/trusty64"
    node1.vm.hostname = 'ubuntu.net'
    node1.vm.network "private_network", ip: "192.168.33.11"
    node1.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.cpus = 2
      vb.memory = "1024"
    end
    node1.vm.provision "shell", inline: <<-SHELL
      wget https://apt.puppetlabs.com/puppet5-release-trusty.deb
      dpkg -i puppet5-release-trusty.deb
      apt-get update  -y
      apt-get install -y puppet-agent
      echo "node default { include ::ntp }" > /etc/puppetlabs/code/environments/production/manifests/site.pp
      rm -rfv /etc/puppetlabs/code/environments/production/modules/ntp
      cp /vagrant /etc/puppetlabs/code/environments/production/modules/ntp -rfv 
      /opt/puppetlabs/bin/puppet module install puppetlabs-stdlib --version 4.19.0
      echo "/opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp"  > /sbin/apply.sh
      chmod +x  /sbin/apply.sh
    SHELL
  end

  config.vm.define :centos do |node2|
    node2.vm.box = "centos/7"
    node2.vm.hostname = 'centos.net'
    node2.vm.network "private_network", ip: "192.168.33.12"
    node2.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.cpus = 2
      vb.memory = "1024"
    end
    node2.vm.provision "shell", inline: <<-SHELL
      yum update -y 
      yum install epel-releas    e -y
      yum install git  net-toos -y
      sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/configpuppet module install puppetlabs-stdlib
      setenforce 0
      echo "Installing puppet agent"
      rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
      yum install -y puppet-agent 
      yum install -y rubygems
      gem install puppet-lint
      echo "node default { include ::ntp }" > /etc/puppetlabs/code/environments/production/manifests/site.pp
      rm -rfv /etc/puppetlabs/code/environments/production/modules/ntp
      cp /vagrant /etc/puppetlabs/code/environments/production/modules/ntp -rfv 
      /opt/puppetlabs/bin/puppet module install puppetlabs-stdlib --version 4.19.0    
      echo "/opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp"  > /sbin/apply.sh
      chmod +x  /sbin/apply.sh
    SHELL
  end
end  