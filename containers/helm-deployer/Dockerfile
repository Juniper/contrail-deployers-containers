FROM ubuntu:16.04

ARG CONTAINER_NAME
ENV PS1="\033[1m($CONTAINER_NAME)\033[m\017[$(id -un)@$(hostname -s) $(pwd)]$ "

COPY src/* /root/

RUN apt-get update && \
    apt-get install -y --no-install-recommends sshpass python-pip && \
    pip --no-cache-dir install --upgrade pip && \
    hash -r && \
    pip --no-cache-dir install --upgrade setuptools && \
    # use the same ansible verion as upstream
    pip --no-cache-dir install --upgrade "ansible==2.5.5" && \
    /root/prepare.sh && \
    apt-get clean

ENTRYPOINT ["/bin/bash"]
