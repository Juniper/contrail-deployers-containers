# This is the general base for all: non-contrail specfic like external and for contrail specific

ARG DEPLOYERS_BASE_CONTAINER
FROM ${DEPLOYERS_BASE_CONTAINER}

ARG GENERAL_EXTRA_RPMS=""
ARG YUM_ENABLE_REPOS=""
ARG PYTHON_PIP_RPM=python-pip
ARG PYTHON_PIP_VENV=""

RUN YUM_ENABLE_REPOS=$(echo $YUM_ENABLE_REPOS | tr -d '"') && \
    if [[ -n "$YUM_ENABLE_REPOS" ]] ; then \
        echo "INFO: contrail-general-base: enable repos $YUM_ENABLE_REPOS" && \
        yum-config-manager --enable $YUM_ENABLE_REPOS ; \
        yum clean metadata ; \
    fi && \
    yum update -y && \
    yum install -y yum-plugin-priorities iproute less hostname git && \
    GENERAL_EXTRA_RPMS=$(echo $GENERAL_EXTRA_RPMS | tr -d '"' | tr ',' ' ') && \
    if [[ -n "$GENERAL_EXTRA_RPMS" ]] ; then \
        echo "INFO: contrail-general-base: install $GENERAL_EXTRA_RPMS" && \
        yum install -y $GENERAL_EXTRA_RPMS ; \
    fi && \
    yum install -y $PYTHON_PIP_RPM && \
    if [[ -n "$PYTHON_PIP_VENV" ]] ; then \
        source $PYTHON_PIP_VENV ; \
    fi && \
    pip --no-cache-dir install --upgrade pip

CMD ["/usr/bin/tail","-f","/dev/null"]
