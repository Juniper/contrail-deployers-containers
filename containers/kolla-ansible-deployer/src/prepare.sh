#!/bin/bash -e

yum install -y git

cd /root
[ -d contrail-ansible-deployer ] || git clone https://github.com/Juniper/contrail-ansible-deployer -b master
[ -d contrail-kolla-ansible ] || git clone https://github.com/Juniper/contrail-kolla-ansible -b master

pushd contrail-ansible-deployer
git branch -a -vv
popd

pushd contrail-kolla-ansible
git branch -a -vv
popd
