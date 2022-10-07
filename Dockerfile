FROM ubuntu:22.04

RUN apt-get -qq update \
  && apt-get install -qqy curl gnupg2 software-properties-common openssh-client

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
  && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
  && apt-get -qq update \
  && apt-get install -qqy packer

RUN apt-get install -qqy python3 python3-pip \
  && pip install ansible

RUN rm -fr /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*
