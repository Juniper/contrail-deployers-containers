ARG DEPLOYERS_BASE_CONTAINER
FROM ${DEPLOYERS_BASE_CONTAINER}

ARG PYTHON_PIP_RPM=python-pip
ARG PYTHON_PIP_VENV=""

RUN set -x ; yum install -y $PYTHON_PIP_RPM && \
    echo "venv: $PYTHON_PIP_VENV" && \
    if [[ -n "$PYTHON_PIP_VENV" ]] ; then \
        cat $PYTHON_PIP_VENV ; \
        source $PYTHON_PIP_VENV ; \
    fi && \
    find / | grep pip && \
    pip --no-cache-dir install --upgrade pip && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENV PS1="\033[1m($(printenv CONTAINER_NAME))\033[m\017[$(id -un)@$(hostname -s) $(pwd)]$ "

CMD ["/usr/bin/tail","-f","/dev/null"]
