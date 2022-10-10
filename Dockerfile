FROM ubuntu:22.04

ADD ansible.cfg /etc/ansible/
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update \
  && apt-get install -qq \
    curl \
    jq \
    gnupg2 \
    openssh-client \
    python3 \
    python3-pip \
    software-properties-common \
    > install.log 2>&1 \
  || { cat install.log && exit 1; }

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
  && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
  && apt-get -qq update \
  && apt-get install -qq packer > install.log 2>&1 \
  || { cat install.log && exit 1; }

RUN pip install ansible hvac

RUN rm -fr /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*
