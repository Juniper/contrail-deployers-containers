ARG DEPLOYERS_BASE_CONTAINER
FROM ${DEPLOYERS_BASE_CONTAINER}

RUN yum update -y && \
    yum install -y python-ipaddress && \
<<<<<<< HEAD   (95ca3a Adding R1912.L3.1 branch to CI)
    curl https://bootstrap.pypa.io/get-pip.py | python2 - 'pip==20.1' && \
=======
    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2 - 'pip==20.1' && \
>>>>>>> CHANGE (aae2b0 fix url for get-pip.py)
    yum clean all -y && \
    rm -rf /var/cache/yum

ENV PS1="\033[1m($(printenv CONTAINER_NAME))\033[m\017[$(id -un)@$(hostname -s) $(pwd)]$ "

CMD ["/usr/bin/tail","-f","/dev/null"]
