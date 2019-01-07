#!/bin/bash -e

cd /root
[ -d contrail-helm-deployer ] || git clone https://github.com/Juniper/contrail-helm-deployer -b master
[ -d openstack-helm ] || git clone https://github.com/Juniper/openstack-helm -b master
[ -d openstack-helm-infra ] || git clone https://github.com/Juniper/openstack-helm-infra -b master
