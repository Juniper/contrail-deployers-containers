#!/bin/bash -e

cd /root
if [ ! -d openshift-ansible ] ; then 
    git clone https://github.com/Juniper/openshift-ansible -b master

    rm -rf openshift-ansible3.7
    cp -R openshift-ansible openshift-ansible3.7
    pushd openshift-ansible3.7
    git checkout release-3.7-contrail || git checkout origin/release-3.7-contrail
    popd

    rm -rf openshift-ansible3.9
    cp -R openshift-ansible openshift-ansible3.9
    pushd openshift-ansible3.9
    git checkout release-3.9-contrail || git checkout origin/release-3.9-contrail
    popd
fi
