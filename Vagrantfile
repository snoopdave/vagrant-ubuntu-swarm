# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure(2) do |config|

    (1..2).each do |i|

        config.vm.define "vm#{i}" do |s|
            #s.ssh.forward_agent = true
            s.vm.box = "ubuntu/xenial64"
            s.vm.hostname = "vm#{i}"
            s.vm.provision :shell, path: "scripts/bootstrap_ansible.sh"
            if i == 1
                s.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/master.yml -c local"
            else
                s.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/worker.yml -c local"
            end
            s.vm.network "private_network", ip: "10.1.1.16#{i}", netmask: "255.255.255.0", auto_config: true
            s.vm.provider "virtualbox" do |v|
                v.name = "vm#{i}"
                v.memory = 2048
                v.gui = false
            end
        end
    end
end



