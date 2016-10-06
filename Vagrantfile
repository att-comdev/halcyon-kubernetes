# -*- mode: ruby -*-
# vi: set ft=ruby :
# NOTE: Variable overrides are in ./config.rb
require "yaml"
require "vagrant-openstack-provider"
require "fileutils"

# Use a variable file for overrides:
CONFIG = File.expand_path("config.rb")
if File.exist?(CONFIG)
  require CONFIG
end

# Force best practices for this environment:
if $kube_memory < 512
  puts "WARNING: Your machine should have at least 512 MB of memory"
end

# Install any Required Plugins
missing_plugins_installed = false
required_plugins = %w(vagrant-env vagrant-git vagrant-openstack-provider)

required_plugins.each do |plugin|
  if !Vagrant.has_plugin? plugin
    system "vagrant plugin install #{plugin}"
    missing_plugins_installed = true
  end
end

# If any plugins were missing and have been installed, re-run vagrant
if missing_plugins_installed
  exec "vagrant #{ARGV.join(" ")}"
end

# Vagrantfile API/sytax version. Don’t touch unless you know what you’re doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

# UNCOMMENT FOLLOWING LINES FOR OPENSTACK PROVIDER:
#if provider == "openstack"
#   config.ssh.username         = $ssh_user
#   config.ssh.private_key_path = $ssh_keypath
#end
# DO NOT ADD YET!!!
#  config.ssh.username         = $ssh_user
#  config.ssh.private_key_path = $ssh_keypath

  # Guest Definitions:
  # ------------------------
  #
  # START: Kube Definition(s)
  (1..$kube_count).each do |kb|
  ip = "#{$subnet}.#{kb}"

    config.vm.define vm_name = "kube#{kb}" do |kube|

      kube.vm.box = $kube_version
      kube.vm.hostname = "kube#{kb}"
      # NETWORK-SETTINGS: eth1 configured in using the $subnet variable:
      kube.vm.network "private_network", ip: "172.16.35.1#{kb}", auto_config: true
#      kube.vm.network "public_network", ip: "#{$subnet}.#{kb}"

      if $expose_docker_tcp
        kube.vm.network "forwarded_port", guest: 2375, host: ($expose_docker_tcp + i - 1), auto_correct: true
      end
      $forwarded_ports.each do |guest, host|
        kube.vm.network "forwarded_port", guest: guest, host: host, auto_correct: true
      end
      # Openstack Provider (Optional --provider=openstack):
      kube.vm.provider "virtualbox" do |vb|
        vb.name = "kube#{kb}"
        vb.customize ["modifyvm", :id, "--memory", $kube_memory]
        vb.customize ["modifyvm", :id, "--cpus", $kube_vcpus]
      end
      # Openstack Provider (Optional --provider=openstack):
      kube.vm.provider "openstack" do |os|
        # Openstack Authentication Information:
        os.openstack_auth_url  = $os_auth_url
        os.username            = $os_username
        os.password            = $os_password
        os.tenant_name         = $os_tenant
        # Openstack Instance Information:
        os.server_name         = "kube#{kb}"
        os.flavor              = $os_flavor
        os.image               = $os_image
        os.floating_ip_pool    = $os_floatnet
        os.networks            = $os_fixednet
        os.keypair_name        = $os_keypair
        os.security_groups     = $os_secgroups
      end
    # We only want Ansible to run after after all servers are deployed:
    if kb == $kube_count
      kube.vm.provision :ansible do |ansible|
        ansible.sudo              = true
        ansible.limit             = $ansible_limit
        ansible.playbook          = $ansible_playbook
        ansible.host_key_checking = false
        ansible.groups            = {
          # The first three nodes should be etcd servers
          #"etcd" => [$number_etcd],
          # The first two nodes should be masters
          "kube-masters" => [$kube_masters],
          # all nodes should be kube nodes
          "kube-workers" => [$kube_workers],
          "kube-cluster:children" => ["kube-masters", "kube-workers"],
        }
        # Additional Ansible tools for debugging:
        #ansible.inventory_path = $ansible_inventory
        #ansible.verbose        = "-vvvv"
        #ansible.raw_ssh_args   = ANSIBLE_RAW_SSH_ARGS
        end
      end
    end
  end
end
