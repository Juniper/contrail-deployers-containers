#!/bin/bash
# Internal script for parsing common.env. Run by other executable scripts

env_dir="${BASH_SOURCE%/*}"
[ -d "$env_dir" ] || env_dir="$PWD"
env_file="$env_dir/common.env"
if [ -f $env_file ]; then
  source $env_file
  export ENV_FILE="$env_file"
fi

export LINUX_DISTR=${LINUX_DISTR:-centos}
export LINUX_DISTR_VER=${LINUX_DISTR_VER:-'7.5.1804'}

default_interface=`ip route show | grep "default via" | awk '{print $5}'`
host_ip=`ip address show dev $default_interface | head -3 | tail -1 | tr "/" " " | awk '{print $2}'`
export CONTRAIL_REGISTRY=${CONTRAIL_REGISTRY:-"$host_ip:5000"}
export CONTRAIL_DEPLOYERS_TAG=${CONTRAIL_DEPLOYERS_TAG:-${CONTRAIL_VERSION:-'5.0'}}
export DEPLOYERS_BASE_CONTAINER=${DEPLOYERS_BASE_CONTAINER:-"$LINUX_DISTR:$LINUX_DISTR_VER"}

export GENERAL_EXTRA_RPMS=${GENERAL_EXTRA_RPMS="epel-release"}
export YUM_ENABLE_REPOS=${YUM_ENABLE_REPOS:-}
if [[ "$LINUX_DISTR" == 'rhel'* ]] ; then
  export PYTHON_PIP_RPM='python27-python-pip'
  export PYTHON_PIP_VENV='/opt/rh/python27/enable'
  export RHEL_FORCE_REGISTRATION=${RHEL_FORCE_REGISTRATION:-'false'}
  export RHEL_USER_NAME=${RHEL_USER_NAME:-}
  export RHEL_USER_PASSWORD=${RHEL_USER_PASSWORD:-}
  export RHEL_POOL_ID=${RHEL_POOL_ID:-}
  export RHEL_ORG=${RHEL_ORG:-}
  export RHEL_ACTIVATION_KEY=${RHEL_ACTIVATION_KEY:-}
  if [[ -z "${RHEL_HOST_REPOS+x}" ]] ; then
    export RHEL_HOST_REPOS=''
    # generic repos
    RHEL_HOST_REPOS+=",rhel-7-server-rpms,rhel-7-server-extras-rpms,rhel-7-server-optional-rpms"
    # python-pip repo (package python27-python-pip),
    RHEL_HOST_REPOS+=",rhel-server-rhscl-7-rpms"
    # ansible repo
    RHEL_HOST_REPOS+=",rhel-7-server-ansible-2.4-rpms"
    RHEL_HOST_REPOS="${RHEL_HOST_REPOS##,}"
  fi
  # add repos to be explicitly enabled inside containers
  # byt default only basic repos are enabled inside.
  YUM_ENABLE_REPOS+=",${RHEL_HOST_REPOS}"
  YUM_ENABLE_REPOS="${YUM_ENABLE_REPOS##,}"
fi
