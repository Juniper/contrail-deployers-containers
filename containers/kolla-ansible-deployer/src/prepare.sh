#!/bin/bash -e

cd /root
<<<<<<< HEAD   (fadffb pin packages for openshift-deployer)
=======

>>>>>>> CHANGE (a15ae1 remove hack for kolla-deployer container)
[ -d contrail-ansible-deployer ] || git clone https://github.com/Juniper/contrail-ansible-deployer -b master
[ -d contrail-kolla-ansible ] || git clone https://github.com/Juniper/contrail-kolla-ansible -b master
