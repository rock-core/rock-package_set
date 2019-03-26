FROM ubuntu:18.04

MAINTAINER 2maz "https://github.com/2maz"

## BEGIN BUILD ARGUMENTS
# Arguments for creation of the Docker imaged,
# passed via --build-arg

# Optional arguments
ARG PKG_BRANCH="master"
ENV PKG_BRANCH=${PKG_BRANCH}

ARG PKG_PULL_REQUEST="false"
ENV PKG_PULL_REQUEST=${PKG_PULL_REQUEST}

ARG PKG_PULL_REQUEST_BRANCH=""
ENV PKG_PULL_REQUEST_BRANCH=${PKG_PULL_REQUEST_BRANCH}
## END ARGUMENTS

RUN apt update
RUN apt upgrade -y
RUN export DEBIAN_FRONTEND=noninteractive; apt install -y ruby ruby-dev wget tzdata locales g++ autotools-dev make cmake sudo git
RUN echo "Europe/Berlin" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata
RUN export LANGUAGE=de_DE.UTF-8; export LANG=de_DE.UTF-8; export LC_ALL=de_DE.UTF-8; locale-gen de_DE.UTF-8; DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

RUN useradd -ms /bin/bash docker
RUN echo "docker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER docker
WORKDIR /home/docker

ENV LANG de_DE.UTF-8
ENV LANG de_DE:de
ENV LC_ALL de_DE.UTF-8
ENV SHELL /bin/bash

RUN git config --global user.email "rock-users@dfki.de"
RUN git config --global user.name "Rock CI"

RUN wget https://raw.githubusercontent.com/rock-core/autoproj/master/bin/autoproj_bootstrap

RUN mkdir -p /home/docker/rock_test
WORKDIR /home/docker/rock_test
# Use the existing seed configuration
COPY --chown=docker .ci/autoproj-config.yml seed-config.yml
COPY --chown=docker .ci/build-package.sh build-package.sh
RUN /bin/bash build-package.sh
