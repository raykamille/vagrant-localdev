#!/usr/bin/env bash
#
# Bootstrap the vagrant VM by installing Ansible
# letting ansible do the provisioning in local connection mode
# This should work for windows machines and be more self contained
# meaning no need to install ansible on the host.

# Let's ensure we have the lastest updates (not ideal as we should be running the same
# versions of everything that we run on the production servers... but it works for now
# until we build our own 'vagrant box' )

sudo apt-get update

# This doesn't work on squeeze becase of versions add-apt-repositry isn't avaialble in
# debian squeeze
#sudo apt-get install -y python-software-properties
#sudo add-apt-repository -y ppa:rquillo/ansible
#sudo apt-get update
#sudo apt-get install -y ansible

# So we are going to install Ansible using pip instead.

sudo apt-get install -y python-pip python-dev
sudo pip install ansible

# Now let's execute our ansible playbook on this guest as this guest
# note we are not calling the ainsible playbook from the vagrant provisioner
# we are using the shell provisioner because currently ansible does not have an
# option to run ansible as the guest.

sudo echo 'Running ansible playbook - this will take a little bit - stand by...'
sudo ansible-playbook -v -i /vagrant/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --connection=local /vagrant/localdev-ansible.yml
