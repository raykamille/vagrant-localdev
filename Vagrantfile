# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
# --
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # We are using debian squeeze - We eventually might make our own box, but this works
  # for now

  config.vm.box = "ffuenf/debian-6.0.9-amd64"

  # Vagrant creates a NAT interface for internet access by default

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # This is where we will access our virtual web server

  config.vm.network "private_network", ip: "192.168.77.10"

  
  # Vagrant shares the host vagrant folder with the host OS by default at /vagrant

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.

  config.vm.synced_folder "../virtual-web-sites", "/var/www",
  owner: "www-data", group: "adm"

#  config.vm.provision "ansible" do |ansible|
#        ansible.verbose = "v"
#        ansible.playbook = "localdev-ansible.yml"
#  end

   config.vm.provision :shell, :path => "bootstrap/bootstrap.sh"

end
