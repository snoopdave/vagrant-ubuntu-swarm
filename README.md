# vagrant-ubuntu-swarm

Vagrant setup for 3-node Docker Swarm cluster on Ubuntu.

This Vagrant setup creates three Ubuntu VMs and then uses Ansible
to install an NFS server and Docker Swarm manager on VM #1. It sets
up NFS clients on the other VMs, Docker and uses "docker swarm join"
to add the other VMs the the Docker Swarm managed by VM #1.

## Prerequisites

You'll need Git, Vagrant and a machine with a fair amount of memory.
If you're reading this you probably have Git installed.
You can get Vagrant here: https://www.vagrantup.com/downloads.html

## Getting the code

Use Git to clone this repo:

    $ git clone https://github.com/snoopdave/vagrant-ubuntu-swarm.git

## Starting the cluster

Change directory in to the repo directory:

    $ cd vagrant-ubuntu-swarm

Use Vagrant to create the cluster:

    $ vagrant up

Vagrant will create three VMs running Ubuntu and will then use Ansible
to install Docker on each. Ansible will init a Docker Swarm cluster
on vm1, making it the Swarm master, and save the join-token to NFS
drive. The other VMs will use that join-token to join the cluster.

## Accessing the cluster

You can use Vagrant to ssh into the three VMs of the cluster:
vm1, vm2 and vm3. vm1 is the Docker Swarm master. For example, you
can login to vm1 and list the Docker networks:

    $ docker network ls
    NETWORK ID          NAME                DRIVER              SCOPE
    4e6647e451f5        bridge              bridge              local
    5417aa6b23a9        docker_gwbridge     bridge              local
    98592e66496b        host                host                local
    2db972t4ugnd        ingress             overlay             swarm
    4838d2ef79d3        none                null                local

You can also access the cluster via IP addresses:

* vm1 is 10.1.1.161
* vm2 is 10.1.1.162
* vm3 is 10.1.1.163

The cluster also exposes 8080 on each VM as port 80. So, for example
if you run Tomcat on vm1 on port 8080, you'll be able to access
Tomcat at http://10.1.1.161:8080 on your host computer.

You can change or add additional port mappings by changing the `Vagrantfile`.

## NFS drive

vm1 also runs an NFS server and the other VMs mount it as /var/nfs.








