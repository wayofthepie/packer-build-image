FROM ubuntu:22.04

RUN apt-get update \
  && apt install -y curl gnupg2 software-properties-common

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
  && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
  && apt-get update \
  && apt-get install packer

RUN apt install -y python3 python3-pip \
  && pip install ansible

RUN rm -fr /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*
