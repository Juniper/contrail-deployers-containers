#!/bin/bash -e

yum install -y git

cd /root
ls -lR
[ -d contrail-ansible-deployer ] || git clone https://github.com/Juniper/contrail-ansible-deployer -b master
[ -d contrail-kolla-ansible ] || git clone https://github.com/Juniper/contrail-kolla-ansible -b master
