# [ Container Workflow] Deploying Contrail with OpenStack

## 1. Install Docker
Install Docker on the base host. Installation steps for CentOS and Ubuntu are given below:
### CentOS
```bash
sudo su -
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce-18.03.1.ce
systemctl start docker
```

Reference: https://docs.docker.com/install/linux/docker-ce/centos/
### Ubuntu
```bash
sudo su -
apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce=18.03.1~ce-0~ubuntu
```

Reference: https://docs.docker.com/install/linux/docker-ce/ubuntu/

## 2. Copy files from contrail-helm-deployer  container to host
Nightly builds for container can be accessed from [Docker Hub](https://hub.docker.com/r/opencontrailnightly/contrail-helm-deployer/tags "Docker Hub")
#### Set Container Details
```bash
export CHD_IMAGE=opencontrailnightly/contrail-helm-deployer:<build>

```
#### Create Docker Container
```bash
docker create -ti --name contrail-helm-deployer $CHD_IMAGE
```
#### Copy sources from container to host in single node installation or to every host in multi node installation
```bash
docker cp contrail-helm-deployer:/root /dest/to/host/folder
docker rm -fv contrail-helm-deployer
```
## 3. Installation
 For multinode installation follow the instructions from https://github.com/Juniper/contrail-helm-deployer/blob/master/doc/contrail-osh-multinode-install.md

For single node installation follow the instructions from https://github.com/Juniper/contrail-helm-deployer/blob/master/doc/contrail-osh-aio-install.md
