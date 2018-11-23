#!/bin/bash -e

yum install -y git

cd /root
[ -d openshift-ansible ] || git clone https://github.com/Juniper/openshift-ansible -b master

pushd openshift-ansible
git branch -a -vv
popd

rm -rf openshift-ansible3.7
cp -R openshift-ansible openshift-ansible3.7
pushd openshift-ansible3.7
git checkout origin/release-3.7-contrail
popd

rm -rf openshift-ansible3.9
cp -R openshift-ansible openshift-ansible3.9
pushd openshift-ansible3.9
git checkout origin/release-3.9-contrail
popd
