# vagrant-ubuntu-swarm

Vagrant setup for 3-node Docker Swarm cluster on Ubuntu.

This Vagrant setup creates three Ubuntu VMs and then uses Ansible
to install an NFS server and Docker Swarm manager on VM #1. It sets
up NFS clients on the other VMs, Docker and uses "docker swarm join"
to add the other VMs the the Docker Swarm managed by VM #1.



