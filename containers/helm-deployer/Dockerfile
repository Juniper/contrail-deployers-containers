ARG CONTRAIL_REGISTRY
ARG CONTRAIL_DEPLOYERS_TAG
FROM ${CONTRAIL_REGISTRY}/contrail-deployers-base:${CONTRAIL_DEPLOYERS_TAG}

ARG CONTAINER_NAME

COPY src /root/

RUN yum install -y sshpass git && \
    # use the same ansible verion as upstream
    pip --no-cache-dir install --upgrade setuptools "ansible==2.5.5" && \
    /root/prepare.sh && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/bin/bash"]
