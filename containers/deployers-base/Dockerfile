ARG DEPLOYERS_BASE_CONTAINER
FROM ${DEPLOYERS_BASE_CONTAINER}

ARG PYTHON_PIP_RPM=python-pip

RUN yum install -y $PYTHON_PIP_RPM && \
    if [[ -n "$PYTHON_PIP_VENV" ]] ; then \
        source $PYTHON_PIP_VENV ; \
    fi && \
    pip --no-cache-dir install --upgrade pip && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENV PS1="\033[1m($(printenv CONTAINER_NAME))\033[m\017[$(id -un)@$(hostname -s) $(pwd)]$ "

CMD ["/usr/bin/tail","-f","/dev/null"]
