# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "generic/ubuntu1804"
#    config.vm.synced_folder ".", "/vagrant"


    config.vm.define "machine1" do |server|
        server.vm.hostname = "machine1"
        server.vm.network "private_network", ip: "192.168.42.20"
        server.vm.provider :virtualbox do |v|
            v.name = "machine1"
            v.memory = 2500
            v.cpus = 2
        end
    end

end