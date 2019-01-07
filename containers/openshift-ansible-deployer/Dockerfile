ARG CONTRAIL_REGISTRY
ARG CONTRAIL_CONTAINER_TAG
FROM ${CONTRAIL_REGISTRY}/contrail-deployers-base:${CONTRAIL_CONTAINER_TAG}

ARG CONTAINER_NAME

# If <source> is a directory, the entire contents of the directory are copied, including filesystem metadata.
# Note: The directory itself is not copied, just its contents.
COPY src /root/

RUN yum install -y git python-pip && \
    pip --no-cache-dir install --upgrade 'ansible==2.5.2' && \
    /root/prepare.sh && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/bin/bash"]
