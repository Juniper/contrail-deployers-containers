ARG CONTRAIL_REGISTRY
ARG CONTRAIL_DEPLOYERS_TAG
FROM ${CONTRAIL_REGISTRY}/contrail-deployers-base:${CONTRAIL_DEPLOYERS_TAG}

ARG CONTAINER_NAME

# If <source> is a directory, the entire contents of the directory are copied, including filesystem metadata.
# Note: The directory itself is not copied, just its contents.
COPY src /root/

RUN yum install -y git python-pip && \
    pip --no-cache-dir install --upgrade \
    "MarkupSafe==1.1.1" "PyYAML==5.3" "ansible==2.6.18" "bcrypt==3.1.7" "cffi==1.12.3" "cryptography==2.8" \
    "enum34==1.1.9" "ipaddress==1.0.18" "jinja2==2.11.1" "paramiko==2.7.1" "pycparser==2.20" "pynacl==1.3.0" \
    "setuptools==44.0.0" "six==1.14.0" && \
    /root/prepare.sh && \
    yum clean all -y && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/bin/bash"]
