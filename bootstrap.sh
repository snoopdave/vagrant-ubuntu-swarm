#!/bin/bash

# VagrantFile passes in hostname as argument 1
export PUBLIC_HOSTNAME=$1

# create a startup file for all shells
cat >/etc/profile.d/vm-env.sh <<EOF
alias sudo='sudo -E'
export PUBLIC_HOSTNAME=$PUBLIC_HOSTNAME
#PATH=$PATH:
EOF
source /etc/profile.d/vm-env.sh 

cat >>/etc/hosts <<EOF
10.1.1.161 vm1
10.1.1.162 vm2
10.1.1.163 vm3
EOF


/vagrant/install-docker.sh

