ARG CONTRAIL_REGISTRY
ARG CONTRAIL_DEPLOYERS_TAG
FROM ${CONTRAIL_REGISTRY}/contrail-deployers-base:${CONTRAIL_DEPLOYERS_TAG}

ARG CONTAINER_NAME
ARG PYTHON_PIP_VENV=""

COPY src /root/

RUN set -x ; yum install -y sshpass git && \
    if [[ -n "$PYTHON_PIP_VENV" ]] ; then \
        source $PYTHON_PIP_VENV ; \
    fi && \
    # use the same ansible verion as upstream
    pip --no-cache-dir install --upgrade setuptools "ansible==2.5.5" && \
    ls -l /opt/rh/python27/root/usr/lib/python2.7/site-packages/ && ls -l /usr/lib/python2.7/site-packages/ && \
    /root/prepare.sh && \
    yum clean all -y && \
    rm -rf /var/cache/yum

RUN ansible --version

ENTRYPOINT ["/bin/bash"]
