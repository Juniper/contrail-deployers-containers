#!/bin/bash -e

#HACK: always do clone as a temporary WA for tf-dev-env issue with symlinks in .git that are created by repo tool
rm -rf contrail-ansible-deployer contrail-kolla-ansible

cd /root
[ -d contrail-ansible-deployer ] || git clone https://github.com/Juniper/contrail-ansible-deployer -b master
[ -d contrail-kolla-ansible ] || git clone https://github.com/Juniper/contrail-kolla-ansible -b master
